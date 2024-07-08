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

(*
let number_to_digits (n : int<19>) =
    let v1 = n mod 10 in
    let n = n / 10 in
    let v2 = n mod 10 in
    let n = n / 10 in
    let v3 = n mod 10 in
    let n = n / 10 in
    let v4 = n mod 10 in
    let n = n / 10 in
    let v5 = n mod 10 in
    let n = n / 10 in
    let v6 = n mod 10 in
    (map_digit(v1), map_digit(v2), map_digit(v3), map_digit(v4), map_digit(v5), map_digit(v6)) ;;
*)

let number_to_alpha(n : int<16>) = (* 21 car on prend le signe *)
    let i1 = int_of_tuple<4>(get_bit(n, 3), get_bit(n, 2), get_bit(n, 1), get_bit(n, 0)) in
    let i2 = int_of_tuple<4>(get_bit(n, 7), get_bit(n, 6), get_bit(n, 5), get_bit(n, 4)) in
    let i3 = int_of_tuple<4>(get_bit(n, 11), get_bit(n, 10), get_bit(n, 9), get_bit(n, 8)) in
    let i4 = int_of_tuple<4>(get_bit(n, 15), get_bit(n, 14), get_bit(n, 13), get_bit(n, 12)) in
    if n >= 0 then
        (map_digit(i1), map_digit(i2), map_digit(i3), map_digit(i4), display0, display0)
    else
        (map_digit(15 - i1), map_digit(15 - i2), map_digit(15 - i3), map_digit(15 - i4), tuple_of_int<8>(0b11111101), display0) ;; (* 15 - x car complément à 2 *)

let main ((s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, btn0, btn1, data_x, data_y, data_z) : (bool * bool * bool * bool * bool * bool * bool * bool * bool * bool * bool * bool * int<16> * int<16> * int<16>)) =
    if s0 then
        (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, number_to_alpha(data_x))
    else if s1 then
        (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, number_to_alpha(data_y))
    else if s2 then
        (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, number_to_alpha(data_z))
    else
        (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, display_zero) ;;
