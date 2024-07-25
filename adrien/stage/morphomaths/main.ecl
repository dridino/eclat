(* PAR *)

let skel_par((src, dst, es) : (int<2> vector<12> array<12>) * (int<2> vector<12> array<12>) * (int<2>*int<2>*int<2>*int<2>*int<2>*int<2>*int<2>*int<2>*int<2> => int<2>)) =
    let to_bounds(i,j) =
        let cond = i >= 0 && j >= 0 && i < 12 && j < 12 in
        if cond then let l = src.(i) in vect_nth(l, j)
        else -1
    in

    macro_for i=0 to 11 do
        let l = vect_create(12,0) in
        let f (j,cell) = es(
            to_bounds(i-1,j-1),
            to_bounds(i-1,j),
            to_bounds(i-1,j+1),
            
            to_bounds(i,j-1),
            to_bounds(i,j),
            to_bounds(i,j+1),
            
            to_bounds(i+1,j-1),
            to_bounds(i+1,j),
            to_bounds(i+1,j+1)
        ) in
        dst.(i) <- vect_mapi(f,l)
    done ;;

let dilatation_par(src,dst) =
    let max(i1,i2) = if i1 > i2 then i1 else i2 in
    let es(i00,i01,i02,  i10,i11,i12,  i20,i21,i22) =
        let m1 = max(i01,i10) in
        let m2 = max(m1,i11) in
        let m3 = max(m2,i12) in
        max(m3,i21)
    in
    skel_par(src,dst,es) ;;


let erosion_par(src,dst) =
    let min(i1,i2) = if i1 < i2 then i1 else i2 in
    let es(i00,i01,i02,  i10,i11,i12,  i20,i21,i22) =
        let m1 = min(i01,i10) in
        let m2 = min(m1,i11) in
        let m3 = min(m2,i12) in
        let res = min(m3,i21) in
        if res >= 0 then res else 0
    in
    skel_par(src,dst,es) ;;


let gradient_int_par(src,dst) =
    erosion_par(src,dst);
    macro_for i=0 to 11 do
        let f (j, cell) = let r = vect_nth(get(src, i), j) - cell in if r > 0 then r else 0 in
        set(dst, i, vect_mapi(f, get(dst, i)))
    done ;;


let gradient_ext_par(src,dst) =
    dilatation_par(src,dst);
    macro_for i=0 to 11 do
        let f (j, cell) = let r = cell - vect_nth(get(src, i), j) in if r > 0 then r else 0 in
        set(dst, i, vect_mapi(f, get(dst, i)))
    done ;;


let gradient_morph_par(src,dst) =
    let dst1 = create(12) in
    erosion_par(src,dst1);
    dilatation_par(src,dst);
    macro_for i=0 to 11 do
        let f (j, cell) = let r = cell - vect_nth(get(dst1, i), j) in if r > 0 then r else 0 in
        set(dst, i, vect_mapi(f, get(dst, i)))
    done ;;


(* SEQ *)
let skel_seq((src, dst, es) : (int<2> vector<12> array<12>) * (int<2> vector<12> array<12>) * (int<2>*int<2>*int<2>*int<2>*int<2>*int<2>*int<2>*int<2>*int<2> => int<2>)) =
    let to_bounds(i,j) =
        if j >= 0 && j < 12 && i >= 0 && i < 12 then vect_nth(src.(i), j)
        else -1
    in

    let rec loop(i) =
        if i = 12 then ()
        else (
            let l = vect_create(12,-1) in
            let f (j,cell) =
                es(
                    to_bounds(i-1,j-1),
                    to_bounds(i-1,j),
                    to_bounds(i-1,j+1),
                    
                    to_bounds(i,j-1),
                    to_bounds(i,j),
                    to_bounds(i,j+1),
                    
                    to_bounds(i+1,j-1),
                    to_bounds(i+1,j),
                    to_bounds(i+1,j+1)
                )
            in
            let tmp = vect_mapi(f, l) in
            set(dst, i, tmp);
            loop(i+1)
        )
    in loop(0) ;;

