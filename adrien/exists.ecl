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

let iter_counter(reset) = (* reset qui marche pas *)
  let inc(c) = 
    if reset then 0 else c + 1 
  in
  reg inc last 0 ;;

let exists_1(f)<t> =
  let rec loop (i) =
    if i >= t.length then false else
    let update(i) =
      let c = iter_counter(false) in
      if c > 20 then
        false
      else f (t[i])
    in
    let v1 = update (i) in
    if v1 then true
    else if iter_counter(false) >= 20 then let _ = iter_counter(true) in false
        else let _ = iter_counter(true) in loop (i+1)
  in
  let _ = iter_counter(true) in loop 0 ;;

let exists_2(f)<t> =
  let rec loop (i) =
    if i >= t.length - 1 then false else
    let update(i) =
      let c = iter_counter(false) in
      print_int (c); print_string (" "); print_int (i); print_newline ();
      if c > 40 then
        false
      else f (t[i])
    in
    let v1 = update (i)
    and v2 = update (i+1) in
    if v1 or v2 then true
    else if iter_counter(false) >= 40 then let _ = iter_counter(true) in false
        else let _ = iter_counter(true) in loop (i+2)
  in
  let _ = iter_counter(true) in loop 0 ;;
  
let exists_4(f)<t> =
  let rec loop (i) =
    if i >= t.length - 3 then false else
    let update(i) =
      let c = iter_counter(false) in
      if c > 80 then
        false
      else f (t[i])
    in
    let v1 = update (i)
    and v2 = update (i+1)
    and v3 = update (i+2)
    and v4 = update (i+3) in
    if v1 or v2 or v3 or v4 then true
    else if iter_counter(false) >= 80 then let _ = iter_counter(true) in false
        else let _ = iter_counter(true) in loop (i+4)
  in
  let _ = iter_counter(true) in loop 0 ;;

let exists_8(f)<t> =
  let rec loop (i) =
    if i >= t.length - 7 then false else
    let update(i) =
      let c = iter_counter(false) in
      if c > 160 then
        false
      else f (t[i])
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
    else if iter_counter(false) >= 160 then let _ = iter_counter(true) in false
        else let _ = iter_counter(true) in loop (i+8)
  in
  let _ = iter_counter(true) in loop 0 ;;


let counter () = 
  reg (fun c -> c + 1) last 0 ;;

let main () =
  let rec foo x = (x = 42) && foo x in
  let c = counter () in
  exec
    let () = (mapi_2 (fun (i,_) -> 2*i))<tab,tab> in
    print_string "cy:"; print_int c; print_newline ();
    let b = (exists_1 (fun x -> x = 1))<tab> in
    print_string "cy:"; print_int c; print_newline ();
    (if b then print_string "true" else print_string "false"); print_newline ();
    ()
  default ();;
