(* $ ./eclat ../adrien/exists.ecl
   $ make simul NS=4000 
 *)

let static tab = 100^128;;

let mapi_2(f)<src,dst> =
  let rec loop (i) =
    if i >= src.length - 1 then () else
    let update(i) = dst[i] <- f (i,src[i]) in
    let () = update(i)
    and () = update(i+1) in
    loop(i+2)
  in
  loop(0) ;;

let exists_1(f)<t> =
  let rec loop (i) =
    if i >= t.length then false else
    let update(i) = f (t[i])
    in
    let v1 = update (i) in
    if v1 then true
    else loop (i+1)
  in
  loop 0 ;;

let exists_2(f)<t> =
  let rec loop (i) =
    if i >= t.length - 1 then false else
    let update(i) = f (t[i])
    in
    let v1 = update (i)
    and v2 = update (i+1) in
    if v1 or v2 then true
    else loop (i+2)
  in
  loop 0 ;;
  
let exists_4(f)<t> =
  let rec loop (i) =
    if i >= t.length - 3 then false else
    let update(i) = f (t[i])
    in
    let v1 = update (i)
    and v2 = update (i+1)
    and v3 = update (i+2)
    and v4 = update (i+3) in
    if v1 or v2 or v3 or v4 then true
    else loop (i+4)
  in
  loop 0 ;;

let exists_8(f)<t> =
  let rec loop (i) =
    if i >= t.length - 7 then false else
    let update(i) = f (t[i])
    in
    let v1 = update (i)
    and v2 = update (i+1)
    and v3 = update (i+2)
    and v4 = update (i+3)
    and v5 = update (i+4)
    and v6 = update (i+5)
    and v7 = update (i+6)
    and v8 = update (i+7) in
    if v1 or v2 or v3 or v4 or v5 or v6 or v7 or v8 then true
    else loop (i+8)
  in
  loop 0 ;;


let counter () = 
  reg (fun c -> c + 1) last 0 ;;

let main () =
  let rec foo x = (x = 42) && foo x in
  let c = counter () in
  exec
    let () = (mapi_2 (fun (i,_) -> 2*i))<tab,tab> in
    print_string "before: "; print_int c; print_newline ();
    let b = (exists_8 (fun x -> x = 1))<tab> in
    print_string "after: "; print_int c; print_newline ();
    (if b then print_string "true" else print_string "false"); print_newline ();
    ()
  default ();;
