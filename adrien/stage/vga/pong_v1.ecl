type box = int<11> vector<7> ;; (* [| x;y;w;h;r;g;b |] *)

let (h_offset,v_offset) = (160,45) ;;

let (bg_r,bg_g,bg_b) = (0,0,1) ;;

let (player_w,player_h) = (20,100) ;;

let ball_size = 14 ;;

let left_wall = (-100,-1,100,482) ;;
let right_wall = (640,-1,100,482) ;;
let top_wall = (-1,-100,642,100) ;;
let bottom_wall = (-1,480,642,100) ;;

let create_box(x,y,w,h,(r,g,b)) =
    let vec = vect_create(7,0) in
    let vec = vect_copy_with(vec,0,x) in
    let vec = vect_copy_with(vec,1,y) in
    let vec = vect_copy_with(vec,2,w) in
    let vec = vect_copy_with(vec,3,h) in
    let vec = vect_copy_with(vec,4,r) in
    let vec = vect_copy_with(vec,5,g) in
    let vec = vect_copy_with(vec,6,b) in
    vec ;;

let collision((x1,y1,w1,h1),(x2,y2,w2,h2)) =
    (x1 <= x2 + w2) && (x1 + w1 >= x2) && (y1 <= y2 + h2) && (y1 + h1 >= y2) ;;

(* takes a vector old and add b in front of it, without changing its size *)
(* e.g. add_box([| a;b |], c) becomes [| c;a |] *)
let set_boxi((v,i,b) : (box vector<'a>) * int<32> * box) = vect_copy_with(v,i,b) ;;

let pll(f : unit => (bool*bool*int<4>*int<4>*int<4>)) =
    let (_,v) = reg (fun (indic,v) -> if indic then (false,v) else (true, f())) last (true,(true,true,0,0,0)) in v;;

let hvpos() =
    reg (fun (h,v) -> if h < 799 then (h+1,v) else if v < 525 then (0,v+1) else (0,0)) last (-1,0) ;;

let update(box_vec : box vector<'a>) =
    let (hpos,vpos) = hvpos() in

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
            (bg_r,bg_g,bg_b)
    in

    let hsync = not(hpos > 16 && hpos < 112) in
    let vsync = not(vpos > 10 && vpos < 12) in

    let (r,g,b) =
        if ((hpos > 0 && hpos < h_offset) or (vpos > 0 && vpos < v_offset)) then
            (0,0,0)
        else
            (r,g,b)
    in
    (hsync,vsync,r,g,b) ;;


let box_x(pressed) =
    let m = 50 in
    let (v,_) = reg (fun (v,cpt) -> if not(pressed) then (if cpt = 200000 then (if v + player_w < 640 then v+1 else v,0) else (v,cpt+1)) else (v,cpt)) last (10,0) in
    v;;
    
let player_y(dy,(ball_x,ball_y)) =
    let (y,_) = reg (fun (y,cpt) ->
        if dy <> 0 then (if cpt = 200000 then (if not(collision((610,y+dy,20,player_h),top_wall) or collision((610,y+dy-2,20,player_h),bottom_wall) or collision((610,y+dy,20,player_h), (ball_x,ball_y,ball_size,ball_size))) then y+dy else y,0) else (y,cpt+1)) else (y,cpt)
    ) last ((480-player_h)/2,0) in (* (480 - player_h) / 2*)
    y;;

let ball_move(player_posx,player_posy) =
    let ((x,y),(_,_),_) = reg (fun ((x,y),(dx,dy),cpt) ->
        if cpt = 1000000 then (
            print_int x;
            print_newline ();
            print_int y;
            print_newline ();
            if collision((x+dx,y,ball_size,ball_size),left_wall) or collision((x+dx,y,ball_size,ball_size),right_wall) or ((x <= player_posx or x >= player_posx + player_w) && collision((x+dx,y,ball_size,ball_size),(player_posx,player_posy,player_w,player_h))) then
                ((x-dx,y),(-dx,dy),0)
            else if collision((x,y+dy,ball_size,ball_size),top_wall) or collision((x,y+dy,ball_size,ball_size),bottom_wall) or ((y <= player_posy or y >= player_posy + player_h) && collision((x,y+dy,ball_size,ball_size),(player_posx,player_posy,player_w,player_h)))then
                ((x,y-dy),(dx,-dy),0)
            else
                ((x+dx,y+dy),(dx,dy),0)
        ) else
            ((x,y),(dx,dy),cpt+1)
    ) last ((313,233),(1,1),0) in (x,y) ;; (* x=640/2 - 7 ; y=480/2 - 7*)

let main((sw, (k0,k1), gsensor_int, gsensor_sdo, gsensor_sdi) : (int<10> * (bool*bool) * int<2> * std_logic * std_logic)) =

    let box_vec = vect_create(2,create_box(0,0,0,0,(0,0,0))) in
    let player_posx = 610 in (* 640 - 20 - 10 *)
    print_int (player_y(0,(0,0)));
    let (ball_x,ball_y) = ball_move(player_posx,player_y(0,(0,0))) in
    let player_posy = player_y(if not(k0) then -1 else if not(k1) then 1 else 0,(ball_x,ball_y)) in
    let player = create_box(player_posx,player_posy,player_w,player_h,(-1,-1,-1)) in
    let ball = create_box(ball_x,ball_y,ball_size,ball_size,(-1,0,0)) in
    let box_vec = set_boxi(box_vec, 0, player) in
    let box_vec = set_boxi(box_vec, 1, ball) in
    
    let (hsync,vsync,r,g,b) = pll(fun () -> update(box_vec)) in

    let dz = (true,true,true,true,true,true,true,true) in
    let digs = (dz,dz,dz,dz,dz,dz) in

    (sw, digs, ZERO, false, hsync,vsync,r,g,b, ZERO,ZERO) ;;
