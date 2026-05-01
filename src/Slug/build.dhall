let Prelude = ../Deps/Prelude.dhall

let NonEmpty = Prelude.NonEmpty.Type

let List/uncons = ../List/uncons.dhall

let Self = ./Type.dhall

let Char = ./Char.dhall

let Word = ./Word.dhall

in  \(lists : List (List Char)) ->
        List/uncons
          Word
          ( Prelude.List.mapMaybe
              (List Char)
              (NonEmpty Char)
              (List/uncons Char)
              lists
          )
      : Optional Self
