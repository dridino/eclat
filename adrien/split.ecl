(* $ ./eclat ../adrien/split.ecl
   $ make simul NS=4000 
 *)

let static tab = (100, 100)^128;;
let static tab2 = 100^128;;
let static tab3 = 100^128;;

let mapi_2(f)<src,dst> =
  let rec loop (i) =
    if i >= src.length - 1 then () else
    let update(i) = dst[i] <- f (i,src[i]) in
    let () = update(i)
    and () = update(i+1) in
    loop(i+2)
  in
  loop(0) ;;

let split_1()<src, dst1, dst2> =
  let rec loop (i) =
    if i >= src.length then () else
    let update(i) =
      let (v1, v2) = src[i] in
      let () = dst1[i] <- v1 and
          () = dst2[i] <- v2 in ()
    in
    let () = update(i) in
    loop (i+1)
  in loop (0) ;;

let split_2()<src, dst1, dst2> =
  let rec loop (i) =
    if i >= src.length - 1 then () else
    let update(i) =
      let (v1, v2) = src[i] in
      let () = dst1[i] <- v1 and
          () = dst2[i] <- v2 in ()
    in
    let () = update(i) and
        () = update(i+1) in
    loop (i+2)
  in loop (0) ;;

let split_4()<src, dst1, dst2> =
  let rec loop (i) =
    if i >= src.length - 3 then () else
    let update(i) =
      let (v1, v2) = src[i] in
      let () = dst1[i] <- v1 and
          () = dst2[i] <- v2 in ()
    in
    let () = update(i) and
        () = update(i+1) and
        () = update(i+2) and
        () = update(i+3) in
    loop (i+4)
  in loop (0) ;;

let split_8()<src, dst1, dst2> =
  let rec loop (i) =
    if i >= src.length - 7 then () else
    let update(i) =
      let (v1, v2) = src[i] in
      let () = dst1[i] <- v1 and
          () = dst2[i] <- v2 in ()
    in
    let () = update(i) and
        () = update(i+1) and
        () = update(i+2) and
        () = update(i+3) and
        () = update(i+4) and
        () = update(i+5) and
        () = update(i+6) and
        () = update(i+7) in
    loop (i+8)
  in loop (0) ;;

let counter () = 
  reg (fun c -> c + 1) last 0 ;;

let main () =
  let c = counter () in
  exec 
    let () = (mapi_2 (fun (i,_) -> (i, 2*i)))<tab2,tab> in
    print_string "cy:"; print_int c; print_newline ();
    (split_8 ())<tab, tab2, tab3>;
    print_string "cy:"; print_int c; print_newline ();
    let () = (mapi_2 (fun (_,x) -> print_int x; print_string " "; print_newline (); x))<tab2,tab2> in
    let () = (mapi_2 (fun (_,x) -> print_int x; print_string " "; print_newline (); x))<tab3,tab3> in
    ()
  default ();;
