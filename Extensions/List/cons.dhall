let Prelude = ../../Prelude.dhall

in  \(Element : Type) ->
    \(element : Element) ->
    \(list : List Element) ->
      [ element ] # list
