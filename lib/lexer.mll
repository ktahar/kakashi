{
open Parser
}

let digit = ['0'-'9']
let alphabet = ['a'-'z' 'A'-'Z' '_']
let number = (digit+ | (digit+ "." digit*) | (digit* "." digit+))
let id = alphabet (alphabet | digit)*

let whitespace = ['\t' ' ' '\n' '\r']

rule token = parse
  | whitespace+ { token lexbuf }
  | "def" { DEF }
  | "extern" { EXTERN }
  | id as text { ID text }
  | number as n { NUM (float_of_string n ) }
  | "+"  { PLUS }
  | "-"  { MINUS }
  | "*"  { TIMES }
  | "/"  { DIV }
  | "<"  { LT }
  | "("  { LP }
  | ")"  { RP }
  | ","  { COMMA }
  | eof  { EOF }
