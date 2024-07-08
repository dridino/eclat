let get_bit_b(v, i) =
    get_bit(v, resize_int<32>(i)) ;;

(* PLL *)
(* exec f(arg) 1 fois sur n cycles*)
let pll(n: int<5>) =
    reg (fun (_, v) -> if v = n then (true, 0) else (false, v + 1)) last (true, 0) ;;

(* interface avec accelerometre *)
(* OUT *)
(* oS2P_DATA, oSPI_CLK, oSPI_CSN, oSPI_END (*buffer*), ioSPI_SDIO (*inout*) *)
let spi_controller =
    let zero_16 : int<16> = 0 in
    let zero_8 : int<8> = 0 in
    let zero_4 : int<4> = 0 in
    (* utilisé que pour spi_count de taille 4 *)
    let reduce_or_4(n) = get_bit_b(n, 0) or get_bit_b(n, 1) or get_bit_b(n, 2) or get_bit_b(n, 3)
    in
    
    (fun (iP2S_DATA, iRSTN, iSPI_CLK, iSPI_CLK_OUT, iSPI_GO, ioSPI_SDIO (*inout*)) : (int<16> * bool * bool * bool * bool * std_logic) ->
        let (_, _, _, _, _, _, _, _, _, oSPI_CLK, oS2P_DATA, oSPI_CSN, oSPI_END, ioSPI_SDIO) = reg (fun (oS2P_DATA_Reg, tmp_ivl_13, tmp_ivl_15, tmp_ivl_17, tmp_ivl_19, read_mode, spi_count, spi_count_en, write_adress, oSPI_CLK, oS2P_DATA, oSPI_CSN, oSPI_END, ioSPI_SDIO) ->
            let oS2P_DATA : int<8> = oS2P_DATA_Reg in
            let oSPI_CSN = not(iSPI_GO) in
            let tmp_ivl_15 = tmp_ivl_13 or write_adress in
            let tmp_ivl_17 = spi_count_en && tmp_ivl_15 in
            let read_mode = get_bit_b(iP2S_DATA, 15) in
            let write_adress = get_bit_b(spi_count, 3) in
            let oSPI_END = not(reduce_or_4(spi_count)) in
            let oSPI_CLK = if spi_count_en then iSPI_CLK_OUT else true in
            let tmp_ivl_13 = not(read_mode) in
            let tmp_ivl_19 = get_bit_b(iP2S_DATA, spi_count) in
            let ioSPI_SDIO = if tmp_ivl_17 then std_logic_of_bool(tmp_ivl_19) else Z in
            
            let (spi_count, spi_count_en, oS2P_DATA_Reg) : (int<4>*bool*int<8>) =
                if not(iRSTN) then
                    (15, false, oS2P_DATA_Reg)
                else if iSPI_CLK then (
                    let (spi_count, spi_count_en, oS2P_DATA_Reg) =
                        if oSPI_END then
                            (spi_count, false, oS2P_DATA_Reg)
                        else
                            if iSPI_GO then
                                (spi_count, true, oS2P_DATA_Reg)
                            else
                                (spi_count, spi_count_en, oS2P_DATA_Reg)
                    in
                
                    let (spi_count, spi_count_en, oS2P_DATA_Reg) =
                        if not(spi_count_en) then
                            (15, spi_count_en, oS2P_DATA_Reg)
                        else
                            (spi_count - 1, spi_count_en, oS2P_DATA_Reg)
                    in

                    let (spi_count, spi_count_en, oS2P_DATA_Reg) =
                        if (read_mode && not(write_adress)) then
                            let n = oS2P_DATA_Reg in
                            let (valid, res) = bool_of_std_logic(ioSPI_SDIO) in
                            let oS2P_DATA_Reg = int_of_tuple<8>(get_bit_b(n, 6), get_bit_b(n, 5), get_bit_b(n, 4), get_bit_b(n, 3), get_bit_b(n, 2), get_bit_b(n, 1), get_bit_b(n, 0), if valid then res else false) in
                            (spi_count, spi_count_en, oS2P_DATA_Reg)
                        else
                            (spi_count, spi_count_en, oS2P_DATA_Reg)
                    in (spi_count, spi_count_en, oS2P_DATA_Reg)
                ) else
                    (spi_count, spi_count_en, oS2P_DATA_Reg)
            in
            (oS2P_DATA_Reg, tmp_ivl_13, tmp_ivl_15, tmp_ivl_17, tmp_ivl_19, read_mode, spi_count, spi_count_en, write_adress, oSPI_CLK, oS2P_DATA, oSPI_CSN, oSPI_END, ioSPI_SDIO)
        ) last (zero_8, false, false, false, false, false, 15, false, false, false, zero_8, false, false, ioSPI_SDIO) in
        (oS2P_DATA, oSPI_CSN, oSPI_END, oSPI_CLK, ioSPI_SDIO (*inout*))) ;;

