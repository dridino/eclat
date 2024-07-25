(* SEQ *)
let skel_seq((src, es) : (int<2> vector<144>) * (int<2>*int<2>*int<2>*int<2>*int<2>*int<2>*int<2>*int<2>*int<2> => int<2>)) =
    let to_bounds(i,j) =
        if j >= 0 && j < 12 && i >= 0 && i < 12 then vect_nth(src, i*12 + j)
        else -1
    in

    let f(j,cell) =
        let i = j / 12 in
        let j = j-i*12 in
        es(
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

    vect_mapi(f,src) ;;

let dilatation_seq(src) =
    let max(i1,i2) = if i1 > i2 then i1 else i2 in
    let es(i00,i01,i02,  i10,i11,i12,  i20,i21,i22) =
        let m1 = max(i01,i10) in
        let m2 = max(m1,i11) in
        let m3 = max(m2,i12) in
        max(m3,i21)
    in
    skel_seq(src,es) ;;

let erosion_seq(src) =
    let min(i1,i2) = if i1 < i2 then i1 else i2 in
    let es(i00,i01,i02,  i10,i11,i12,  i20,i21,i22) =
        let m1 = min(i01,i10) in
        let m2 = min(m1,i11) in
        let m3 = min(m2,i12) in
        let res = min(m3,i21) in
        if res >= 0 then res else 0
    in
    skel_seq(src,es) ;;

let gradient_int_seq(src,dst) =
    let _ = erosion_seq(src) in
    let rec loop(i) =
        if i = 12 then ()
        else (
            let f (j, cell) = let r = vect_nth(src, i*12 + j) - cell in if r > 0 then r else 0 in
            set(dst, i, vect_mapi(f, get(dst, i)));
            loop(i+1)
        )
    in loop(0) ;;

let gradient_ext_seq(src,dst) =
    let _ = dilatation_seq(src) in
    let rec loop(i) =
        if i = 12 then ()
        else (
            let f (j, cell) = let r = cell - vect_nth(src, i*12+j) in if r > 0 then r else 0 in
            set(dst, i, vect_mapi(f, get(dst, i)));
            loop(i+1)
        )
    in loop(0) ;;

let gradient_morph_seq(src) =
    (* erosion_seq(src,dst1);  -- v1 *)
    (* dilatation_seq(src,dst);      *)
    let dst1 = erosion_seq(src) in
    let dst2 = dilatation_seq(src) in

    let f(i,cell1) =
        let cell2 = vect_nth(dst2,i) in
        let r = cell1 - cell2 in if r > 0 then r else 0
    in

    vect_mapi(f,dst1) ;;


let print_img(img) =
    let n = 12 in
    let rec loopi(i) =
        let rec loopj(j) =
            if j = n then ()
            else (print_int (vect_nth(img, i*12+j)); print_string ","; loopj(j+1))
        in
        if i = n then print_newline()
        else (loopj(0); print_newline(); loopi(i+1))
    in loopi(0) ;;


let counter() = reg (fun v -> v + 1) last 0;;

let main(v:int<16>) =
    let res : int<62> = 0 in
    let c = counter() in
    let (_,_) = exec (
        let t2 = create(144) in
        let t1 = [| 1;1;1;1;1;1;1;1;1;1;1;1;
                    1;1;1;1;1;1;1;1;1;1;1;1;
                    1;1;1;1;1;0;0;1;1;1;1;1;
                    1;1;1;0;0;0;0;0;0;1;1;1;
                    1;1;0;1;1;0;0;1;1;0;1;1;
                    1;0;0;1;1;0;0;1;1;0;0;1;
                    1;0;0;0;0;0;0;0;0;0;0;1;
                    1;0;0;1;1;1;1;1;1;0;0;1;
                    1;1;0;0;1;1;1;1;0;0;1;1;
                    1;1;1;0;0;0;0;0;0;1;1;1;
                    1;1;1;1;1;0;0;1;1;1;1;1;
                    1;1;1;1;1;1;1;1;1;1;1;1 |] in
        print_int c; print_newline ();
        let t2 = gradient_morph_seq(t1) in
        print_int c; print_newline ();
        print_img(t2)
    ) default () in res ;;
