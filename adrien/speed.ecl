(* 

  Un programme qui allume une led si la vitesse (en argument) depasse 50
  =============================

        val main : i8 => bool


   $ cd eclat-compiler
   $ make
   $ ./eclat ../adrien/speed.ecl -arg="13;26;45;51;82;62;50"

  (option -arg is used for simulation only and ignored for synthesis)

   $ cd ..
   $ make simul
    
      ~> Then, double-click on the file target/tb.vcd to open it with GtkWave 
         and add I/Os of the generated hardware to see their evolution

         A screen copy of the tool GTKWave, on this example, 
         is given in examples/sum.png

*)

let main(speed:int<8>) =
  speed > 50;;