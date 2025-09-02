let Number = ./Type.dhall

let Typeclasses = ../../Typeclasses.dhall

let Extensions = ../../Extensions/package.dhall

let Char = ./Char.dhall

let Order = Typeclasses.Classes.Ordering

in    Typeclasses.Instances.NonEmpty.ordering Char.Type Char.order
    : Order.Type Number
