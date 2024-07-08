let static arr = 0^16 ;;

let main() =
    let _ = exec arr.(0) <- 1; print_int(arr.(0)) default () in
    () ;;