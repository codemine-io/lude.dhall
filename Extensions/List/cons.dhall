let Prelude = ../../Deps/Prelude.dhall

in  \(Element : Type) ->
    \(element : Element) ->
    \(list : List Element) ->
      [ element ] # list
