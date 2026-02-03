-- Safe division of Natural numbers.
let Prelude = ../../Prelude.dhall

let quotient =
      ../../quotient.dhall

in  \(a : Natural) ->
    \(b : Natural) ->
      if Prelude.Natural.isZero b then None Natural else Some (quotient a b).q
