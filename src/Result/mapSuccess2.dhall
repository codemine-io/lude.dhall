let Self = ./Type.dhall

in  \(Failure : Type) ->
    \(Success1 : Type) ->
    \(Success2 : Type) ->
    \(Success : Type) ->
    \(f : Success1 -> Success2 -> Success) ->
    \(result1 : Self Failure Success1) ->
    \(result2 : Self Failure Success2) ->
      merge
        { Failure = (Self Failure Success).Failure
        , Success =
            \(success1 : Success1) ->
              merge
                { Failure = (Self Failure Success).Failure
                , Success =
                    \(success2 : Success2) ->
                      (Self Failure Success).Success (f success1 success2)
                }
                result2
        }
        result1
