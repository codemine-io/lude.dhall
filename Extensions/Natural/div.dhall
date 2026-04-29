-- Safe division of Natural numbers.
let divMod = ./divMod.dhall

in  λ(a : Natural) →
    λ(b : Natural) →
      merge
        { None = None Natural
        , Some = λ(result : { div : Natural, mod : Natural }) → Some result.div
        }
        (divMod a b)
