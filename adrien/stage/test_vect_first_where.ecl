let f (i,v) = v*v = 49 ;;

let main() =
    let (valid,value) = vect_first_where(f,[|0;1;7;4|]) in
    if valid then (
        print_string "valid : ";
        print_int (value)
    ) else print_string "invalid";
    print_newline () ;;