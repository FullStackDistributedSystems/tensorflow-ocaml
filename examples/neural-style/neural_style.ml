open Core_kernel.Std
open Tensorflow_core
open Tensorflow

let conv2d node ~in_channels ~out_channels =
  let w = Var.f_or_d [ 3; 3; in_channels; out_channels ] ~type_:Float 0. in
  let b = Var.f_or_d [ out_channels ] ~type_:Float 0. in
  let conv2d = Ops.conv2D ~strides:[ 1; 1; 1; 1 ] ~padding:"SAME" node w in
  Ops.(+) conv2d b, w, b

let max_pool node =
  Ops.maxPool node ~ksize:[ 1; 2; 2; 1 ] ~strides:[ 1; 2; 2; 1 ] ~padding:"SAME"

let load var_and_names ~npz_filename =
  let npz = Npy.Npz.open_in npz_filename in
  let inputs, targets =
    List.map var_and_names ~f:(fun (var_name, var) ->
      let Npy.P tensor = Npy.Npz.read npz var_name in
      match Bigarray.Genarray.kind tensor, Bigarray.Genarray.layout tensor with
      | Bigarray.Float32, Bigarray.C_layout ->
        let tensor = Tensor.of_bigarray tensor ~scalar:false in
        let shape = Tensor.dims tensor |> Array.to_list in
        let ph = Ops.placeholder ~type_:Float shape in
        Session.Input.float ph tensor, Node.P (Ops.assign var (Ops.Placeholder.to_node ph))
      | _ -> failwith "Improper weight types or layout")
    |> List.unzip
  in
  Session.run ~inputs ~targets Session.Output.empty;
  Npy.Npz.close_in npz

let style_grams_and_content_nodes input ~img_h ~img_w ~npz_filename =
  let var_by_name = String.Table.create () in
  let block iter ~block_idx ~in_channels ~out_channels (node, acc) =
    List.init iter ~f:Fn.id
    |> List.fold ~init:(node, []) ~f:(fun (node, acc_relus) idx ->
      let name = sprintf "conv%d_%d" block_idx (idx+1) in
      let in_channels = if idx = 0 then in_channels else out_channels in
      let conv2d, w, b = conv2d node ~in_channels ~out_channels in
      Hashtbl.set var_by_name ~key:(name ^ "W") ~data:w;
      Hashtbl.set var_by_name ~key:(name ^ "b") ~data:b;
      let relu = Ops.relu conv2d in
      relu, (relu, (`block_idx block_idx, `out_channels out_channels)) :: acc_relus)
    |> fun (node, acc_relus) -> max_pool node, List.rev acc_relus :: acc
  in
  let _model, acc_relus =
    (Ops.reshape input (Ops.const_int ~type_:Int32 [ 1; img_h; img_w; 3 ]), [])
    |> block 2 ~block_idx:1 ~in_channels:3   ~out_channels:64
    |> block 2 ~block_idx:2 ~in_channels:64  ~out_channels:128
    |> block 4 ~block_idx:3 ~in_channels:128 ~out_channels:256
    |> block 4 ~block_idx:4 ~in_channels:256 ~out_channels:512
    |> block 4 ~block_idx:5 ~in_channels:512 ~out_channels:512
  in
  let acc_relus = List.rev acc_relus in
  load (Hashtbl.to_alist var_by_name) ~npz_filename;
  let style_grams =
    List.map acc_relus ~f:(fun relus ->
      let node, (`block_idx block_idx, `out_channels out_channels) = List.hd_exn relus in
      let node = Ops.reshape node (Ops.const_int ~type_:Int32 [ -1; out_channels ]) in
      let two = Int.pow 2 (block_idx - 1) in
      let size_ = float (out_channels * (img_h/two) * (img_w/two)) in
      Ops.(matMul ~transpose_a:true node node / f size_))
  in
  let content_nodes =
    (* Block 4, conv 2. *)
    List.map [ 4, 2 ] ~f:(fun (block_idx, conv_idx) ->
      let block = List.nth_exn acc_relus (block_idx - 1) in
      List.nth_exn block (conv_idx - 1) |> fst)
  in
  style_grams, content_nodes

