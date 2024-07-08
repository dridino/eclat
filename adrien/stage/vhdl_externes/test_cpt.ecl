shared external Cpt : unit => int<8> ;;

let main() =
    let ((v1,v2),rdy) = exec (let v1 = run Cpt(()) in let v2 = if v1 mod 2 = 0 then run Cpt(()) else 0 in v1,v2) default (0,0) in
    if rdy then (
        print_int v1; print_newline (); print_int v2; print_newline ()
    ) ;;