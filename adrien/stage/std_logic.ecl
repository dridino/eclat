let print_bool(b) =
    if b then print_string "true" else print_string "false" ;;

let main() =
    let s = ONE in
    let (rdy, res) = bool_of_std_logic s in
    print_bool (rdy); print_string " "; print_bool (res); print_newline () ;;
