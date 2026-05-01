let Self = ./Type.dhall

let Prelude = ../Deps/Prelude.dhall

let Char = ./Char.dhall

let toTextInLower = ./Char/toTextInLower.dhall

let toTextInUpper = ./Char/toTextInUpper.dhall

let Word = Prelude.NonEmpty.Type Char

let wordToTextInLower =
      \(word : Word) ->
            toTextInLower word.head
        ++  Prelude.Text.concatMap Char toTextInLower word.tail

let wordToTextInTitle =
      \(word : Word) ->
            toTextInUpper word.head
        ++  Prelude.Text.concatMap Char toTextInLower word.tail

in  \(self : Self) ->
          wordToTextInLower self.head
      ++  Prelude.Text.concatMap Word wordToTextInTitle self.tail
