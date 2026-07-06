let Compiled = ./Type.dhall

let Result = ./Result/package.dhall

let Report = ./Report/Type.dhall

in  \(A : Type) ->
    \(a : A) ->
        Result.ok
          { warnings : List Report, value : A }
          { warnings = [] : List Report, value = a }
      : Compiled A
