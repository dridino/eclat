type box = int<11> vector<8> ;; (* [| id;x;y;w;h;r;g;b |] *)

let (ball_id,player1_id,player2_id,top_wall_id,bottom_wall_id,left_wall_id,right_wall_id) = (0,1,2,3,4,5,6) ;;

let (bg_r,bg_g,bg_b) = (0,0,1) ;;

let ball_color = (-1,0,0) ;;
let player_color = (-1,-1,-1) ;;

let (player_w,player_h) = (20,100) ;;

let ball_size = 14 ;;

let create_box(id,x,y,w,h,(r,g,b)) =
    let vec = vect_create(8,0) in
    let vec = vect_copy_with(vec,0,id) in
    let vec = vect_copy_with(vec,1,x) in
    let vec = vect_copy_with(vec,2,y) in
    let vec = vect_copy_with(vec,3,w) in
    let vec = vect_copy_with(vec,4,h) in
    let vec = vect_copy_with(vec,5,r) in
    let vec = vect_copy_with(vec,6,g) in
    let vec = vect_copy_with(vec,7,b) in
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

let display(box_vec : box vector<'a>) =
    let (h_offset,v_offset) = (160,45) in
    let (hpos,vpos) = hvpos() in

    let (smth,object_to_draw) = vect_first_where((fun (i,v) ->
        let (x,y,w,h) = (vect_nth(v,1),vect_nth(v,2),vect_nth(v,3),vect_nth(v,4)) in
        (vpos >= y+v_offset && vpos < y+h+v_offset && hpos >= x+h_offset && hpos < x+w+h_offset)
    ),box_vec) in
    (* print_string ", "; if smth then print_string "true" else print_string "false";
    print_newline (); *)
    let (r,g,b) : (int<4> * int<4> * int<4>) =
        if smth then
            (resize_int<4>(vect_nth(object_to_draw,5)),resize_int<4>(vect_nth(object_to_draw,6)),resize_int<4>(vect_nth(object_to_draw,7)))
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

let move((box_vec, p1_dy) : box vector<'a> * int<11>) =
    let ball_dir = (2,1) in
    let player_dir = (0,1) in
    let ball_delta(left_col,right_col,top_col,bot_col) =
        let ((_,_),(dx,dy),_) = reg (fun ((old_dx,old_dy),(r_dx,r_dy),cpt) ->
            if cpt = 1000000 then (
                let dx = if left_col then 1 else (if right_col then -1 else old_dx) in
                let dy = if top_col then 1 else (if bot_col then -1 else old_dy) in
                ((dx,dy),(dx,dy),0)
            ) else ((old_dx,old_dy),(0,0),cpt+1)
        ) last ((2,1),(0,0),0)
        in (dx,dy)
    in
    let player1_delta(top_col,bot_col) = let (_,dy,_) = reg (fun (dy,r_dy,cpt) -> if p1_dy = 0 then (dy,0,cpt) else if cpt = 200000 then let dy = (if (top_col && p1_dy < 0) or (bot_col && p1_dy > 0) then 0 else p1_dy) in (dy,dy,0) else (dy,0,cpt+1)) last (0,0,0) in dy in
    let player2_delta(top_col,bot_col) = let (_,dy,_) = reg (fun (dy,r_dy,cpt) -> if p1_dy = 0 then (dy,0,cpt) else if cpt = 200000 then let dy = (if (top_col && p1_dy < 0) or (bot_col && p1_dy > 0) then 0 else p1_dy) in (dy,dy,0) else (dy,0,cpt+1)) last (0,0,0) in dy in
    vect_mapi((fun (i,b1) ->
        (* obj1 *)
        let (id1,x1,y1,w1,h1,r,g,b) = (vect_nth(b1,0),vect_nth(b1,1),vect_nth(b1,2),vect_nth(b1,3),vect_nth(b1,4),vect_nth(b1,5),vect_nth(b1,6),vect_nth(b1,7)) in
        let (pot_dx,pot_dy) = if id1 = ball_id then ball_dir else player_dir in
        
        (* obj2 *)
        let (valid,b2) = vect_first_where((fun (i,b2) ->
            let (id2,x2,y2,w2,h2) = (vect_nth(b2,0),vect_nth(b2,1),vect_nth(b2,2),vect_nth(b2,3),vect_nth(b2,4)) in
            (id1 <> id2) && collision((x1+pot_dx,y1+pot_dy,w1,h1),(x2,y2,w2,h2))
        ), box_vec) in
        let (id2,x2,y2,w2,h2) = (if valid then vect_nth(b2,0) else -1,vect_nth(b2,1),vect_nth(b2,2),vect_nth(b2,3),vect_nth(b2,4)) in

        let collision_top_wall = y1-pot_dy < 0 in
        let collision_bottom_wall = y1 + h1 + pot_dy >= 480 in
        if (id1 = ball_id) then
            (let collision_left_wall = x1 - pot_dx < 0 in
            let collision_right_wall = x1 + w1 + pot_dx >= 640 in
            let left_col = collision_left_wall or ((id2 = player1_id or id2 = player2_id) && x1+pot_dx >= x2 + w2) in
            let right_col = collision_right_wall or ((id2 = player1_id or id2 = player2_id) && x1+w1-pot_dx <= x2) in
            let top_col = collision_top_wall or ((id2 = player1_id or id2 = player2_id) && y1+pot_dy >= y2 + h2) in
            let bot_col = collision_bottom_wall or ((id2 = player1_id or id2 = player2_id) && y1+h1-pot_dy <= y2) in
            (* let horizontal_col = (collision_left_wall or collision_right_wall or ((id2 = player1_id or id2 = player2_id) && (x1+w1-pot_dx <= x2 or x1+pot_dx >= x2 + w2))) in
            let vertical_col = (collision_top_wall or collision_bottom_wall or ((id2 = player1_id or id2 = player2_id) && (y1+h1-pot_dy <= y2 or y1+pot_dy >= y2 + h2))) in *)
            let (dx,dy) = ball_delta(left_col,right_col,top_col,bot_col) in
            create_box(id1,x1+dx,y1+dy,ball_size,ball_size,ball_color))
        else if (id1 = player1_id or id1 = player2_id) then
            let top_col = (collision_top_wall or ((id2 = ball_id) && (y2+h2-pot_dy <= y1+1))) in (* -v pour deplacement *)
            let bot_col = (collision_bottom_wall or ((id2 = ball_id) && (y2+pot_dy >= y1+h1-1))) in (* +v pour deplacement *)
            let y = if id1 = player1_id then (
                y1 + player1_delta(top_col,bot_col)
            ) else (
                vect_nth(vect_nth(box_vec, resize_int<32>(ball_id)),2) (* y de la balle *)
            ) in
            create_box(id1,x1,y,player_w,player_h,player_color)
        else (
            b1
        )
    ), box_vec) ;;

let main(((s0,s1,s2,s3,s4,s5,s6,s7,s8,s9), (k0,k1), gsensor_int, gsensor_sdo, gsensor_sdi) : ((bool*bool*bool*bool*bool*bool*bool*bool*bool*bool) * (bool*bool) * int<2> * std_logic * std_logic)) =
    let box_vec = reg (fun (box_vec) ->
        let player1_dy = if not(s0) && not(k0) then -1 else if not(s0) && not(k1) then 1 else 0 in
        move(box_vec, player1_dy)
    ) last (
        let box_vec = vect_create(3,create_box(0,0,0,0,0,(0,0,0))) in
        let player1 = create_box(player1_id,610,190,player_w,player_h,(-1,-1,-1)) in
        let player2 = create_box(player2_id,10,190,player_w,player_h,(15,15,15)) in
        let ball = create_box(ball_id,313,233,ball_size,ball_size,(-1,0,0)) in (* 313,233 *)
        let box_vec = set_boxi(box_vec, resize_int<32>(player1_id), player1) in
        let box_vec = set_boxi(box_vec, resize_int<32>(player2_id), player2) in
        let box_vec = set_boxi(box_vec, resize_int<32>(ball_id), ball) in
        box_vec
    ) in
    
    let (hsync,vsync,r,g,b) = pll(fun () -> display(box_vec)) in

    let dz = (true,true,true,true,true,true,true,true) in
    let digs = (dz,dz,dz,dz,dz,dz) in

    ((s0,s1,s2,s3,s4,s5,s6,s7,s8,s9), digs, ZERO, false, hsync,vsync,r,g,b, ZERO,ZERO) ;;
