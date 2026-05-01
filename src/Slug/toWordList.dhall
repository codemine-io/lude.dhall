let Self = ./Type.dhall

let Prelude = ../Deps/Prelude.dhall

let Char = ./Char.dhall

let Word = Prelude.NonEmpty.Type Char.Type

in  \(self : Self) -> [ self.head ] # self.tail : List Word
