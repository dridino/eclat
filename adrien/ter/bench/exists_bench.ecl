
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
let exists_1(f, t) =
      let rec loop (i) =
        if i >= t.length then false else
        let update(i) = f (t[i])
        in
        let v1 = update (i) in
        if v1 then true
        else loop (i+1)
      in
      loop 0 ;;
      let exists_2(f, t) =
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
      let exists_4(f, t) =
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
      let exists_8(f, t) =
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
      
let main () =
    let c = counter () in
    exec
print_int c; print_string "_";let _ = exists_1(wait_false_1000, t) in ();print_int c; print_newline ();print_int c; print_string "_";let _ = exists_2(wait_false_1000, t) in ();print_int c; print_newline ();print_int c; print_string "_";let _ = exists_4(wait_false_1000, t) in ();print_int c; print_newline ();print_int c; print_string "_";let _ = exists_8(wait_false_1000, t) in ();print_int c; print_newline ();print_string "---"; print_newline (); () default () ;;