let Self = ./Type.dhall

let Prelude = ./Prelude.dhall

let Char = ./Char.dhall

in  \(self : Self) ->
          Char.toTextInLower self.head
      ++  Prelude.Text.concatMap Char.Type Char.toTextInLower self.tail
