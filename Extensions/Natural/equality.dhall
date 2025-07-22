let Prelude = ../../Prelude.dhall

let Equality = ../../Algebras/Equality/Type.dhall

let equal = Prelude.Natural.equal

in  { equal } : Equality Natural
