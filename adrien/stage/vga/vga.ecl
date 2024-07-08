type box = int<11> vector<7> ;; (* [| x;y;w;h;r;g;b |] *)

(* takes a vector old and add b in front of it, without changing its size *)
(* e.g. add_box([| a;b |], c) becomes [| c;a |] *)
let add_box((v,b) : (box vector<'a>) * box) =
    vect_mapi((fun (i,_) -> if i = 0 then b else vect_nth(v, i-1)), v) ;;

let pll(f : unit => (bool*bool*int<4>*int<4>*int<4>)) =
    reg (fun (indic,v) -> if indic then (false,v) else (true, f())) last (true,(true,true,0,0,0)) ;;

let hvpos() =
    reg (fun (h,v) -> if h < 799 then (h+1,v) else if v < 525 then (0,v+1) else (0,0)) last (-1,0) ;;

let print_bool(b) = if b then print_string "true" else print_string "false";;

let update(box_vec : box vector<'a>) =
    let (hpos,vpos) = hvpos() in
    let (h_offset,v_offset) = (160,45) in

    let r = ref false in
    (* set r to the index of the first element to draw at pos (hpos,vpos) *)
    let (smth,object_to_draw) = vect_first_where((fun (i,v) ->
        let (x,y,w,h) = (vect_nth(v,0),vect_nth(v,1),vect_nth(v,2),vect_nth(v,3)) in
        vpos >= y+v_offset && vpos < y+h+v_offset && hpos >= x+h_offset && hpos < x+w+h_offset
    ),box_vec) in
    
    (* let (r,g,b) : (int<4> * int<4> * int<4>) = if smth then (-1,0,-1) else (0,0,0) *)
    let (r,g,b) : (int<4> * int<4> * int<4>) =
        if smth then
            (resize_int<4>(vect_nth(object_to_draw,4)),resize_int<4>(vect_nth(object_to_draw,5)),resize_int<4>(vect_nth(object_to_draw,6)))
        else
            (0,0,0)
    in

    let hsync = not(hpos > 16 && hpos < 112) in
    let vsync = not(vpos > 10 && vpos < 12) in

    let (r,g,b) =
        if ((hpos > 0 && hpos < h_offset) or (vpos > 0 && vpos < v_offset)) then
            (0,0,0)
        else
            (r,g,b)
    in
    print_int hpos; print_string " "; print_int vpos; print_string " ";
    print_bool hsync; print_bool vsync; print_newline ();
    (hsync,vsync,r,g,b) ;;


let main((sw, keys, gsensor_int, gsensor_sdo, gsensor_sdi) : (int<10> * int<2> * int<2> * std_logic * std_logic)) =
    let box_vec = [| [| 10;10;50;50;-1;-1;0 |]; [| 70;25;20;20;-1;0;0 |] |] in
    
    let (_, (hsync,vsync,r,g,b)) = pll(fun () -> update(box_vec)) in

    let dz = (true,true,true,true,true,true,true,true) in
    let digs = (dz,dz,dz,dz,dz,dz) in

    (sw, digs, ZERO, false, hsync,vsync,r,g,b, ZERO,ZERO) ;;