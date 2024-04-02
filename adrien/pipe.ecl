let static t1 = (0, true)^128 ;;
let static t2 = (0, false)^128 ;;
let static t3 = (0)^128 ;;
let static t4 = (0)^128 ;;

let static inter1 = (0, false)^128 ;;
let static inter2 = (0, false)^128 ;;
let static inter3 = (0, false)^128 ;;

let for_all_2(f, t) =
  let rec loop (i) =
    if i >= t.length - 1 then true else
    let update(i) = f (t[i])
    in
    let v1 = update (i)
    and v2 = update (i+1) in
    if v1 && v2 then loop (i+2)
    else false
  in
  loop 0 ;;

let iteri(f, d, src, dst)=
  let rec loop (i) =
    if i >= dst.length then ()
    else
      let (v, b) = src[i] in
      if b then (
        dst[i] <- (d, false);
        dst[i] <- (f v, true);
        loop (i+1)
      ) else loop i
  in loop 0 ;;


(* let print_10(t) =
  let print_bool b =
    if b then print_string "true" else print_string "false"
  in
  let rec loop i =
    if i < 0 then ()
    else
      let (v, b) = t[i] in
      let () = (print_string "(";
      print_int v; print_string ", ";
      print_bool b; print_string ")";
      print_newline ()) in loop (i-1)
  in loop (10) ;; *)

(* Execution time : 904 *)
let pipe2(f, g, df, dg, src, dst) =
  let () = iteri(f, df, src, inter1)
  and () = iteri(g, dg, inter1, dst)
  in () ;;

(* Execution time : 1794 *)
let not_piped2(f, g, src, dst) =
  let rec loop (j) =
    if j >= src.length then ()
    else (
      dst.(j) <- (g (f (src.(j)))); loop (j+1)
    )
  in loop (0) ;;


(* Execution time : 910 *)
let pipe3(f, g, h, df, dg, dh, src, dst) =
  let () = pipe2(f, g, df, dg, src, inter2)
  and () = iteri(h, dh, inter2, dst)
  in ();;
  
(* Execution time : 2691 *)
let not_piped3(f, g, h, src, dst) =
  let rec loop (j) =
    if j >= src.length then ()
    else (
      dst.(j) <- (h (g (f (src.(j))))); loop (j+1)
    )
  in loop (0) ;;


(* Execution time : 916 *)
let pipe4(f, g, h, i, df, dg, dh, di, src, dst) =
  let () = pipe3(f, g, h, df, dg, dh, src, inter3)
  and () = iteri(i, di, inter3, dst)
  in () ;;

(* Execution time : 1665 *)
let not_piped4(f, g, h, i, src, dst) =
  let rec loop (j) =
    if j >= src.length then ()
    else (
      dst.(j) <- (i (h (g (f (src.(j)))))); loop (j+1)
    )
  in loop (0) ;;


let rec wait(n) =
  if n <= 1 then () else wait(n-1) ;;


let counter () = 
  reg (fun c -> c + 1) last 0 ;;

let main () =
  let c = counter () in
  exec
    let f v = wait(5); if v = 0 then 1 else -2 in
    let g v = wait(5); if v = 1 then 2 else -3 in
    let h v = wait(5); if v = 2 then 3 else -4 in
    let i v = wait(5); if v = 3 then 4 else -5 in
    print_string "start : "; print_int c; print_newline ();
    let () = not_piped4(f, g, h, i, t3, t4) in
    print_string "end   : "; print_int c; print_newline ();
    let test (v, b) = v = 4 in
    let b = for_all_2 (test, t2) in
    (if b then print_string "true" else print_string "false"); print_newline ();
    () 
  default () ;;
