let counter(reset) =
  let inc(c) =
    if reset then 0 else (c + 1)
  in reg inc last 0;;

let main () =
  let c1 = counter (false) in
  let c2 = counter (true) in
  print_int (c1); print_string " "; print_int (c2);
  print_newline ();;