(* SEQ 2 (HLPP) *)
let skel_seq_2((img_src,img_dst,es) : (int<2> vector<'a> array<'b> * int<2> vector<'a> array<'b> * ((int<2>*int<2>*int<2>*int<2>*int<2>*int<2>*int<2>*int<2>*int<2>) => int<2>))) : unit =
    let next_cell_with_lines(j,cell,line0,line1,line2,es) =
        let access(j,l) =
            if j >= 0 && j < vect_size(l) then vect_nth(l,j)
            else -1
        in
        es(access(j-1,line0),access(j,line0),access(j+1,line0),
            access(j-1,line1),access(j,line1),access(j+1,line1),
            access(j-1,line2),access(j,line2),access(j+1,line2))
    in

    let line0 = get(img_src, 0) in
    let def = vect_mapi((fun (i,cell) -> -1), line0) in

    let rec aux (line0,line1,i) : unit =
        if i > length(img_src) then ()
        else (
            let line2 =
                if i = length(img_src) - 1 then def else get(img_src, i+1)
            in
            let next (j, cell) =
                next_cell_with_lines(j,cell,line0,line1,line2,es)
            in
            let current_line = vect_mapi(next, line1) in
            set(img_dst, i, current_line);
            aux(line1,line2,i+1)
        )
    in
    aux(def, line0, 0) ;;

let dilatation_seq(src,dst) =
    let max(i1,i2) = if i1 > i2 then i1 else i2 in
    let es(i00,i01,i02,  i10,i11,i12,  i20,i21,i22) =
        let m1 = max(i01,i10) in
        let m2 = max(m1,i11) in
        let m3 = max(m2,i12) in
        max(m3,i21)
    in
    skel_seq(src,dst,es) ;;

let erosion_seq(src,dst) =
    let min(i1,i2) = if i1 < i2 then i1 else i2 in
    let es(i00,i01,i02,  i10,i11,i12,  i20,i21,i22) =
        let m1 = min(i01,i10) in
        let m2 = min(m1,i11) in
        let m3 = min(m2,i12) in
        let res = min(m3,i21) in
        if res >= 0 then res else 0
    in
    skel_seq(src,dst,es) ;;

let gradient_int_seq(src,dst) =
    erosion_seq(src,dst);
    let rec loop(i) =
        if i = 12 then ()
        else (
            let src_i = get(src,i) in
            let f (j, cell) = let r = vect_nth(src_i, j) - cell in if r > 0 then r else 0 in
            set(dst, i, vect_mapi(f, get(dst, i)));
            loop(i+1)
        )
    in loop(0) ;;

let gradient_ext_seq(src,dst) =
    dilatation_seq(src,dst);
    let rec loop(i) =
        if i = 12 then ()
        else (
            let src_i = get(src, i) in
            let f (j, cell) = let r = cell - vect_nth(src_i, j) in if r > 0 then r else 0 in
            set(dst, i, vect_mapi(f, get(dst, i)));
            loop(i+1)
        )
    in loop(0) ;;

let gradient_morph_seq(src,dst) =
    let dst1 = create(12) in
    (* erosion_seq(src,dst1);  -- v1 *)
    (* dilatation_seq(src,dst);      *)
    erosion_seq(src,dst1);
    dilatation_seq(src,dst);
    let rec loop(i) =
        if i = 12 then ()
        else (
            let t = get(dst1, i) in
            let f (j, cell) = let r = cell - vect_nth(t, j) in if r > 0 then r else 0 in
            set(dst, i, vect_mapi(f, get(dst, i)));
            loop(i+1)
        )
    in loop(0) ;;

let map (f,src,dst) = 
  let rec loop(i) =
    if i >= dst.length then () else
    (dst.(i) <- f (i,src.(i)); loop(i+1))
  in loop(0) ;;

let demi_pipe(id,f,src,dst) =
  let rec loop(i) =
    if i >= dst.length then () else
    let (v,b) = src.(i) in
    if b then ((* print_id(id,i);*)
         let () = src.(i) <- (v,false)
         and () = dst.(i) <- f (i,v) in
         loop(i+1)) else loop(i)
  in loop(0) ;;

