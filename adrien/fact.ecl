(* 

  Un programme qui calcule la moyenne des entiers passes en argument
  =============================

        val main : () => i16


   $ cd eclat-compiler
   $ make
   $ ./eclat ../adrien/fact.ecl -arg="()"

  (option -arg is used for simulation only and ignored for synthesis)

   $ cd ..
   $ make simul
    
      ~> Then, double-click on the file target/tb.vcd to open it with GtkWave 
         and add I/Os of the generated hardware to see their evolution

         A screen copy of the tool GTKWave, on this example, 
         is given in examples/sum.png

*)

type i16 = int<16> ;;

let counter(reset) =
  let inc(c) = 
    if reset then 0 else c + 1 
  in
  reg inc last 0 ;;

let rec fact ((m, acc): i16*i16) =
   if m <= 1 then acc
   else fact(m-1, acc*m) ;;

let main () =
   let c = counter(false) in
   let (v, rdy) = exec let f1 = fact(2, 1) and
       f2 = fact(3, 1) in (f1 + f2) default 0 in print_string("ready:"); print_int(if rdy then 1 else 0); print_string(" | "); print_int(v); print_newline(); 
   c ;;
