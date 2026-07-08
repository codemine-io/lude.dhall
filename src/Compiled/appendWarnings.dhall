let Compiled = ./Type.dhall

let Report = ./Report/Type.dhall

let mapWarnings = ./mapWarnings.dhall

in  \(A : Type) ->
    \(warnings : List Report) ->
    \(compiled : Compiled A) ->
        mapWarnings
          A
          (\(existing : List Report) -> existing # warnings)
          compiled
      : Compiled A
