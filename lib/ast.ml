type proto = Prototype of string * string array
type stmt =
  | Expr of expr
  | Extern of proto
  | Function of proto * expr
and expr =
  | Number of float
  | Variable of string
  | Binary of char * expr * expr
  | Call of string * expr array
