let counter () = 
  reg (fun c -> c + 1) last 0 ;;

let rec wait(n) =
  if n <= 1 then () else wait(n-1) ;;

let static t = 5^100 ;;

let main() =
  let c = counter () in
  exec
    print_string "start : "; print_int c; print_newline ();
    wait (2);
    print_string "end : "; print_int c; print_newline ()
  default () ;;  