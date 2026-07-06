let Compiled = ./Type.dhall

let Result = ./Result/package.dhall

let Report = ./Report/Type.dhall

in  \(A : Type) ->
    \(B : Type) ->
    \(f : A -> B) ->
    \(compiled : Compiled A) ->
        Result.map
          { warnings : List Report, value : A }
          { warnings : List Report, value : B }
          ( \(payload : { warnings : List Report, value : A }) ->
              payload // { value = f payload.value }
          )
          compiled
      : Compiled B
