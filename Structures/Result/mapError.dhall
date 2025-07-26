let Self = ./Type.dhall

in  \(Failure1 : Type) ->
    \(Failure2 : Type) ->
    \(Success : Type) ->
    \(f : Failure1 -> Failure2) ->
    \(result : Self Failure1 Success) ->
      merge
        { Failure =
            \(failure1 : Failure1) ->
              (Self Failure2 Success).Failure (f failure1)
        , Success =
            \(success : Success) -> (Self Failure2 Success).Success success
        }
        result
