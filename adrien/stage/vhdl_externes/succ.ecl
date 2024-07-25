external Pkg.succ : int<10> => int<10> ;;

let main() =
    print_int (reg (fun v -> Pkg.succ(v)) last 0); print_newline () ;;