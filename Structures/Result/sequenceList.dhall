let Self = ./Type.dhall

let Prelude = ../../Deps/Prelude.dhall

in  \(Failure : Type) ->
    \(A : Type) ->
    \(list : List (Self Failure A)) ->
      Prelude.List.foldLeft
        (Self Failure A)
        list
        (Self Failure (List A))
        ( \(acc : Self Failure (List A)) ->
          \(element : Self Failure A) ->
            merge
              { Failure =
                  \(failure : Failure) ->
                    (Self Failure (List A)).Failure failure
              , Success =
                  \(element : A) ->
                    merge
                      { Failure =
                          \(failure : Failure) ->
                            (Self Failure (List A)).Failure failure
                      , Success =
                          \(acc : List A) ->
                            (Self Failure (List A)).Success (acc # [ element ])
                      }
                      acc
              }
              element
        )
        ((Self Failure (List A)).Success ([] : List A))
