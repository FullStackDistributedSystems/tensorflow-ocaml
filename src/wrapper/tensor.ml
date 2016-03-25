type ('a, 'b) t = ('a, 'b, Bigarray.c_layout) Bigarray.Genarray.t

type p = P : (_, _) t -> p

let print (P tensor) =
  let print (type a) (type b) (tensor : (a, b) t) (elt_to_string : a -> string) =
    match Bigarray.Genarray.dims tensor with
    | [||] -> Printf.printf "%s\n%!" (Bigarray.Genarray.get tensor [||] |> elt_to_string)
    | [| dim |] ->
      for d = 0 to dim - 1 do
        Printf.printf "%d %s\n%!"
          d (Bigarray.Genarray.get tensor [| d |] |> elt_to_string)
      done
    | [| d0; d1 |] ->
      for x = 0 to d0 - 1 do
        Printf.printf "%d " x;
        for y = 0 to d1 - 1 do
          Printf.printf "%s "
            (Bigarray.Genarray.get tensor [| x; y |] |> elt_to_string)
        done;
        Printf.printf "\n%!";
      done
    | otherwise -> Printf.printf "%d dims\n%!" (Array.length otherwise)
  in
  match Bigarray.Genarray.kind tensor with
  | Bigarray.Float32 -> print tensor (Printf.sprintf "%f")
  | Bigarray.Float64 -> print tensor (Printf.sprintf "%f")
  | Bigarray.Int32 -> print tensor (fun i -> Printf.sprintf "%d" (Int32.to_int i))
  | Bigarray.Int64 -> print tensor (fun i -> Printf.sprintf "%d" (Int64.to_int i))
  | _ -> Printf.printf "Unsupported kind"
