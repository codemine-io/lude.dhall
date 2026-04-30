-- Analogue to Haskell's `ap` / `<*>`
let Compiled = ./Type.dhall

let map2 = ./map2.dhall

in  \(A : Type) ->
    \(B : Type) ->
    \(f : Compiled (A -> B)) ->
    \(a : Compiled A) ->
      map2 (A -> B) A B (\(ab : A -> B) -> \(aVal : A) -> ab aVal) f a
