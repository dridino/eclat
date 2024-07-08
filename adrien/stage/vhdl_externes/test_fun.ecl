external Ex1.ex_add : int<10> * int<10> => int<10> ;;

let main((b1,b2) : bool*bool) : unit =
    print_int (Ex1.ex_add(0,1)) ;;