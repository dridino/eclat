
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
let for_all_1(f, t) =
      let rec loop (i) =
    if i >= t.length then true else
    let update(i) = f (t[i])
    in
    let v1 = update (i) in
    if v1 then loop (i+1)
    else false
  in
  loop 0 ;;
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
      let for_all_4(f, t) =
      let rec loop (i) =
    if i >= t.length - 3 then true else
    let update(i) = f (t[i])
    in
    let v1 = update (i)
    and v2 = update (i+1)
    and v3 = update (i+2)
    and v4 = update (i+3) in
    if v1 && v2 && v3 && v4 then loop (i+4)
    else false
  in
  loop 0 ;;
      let for_all_8(f, t) =
      let rec loop (i) =
    if i >= t.length - 7 then true else
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
    if v1 && v2 && v3 && v4 && v5 && v6 && v7 && v8 then loop (i+8)
    else false
  in
  loop 0 ;;
      
let main () =
    let c = counter () in
    exec
print_int c; print_string "_";let _ = for_all_1(wait_true_1000, t) in ();print_int c; print_newline ();print_int c; print_string "_";let _ = for_all_2(wait_true_1000, t) in ();print_int c; print_newline ();print_int c; print_string "_";let _ = for_all_4(wait_true_1000, t) in ();print_int c; print_newline ();print_int c; print_string "_";let _ = for_all_8(wait_true_1000, t) in ();print_int c; print_newline ();print_string "---"; print_newline (); () default () ;;