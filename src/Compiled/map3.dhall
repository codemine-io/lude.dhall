-- Analogue to Haskell's `liftA3`
let Prelude = ../Deps/Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/Type.dhall

let Result = ./Result/Type.dhall

in  \(A : Type) ->
    \(B : Type) ->
    \(C : Type) ->
    \(D : Type) ->
    \(f : A -> B -> C -> D) ->
    \(a : Compiled A) ->
    \(b : Compiled B) ->
    \(c : Compiled C) ->
      { warnings = a.warnings # b.warnings # c.warnings
      , result =
          merge
            { Ok =
                \(aVal : A) ->
                  merge
                    { Ok =
                        \(bVal : B) ->
                          merge
                            { Ok =
                                \(cVal : C) -> (Result D).Ok (f aVal bVal cVal)
                            , Err = (Result D).Err
                            }
                            c.result
                    , Err = (Result D).Err
                    }
                    b.result
            , Err = (Result D).Err
            }
            a.result
      }
