open Ast

let rec print_expr = function
  | Number n ->
      string_of_float n
  | Variable v ->
      v
  | Binary (c, el, er) ->
      Printf.sprintf "(%c %s %s)" c (print_expr el) (print_expr er)
  | Call (s, es) ->
      Printf.sprintf "(%s %s)" s
        (String.concat " " (Array.to_list (Array.map print_expr es)))

let print_proto = function
  | Prototype (fn, args) ->
      Printf.sprintf "%s %s" fn (String.concat " " (Array.to_list args))

let print = function
  | Expr e ->
      print_expr e
  | Extern p ->
      print_proto p
  | Function (p, expr) ->
      Printf.sprintf "%s : %s" (print_proto p) (print_expr expr)
