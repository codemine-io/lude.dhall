let Self = ./Type.dhall

let Prelude = ../Deps/Prelude.dhall

let Char = ./Char.dhall

let Word = Prelude.NonEmpty.Type Char.Type

let wordToTextInLower =
      \(word : Word) ->
            Char.toTextInLower word.head
        ++  Prelude.Text.concatMap Char.Type Char.toTextInLower word.tail

in  \(self : Self) ->
      let headText = wordToTextInLower self.head

      let tailTexts = Prelude.List.map Word Text wordToTextInLower self.tail

      in  Prelude.Text.concatSep "-" ([ headText ] # tailTexts)
