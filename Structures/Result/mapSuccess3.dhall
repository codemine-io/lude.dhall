let Self = ./Type.dhall

let flatMap = ./flatMap.dhall

in  \(Failure : Type) ->
    \(Success1 : Type) ->
    \(Success2 : Type) ->
    \(Success3 : Type) ->
    \(Success : Type) ->
    \(f : Success1 -> Success2 -> Success3 -> Success) ->
    \(result1 : Self Failure Success1) ->
    \(result2 : Self Failure Success2) ->
    \(result3 : Self Failure Success3) ->
      flatMap
        Failure
        Success1
        Success
        ( \(success1 : Success1) ->
            flatMap
              Failure
              Success2
              Success
              ( \(success2 : Success2) ->
                  flatMap
                    Failure
                    Success3
                    Success
                    ( \(success3 : Success3) ->
                        (Self Failure Success).Success
                          (f success1 success2 success3)
                    )
                    result3
              )
              result2
        )
        result1