(** val pipe2 : int * (('a -> 'b) * ('b -> 'c)) * 'b * ('a array * 'c array) -> unit *)
let pipe2 (id,(f1,f2),d,(src,dst)) =
  let tmp = create(12) in
  tmp.(0) <- (d,true);
  tmp.(1) <- (d,true);
  tmp.(2) <- (d,true);
  tmp.(3) <- (d,true);
  tmp.(4) <- (d,true);
  tmp.(5) <- (d,true);
  tmp.(6) <- (d,true);
  tmp.(7) <- (d,true);
  tmp.(8) <- (d,true);
  tmp.(9) <- (d,true);
  tmp.(10) <- (d,true);
  tmp.(11) <- (d,true);
  let () = map ((fun (i,v) -> (f1 (i,v),true)),src,tmp)
  and () = demi_pipe(id,f2,tmp,dst) in
  () ;;

let gradient_morph_pipe(src,dst) =
    let es_er(i00,i01,i02,  i10,i11,i12,  i20,i21,i22) =
        let min(a,b) = if a < b then a else b in
        let m1 = min(i01,i10) in
        let m2 = min(m1,i11) in
        let m3 = min(m2,i12) in
        let res = min(m3,i21) in
        if res >= 0 then res else 0
    in
    let es_dil(i00,i01,i02,  i10,i11,i12,  i20,i21,i22) =
        let max(a,b) = if a > b then a else b in
        let m1 = max(i01,i10) in
        let m2 = max(m1,i11) in
        let m3 = max(m2,i12) in
        max(m3,i21)
    in
    let to_bounds(i,j) =
        if j >= 0 && j < 12 && i >= 0 && i < 12 then vect_nth(src.(i), j)
        else -1
    in
    let f1(i,line) =
        let f (j,cell) =
            es_er(
                to_bounds(i-1,j-1),
                to_bounds(i-1,j),
                to_bounds(i-1,j+1),
                
                to_bounds(i,j-1),
                cell,
                to_bounds(i,j+1),
                
                to_bounds(i+1,j-1),
                to_bounds(i+1,j),
                to_bounds(i+1,j+1)
            )
        in
        vect_mapi(f, line)
    in
    let f2(i,line) =
        let f (j,cell) =
            es_dil(
                to_bounds(i-1,j-1),
                to_bounds(i-1,j),
                to_bounds(i-1,j+1),
                
                to_bounds(i,j-1),
                cell,
                to_bounds(i,j+1),
                
                to_bounds(i+1,j-1),
                to_bounds(i+1,j),
                to_bounds(i+1,j+1)
            )
        in
        vect_mapi(f, line)
    in
    pipe2(1,(f1,f2),(vect_create(12,0)),(src,dst)) ;;

let print_img(img) =
    let n = 12 in
    let rec loopi(i) =
        let rec loopj(l,j) =
            if j = n then ()
            else (print_int (vect_nth(l, j)); print_string ","; loopj(l,j+1))
        in
        if i = n then print_newline()
        else (loopj(img.(i),0); print_newline(); loopi(i+1))
    in loopi(0) ;;


let counter() = reg (fun v -> v + 1) last 0;;

let main(v:int<16>) =
    let res : int<62> = 0 in
    let c = counter() in
    let (_,_) = exec (
        let t1 = create(12) in
        let t2 = create(12) in
        set(t1,0, [| 1;1;1;1;1;1;1;1;1;1;1;1 |]);
        set(t1,1, [| 1;1;1;1;1;1;1;1;1;1;1;1 |]);
        set(t1,2, [| 1;1;1;1;1;0;0;1;1;1;1;1 |]);
        set(t1,3, [| 1;1;1;0;0;0;0;0;0;1;1;1 |]);
        set(t1,4, [| 1;1;0;1;1;0;0;1;1;0;1;1 |]);
        set(t1,5, [| 1;0;0;1;1;0;0;1;1;0;0;1 |]);
        set(t1,6, [| 1;0;0;0;0;0;0;0;0;0;0;1 |]);
        set(t1,7, [| 1;0;0;1;1;1;1;1;1;0;0;1 |]);
        set(t1,8, [| 1;1;0;0;1;1;1;1;0;0;1;1 |]);
        set(t1,9, [| 1;1;1;0;0;0;0;0;0;1;1;1 |]);
        set(t1,10,[| 1;1;1;1;1;0;0;1;1;1;1;1 |]);
        set(t1,11,[| 1;1;1;1;1;1;1;1;1;1;1;1 |]);
        print_int c; print_newline ();
        gradient_morph_pipe(t1,t2);
        print_int c; print_newline ();
        print_img(t2)
    ) default () in res ;;
