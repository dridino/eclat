external Test_circ1 : int<10> => int<10> ;;

(*
let map_digit(n: int<4>) =
    match n with
    | 0 -> display0
    | 1 -> display1
    | 2 -> display2
    | 3 -> display3
    | 4 -> display4
    | 5 -> display5
    | 6 -> display6
    | 7 -> display7
    | 8 -> display8
    | 9 -> display9
    | 10 -> displayA
    | 11 -> displayB
    | 12 -> displayC
    | 13 -> displayD
    | 14 -> displayE
    | 15 -> displayF
    | _ -> displayL
    end ;;

let number_to_alpha(n : int<10>) = (* 21 car on prend le signe *)
    let i1 = int_of_tuple<4>(get_bit(n, 3), get_bit(n, 2), get_bit(n, 1), get_bit(n, 0)) in
    let i2 = int_of_tuple<4>(get_bit(n, 7), get_bit(n, 6), get_bit(n, 5), get_bit(n, 4)) in
    let i3 = int_of_tuple<4>(false, false, get_bit(n, 9), get_bit(n, 8)) in
    if n >= 0 then
        (map_digit(i1), map_digit(i2), map_digit(i3), tuple_of_int<8>(0b11111111), tuple_of_int<8>(0b11111111), tuple_of_int<8>(0b11111111))
    else
        (map_digit(15 - i1), map_digit(15 - i2), map_digit(15 - i3), display0, tuple_of_int<8>(0b11111101), tuple_of_int<8>(0b11111111)) ;; (* 15 - x car complément à 2 *)
*)

let rec f () = () ;;

let main() =
    let (r1,_) = reg (fun (vv,rdy) ->
        let v =
            let v2 = run Test_circ1(2) in
            let v1 = run Test_circ1(1) in
            v1+v2 in
        v,true
    ) last (0,false) in
    print_int r1
    ;;