let Self = ./Type.dhall

let Result = ./Result/package.dhall

let Report = ./Report/package.dhall

in  \(A : Type) ->
    \(path : List Text) ->
    \(message : Text) ->
        Result.err { warnings : List Report.Type, value : A } path message
      : Self A
