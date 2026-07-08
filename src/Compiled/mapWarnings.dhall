let Compiled = ./Type.dhall

let Result = ./Result/package.dhall

let Report = ./Report/Type.dhall

in  \(A : Type) ->
    \(f : List Report -> List Report) ->
    \(compiled : Compiled A) ->
        Result.map
          { warnings : List Report, value : A }
          { warnings : List Report, value : A }
          ( \(payload : { warnings : List Report, value : A }) ->
              payload // { warnings = f payload.warnings }
          )
          compiled
      : Compiled A
