type box = int<11> vector<4> ;; (* [| x;y;w;h |] *)

(* takes a vector old and add b in front of it, without changing its size *)
(* e.g. add_box([| a;b |], c) becomes [| c;a |] *)
let add_box((old,b) : (box vector<'a>) * box) =
    vect_mapi((fun (i,v) -> if i = 0 then b else vect_nth(old, i-1)), old) ;;

let pll(f : unit => (bool*bool*int<4>*int<4>*int<4>)) =
    reg (fun (indic,v) -> if indic then (false,v) else (true, f())) last (true,(true,true,0,0,0)) ;;

let hvpos() =
    reg (fun (h,v) -> if h < 799 then (h+1,v) else if v < 525 then (0,v+1) else (0,0)) last (-1,0) ;;

let print_bool(b) = if b then print_string "true" else print_string "false";;

let update(box_vec : box vector<'a>) =
    let (hpos,vpos) = hvpos() in

    let r = ref (-1) in

    let bo = vect_mapi((fun (i,v) ->
        let (x,y,w,h) = (vect_nth(v,0),vect_nth(v,1),vect_nth(v,2),vect_nth(v,3)) in
        if !r = -1 && vpos >= y && vpos < y+h && hpos >= x  && hpos < x+w then r:=i else ()
    ),box_vec) in

    let (r,g,b) : (int<4> * int<4> * int<4>) = if !r <> -1 then (0,0,0) else (1,1,1) in

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


let main() =
    let box_vec = [| [| 0;0;50;50 |] |] in
    
    let (_, (hsync,vsync,r,g,b)) = pll(fun () -> update(box_vec)) in

    let dz = (true,true,true,true,true,true,true,true) in
    let digs = (dz,dz,dz,dz,dz,dz) in

    () ;;