(* interface avec accelerometre *)
let spi_ee_config =
    let zero_16 : int<16> = 0 in
    let zero_15 : int<15> = 0 in
    let zero_14 : int<14> = 0 in
    let zero_8 : int<8> = 0 in
    let zero_4 : int<4> = 0 in
    let zero_2 : int<2> = 0 in

    let set_bits_8(v, start, (b0,b1,b2,b3,b4,b5,b6,b7)) =
        let v = update_bit(v, start + 0, b0) in
        let v = update_bit(v, start + 1, b1) in
        let v = update_bit(v, start + 2, b2) in
        let v = update_bit(v, start + 3, b3) in
        let v = update_bit(v, start + 4, b4) in
        let v = update_bit(v, start + 5, b5) in
        let v = update_bit(v, start + 6, b6) in
        let v = update_bit(v, start + 7, b7) in
        v
    in

    (fun (iG_INT2, iRSTN, iSPI_CLK, iSPI_CLK_OUT, ioSPI_SDIO (*inout*)) ->
        let (_, _, _, _,
            _, _, _, _,
            _, _, _, _,
            _, _, _, _,
            _, _, data_x, data_y, data_z,
            _, oSPI_CSN, oSPI_CLK, ioSPI_SDIO) = reg (fun ((clear_status, clear_status_d, high_byte, high_byte_d,
            ini_index, low_byte_data, p2s_data, read_back,
            read_back_d, read_idle_count, read_ready, s2p_data,
            spi_end, spi_go, spi_state, write_data,
            read_idx, oSPI_CSN_Readable, data_x, data_y, data_z,
            oSPI_CLK_Readable, oSPI_CSN, oSPI_CLK, ioSPI_SDIO) : (bool*int<4>*bool*bool*int<4>*int<8>*int<16>*bool*bool*int<15>*bool*int<8>*bool*bool*bool*int<14>*int<2>*bool*int<16>*int<16>*int<16>*bool*bool*bool*std_logic)) ->

            let oSPI_CSN = oSPI_CSN_Readable in
            let oSPI_CLK = oSPI_CLK_Readable in
            let (s2p_data, oSPI_CSN_Readable, spi_end, oSPI_CLK_Readable, ioSPI_SDIO (*inout*)) =
                spi_controller(
                    p2s_data,
                    iRSTN,
                    iSPI_CLK,
                    iSPI_CLK_OUT,
                    spi_go,
                    ioSPI_SDIO
                )
            in

            let write_data = match ini_index with
            | 0 -> 9248
            | 1 -> 9475
            | 2 -> 9729
            | 3 -> 10111
            | 4 -> 10249
            | 5 -> 10566
            | 6 -> 11273
            | 7 -> 11792
            | 8 -> 12048
            | 9 -> 12608
            | _ -> 11528
            end in

            let (ini_index, spi_go, spi_state, read_idle_count, high_byte, read_idx, read_back, clear_status, p2s_data, low_byte_data, data_x, data_y, data_z) =
                if not(iRSTN) then
                    (zero_4, false, false, zero_15, false, 1, false, false, p2s_data, low_byte_data, data_x, data_y, data_z)
                else if iSPI_CLK then (
                    if ini_index < 11 then
                        if spi_state then
                            if spi_end then (
                                let ini_index = ini_index + 1 in
                                let spi_go = false in
                                let spi_state = false in
                                (ini_index, spi_go, spi_state, read_idle_count, high_byte, read_idx, read_back, clear_status, p2s_data, low_byte_data, data_x, data_y, data_z)
                            ) else 
                                (ini_index, spi_go, spi_state, read_idle_count, high_byte, read_idx, read_back, clear_status, p2s_data, low_byte_data, data_x, data_y, data_z)
                        else (
                            let p2s_data = int_of_tuple<16>(
                                get_bit_b(zero_2, 0),
                                get_bit_b(zero_2, 1),

                                get_bit_b(write_data, 13),
                                get_bit_b(write_data, 12),
                                get_bit_b(write_data, 11),
                                get_bit_b(write_data, 10),
                                get_bit_b(write_data, 9),
                                get_bit_b(write_data, 8),
                                get_bit_b(write_data, 7),
                                get_bit_b(write_data, 6),
                                get_bit_b(write_data, 5),
                                get_bit_b(write_data, 4),
                                get_bit_b(write_data, 3),
                                get_bit_b(write_data, 2),
                                get_bit_b(write_data, 1),
                                get_bit_b(write_data, 0)
                            ) in
                            let spi_go = true in
                            let spi_state = true in
                            (ini_index, spi_go, spi_state, read_idle_count, high_byte, read_idx, read_back, clear_status, p2s_data, low_byte_data, data_x, data_y, data_z)
                        )
                    else (
                        if spi_state then (
                            if spi_end then (
                                let spi_go = false in
                                let spi_state = false in
                                if read_back then (
                                    let read_back = false in
                                    let read_idx =
                                        if high_byte then
                                            if read_idx = 2 then
                                                let read_idx = zero_2 in
                                                read_idx
                                            else
                                                let read_idx = read_idx + 1 in
                                                read_idx
                                        else
                                            read_idx
                                    in
                                        
                                    let high_byte = not(high_byte) in
                                    let read_ready = false in
                                    (ini_index, spi_go, spi_state, read_idle_count, high_byte, read_idx, read_back, clear_status, p2s_data, low_byte_data, data_x, data_y, data_z)
                                ) else (
                                    let clear_status = false in
                                    let read_ready = get_bit_b(s2p_data, 6) in
                                    let read_idle_count = zero_15 in
                                    (ini_index, spi_go, spi_state, read_idle_count, high_byte, read_idx, read_back, clear_status, p2s_data, low_byte_data, data_x, data_y, data_z)
                                )
                            ) else
                                (ini_index, spi_go, spi_state, read_idle_count, high_byte, read_idx, read_back, clear_status, p2s_data, low_byte_data, data_x, data_y, data_z)
                        ) else (
                            let read_idle_count = read_idle_count + 1 in
                            let (p2s_data, read_back, clear_status) = 
                                if high_byte then (
                                    let p2s_data = match read_idx with
                                    | 0 -> set_bits_8(p2s_data, 8, (true,true,false,false,true,true,false,true))
                                    | 1 -> set_bits_8(p2s_data, 8, (true,false,true,false,true,true,false,true))
                                    | 2 -> set_bits_8(p2s_data, 8, (true,true,true,false,true,true,false,true))
                                    | _ -> p2s_data
                                    end in
                                    let read_back = true in
                                    (p2s_data, read_back, clear_status)
                                ) else (
                                    if read_ready then (
                                        let p2s_data = match read_idx with
                                        | 0 -> set_bits_8(p2s_data, 8, (false,true,false,false,true,true,false,true))
                                        | 1 -> set_bits_8(p2s_data, 8, (false,false,true,false,true,true,false,true))
                                        | 2 -> set_bits_8(p2s_data, 8, (false,true,true,false,true,true,false,true))
                                        | _ -> p2s_data
                                        end in
                                        let read_back = true in
                                        (p2s_data, read_back, clear_status)
                                    ) else (
                                        if (not(get_bit_b(clear_status_d, 3)) && iG_INT2) or (get_bit_b(read_idle_count, 14)) then (
                                            let p2s_data = set_bits_8(p2s_data, 8, (true,false,true,true,false,false,false,false)) in
                                            let clear_status = true in
                                            (p2s_data, read_back, clear_status)
                                        ) else
                                            (p2s_data, read_back, clear_status)
                                    )
                                )
                            in
                            let (spi_go, spi_state) =
                                if high_byte or read_ready or get_bit_b(read_idle_count, 14) or (not(get_bit_b(clear_status_d, 3)) && iG_INT2) then (
                                    let spi_go = true in
                                    let spi_state = true in
                                    (spi_go, spi_state)
                                ) else
                                    (spi_go, spi_state)
                            in
                            let (low_byte_data, data_x, data_y, data_z) =
                                if read_back_d then (
                                    if high_byte_d then (
                                        let res = int_of_tuple<16>(
                                            get_bit_b(s2p_data, 7),
                                            get_bit_b(s2p_data, 6),
                                            get_bit_b(s2p_data, 5),
                                            get_bit_b(s2p_data, 4),
                                            get_bit_b(s2p_data, 3),
                                            get_bit_b(s2p_data, 2),
                                            get_bit_b(s2p_data, 1),
                                            get_bit_b(s2p_data, 0),
                                            get_bit_b(low_byte_data, 7),
                                            get_bit_b(low_byte_data, 6),
                                            get_bit_b(low_byte_data, 5),
                                            get_bit_b(low_byte_data, 4),
                                            get_bit_b(low_byte_data, 3),
                                            get_bit_b(low_byte_data, 2),
                                            get_bit_b(low_byte_data, 1),
                                            get_bit_b(low_byte_data, 0)
                                        ) in
                                        let (data_x, data_y, data_z) = match read_idx with
                                        | 0 -> (data_x, data_y, res)
                                        | 1 -> (res, data_y, data_z)
                                        | 2 -> (data_x, res, data_z)
                                        | _ -> (data_x, data_y, data_z)
                                        end in
                                        (low_byte_data, data_x, data_y, data_z)
                                    ) else (
                                        let low_byte_data = s2p_data in
                                        (low_byte_data, data_x, data_y, data_z)
                                    )
                                ) else
                                    (low_byte_data, data_x, data_y, data_z)
                            in
                            (ini_index, spi_go, spi_state, read_idle_count, high_byte, read_idx, read_back, clear_status, p2s_data, low_byte_data, data_x, data_y, data_z)
                        )
                    )
                ) else
                    (ini_index, spi_go, spi_state, read_idle_count, high_byte, read_idx, read_back, clear_status, p2s_data, low_byte_data, data_x, data_y, data_z)
            in

            let (high_byte_d, read_back_d, clear_status_d) =
                if not(iRSTN) then (
                    let high_byte_d = false in
                    let read_back_d = false in
                    let clear_status_d = zero_4 in
                    (high_byte_d, read_back_d, clear_status_d)
                ) else if iSPI_CLK then (
                    let high_byte_d = high_byte in
                    let read_back_d = read_back in
                    let tmp = int_of_tuple<4>(
                        get_bit_b(clear_status_d, 2),
                        get_bit_b(clear_status_d, 1),
                        get_bit_b(clear_status_d, 0),
                        clear_status
                    ) in
                    let clear_status_d = tmp in
                    (high_byte_d, read_back_d, clear_status_d)
                ) else
                    (high_byte_d, read_back_d, clear_status_d)
            in
            (clear_status, clear_status_d, high_byte, high_byte_d,
            ini_index, low_byte_data, p2s_data, read_back,
            read_back_d, read_idle_count, read_ready, s2p_data,
            spi_end, spi_go, spi_state, write_data,
            read_idx, oSPI_CSN_Readable, data_x, data_y, data_z, oSPI_CLK_Readable, oSPI_CSN, oSPI_CLK, ioSPI_SDIO)
        ) last (false, zero_4, false, false, zero_4, zero_8, zero_16, false, false, zero_15, false, zero_8, false, false, false, zero_14, 1, false, zero_16, zero_16, zero_16, false, false, false, ZERO) in

        (data_x, data_y, data_z, oSPI_CSN, oSPI_CLK, ioSPI_SDIO)
    ) ;;

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

