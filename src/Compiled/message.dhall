let Compiled = ./Type.dhall

in  \(A : Type) ->
    \(message : Text) ->
      (Compiled A).Err { path = [] : List Text, message }
