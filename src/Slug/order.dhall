let Self = ./Type.dhall

let Typeclasses = ../Deps/Typeclasses.dhall

let Ordering = Typeclasses.Classes.Ordering

let Prelude = ../Deps/Prelude.dhall

let Char = ./Char.dhall

let Word = Prelude.NonEmpty.Type Char.Type

let wordOrder = Typeclasses.Instances.NonEmpty.ordering Char.Type Char.order

in  Typeclasses.Instances.NonEmpty.ordering Word wordOrder : Ordering.Type Self
