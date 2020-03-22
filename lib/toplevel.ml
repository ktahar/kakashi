let rec main () =
  Printf.printf "k> " ;
  flush stdout ;
  let line = input_line stdin in
  ( try
      let lexbuf = Lexing.from_string line in
      let stmt = Parser.prog Lexer.token lexbuf in
      Printf.printf "%s\n" (Print_ast.print stmt) ;
      flush stdout ;
      Llvm.dump_value (Codegen.codegen stmt) ;
      Printf.printf "\n"
    with e -> Printf.printf "Error: %s\n" (Printexc.to_string e) ) ;
  main ()
