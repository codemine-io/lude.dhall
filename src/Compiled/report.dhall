let Compiled = ./Type.dhall

in  \(A : Type) ->
    \(path : List Text) ->
    \(message : Text) ->
      (Compiled A).Err { path, message }
