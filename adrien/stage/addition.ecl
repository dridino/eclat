type state =
  Q1 of int<25>
| Q2 of int<25> * int<25>
| Q3 of int<25> ;;

let f(s) =
    match s with
    | Q1 i -> i
    | Q2 (_, i) -> i
    | Q3 i -> i
    end ;;

let main ((s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, btn0, btn1) : (bool * bool * bool * bool * bool * bool * bool * bool * bool * bool * bool * bool)) =
    
    let r = reg (fun s ->
        match s with
        | Q1 c1 -> if edge (not btn1) then Q2(c1, 0)
                    else if edge (not btn0) then Q1 (c1 + 1) else Q1 c1
        | Q2 (c1, c2) -> if edge (not btn1) then Q3 (c1 + c2)
                            else if edge (not btn0) then Q2 (c1, c2 + 1) else Q2 (c1, c2)
        | Q3 sum -> if edge (not btn1) then Q1 0 else Q3 sum
        end
    ) last (Q1 0) in

    (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, number_to_alpha(f(r))) ;;
