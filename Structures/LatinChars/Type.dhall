let Prelude = ./Prelude.dhall

let Char = ./Char.dhall

in  Prelude.NonEmpty.Type Char.Type
