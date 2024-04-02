
let counter () =
    reg (fun v -> v + 1) last 0 ;;

let rec wait(n) =
    if n <= 1 then () else wait(n-1) ;;

let rec wait_true(n) =
    if n <= 1 then true else wait_true(n-1) ;;
    
let rec wait_false(n) =
    if n <= 1 then false else wait_false(n-1) ;;

let wait_true_1 _ = wait_true(1) ;;
let wait_false_1 _ = wait_false(1) ;;
let wait_true_10 _ = wait_true(10) ;;
let wait_false_10 _ = wait_false(10) ;;
let wait_true_50 _ = wait_true(50) ;;
let wait_false_50 _ = wait_false(50) ;;
let wait_true_100 _ = wait_true(100) ;;
let wait_false_100 _ = wait_false(100) ;;
let static src = (0, true)^1024 ;;
let static dst = (0, false)^1024 ;;
let rec wait_pipe_1(v) = wait(0); v ;;
let rec wait_pipe_10(v) = wait(9); v ;;
let rec wait_pipe_50(v) = wait(49); v ;;
let rec wait_pipe_100(v) = wait(99); v ;;

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

let init_tabs () =
  let rec loop (i) =
  if i >= src.length then ()
  else (
    src.(i) <- (0, true);
    dst.(i) <- (0, false);
    loop (i+1)) in
  loop (0) ;;
let not_piped2(f, g, src, dst) =
  let rec loop (j) =
    if j >= src.length then ()
    else (
      dst.(j) <- (g (f (src.(j)))); loop (j+1)
    )
  in loop (0) ;;
      let pipe2(f, g, df, dg, src, dst) =
        let inter1 = (0, false)^1024 in
  let _ = iteri(f, df, src, inter1)
  and _ = iteri(g, dg, inter1, dst)
  in () ;;
      let not_piped3(f, g, h, src, dst) =
  let rec loop (j) =
    if j >= src.length then ()
    else (
      dst.(j) <- (h (g (f (src.(j))))); loop (j+1)
    )
  in loop (0) ;;
      let pipe3(f, g, h, df, dg, dh, src, dst) =
  let inter2 = (0, false)^1024 in
  let _ = pipe2(f, g, df, dg, src, inter2)
  and _ = iteri(h, dh, inter2, dst)
  in ();;
      let not_piped4(f, g, h, i, src, dst) =
  let rec loop (j) =
    if j >= src.length then ()
    else (
      dst.(j) <- (i (h (g (f (src.(j)))))); loop (j+1)
    )
  in loop (0) ;;
      let pipe4(f, g, h, i, df, dg, dh, di, src, dst) =
  let inter3 = (0, false)^1024 in
  let _ = pipe3(f, g, h, df, dg, dh, src, inter3)
  and _ = iteri(i, di, inter3, dst)
  in () ;;
      
let main () =
    let c = counter () in
    exec
print_int c; print_string "_";not_piped2(wait_pipe_100, wait_pipe_100, src, dst); init_tabs ();print_int c; print_newline ();print_int c; print_string "_";let _ = pipe2(wait_pipe_100, wait_pipe_100, 0, 0, src, dst) in let _ = init_tabs () in ();print_int c; print_newline ();print_int c; print_string "_";not_piped3(wait_pipe_100, wait_pipe_100, wait_pipe_100, src, dst); init_tabs ();print_int c; print_newline ();print_int c; print_string "_";let _ = pipe3(wait_pipe_100, wait_pipe_100, wait_pipe_100, 0, 0, 0, src, dst) in let _ = init_tabs () in ();print_int c; print_newline ();print_int c; print_string "_";not_piped4(wait_pipe_100, wait_pipe_100, wait_pipe_100, wait_pipe_100, src, dst); init_tabs ();print_int c; print_newline ();print_int c; print_string "_";let _ = pipe4(wait_pipe_100, wait_pipe_100, wait_pipe_100, wait_pipe_100, 0, 0, 0, 0, src, dst) in let _ = init_tabs () in ();print_int c; print_newline ();print_string "---"; print_newline (); () default () ;;