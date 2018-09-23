open Base
open Float.O_dot
open Tensorflow_core
open Tensorflow
module O = Ops

let assert_equal_int value ~expected_value =
  if value <> expected_value
  then Printf.failwithf "Got %d, expected %d" value expected_value ()

let assert_equal value ~expected_value ~tol =
  if Float.(abs (value -. expected_value) > tol)
  then Printf.failwithf "Got %f, expected %f" value expected_value ()

let assert_scalar tensor ~expected_value ~tol =
  let index =
    match Tensor.dims tensor with
    | [||] -> [||]
    | [| 1 |] -> [| 0 |]
    | [| n |] -> Printf.failwithf "Single dimension tensor with %d elements" n ()
    | _ -> failwith "Multi-dimensional tensor."
  in
  assert_equal (Tensor.get tensor index) ~expected_value ~tol

let assert_vector tensor ~expected_value ~tol =
  match Tensor.dims tensor with
  | [||] -> failwith "Scalar rather than vector"
  | [| n |] ->
    List.init n ~f:(fun i -> Tensor.get tensor [| i |])
    |> List.iter2_exn expected_value ~f:(fun expected_value value ->
      assert_equal value ~expected_value ~tol)
  | _ -> failwith "Multi-dimensional tensor."

let test_scalar () =
  List.iter ~f:(fun (tol, ops, expected_value) ->
    let tensor = Session.run (Session.Output.float ops) in
    assert_scalar tensor ~expected_value ~tol)
    [ 0.,   O.(f 40. + f 2.), 42.
    ; 0.,   O.(f 12. * f 3.), 36.
    ; 0.,   O.(f 7. / (neg (f 2.))), -3.5
    ; 0.,   O.(pow (f 2.) (f 10.) - square (f 10.)), 924.
    ; 1e-7, O.(sin (f 1.) + cos (f 2.) - tanh (f 3.)), Float.sin 1. +. Float.cos 2. -. Float.tanh 3.
    ; 0.,   O.(reduce_mean (pow (cf (List.init 100 ~f:Float.of_int)) (f 3.))), 245025.
    ; 0.,   O.(reduce_sum (range (const_int ~shape:[] ~type_:Int32 [ 10 ])
              |> cast ~type_:Float)), 45.
    ; 0.,   O.(maximum (f 2.) (f 3.) - minimum (f 5.) (f (-5.))), 8.
    ; 1e-6, O.(matrixDeterminant (cf ~shape:[ 2; 2 ] [ 1.; 2.; 3.; 4. ])), -2.
    ; 0.,   O.(moments (cf ~shape:[ 5 ] [ 1.; 2.; 3.; 4.; 5. ]) ~dims:[ 0 ]).mean, 3.
    ; 0.,   O.(moments (cf ~shape:[ 5 ] [ 1.; 2.; 3.; 4.; 5. ]) ~dims:[ 0 ]).variance, 2.
    ]

let test_vector () =
  List.iter ~f:(fun (tol, ops, expected_value) ->
    let tensor = Session.run (Session.Output.double ops) in
    assert_vector tensor ~expected_value ~tol)
    [ 0., O.(range (const_int ~shape:[] ~type_:Int32 [ 3 ]) |> cast ~type_:Double), [ 0.; 1.; 2. ]
    ; 0., O.(concat zero32
        [ floor (cd [ 1.0; 1.1; 1.9; 2.0 ])
        ; ceil (cd [ 1.0; 1.1; 1.9; 2.0 ])
        ])
      , [ 1.; 1.; 1.; 2.; 1.; 2.; 2.; 2. ]
    ; 0., O.((cd ~shape:[ 2; 2 ] [ 1.; 2.; 3.; 4. ]) *^ (cd ~shape:[ 2; 1 ] [ 5.; 6. ])
            |> reduce_sum ~dims:[ 1 ])
      , [ 17.; 39. ]
    ; 1e-8, O.(matrixSolve (cd ~shape:[ 2; 2 ] [ 1.; 2.; 3.; 4. ])
                           (cd ~shape:[ 2; 1 ] [ 4.; 10. ])
            |> reduce_sum ~dims:[ 1 ])
      , [ 2.; 1. ]
    ; 0., O.(split ~num_split:2 one32 (cd ~shape:[ 2; 2 ] [ 1.; 2.; 3.; 4. ])
          |> function
          | [ o1; o2 ] ->
            concat zero32
              [ reshape o2 (const_int ~type_:Int32 [ 2 ])
              ; reshape o1 (const_int ~type_:Int32 [ 2 ])
              ]
          | _ -> assert false)
      , [ 2.; 4.; 1.; 3. ]
    ; 0., O.(split ~num_split:2 zero32 (cd ~shape:[ 2; 2 ] [ 1.; 2.; 3.; 4. ])
          |> function
          | [ o1; o2 ] ->
            concat zero32
              [ reshape o2 (const_int ~type_:Int32 [ 2 ])
              ; reshape o1 (const_int ~type_:Int32 [ 2 ])
              ]
          | _ -> assert false)
      , [ 3.; 4.; 1.; 2. ]
    ; 0., O.(moments (cd ~shape:[ 2; 5 ] [ 1.; 2.; 3.; 4.; 5.; 8.; 10.; 8.; 10.; 9. ])
            ~dims:[ 1 ]).mean
      , [ 3.; 9. ]
    ; 1e-8, O.(moments (cd ~shape:[ 2; 5 ] [ 1.; 2.; 3.; 4.; 5.; 8.; 10.; 8.; 10.; 9. ])
              ~dims:[ 1 ]).variance
      , [ 2.; 0.8 ]
    ]

