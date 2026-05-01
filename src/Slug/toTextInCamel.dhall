let Self = ./Type.dhall

let Prelude = ../Deps/Prelude.dhall

let Char = ./Char.dhall

let Word = Prelude.NonEmpty.Type Char.Type

let wordToTextInLower =
      \(word : Word) ->
            Char.toTextInLower word.head
        ++  Prelude.Text.concatMap Char.Type Char.toTextInLower word.tail

let wordToTextInTitle =
      \(word : Word) ->
            Char.toTextInUpper word.head
        ++  Prelude.Text.concatMap Char.Type Char.toTextInLower word.tail

in  \(self : Self) ->
          wordToTextInLower self.head
      ++  Prelude.Text.concatMap Word wordToTextInTitle self.tail
