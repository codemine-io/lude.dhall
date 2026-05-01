let Prelude = ../Deps/Prelude.dhall

let Self = ./Type.dhall

let Char = ./Char.dhall

let Word = Prelude.NonEmpty.Type Char

let toWordList = ./toWordList.dhall

in  \(head : Self) ->
    \(tail : List Self) ->
        { head = head.head
        , tail = head.tail # Prelude.List.concatMap Self Word toWordList tail
        }
      : Self
