-- Analogue to Haskell's `liftA3`
let Compiled = ./Type.dhall

let Report = ./Report/Type.dhall

in  \(A : Type) ->
    \(B : Type) ->
    \(C : Type) ->
    \(D : Type) ->
    \(f : A -> B -> C -> D) ->
    \(a : Compiled A) ->
    \(b : Compiled B) ->
    \(c : Compiled C) ->
      merge
        { Ok =
            \(aPayload : { warnings : List Report, value : A }) ->
              merge
                { Ok =
                    \(bPayload : { warnings : List Report, value : B }) ->
                      merge
                        { Ok =
                            \ ( cPayload
                              : { warnings : List Report, value : C }
                              ) ->
                              (Compiled D).Ok
                                { warnings =
                                      aPayload.warnings
                                    # bPayload.warnings
                                    # cPayload.warnings
                                , value =
                                    f
                                      aPayload.value
                                      bPayload.value
                                      cPayload.value
                                }
                        , Err = (Compiled D).Err
                        }
                        c
                , Err = (Compiled D).Err
                }
                b
        , Err = (Compiled D).Err
        }
        a
