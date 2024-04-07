let n = 8 ;;
let static board1 = 0^64 ;;
let static board2 = 0^64 ;;


let get_idx(c, l) = c*n + l ;;

let coord_from_idx(a) =
    let rec loop (a, i) =
        if a >= n then loop(a - n, i+1)
        else (i, a)
    in loop(a, 0) ;;

let init_board () =
    let rec loop (i) =
        if i < 0 then () else (board1.(i) <- 1; loop (i-1))
    in loop (5) ;;

let step (src, dst) =
    let num_neighbours (i, j) =
        let s = 0^1 in
        s.(0) <- 0;
        if i > 0 then
            (s.(0) <- s.(0) + src.(get_idx(i-1, j));
            if j > 0 then
                (s.(0) <- s.(0) + src.(get_idx(i , j-1));
                s.(0) <- s.(0) + src.(get_idx(i-1, j-1)));
            if j < n - 1 then
                (s.(0) <- s.(0) + src.(get_idx(i , j+1));
                s.(0) <- s.(0) + src.(get_idx(i-1, j+1))));
        if i < n - 1 then
            (s.(0) <- s.(0) + src.(get_idx(i+1, j));
            if j > 0 then
                s.(0) <- s.(0) + src.(get_idx(i+1, j-1));
            if j < n - 1 then
                s.(0) <- s.(0) + src.(get_idx(i+1, j+1)));
        s.(0)
    in
    let f(idx) =
        let (i, j) = coord_from_idx (idx) in
        let num_n = num_neighbours(i, j) in
        let is_alive = src.(idx) <> 0 in
        if is_alive && num_n < 2 && num_n > 3 then
            dst.(idx) <- 0;
        if not is_alive && num_n = 3 then
            dst.(idx) <- 1 in
    let rec loop (i) =
        if i >= n*n then ()
        else (f(i); loop(i+1)) in
    loop (0) ;;

let print_board (board) =
    let f (i, j) = print_string (if board.(i*n + j) <> 0 then " O " else " . ") in
    let rec loopj (i, j) =
        if j < 0 then () else (f(i, j); loopj (i, j-1))
    in
    let rec loopi (i) =
        if i < 0 then print_newline () else (loopj (i, n-1); print_newline (); loopi (i-1))
    in
    loopi (n-1) ;;

let main() =
    exec (
        init_board ();
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
        print_board (board2)
    ) default () ;;