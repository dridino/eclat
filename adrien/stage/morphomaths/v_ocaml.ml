let t1 = Array.init 12 (fun _ -> Array.make 12 0)
let t2 = Array.init 12 (fun _ -> Array.make 12 0)

let skel_seq (src: int array array) (dst: int array array) es =
    let to_bounds(l,j) =
        if j >= 0 && j < 12 then l.(j)
        else -1
    in

    let rec loop(i) =
        if i = 12 then ()
        else (
            let l = Array.make 12 (-1) in
            let l0 = if i < 0 then src.(i-1) else l in
            let l1 = src.(i) in
            let l2 = if i < 11 then src.(i+1) else l in
            let f j cell =
                es
                    (to_bounds(l0,j-1))
                    (to_bounds(l0,j))
                    (to_bounds(l0,j+1))
                    
                    (to_bounds(l1,j-1))
                    (to_bounds(l1,j))
                    (to_bounds(l1,j+1))
                    
                    (to_bounds(l2,j-1))
                    (to_bounds(l2,j))
                    (to_bounds(l2,j+1))
            in
            let tmp = Array.mapi f l in
            dst.(i) <- tmp;
            loop(i+1)
        )
    in loop(0) ;;

let dilatation_seq src dst =
    let es i00 i01 i02  i10 i11 i12  i20 i21 i22 =
        let m1 = max i01 i10 in
        let m2 = max m1 i11 in
        let m3 = max m2 i12 in
        max m3 i21
    in
    skel_seq src dst es ;;

let erosion_seq src dst =
    let min(i1,i2) = if i1 < i2 then i1 else i2 in
    let es i00 i01 i02  i10 i11 i12  i20 i21 i22 =
        let m1 = min(i01,i10) in
        let m2 = min(m1,i11) in
        let m3 = min(m2,i12) in
        let res = min(m3,i21) in
        if res >= 0 then res else 0
    in
    skel_seq src dst es ;;

let gradient_int_seq src dst =
    erosion_seq src dst;
    let rec loop(i) =
        if i = 12 then ()
        else (
            let src_i = src.(i) in
            let f j cell = let r = src_i.(j) - cell in if r > 0 then r else 0 in
            dst.(i) <- Array.mapi f dst.(i);
            loop(i+1)
        )
    in loop(0) ;;

let gradient_ext_seq src dst =
    dilatation_seq src dst;
    let rec loop(i) =
        if i = 12 then ()
        else (
            let src_i = src.(i) in
            let f j cell = let r = cell - src_i.(j) in if r > 0 then r else 0 in
            dst.(i) <- Array.mapi f dst.(i);
            loop(i+1)
        )
    in loop(0) ;;

let gradient_morph_seq(src,dst) =
    let dst1 = Array.init 12 (fun _ -> Array.init 12 (fun _ -> -1)) in
    (* erosion_seq(src,dst1);  -- v1 *)
    (* dilatation_seq(src,dst);      *)
    erosion_seq src dst1;
    dilatation_seq src dst;
    let rec loop(i) =
        if i = 12 then ()
        else (
            let t = dst1.(i) in
            let f j cell = let r = cell - t.(j) in if r > 0 then r else 0 in
            dst.(i) <- Array.mapi f dst.(i);
            loop(i+1)
        )
    in loop(0) ;;
let print_img(img) =
    let n = 12 in
    let rec loopi(i) =
        let rec loopj(l,j) =
            if j = n then ()
            else (print_int l.(j); print_string ","; loopj(l,j+1))
        in
        if i = n then print_newline()
        else (loopj(img.(i),0); print_newline(); loopi(i+1))
    in loopi(0) ;;

let main () =
    let src = [|
      [| 1;1;1;1;1;1;1;1;1;1;1;1 |];
      [| 1;1;1;1;1;1;1;1;1;1;1;1 |];
      [| 1;1;1;1;1;0;0;1;1;1;1;1 |];
      [| 1;1;1;0;0;0;0;0;0;1;1;1 |];
      [| 1;1;0;1;1;0;0;1;1;0;1;1 |];
      [| 1;0;0;1;1;0;0;1;1;0;0;1 |];
      [| 1;0;0;0;0;0;0;0;0;0;0;1 |];
      [| 1;0;0;1;1;1;1;1;1;0;0;1 |];
      [| 1;1;0;0;1;1;1;1;0;0;1;1 |];
      [| 1;1;1;0;0;0;0;0;0;1;1;1 |];
      [| 1;1;1;1;1;0;0;1;1;1;1;1 |];
      [| 1;1;1;1;1;1;1;1;1;1;1;1 |];
    |] in

    let time1 = Sys.time() in
    gradient_morph_seq(src,t2);
    let time2 = Sys.time() in
    
    Printf.printf "%.8f\n" (time2 -. time1);
    print_img(t2)
    ;;

main()