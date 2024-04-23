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

let get_value(idx, c) =
    if c = 0 then c0_0.(idx)
    else if c = 1 then c1_0.(idx)
    else if c = 2 then c2_0.(idx)
    else if c = 3 then c3_0.(idx)
    else if c = 4 then c4_0.(idx)
    else if c = 5 then c5_0.(idx)
    else if c = 6 then c6_0.(idx)
    else if c = 7 then c7_0.(idx)
    else 0 ;;

let put_value(v, idx, c) =
    if c = 0 then c0_1.(idx) <- v
    else if c = 1 then c1_1.(idx) <- v
    else if c = 2 then c2_1.(idx) <- v
    else if c = 3 then c3_1.(idx) <- v
    else if c = 4 then c4_1.(idx) <- v
    else if c = 5 then c5_1.(idx) <- v
    else if c = 6 then c6_1.(idx) <- v
    else if c = 7 then c7_1.(idx) <- v ;;

let init_glider () =
    c1_0.(0) <- 1;
    c2_0.(1) <- 1;
    c0_0.(2) <- 1;
    c1_0.(2) <- 1;
    c2_0.(2) <- 1 ;;

let print_board () =
    let f (i, j) = print_string (if get_value(i, j) <> 0 then " O " else " . ") in
    let rec loopj (i, j) =
        if j >= n then () else (f(i, j); loopj (i, j+1))
    in
    let rec loopi (i) =
        if i >= n then print_newline () else (loopj (i, 0); print_newline (); loopi (i+1))
    in
    loopi (0) ;;

let invert () =
    let rec loop (i) =
        if i >= n then () else (
            c0_0.(i) <- c0_1.(i);
            c1_0.(i) <- c1_1.(i);
            c2_0.(i) <- c2_1.(i);
            c3_0.(i) <- c3_1.(i);
            c4_0.(i) <- c4_1.(i);
            c5_0.(i) <- c5_1.(i);
            c6_0.(i) <- c6_1.(i);
            c7_0.(i) <- c7_1.(i);
            loop (i+1)
        )
    in loop (0) ;;

let step () =
    let num_neighbours (i, j) =
        let f (i, j) =
            if i >= 0 && i < n then
                if j >= 0 && j < n then get_value(i, j) else 0
            else 0
        in
        f(i-1, j-1) + f(i-1, j) + f(i-1, j+1) + f(i, j-1) + f(i, j+1) + f(i+1, j-1) + f(i+1, j) + f(i+1, j+1)
    in
    let f(i, j) =
        let num_n = num_neighbours(i, j) in
        let is_alive = get_value(i, j) <> 0 in
        let v =
            if is_alive then
                if num_n < 2 or num_n > 3 then 0 else 1
            else
                if num_n = 3 then 1 else 0
        in
        put_value(v, i, j)
    in
    let rec loopj (i, j) =
        if j >= n then () else (f(i, j); loopj (i, j+1))
    in
    let rec loopi (i) =
        if i >= n then () else (loopj (i, 0); loopi (i+1))
    in
    loopi (0) ;;

let main () =
    exec (
        step ()
    ) default () ;;