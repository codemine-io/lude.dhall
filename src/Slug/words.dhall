let Prelude = ../Deps/Prelude.dhall

let Self = ./Type.dhall

let Char = ./Char.dhall

let Word = Prelude.NonEmpty.Type Char

let uncons = ../List/uncons.dhall

let word = ./word.dhall

in  \(headHead : Char) ->
    \(headTail : List Char) ->
    \(tail : List (List Char)) ->
        { head = word headHead headTail
        , tail =
            Prelude.List.filterMap (List Char) Word (uncons Char) tail
        }
      : Self
