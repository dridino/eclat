let n = 10 ;;
let static board = 0^100 ;;


let get_idx(c, l) = c + n*l ;;

let coord_from_idx(a) =
    let rec loop (a, i) =
        if a >= n then loop(a - n, i+1)
        else (i, a)
    in loop(a, 0) ;;

let init_board () =
    for i = 0 to 2 do
        for j = 0 to 2 do
            board.(get_idx(i, j)) <- 1
        done
    done;;

let step () =
    let num_neighbours (i, j) =
        let s = 0^1 in
        if i > 0 then
            s.(0) <- s.(0) + board.(get_idx(i-1, j));
            if j > 0 then
                s.(0) <- s.(0) + board.(get_idx(i  , j-1));
                s.(0) <- s.(0) + board.(get_idx(i-1, j-1));
            if j < n - 1 then
                s.(0) <- s.(0) + board.(get_idx(i  , j+1));
                s.(0) <- s.(0) + board.(get_idx(i-1, j+1));
        if i < n - 1 then
            s.(0) <- s.(0) + board.(get_idx(i+1, j));
            if j > 0 then
                s.(0) <- s.(0) + board.(get_idx(i+1, j-1));
            if j < n - 1 then
                s.(0) <- s.(0) + board.(get_idx(i+1, j+1));
        s.(0)
    in
    let f(idx) =
        let (i, j) = coord_from_idx (idx) in
        let num_n = num_neighbours(i, j) in
        let is_alive = board.(idx) <> 0 in
        if is_alive && num_n < 2 && num_n > 3 then
            board.(idx) <- 0;
        if not is_alive && num_n = 3 then
            board.(idx) <- 1 in
    let rec loop (i) =
        if i >= n*n then ()
        else (f(i); loop(i+1)) in
    loop (0) ;;

let print_board () =
    let rec aux (i, v) =
        if i = n*n then ()
        else
            (print_string (if board.(i) <> 0 then "O" else ".");
            if v - n = 1 then (print_newline (); aux (i+1, 0)) else aux(i+1, v+1))
    in aux (0, 0);;

let main() =
    exec (
        init_board ();
        for i = 0 to 10 do
            step ();
            print_board ()
        done
    ) default () ;;