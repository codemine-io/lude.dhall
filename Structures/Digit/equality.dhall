let Self = ./Type.dhall

let Typeclasses = ../../Deps/Typeclasses.dhall

in  { equal = ./equal.dhall } : Typeclasses.Classes.Equality.Type Self
