(* count alive neighbors *)
let es_erosion(f,l0,l1,l2,i) =
  let (e1,_) = f(l0,i) in
  let (e2,_) = f(l1,i-1) in
  let (e3,_) = f(l1,i) in
  let (e4,_) = f(l1,i+1) in
  let (e5,_) = f(l2,i) in
  e1 or e2 or e3 or e4 or e5 ;;

(* instantaneously transform one line of the world 
   from the neighboring lines *)
let next_cell_with_lines(i,cell,line0,line1,line2) : bool * bool =
  let access(l,i) = 
    if i >= vect_size l or i < 0 then (false,false)
    else vect_nth(l,i)
  in
  es_erosion(access,line0,line1,line2,i),true ;;

(* transform the world: an entire line is processed each 5 cycles *)
let vect_array_life (world : (bool * bool) vector<'a> array<'b>) : unit = 
  let first_line = get(world,0) in
  let def = let i = (false,false) in vect_create(64, i) in
  
  let rec aux (line0,line1,i) : unit =
    if i < length(world) then
      (* prefetch the next line *)
      (let line2 = if i = length(world)-1 
                   then def 
                   else get(world,i+1)             (* memory read, takes 2 cycles *)
       in
       let next (j,cell) = 
         next_cell_with_lines(j,cell,line0,line1,line2)
       in
       let current_line = 
         vect_mapi(next,line1)      (* vect_mapi is a built-in, instantaneous operator *)
       in
       set(world,i,current_line);                  (* memory write, takes 2 cycles *)
       aux(line1,line2,i+1))                       (* tail call, takes 1 cycle *)
    else ()
  in aux(def,first_line,0) ;;


(** ==== measure execution time ==== *)

let counter () =
  reg (fun c -> c + 1) last 0 ;;

let main () =
  let cy = counter () in
  let ((),rdy) =
    exec
      let w0 : (bool * bool) vector<64> = vect_create(64,(false,true)) in
      let w : (bool * bool) vector<64> array<64> = create 64 in
      set(w,0,w0);
      (** no initiation (which would take time), 
          this does not change the timing behavior. *)
      vect_array_life(w)
    default ()
  in
  if rdy then (print_string "execution time = "; 
               print_int cy; 
               print_string " cycles"; 
               print_newline ()) ;;
