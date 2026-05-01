let Self = ./Type.dhall

let Prelude = ../Deps/Prelude.dhall

let Char = ./Char.dhall

let toTextInLower = ./Char/toTextInLower.dhall

let Word = Prelude.NonEmpty.Type Char

let wordToTextInLower =
      \(word : Word) ->
            toTextInLower word.head
        ++  Prelude.Text.concatMap Char toTextInLower word.tail

in  \(self : Self) ->
      let headText = wordToTextInLower self.head

      let tailTexts = Prelude.List.map Word Text wordToTextInLower self.tail

      in  Prelude.Text.concatSep "_" ([ headText ] # tailTexts)
