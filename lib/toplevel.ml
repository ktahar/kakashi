open Llvm
open Ast

let main () =
  while true do
    Printf.printf "k>" ;
    flush stdout ;
    let line = input_line stdin in
    try
      let lexbuf = Lexing.from_string line in
      let stmt = Parser.prog Lexer.token lexbuf in
      Printf.printf "%s\n" (Print_ast.print stmt) ;
      flush stdout ;
      match stmt with
      | Function (_, _) as f -> dump_value (Codegen.codegen_func f)
      | Extern e -> dump_value (Codegen.codegen_proto e)
      | Expr e -> dump_value (Codegen.codegen_expr e)
      ;
      Printf.printf "\n"
    with e -> Printf.printf "Syntax Error: %s\n" (Printexc.to_string e)
  done
