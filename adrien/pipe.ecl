let static t0 = 0^128 ;;
let static t1 = (0, true)^128 ;;
let static t2 = (0, false)^128 ;;

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

(* Execution time : 968 *)
let pipe2(f, g, df, dg, src, dst) =
  let () = iteri(f, df, src, dst)
  and () = iteri(g, dg, dst, src)
  in () ;;

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

(* Execution time : 1794 *)
let not_piped2(f, g, df, dg, src, dst) =
  let _ = iteri(f, df, src, dst) in
  let _ = iteri(g, dg, dst, src) in
  () ;;

let counter () = 
  reg (fun c -> c + 1) last 0 ;;

let main () =
  let c = counter () in
  exec
    let f v = if v = 0 then 1 else -2 in
    let g v = if v = 1 then 2 else -3 in
    print_string "start : "; print_int c; print_newline ();
    let () = pipe2(f, g, -1, -1, t1, t2) in
    print_string "end   : "; print_int c; print_newline ();
    let test (v, b) = v = 2 in
    let b = for_all_2 (test, t1) in
    (if b then print_string "true" else print_string "false"); print_newline ();
    () 
  default () ;;
