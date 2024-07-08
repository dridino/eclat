(* $ ./eclat ../adrien/combine.ecl
   $ make simul NS=4000 
 *)

let static tab = 100^128;;
let static tab2 = 100^128;;
let static tab3 = (0, 0)^128;;

let mapi_2(f)<src,dst> =
  let rec loop (i) =
    if i >= src.length - 1 then () else
    let update(i) = dst[i] <- f (i,src[i]) in
    let () = update(i)
    and () = update(i+1) in
    loop(i+2)
  in
  loop(0) ;;

let combine_1()<t1, t2, dst> =
  let rec loop (i) =
    if i >= t1.length then () else
    let update(i) = dst[i] <- (t1[i], t2[i]) in
    let () = update(i) in
    loop (i+1)
  in
  loop(0);;
  
let combine_2()<t1, t2, dst> =
  let rec loop (i) =
    if i >= t1.length - 1 then () else
    let update(i) = dst[i] <- (t1[i], t2[i]) in
    let () = update(i)
    and () = update(i+1) in
    loop (i+2)
  in
  loop(0);;
  
let combine_4()<t1, t2, dst> =
  let rec loop (i) =
    if i >= t1.length - 3 then () else
    let update(i) = dst[i] <- (t1[i], t2[i]) in
    let () = update(i)
    and () = update(i+1)
    and () = update(i+2)
    and () = update(i+3) in
    loop (i+4)
  in
  loop(0);;
  
let combine_8()<t1, t2, dst> =
  let rec loop (i) =
    if i >= t1.length - 7 then () else
    let update(i) = dst[i] <- (t1[i], t2[i]) in
    let () = update(i)
    and () = update(i+1)
    and () = update(i+2)
    and () = update(i+3)
    and () = update(i+4)
    and () = update(i+5)
    and () = update(i+6)
    and () = update(i+7) in
    loop (i+8)
  in
  loop(0);;

let counter () = 
  reg (fun c -> c + 1) last 0 ;;

let print_dlist()<t> =
  let rec loop(i) =
    if i >= t.length then () else
    let (v1, v2) = t[i] in
    print_int v1; print_string " "; print_int v2; print_newline ();
    loop (i+1)
  in loop 0 ;;

let main () =
  let c = counter () in
  exec 
    let () = (mapi_2 (fun (i,_) -> i))<tab,tab2> in
    print_string "cy:"; print_int c; print_newline ();
    let () = (combine_8 ())<tab, tab2, tab3> in
    print_string "cy:"; print_int c; print_newline ();
    (mapi_2 (fun (_, (a, b)) -> print_int a; print_string " "; print_int b; print_newline (); (a, b)))<tab3, tab3>;
    ()
  default ();;
