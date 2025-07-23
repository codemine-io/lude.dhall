let Number = ./Type.dhall

let Algebras = ../../Algebras/package.dhall

let Extensions = ../../Extensions/package.dhall

let Char = ./Char.dhall

let Order = Algebras.Order

in  Extensions.NonEmpty.order Char.Type Char.order : Order.Type Number
