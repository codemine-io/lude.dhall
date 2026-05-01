let Self = ./Type.dhall

let Typeclasses = ../Deps/Typeclasses.dhall

let Ordering = Typeclasses.Classes.Ordering

let Prelude = ../Deps/Prelude.dhall

let Char = ./Char.dhall

let charOrder = ./Char/order.dhall

let Word = Prelude.NonEmpty.Type Char

let wordOrder = Typeclasses.Instances.NonEmpty.ordering Char charOrder

in  Typeclasses.Instances.NonEmpty.ordering Word wordOrder : Ordering.Type Self
