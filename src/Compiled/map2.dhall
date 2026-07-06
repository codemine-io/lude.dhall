-- Analogue to Haskell's `liftA2`
let Compiled = ./Type.dhall

let Report = ./Report/Type.dhall

in  \(A : Type) ->
    \(B : Type) ->
    \(C : Type) ->
    \(f : A -> B -> C) ->
    \(a : Compiled A) ->
    \(b : Compiled B) ->
      merge
        { Ok =
            \(aPayload : { warnings : List Report, value : A }) ->
              merge
                { Ok =
                    \(bPayload : { warnings : List Report, value : B }) ->
                      (Compiled C).Ok
                        { warnings = aPayload.warnings # bPayload.warnings
                        , value = f aPayload.value bPayload.value
                        }
                , Err = (Compiled C).Err
                }
                b
        , Err = (Compiled C).Err
        }
        a
