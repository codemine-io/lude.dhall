let Self = ./Type.dhall

let Typeclasses = ../../Typeclasses.dhall

in  { equal = ./equal.dhall } : Typeclasses.Classes.Equality.Type Self
