
let counter () =
    reg (fun v -> v + 1) last 0 ;;

let rec wait(n) =
    if n <= 1 then () else wait(n-1) ;;

let rec wait_true(n) =
    if n <= 1 then true else wait_true(n-1) ;;
    
let rec wait_false(n) =
    if n <= 1 then false else wait_false(n-1) ;;

let static t = 0^256 ;;
let iteri(f, t) =
    let rec loop (i) =
        if i >= t.length then () else (
            let () = f(i, t.(i))
            in loop (i+1)
        )
    in loop (0) ;;
      let iteri_8(f, t) =
    let rec loop (i) =
        if i >= t.length then () else (
            let () = f(i, t.(i))
            and () = f(i+1, t.(i+1))
            and () = f(i+2, t.(i+2))
            and () = f(i+3, t.(i+3))
            and () = f(i+4, t.(i+4))
            and () = f(i+5, t.(i+5))
            and () = f(i+6, t.(i+6))
            and () = f(i+7, t.(i+7))
            in loop (i+8)
        )
    in loop (0) ;;
      let iteri_farm(f, t) =
    let n = t.length in
    let idx = 0^1 in
    let rec loop() =
        (* let i = idx(false, false) in *)
        let i = idx.(0) in
        (* if i >= n then () else (let _ = idx(true, false) in let () = f(i, t.(i)) in loop ()) *)
        if i >= n then () else (idx.(0) <- i + 1; let () = f(i, t.(i)) in loop ())
    in
    let () = loop ()
    and () = loop ()
    and () = loop ()
    and () = loop ()
    and () = loop ()
    and () = loop ()
    and () = loop ()
    and () = loop ()
    (* in let _ = idx(false, true) in () ;; *)
    in idx.(0) <- 0; () ;;
      let iteri(f, t) =
    let rec loop (i) =
        if i >= t.length then () else (
            let () = f(i, t.(i))
            in loop (i+1)
        )
    in loop (0) ;;
      let iteri_8(f, t) =
    let rec loop (i) =
        if i >= t.length then () else (
            let () = f(i, t.(i))
            and () = f(i+1, t.(i+1))
            and () = f(i+2, t.(i+2))
            and () = f(i+3, t.(i+3))
            and () = f(i+4, t.(i+4))
            and () = f(i+5, t.(i+5))
            and () = f(i+6, t.(i+6))
            and () = f(i+7, t.(i+7))
            in loop (i+8)
        )
    in loop (0) ;;
      let iteri_farm(f, t) =
    let n = t.length in
    let idx = 0^1 in
    let rec loop() =
        let i = idx.(0) in
        if i >= n then () else (idx.(0) <- i + 1; let () = f(i, t.(i)) in loop ())
    in
    let () = loop ()
    and () = loop ()
    and () = loop ()
    and () = loop ()
    and () = loop ()
    and () = loop ()
    and () = loop ()
    and () = loop ()
    (* in let _ = idx(false, true) in () ;; *)
    in idx.(0) <- 0; () ;;
      
let main () =
    let c = counter () in
    exec
print_int c; print_string "_";iteri((fun (i, v) -> if i mod 2 = 0 then wait(1100) else wait(100)), t);print_int c; print_newline ();print_int c; print_string "_";iteri_8((fun (i, v) -> if i mod 2 = 0 then wait(1100) else wait(100)), t);print_int c; print_newline ();print_int c; print_string "_";iteri_farm((fun (i, v) -> if i mod 2 = 0 then wait(1100) else wait(100)), t);print_int c; print_newline ();print_int c; print_string "_";iteri((fun _ -> wait(1000)), t);print_int c; print_newline ();print_int c; print_string "_";iteri_8((fun _ -> wait(1000)), t);print_int c; print_newline ();print_int c; print_string "_";iteri_farm((fun _ -> wait(1000)), t);print_int c; print_newline ();print_string "---"; print_newline (); () default () ;;