let number_to_alpha(n : int<16>) = (* 25 car signe *)
    let i1 = int_of_tuple<4>(get_bit_b(n, 3), get_bit_b(n, 2), get_bit_b(n, 1), get_bit_b(n, 0)) in
    let i2 = int_of_tuple<4>(get_bit_b(n, 7), get_bit_b(n, 6), get_bit_b(n, 5), get_bit_b(n, 4)) in
    let i3 = int_of_tuple<4>(get_bit_b(n, 11), get_bit_b(n, 10), get_bit_b(n, 9), get_bit_b(n, 8)) in
    let i4 = int_of_tuple<4>(get_bit_b(n, 15), get_bit_b(n, 14), get_bit_b(n, 13), get_bit_b(n, 12)) in
    (map_digit(i1), map_digit(i2), map_digit(i3), map_digit(i4), display0, display0) ;;

(* TODO *)
(* changer n reg en un reg de n var *)

let main((sw, keys, gsensor_int, gsensor_sdo, gsensor_sdi) : (int<10> * int<2> * int<2> * std_logic * std_logic)) =
    
    let (rdy, _) = pll(25) in
    let zero_16 : int<16> = 0 in
    let (data_x, data_y, data_z, oSPI_CSN, oSPI_CLK, ioSPI_SDIO) = reg (fun (data_x, data_y, data_z, oSPI_CSN, oSPI_CLK, ioSPI_SDIO) ->
        spi_ee_config(
            get_bit_b(gsensor_int, 1),
            true,
            rdy,
            rdy,
            gsensor_sdi
        )
    ) last (zero_16, zero_16, zero_16, false, false, gsensor_sdi) in

    ((data_x <> 0, data_y <> 0, data_z <> 0, false,false,false,false,false,false,false), (display0,display0,display0,display0,display0,display0), if rdy then std_logic_of_bool(oSPI_CSN) else Z, oSPI_CLK, gsensor_sdo, ioSPI_SDIO)
    ;;