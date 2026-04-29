let Self = ./Type.dhall

in  \(Failure : Type) ->
    \(Success1 : Type) ->
    \(Success2 : Type) ->
    \(f : Success1 -> Success2) ->
    \(result : Self Failure Success1) ->
      merge
        { Failure =
            \(failure : Failure) -> (Self Failure Success2).Failure failure
        , Success =
            \(success1 : Success1) ->
              (Self Failure Success2).Success (f success1)
        }
        result
