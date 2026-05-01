let Self = ./Type.dhall

let Prelude = ../Deps/Prelude.dhall

let Char = ./Char.dhall

let Word = Prelude.NonEmpty.Type Char.Type

let wordToTextInTitle =
      \(word : Word) ->
            Char.toTextInUpper word.head
        ++  Prelude.Text.concatMap Char.Type Char.toTextInLower word.tail

in  \(self : Self) ->
      Prelude.Text.concatMap Word wordToTextInTitle ([ self.head ] # self.tail)
