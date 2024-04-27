let n = 8 ;;
let static board1 = false^64 ;;
let static board2 = false^64 ;;

let get_idx(c, l) = c*n + l ;;

let coord_from_idx(a) = (a/n, a mod n) ;;

let init_board () =
    let rec loop (i) =
        if i < 0 then () else (board1.(i) <- true; loop (i-1))
    in loop (5) ;;

let init_glider () =
    board1.(get_idx(0, 1)) <- true;
    board1.(get_idx(1, 2)) <- true;
    board1.(get_idx(2, 0)) <- true;
    board1.(get_idx(2, 1)) <- true;
    board1.(get_idx(2, 2)) <- true ;;

let step (src, dst) =
    let num_neighbours (i, j) =
        let f (i, j) =
            if i >= 0 && i < n then
                if j >= 0 && j < n then
                    if src.(get_idx(i, j)) then 1 else 0
                else 0
            else 0
        in
        let v = 0 in
        let v = v + f(i-1, j-1) in
        let v = v + f(i-1, j) in
        let v = v + f(i-1, j+1) in

        let v = v + f(i, j-1) in
        let v = v + f(i, j+1) in

        let v = v + f(i+1, j-1) in
        let v = v + f(i+1, j) in
        let v = v + f(i+1, j+1) in
        v
    in
    let f(idx) =
        let (i, j) = coord_from_idx (idx) in
        let num_n = num_neighbours(i, j) in
        let is_alive = src.(idx) in
        if is_alive then
            if num_n < 2 or num_n > 3 then
                dst.(idx) <- false
            else dst.(idx) <- true
        else if num_n = 3 then
                dst.(idx) <- true
            else dst.(idx) <- false
    in
    let rec loop (i) =
        if i >= n*n then ()
        else (f(i); loop(i+1)) in
    loop (0) ;;

let counter () =
    reg (fun v -> v + 1) last 0 ;;

let main() =
    let c = counter () in
    exec (
        init_glider ();
        print_string "start : "; print_int c; print_newline ();
        step (board1, board2);
        print_string "end : "; print_int c; print_newline ();

        let rec f () = f () in f ()
    ) default () ;;