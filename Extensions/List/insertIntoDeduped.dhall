let Prelude = ../../Deps/Prelude.dhall

let Typeclasses = ../../Deps/Typeclasses.dhall

in  \(Element : Type) ->
    \(elementOrder : Typeclasses.Classes.Ordering.Type Element) ->
    \(list : List Element) ->
    \(element : Element) ->
        Typeclasses.Classes.Ordering.insertIntoDedupedSortedList
          Element
          elementOrder
          element
          list
      : List Element
