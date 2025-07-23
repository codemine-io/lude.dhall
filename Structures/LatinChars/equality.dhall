let Self = ./Type.dhall

let Algebras = ../../Algebras/package.dhall

let order = ./order.dhall

in  Algebras.Order.toEquality Self order : Algebras.Equality.Type Self
