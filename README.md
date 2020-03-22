# kakashi
A slightly modified implementation of Kaleidoscope from [llvm tutorial](https://llvm.org/docs/tutorial/).

Compared to the original, kakashi
- uses dune for build tool.
- does not use camlp4.

## Install

```bash
# opam switch create 4.10.0 # ocaml version wouldn't matter. just for ref.
sudo apt install llvm-9-dev
opam install dune llvm
```

## Build

`dune build`.
