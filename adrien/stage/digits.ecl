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

let number_to_alpha(n : int<25>) = (* 25 car signe *)
    let i1 = int_of_tuple<4>(get_bit(n, 3), get_bit(n, 2), get_bit(n, 1), get_bit(n, 0)) in
    let i2 = int_of_tuple<4>(get_bit(n, 7), get_bit(n, 6), get_bit(n, 5), get_bit(n, 4)) in
    let i3 = int_of_tuple<4>(get_bit(n, 11), get_bit(n, 10), get_bit(n, 9), get_bit(n, 8)) in
    let i4 = int_of_tuple<4>(get_bit(n, 15), get_bit(n, 14), get_bit(n, 13), get_bit(n, 12)) in
    let i5 = int_of_tuple<4>(get_bit(n, 19), get_bit(n, 18), get_bit(n, 17), get_bit(n, 16)) in
    let i6 = int_of_tuple<4>(get_bit(n, 23), get_bit(n, 22), get_bit(n, 21), get_bit(n, 20)) in
    (map_digit(i1), map_digit(i2), map_digit(i3), map_digit(i4), map_digit(i5), map_digit(i6)) ;;

let cpt (incr, res) =
    reg (fun v -> if res then 0 else if incr then v+1 else v) last 0 ;;

let fby (a,b) =
  let step (x,_) = (b,x) in
  let (_,x) = reg step last (a,b) in x ;;

let edge i = not (fby(false,i)) & i ;;

let main ((s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, btn0, btn1) : (bool * bool * bool * bool * bool * bool * bool * bool * bool * bool * bool * bool)) =
    let c = cpt(edge (not btn0), not btn1) in
    (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, number_to_alpha(c)) ;;