let Char = ./Char/Type.dhall

let Prelude = ../Deps/Prelude.dhall

let NonEmpty = Prelude.NonEmpty.Type

let Word = NonEmpty Char

in  NonEmpty Word
