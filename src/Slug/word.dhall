let Prelude = ../Deps/Prelude.dhall

let Char = ./Char.dhall

let Word = Prelude.NonEmpty.Type Char.Type

in  \(head : Char.Type) -> \(tail : List Char.Type) -> { head, tail } : Word
