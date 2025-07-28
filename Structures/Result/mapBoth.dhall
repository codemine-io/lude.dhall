let Self = ./Type.dhall

in  \(Failure1 : Type) ->
    \(Failure2 : Type) ->
    \(Success1 : Type) ->
    \(Success2 : Type) ->
    \(failureFn : Failure1 -> Failure2) ->
    \(successFn : Success1 -> Success2) ->
    \(result : Self Failure1 Success1) ->
      merge
        { Failure =
            \(failure1 : Failure1) ->
              (Self Failure2 Success2).Failure (failureFn failure1)
        , Success =
            \(success1 : Success1) ->
              (Self Failure2 Success2).Success (successFn success1)
        }
        result
