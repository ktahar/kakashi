%{
open Ast
%}

%token <float> NUM
%token <string> ID
%token DEF EXTERN
%token PLUS MINUS TIMES DIV LT
%token LP RP COMMA EOF

%start <Ast.stmt> prog

%%

prog :
  | s = stmt; EOF { s }

stmt :
  | DEF; p = proto; e = expr { Function (p, e) }
  | EXTERN; p = proto { Extern p }
  | e = expr { Expr e }

args :
  | a = args; COMMA; e = expr { Array.append a [|e|] }
  | e = expr { [|e|] }

proto_args :
  | a = proto_args; COMMA; n = ID { Array.append a [|n|] }
  | n = ID { [|n|] }

proto :
  | fn = ID; LP; a = proto_args; RP { Prototype (fn, a) }

expr :
  | n = NUM { Number n }
  | LP; e = expr; RP  { e }
  | e1 = expr; PLUS;  e2 = expr { Binary ('+', e1, e2) }
  | e1 = expr; MINUS; e2 = expr { Binary ('-', e1, e2) }
  | e1 = expr; TIMES; e2 = expr { Binary ('*', e1, e2) }
  | e1 = expr; DIV;   e2 = expr { Binary ('/', e1, e2) }
  | e1 = expr; LT;    e2 = expr { Binary ('<', e1, e2) }
  | fn = ID; LP; a = args; RP { Call (fn, a) }
  | v = ID { Variable v }
