let Prelude = ../../Prelude.dhall

in  \(Element : Type) ->
      let Result = Prelude.NonEmpty.Type Element

      in  \(ls : List Element) ->
              Prelude.List.fold
                Element
                (Prelude.List.reverse Element ls)
                (Optional Result)
                ( \(x : Element) ->
                  \(acc : Optional Result) ->
                    merge
                      { None = Some (Prelude.NonEmpty.singleton Element x)
                      , Some =
                          \(ne : Result) ->
                            Some (ne // { tail = ne.tail # [ x ] })
                      }
                      acc
                )
                (None Result)
            : Optional Result
