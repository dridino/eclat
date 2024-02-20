
let static t = 10^50 ;;

let map_t f =
    let rec loop i =
        if i < t.length - 1 then
            let y1 = t[i] in
            let y2 = t[i+1] in
            let v1 = f y1 and
                v2 = f y2 in
            t[i] <- v1;
            t[i+1] <- v2;
            loop (i+2)
        else ()
    in loop 0 ;;

let fact n =
    let rec loop (m, acc) =
        if m <= 1 then acc
        else loop(m-1, acc*m)
    in loop (n, 1) ;;

let main () =
    map_t (fun v -> 10);
    map_t fact;
    let rec iter i =
        if i < t.length then
            (print_int(t[i]);
            print_newline();
            iter(i+1))
        else ()
    in iter 0 ;;

(* to run: $ ./eclat tests/static1.ecl ; make simul

   ~> 1,5,9,13,17,21,25,29,33,37,41,45,49,5... *)