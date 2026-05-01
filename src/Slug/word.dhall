let Prelude = ../Deps/Prelude.dhall

let Char = ./Char.dhall

let Word = Prelude.NonEmpty.Type Char

in  \(head : Char) -> \(tail : List Char) -> { head, tail } : Word
