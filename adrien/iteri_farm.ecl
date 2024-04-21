(*  Perf :
    une fonction qui s'exécute en 1000 temps sur une entrée et en 100 sur les autres

    iteri_farm  : 1015
    iteri       : 2581
    iteri_8     : 1125
*)

let static src = 0^128 ;;
let static dst = 0^128 ;;

let idx(incr, reset) = reg (fun v -> if reset then 0 else (if incr then v + 1 else v)) last 0 ;;

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
        if i >= t.length then ()
        else (f(i, t.(i)); loop(i+1))
    in
    loop (0) ;;

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

let rec wait (n) = if n = 0 then () else wait(n-1) ;;

let counter() = reg (fun v -> v+1) last 0 ;;

let main () =
    let rec f (i, v) = if i mod 2 = 0 then wait(1000) else wait(100) in
    let c = counter () in
    exec (
        (* iteri_farm((fun (i, v) -> dst.(i) <- i), src);
        iteri_farm((fun (i, v) -> print_int (v); print_newline ()), dst) *)
        print_string "c_farm : "; print_int c; print_newline ();
        iteri_farm(f, src);
        print_string "c_farm : "; print_int c; print_newline ();

        (* print_string "c_classic : "; print_int c; print_newline ();
        iteri(f, src);
        print_string "c_classic : "; print_int c; print_newline (); *)
        
        print_string "c_8 : "; print_int c; print_newline ();
        iteri_8(f, src);
        print_string "c_8 : "; print_int c; print_newline ()
    ) default () ;;