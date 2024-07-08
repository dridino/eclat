
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
let wait_true_100 _ = wait_true(100) ;;
let wait_false_100 _ = wait_false(100) ;;
let wait_true_500 _ = wait_true(500) ;;
let wait_false_500 _ = wait_false(500) ;;
let wait_true_1000 _ = wait_true(1000) ;;
let wait_false_1000 _ = wait_false(1000) ;;
let static t = 0^256 ;;
let rec wait_fold_1(init, v) = wait(0); init ;;
let rec wait_fold_100(init, v) = wait(99); init ;;
let rec wait_fold_500(init, v) = wait(499); init ;;
let rec wait_fold_1000(init, v) = wait(999); init ;;
let fold_1(f, init, t) =
  let rec loop (init, i) =
    if i >= t.length then init else
    loop (f(init, t[i]), i+1)
  in loop (init, 0) ;;
      let fold_2(f, init, t) =
      let rec loop (init, i) =
    if i >= t.length - 1 then init else
    let v1 = t[i] in
    let v2 = t[i+1] and
        r1 = f(init, v1) in
    loop (f(r1, v2), i+2)
  in loop (init, 0) ;;
      let fold_4(f, init, t) =
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
      let fold_8(f, init, t) =
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
      
let main () =
    let c = counter () in
    exec
print_int c; print_string "_";let _ = fold_1(wait_fold_1000, 0, t) in ();print_int c; print_newline ();print_int c; print_string "_";let _ = fold_2(wait_fold_1000, 0, t) in ();print_int c; print_newline ();print_int c; print_string "_";let _ = fold_4(wait_fold_1000, 0, t) in ();print_int c; print_newline ();print_int c; print_string "_";let _ = fold_8(wait_fold_1000,0, t) in ();print_int c; print_newline ();print_string "---"; print_newline (); () default () ;;