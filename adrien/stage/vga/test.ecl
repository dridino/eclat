type box = int<11> vector<4> ;; (* [| x;y;w;h |] *)

let pll(f : unit => (bool*bool*int<4>*int<4>*int<4>)) =
    reg (fun (indic,v) -> if indic then (false,v) else (true, f())) last (true,(true,true,0,0,0)) ;;

let hvpos() =
    reg (fun (h,v) -> if h < 799 then (h+1,v) else if v < 525 then (0,v+1) else (0,0)) last (-1,0) ;;

let print_bool(b) = if b then print_string "true" else print_string "false";;

let update(box_vec : box vector<'a>) =
    let (hpos,vpos) = hvpos() in
    let (h_offset,v_offset) = (160,45) in

    let (r,g,b) : (int<4> * int<4> * int<4>) =
        if hpos >= h_offset + 0 && hpos < h_offset + 0 + 50 &&
            vpos >= v_offset + 0 && vpos < v_offset + 0 + 50 then
            (-1,-1,-1)
        else (0,0,0)
    in

    let hsync = not(hpos > 16 && hpos < 112) in
    let vsync = not(vpos > 10 && vpos < 12) in

    let (r,g,b) =
        if ((hpos > 0 && hpos < 160) or (vpos > 0 && vpos < 45)) then
            (0,0,0)
        else
            (r,g,b)
    in
    print_int hpos; print_string " "; print_int vpos; print_string " ";
    print_bool hsync; print_bool vsync; print_newline ();
    (hsync,vsync,r,g,b) ;;

let main((sw, keys, gsensor_int, gsensor_sdo, gsensor_sdi) : (int<10> * int<2> * int<2> * std_logic * std_logic)) =
    let box_vec = [| [| 0;0;50;50 |] |] in
    let (_, (hsync,vsync,r,g,b)) = pll(fun () -> update(box_vec)) in
    let dz = (true,true,true,true,true,true,true,true) in
    let digs = (dz,dz,dz,dz,dz,dz) in
    (sw, digs, ZERO, false, hsync,vsync,r,g,b, ZERO,ZERO) ;;