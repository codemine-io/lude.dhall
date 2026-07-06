let Compiled = ./Type.dhall

let Report = ./Report/Type.dhall

in  \(A : Type) ->
    \(B : Type) ->
    \(f : A -> Compiled B) ->
    \(a : Compiled A) ->
      merge
        { Ok =
            \(aPayload : { warnings : List Report, value : A }) ->
              let b = f aPayload.value

              in  merge
                    { Ok =
                        \(bPayload : { warnings : List Report, value : B }) ->
                          (Compiled B).Ok
                            { warnings = aPayload.warnings # bPayload.warnings
                            , value = bPayload.value
                            }
                    , Err = (Compiled B).Err
                    }
                    b
        , Err = (Compiled B).Err
        }
        a
      : Compiled B