let imagenet_mean = function
  | `blue -> 103.939
  | `green -> 116.779
  | `red -> 123.68

let normalize x ~channel =
  float x -. imagenet_mean channel

let unnormalize x ~channel =
  min 255 (int_of_float (x +. imagenet_mean channel))
  |> max 0

let load_image ~filename =
  let image = OImages.load filename [] in
  let image = OImages.rgb24 image in
  let img_w = image # width in
  let img_h = image # height in
  let tensor = Tensor.create3 Float32 img_h img_w 3 in
  for i = 0 to img_h - 1 do
    for j = 0 to img_w - 1 do
      let { Color.r; g; b } = image # get j i in
      Tensor.set tensor [| i; j; 0 |] (normalize r ~channel:`red);
      Tensor.set tensor [| i; j; 1 |] (normalize g ~channel:`green);
      Tensor.set tensor [| i; j; 2 |] (normalize b ~channel:`blue);
    done;
  done;
  tensor, img_w, img_h

let save_image tensor ~filename ~img_h ~img_w =
  let total_size = Array.fold (Tensor.dims tensor) ~init:1 ~f:( * ) in
  if total_size <> img_h * img_w * 3
  then failwith "Incorrect tensor size";
  let image = new OImages.rgb24 img_w img_h in
  for i = 0 to img_h - 1 do
    for j = 0 to img_w - 1 do
      let r = Tensor.get tensor [| i; j; 0 |] |> unnormalize ~channel:`red in
      let g = Tensor.get tensor [| i; j; 1 |] |> unnormalize ~channel:`green in
      let b = Tensor.get tensor [| i; j; 2 |] |> unnormalize ~channel:`blue in
      image # set j i { Color.r; g; b }
    done;
  done;
  image # save filename None []

let compute_grams ~filename ~npz_filename =
  let input_tensor, img_w, img_h = load_image ~filename in
  let input_placeholder = Ops.placeholder ~type_:Float [ img_h; img_w; 3 ] in
  let style_grams, _ =
    style_grams_and_content_nodes (Ops.Placeholder.to_node input_placeholder)
      ~img_h ~img_w ~npz_filename
  in
  List.map style_grams ~f:(fun node ->
    Session.run
      ~inputs:[ Session.Input.float input_placeholder input_tensor ]
      ~targets:[ Node.P node ]
      (Session.Output.float node))

let total_variation_loss input ~img_h ~img_w =
  let input =
    Ops.reshape input (Ops.const_int ~type_:Int32 [ img_h; img_w; 3 ])
  in
  let axis1_diff =
    Ops.(-)
      (Ops.slice input (Ops.ci32 [ 0; 0; 0 ]) (Ops.ci32 [ img_h-1; img_w; 3 ]))
      (Ops.slice input (Ops.ci32 [ 1; 0; 0 ]) (Ops.ci32 [ img_h-1; img_w; 3 ]))
  in
  let axis2_diff =
    Ops.(-)
      (Ops.slice input (Ops.ci32 [ 0; 0; 0 ]) (Ops.ci32 [ img_h; img_w-1; 3 ]))
      (Ops.slice input (Ops.ci32 [ 0; 1; 0 ]) (Ops.ci32 [ img_h; img_w-1; 3 ]))
  in
  Ops.(reduce_sum (axis1_diff * axis1_diff) + reduce_sum (axis2_diff * axis2_diff))

let create_and_set_var tensor =
  let dims = Tensor.dims tensor |> Array.to_list in
  let input_var = Var.f_or_d dims ~type_:Float 0. in
  let placeholder = Ops.placeholder dims ~type_:Float in
  let assign = Ops.assign input_var (Ops.Placeholder.to_node placeholder) in
  Session.run
    ~inputs:[ Session.Input.float placeholder tensor ]
    ~targets:[ Node.P assign ]
    Session.Output.empty;
  input_var

let run epochs learning_rate content_weight style_weight tv_weight npz_filename input_filename style_filename =
  let suffix =
    String.rsplit2 input_filename ~on:'.'
    |> Option.value_map ~f:snd ~default:"jpg"
  in
  let input_tensor, img_w, img_h = load_image ~filename:input_filename in
  printf "Computing target features...\n%!";
  let target_grams = compute_grams ~filename:style_filename ~npz_filename in
  printf "Done computing target features.\n%!";
  let input_var = create_and_set_var input_tensor in
  let style_grams, content_nodes =
    style_grams_and_content_nodes input_var ~img_h ~img_w ~npz_filename
  in
  let style_losses, style_inputs =
    List.map2_exn style_grams target_grams ~f:(fun gram_node target_gram ->
      let dims = Tensor.dims target_gram |> Array.to_list in
      let size_ = List.reduce_exn dims ~f:( * ) in
      let placeholder = Ops.placeholder ~type_:Float dims in
      let diff = Ops.(-) gram_node (Ops.Placeholder.to_node placeholder) in
      Ops.(reduce_sum (diff * diff) / f (float size_)),
      Session.Input.float placeholder target_gram)
    |> List.unzip
  in
  let content_losses, content_inputs =
    List.map content_nodes ~f:(fun content_node ->
      let content_target = Session.run Session.Output.(float content_node) in
      let dims = Tensor.dims content_target |> Array.to_list in
      let placeholder = Ops.placeholder ~type_:Float dims in
      let diff = Ops.(-) content_node (Ops.Placeholder.to_node placeholder) in
      let total_dims = List.reduce_exn dims ~f:( * ) |> float in
      Ops.(reduce_sum (diff * diff) / f total_dims),
      Session.Input.float placeholder content_target)
    |> List.unzip
  in
  let loss =
    Ops.(List.reduce_exn style_losses ~f:(+) * f style_weight
      + List.reduce_exn content_losses ~f:(+) * f content_weight
      + total_variation_loss input_var ~img_h ~img_w * f tv_weight)
  in
  let gd =
    Optimizers.adam_minimizer loss
      ~learning_rate:(Ops.f learning_rate)
      ~varsf:[ input_var ]
  in
  for epoch = 1 to epochs do
    let output_tensor, loss =
      Session.run
        ~inputs:(style_inputs @ content_inputs)
        ~targets:gd
        Session.Output.(both (float input_var) (scalar_float loss))
    in
    printf "epoch: %d   loss: %g\n%!" epoch loss;
    if epoch mod 100 = 0
    then save_image output_tensor ~filename:(sprintf "out_%d.%s" epoch suffix) ~img_h ~img_w;
  done

let () =
  let open Cmdliner in
  let default_cmd =
    let epochs =
      Arg.(value & opt int 10_000
        & info [ "epochs" ] ~docv:"INT" ~doc:"Number of epochs to run")
    in
    let learning_rate =
      Arg.(value & opt float 1.
        & info [ "learning-rate" ] ~docv:"FLOAT" ~doc:"Learning rate for the Adam optimizer")
    in
    let content_weight =
      Arg.(value & opt float 1e-3
        & info [ "content-weight" ] ~docv:"FLOAT" ~doc:"Weight for the content loss")
    in
    let style_weight =
      Arg.(value & opt float 1.
        & info [ "style-weight" ] ~docv:"FLOAT" ~doc:"Weight for the style loss")
    in
    let tv_weight =
      Arg.(value & opt float 1e-4
        & info [ "tv-weight" ] ~docv:"FLOAT" ~doc:"Weight for the total variation loss")
    in
    let npz_filename =
      Arg.(value & opt file "vgg19.npz"
        & info [ "npz-model-weights" ] ~docv:"FILE" ~doc:"npz file containing the trained model weights")
    in
    let input_filename =
      Arg.(value & opt file "input.jpg"
        & info [ "input" ] ~docv:"FILE" ~doc:"input image file")
    in
    let style_filename =
      Arg.(value & opt file "style.jpg"
        & info [ "style" ] ~docv:"FILE" ~doc:"style image file")
    in
    Term.(const run
      $ epochs
      $ learning_rate
      $ content_weight
      $ style_weight
      $ tv_weight
      $ npz_filename
      $ input_filename
      $ style_filename),
    Term.info "neural_style" ~version:"0" ~sdocs:"" ~doc:"Neural Style Transfer"
  in
  match Term.eval_choice default_cmd [] with
  | `Error _ -> exit 1
  | _ -> exit 0
