let n = 8 ;;

(* read tab *)
let static c0_0 = 0^8 ;;
let static c1_0 = 0^8 ;;
let static c2_0 = 0^8 ;;
let static c3_0 = 0^8 ;;
let static c4_0 = 0^8 ;;
let static c5_0 = 0^8 ;;
let static c6_0 = 0^8 ;;
let static c7_0 = 0^8 ;;

(* write tab *)
let static c0_1 = 0^8 ;;
let static c1_1 = 0^8 ;;
let static c2_1 = 0^8 ;;
let static c3_1 = 0^8 ;;
let static c4_1 = 0^8 ;;
let static c5_1 = 0^8 ;;
let static c6_1 = 0^8 ;;
let static c7_1 = 0^8 ;;


let coord_from_idx(a) = (a/n, a mod n) ;;

let rec get_value(idx, c, first_tab) =
    if c = 0 then if first_tab then c0_0.(idx) else c0_1.(idx)
    else if c = 1 then if first_tab then c1_0.(idx) else c1_1.(idx)
    else if c = 2 then if first_tab then c2_0.(idx) else c2_1.(idx)
    else if c = 3 then if first_tab then c3_0.(idx) else c3_1.(idx)
    else if c = 4 then if first_tab then c4_0.(idx) else c4_1.(idx)
    else if c = 5 then if first_tab then c5_0.(idx) else c5_1.(idx)
    else if c = 6 then if first_tab then c6_0.(idx) else c6_1.(idx)
    else if c = 7 then if first_tab then c7_0.(idx) else c7_1.(idx)
    else 0 ;;

let rec put_value(v, idx, c, first_tab) =
    if c = 0 then if first_tab then c0_0.(idx) <- v else c0_1.(idx) <- v
    else if c = 1 then if first_tab then c1_0.(idx) <- v else c1_1.(idx) <- v
    else if c = 2 then if first_tab then c2_0.(idx) <- v else c2_1.(idx) <- v
    else if c = 3 then if first_tab then c3_0.(idx) <- v else c3_1.(idx) <- v
    else if c = 4 then if first_tab then c4_0.(idx) <- v else c4_1.(idx) <- v
    else if c = 5 then if first_tab then c5_0.(idx) <- v else c5_1.(idx) <- v
    else if c = 6 then if first_tab then c6_0.(idx) <- v else c6_1.(idx) <- v
    else if c = 7 then if first_tab then c7_0.(idx) <- v else c7_1.(idx) <- v ;;

let init_glider () =
    c0_0.(1) <- 1;
    c1_0.(2) <- 1;
    c2_0.(0) <- 1;
    c2_0.(1) <- 1;
    c2_0.(2) <- 1 ;;

(*
let rec print_board (first_tab) =
    let f (i, j) = print_string (if get_value(i, j, first_tab) <> 0 then " O " else " . ") in
    let rec loopj (i, j) =
        if j >= n then () else (f(i, j); loopj (i, j+1))
    in
    let rec loopi (i) =
        if i >= n then print_newline () else (loopj (i, 0); print_newline (); loopi (i+1))
    in
    loopi (0) ;; *)

let rec num_neighbours (i, j, first_tab) =
        let rec f (i, j) =
            if i >= 0 && i < n then
                if j >= 0 && j < n then get_value(i, j, first_tab) else 0
            else 0
        in
        f(i-1, j-1) + f(i-1, j) + f(i-1, j+1) + f(i, j-1) + f(i, j+1) + f(i+1, j-1) + f(i+1, j) + f(i+1, j+1) ;;

let rec one(i, j, first_tab) =
        let num_n = num_neighbours(i, j, first_tab) in
        let is_alive = get_value(i, j, first_tab) <> 0 in
        let v =
            if is_alive then
                if num_n < 2 or num_n > 3 then 0 else 1
            else
                if num_n = 3 then 1 else 0
        in
        put_value(v, i, j, not(first_tab)) ;;

let step_seq (first_tab) =
    let rec loop (k) =
        if k >= n*n then () else let (i, j) = coord_from_idx(k) in (one(i, j, first_tab); loop (k+1))
    in
    loop (0) ;;

let step_par (first_tab) =
    let loop8 (f) =
        macro_for i = 0 to (n-1) do
            f(i)
        done
    in
    let rec f0(i, j) = one(i, j, true) in
    let rec f1(i, j) = one(i, j, false) in
    if first_tab then
        let () = loop8((fun (i) -> f0(i, 0)))
        and () = loop8((fun (i) -> f0(i, 1)))
        and () = loop8((fun (i) -> f0(i, 2)))
        and () = loop8((fun (i) -> f0(i, 3)))
        and () = loop8((fun (i) -> f0(i, 4)))
        and () = loop8((fun (i) -> f0(i, 5)))
        and () = loop8((fun (i) -> f0(i, 6)))
        and () = loop8((fun (i) -> f0(i, 7)))
        in ()
    else
        let () = loop8((fun (i) -> f1(i, 0)))
        and () = loop8((fun (i) -> f1(i, 1)))
        and () = loop8((fun (i) -> f1(i, 2)))
        and () = loop8((fun (i) -> f1(i, 3)))
        and () = loop8((fun (i) -> f1(i, 4)))
        and () = loop8((fun (i) -> f1(i, 5)))
        and () = loop8((fun (i) -> f1(i, 6)))
        and () = loop8((fun (i) -> f1(i, 7)))
        in ()
    ;;

let counter () =
    reg (fun v -> v + 1) last 0 ;;

let iteri_8(f, t) =
  let rec loop (i) =
    if i >= n then () else
    let () = f(i, t.(i))
    and () = f(i+1, t.(i+1))
    and () = f(i+2, t.(i+2))
    and () = f(i+3, t.(i+3))
    and () = f(i+4, t.(i+4))
    and () = f(i+5, t.(i+5))
    and () = f(i+6, t.(i+6))
    and () = f(i+7, t.(i+7))
    in
    loop (i+8)
  in
  loop 0 ;;

(* sans paralleliser : 1709 / step *)
(* en parallelisant  :  149 / step *)
let main () =
    let c = counter () in
    exec (
        init_glider ();
        print_string "start : "; print_int c; print_newline ();
        step_par(true);
        print_string "end : "; print_int c; print_newline ();

        let rec f() = f () in f ()
    ) default () ;;