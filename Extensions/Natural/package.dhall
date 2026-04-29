let div
    : Natural -> Natural -> Optional Natural
    = ./div.dhall

let divMod
    : Natural -> Natural -> Optional { div : Natural, mod : Natural }
    = ./divMod.dhall

in  { div, divMod }
