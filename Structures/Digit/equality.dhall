let Self = ./Type.dhall

let Algebras = ../../Algebras/package.dhall

in  { equal = ./equal.dhall } : Algebras.Equality.Type Self
