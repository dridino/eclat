external Interface_accelerometer : (int<2> * std_logic * std_logic) =>
(int<16> * int<16> * int<16> * std_logic * bool * std_logic * std_logic) ;;

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


let number_to_alpha(n : int<16>) = (* 21 car on prend le signe *)
    let i1 = int_of_tuple<4>(get_bit(n, 3), get_bit(n, 2), get_bit(n, 1), get_bit(n, 0)) in
    let i2 = int_of_tuple<4>(get_bit(n, 7), get_bit(n, 6), get_bit(n, 5), get_bit(n, 4)) in
    let i3 = int_of_tuple<4>(get_bit(n, 11), get_bit(n, 10), get_bit(n, 9), get_bit(n, 8)) in
    let i4 = int_of_tuple<4>(get_bit(n, 15), get_bit(n, 14), get_bit(n, 13), get_bit(n, 12)) in
    if n >= 0 then
        (map_digit(i1), map_digit(i2), map_digit(i3), map_digit(i4), display0, display0)
    else
        (map_digit(15 - i1), map_digit(15 - i2), map_digit(15 - i3), map_digit(15 - i4), tuple_of_int<8>(0b11111101), display0) ;; (* 15 - x car complément à 2 *)


let main(((s0,s1,s2,s3,s4,s5,s6,s7,s8,s9), keys, gsensor_int, gsensor_sdo, gsensor_sdi) : ((bool*bool*bool*bool*bool*bool*bool*bool*bool*bool) * int<2> * int<2> * std_logic * std_logic)) =
    let (accel_x,accel_y,accel_z,gsensor_cs_n,gsensor_sclk,gsensor_sdo,gsensor_sdi) =
        run Interface_accelerometer(gsensor_int, gsensor_sdo, gsensor_sdi) in

    
    let digs = if s0 then
            number_to_alpha(accel_x)
        else if s1 then
            number_to_alpha(accel_y)
        else if s2 then
            number_to_alpha(accel_z)
        else
            display_zero
    in
    let z : int<4> = 0 in
    ((s0,s1,s2,s3,s4,s5,s6,s7,s8, accel_z>0), digs, gsensor_cs_n, gsensor_sclk,false,false,z,z,z, gsensor_sdo, gsensor_sdi)
    ;;