let test_batch_norm () =
  let batch = Ops.placeholder ~type_:Double [ 3; 4 ] in
  let is_training = Ops.placeholder ~type_:Bool [ 1 ] in
  let ops, `update_ops update_ops =
    Layer.batch_norm (Ops.Placeholder.to_node batch)
      ~is_training:(Ops.Placeholder.to_node is_training)
      ~decay:0.5
  in
  let ops = Ops.reduce_sum ops ~dims:[ 0 ] in
  let batch_tensor = Tensor.create2 Float64 3 4 in
  let is_training_tensor = Tensor.create0 Int8_unsigned in
  Tensor.copy_elt_list is_training_tensor [ 1 ];
  for i = 0 to 4 do
    let training = i < 3 in
    Tensor.copy_elt_list is_training_tensor [ if training then 1 else 0 ];
    let tensor =
      Tensor.copy_elt_list batch_tensor
        [ 0.; 4.; 0.; 8.
        ; 0.; 4.; 9.; 8.
        ; 0.; 4.; 3.; 3.
        ];
      Session.run Session.Output.(double ops)
        ~inputs:
          [ Session.Input.double batch batch_tensor
          ; Session.Input.bool is_training is_training_tensor
          ]
    in
    let blessed_values =
      if training then [ 0.; 0.; 0.; 0. ]
      else if i = 3 then [ 0.; 4.242641; 0.426401; 1.063611 ]
      else if i = 4 then [ 0.; 4.242641; 0.426401; 1.063611 ]
      else assert false
    in
    assert_vector tensor ~expected_value:blessed_values ~tol:1e-6;
    if training
    then Session.run ~targets:(List.map update_ops ~f:(fun op -> Node.P op))
      ~inputs:
        [ Session.Input.double batch batch_tensor
        ; Session.Input.bool is_training is_training_tensor
        ]
      Session.Output.empty
  done

let test_cond true_false =
  let testing = Ops.placeholder ~type_:Bool [] in
  let true_false = if true_false then 1 else 0 in
  let int32_with_control_inputs ~control_inputs v =
    Ops.const_int ~shape:[] ~type_:Int32 ~control_inputs [ v ]
  in
  let cond =
    Ops.cond_with_control_inputs (Ops.Placeholder.to_node testing)
      ~if_true:(int32_with_control_inputs 1)
      ~if_false:(int32_with_control_inputs 0)
  in
  let testing_tensor = Tensor.create0 Int8_unsigned in
  Tensor.copy_elt_list testing_tensor [ true_false ];
  let tensor =
    Session.run Session.Output.(int32 cond)
      ~inputs:
        [ Session.Input.bool testing testing_tensor
        ]
  in
  let index =
    match Tensor.dims tensor with
    | [||] -> [||]
    | [| 1 |] -> [| 0 |]
    | [| n |] -> Printf.failwithf "Single dimension tensor with %d elements" n ()
    | _ -> failwith "Multi-dimensional tensor."
  in
  let value = Tensor.get tensor index |> Int32.to_int_exn in
  assert_equal_int value ~expected_value:true_false

let () =
  test_scalar ();
  test_vector ();
  test_batch_norm ();
  test_cond true;
  test_cond false
