(* $ ./eclat ../adrien/fold.ecl
   $ make simul NS=4000 
 *)

let static tab = 100^128;;
let static tab2 = 100^128;;

let mapi_2(f)<src,dst> =
  let rec loop (i) =
    if i >= src.length - 1 then () else
    let update(i) = dst[i] <- f (i,src[i]) in
    let () = update(i)
    and () = update(i+1) in
    loop(i+2)
  in
  loop(0) ;;

let fold_1(f, init)<t> =
  let rec loop (init, i) =
    if i >= t.length then init else
    loop (f(init, t[i]), i+1)
  in loop (init, 0) ;;
  
let fold_2(f, init)<t> =
  let rec loop (init, i) =
    if i >= t.length - 1 then init else
    let v1 = t[i] in
    let v2 = t[i+1] and
        r1 = f(init, v1) in
    loop (f(r1, v2), i+2)
  in loop (init, 0) ;;
  
let fold_4(f, init)<t> =
  let rec loop (init, i) =
    if i >= t.length - 3 then init else
    let v1 = t[i] in
    let v2 = t[i+1] and
        r1 = f(init, v1) in
    let v3 = t[i+2] and
        r2 = f(r1, v2) in
    let v4 = t[i+3] and
        r3 = f(r2, v3) in
    loop (f(r3, v4), i+4)
  in loop (init, 0) ;;

let fold_8(f, init)<t> =
  let rec loop (init, i) =
    if i >= t.length - 7 then init else
    let v1 = t[i] in
    let v2 = t[i+1] and
        r1 = f(init, v1) in
    let v3 = t[i+2] and
        r2 = f(r1, v2) in
    let v4 = t[i+3] and
        r3 = f(r2, v3) in
    let v5 = t[i+4] and
        r4 = f(r3, v4) in
    let v6 = t[i+5] and
        r5 = f(r4, v5) in
    let v7 = t[i+6] and
        r6 = f(r5, v6) in
    let v8 = t[i+7] and
        r7 = f(r6, v7) in
    loop (f(r7, v8), i+8)
  in loop (init, 0) ;;

let sum(n) = 
  let rec loop(acc,n) =
    if n < 1 then acc else loop(acc+n,n-1)
  in loop(0,n) ;;

let counter () = 
  reg (fun c -> c + 1) last 0 ;;

let main () =
  let c = counter () in
  exec 
    let () = (mapi_2 (fun (i,_) -> sum(i)))<tab,tab2> in
    print_string "cy:"; print_int c; print_newline ();
    let s = (fold_8 ((fun (init, v) -> init + 1), 0))<tab2> in
    print_string "cy:"; print_int c; print_newline ();
    print_int s; print_newline ();
    ()
  default ();;
