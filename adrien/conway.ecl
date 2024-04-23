let n = 8 ;;
let static board1 = 0^64 ;;
let static board2 = 0^64 ;;

let get_idx(c, l) = c*n + l ;;

let coord_from_idx(a) = (a/n, a mod n) ;;

let init_board () =
    let rec loop (i) =
        if i < 0 then () else (board1.(i) <- 1; loop (i-1))
    in loop (5) ;;

let init_glider () =
    board1.(get_idx(0, 1)) <- 1;
    board1.(get_idx(1, 2)) <- 1;
    board1.(get_idx(2, 0)) <- 1;
    board1.(get_idx(2, 1)) <- 1;
    board1.(get_idx(2, 2)) <- 1 ;;

let step (src, dst) =
    let num_neighbours (i, j) =
        let f (i, j) =
            if i >= 0 && i < n then
                if j >= 0 && j < n then src.(get_idx(i, j)) else 0
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
        let is_alive = src.(idx) <> 0 in
        if is_alive then
            if num_n < 2 or num_n > 3 then
                dst.(idx) <- 0
            else dst.(idx) <- 1
        else if num_n = 3 then
                dst.(idx) <- 1 
            else dst.(idx) <- 0
    in
    let rec loop (i) =
        if i >= n*n then ()
        else (f(i); loop(i+1)) in
    loop (0) ;;

let print_board (board) =
    let f (i, j) = print_string (if board.(i*n + j) <> 0 then " O " else " . ") in
    let rec loopj (i, j) =
        if j >= n then () else (f(i, j); loopj (i, j+1))
    in
    let rec loopi (i) =
        if i >= n then print_newline () else (loopj (i, 0); print_newline (); loopi (i+1))
    in
    loopi (0) ;;

let main() =
    exec (
        init_glider ();
        print_board (board1);

        step (board1, board2);
        print_board (board2);

        step (board2, board1);
        print_board (board1);

        step (board1, board2);
        print_board (board2);

        step (board2, board1);
        print_board (board1);

        step (board1, board2);
        print_board (board2);

        let rec f() = f() in
        f()
    ) default () ;;