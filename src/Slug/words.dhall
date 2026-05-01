let Prelude = ../Deps/Prelude.dhall

let Self = ./Type.dhall

let Char = ./Char.dhall

let Word = Prelude.NonEmpty.Type Char.Type

let uncons = ../List/uncons.dhall

let word = ./word.dhall

in  \(headHead : Char.Type) ->
    \(headTail : List Char.Type) ->
    \(tail : List (List Char.Type)) ->
        { head = word headHead headTail
        , tail =
            Prelude.List.filterMap (List Char.Type) Word (uncons Char.Type) tail
        }
      : Self
