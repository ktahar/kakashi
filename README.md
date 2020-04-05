# kakashi
A slightly modified implementation of Kaleidoscope language in [llvm tutorial](https://llvm.org/docs/tutorial/).
Kakashi uses different tool sets compared to the original.
- ocamllex and menhir are used for lexer and parser generation
(those are written based on camlp4 in the original).
- dune is used for build.

## Status
implemented till Chapter 3

## Install

```bash
# opam switch create 4.10.0 # ocaml version wouldn't matter. just for ref.
sudo apt install llvm-9-dev
opam insall dune menhir llvm
```

## Build

`dune build`

## Run

`_build/default/bin/kakashi.exe`
