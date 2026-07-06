let Prelude = ../Deps/Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/package.dhall

in  \(A : Type) ->
    \(context : Text) ->
    \(compiled : Compiled A) ->
      merge
        { Ok =
            \(payload : { warnings : List Report.Type, value : A }) ->
              (Compiled A).Ok
                { warnings =
                    Prelude.List.map
                      Report.Type
                      Report.Type
                      (Report.nest context)
                      payload.warnings
                , value = payload.value
                }
        , Err =
            \(err : Report.Type) -> (Compiled A).Err (Report.nest context err)
        }
        compiled
      : Compiled A
