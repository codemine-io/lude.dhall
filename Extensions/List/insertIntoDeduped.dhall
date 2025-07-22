let Prelude = ../../Prelude.dhall

let Algebras = ../../Algebras/package.dhall

in  \(Element : Type) ->
    \(elementOrder : Algebras.Order.Type Element) ->
    \(list : List Element) ->
    \(element : Element) ->
        Algebras.Order.insertIntoDedupedSortedList
          Element
          elementOrder
          element
          list
      : List Element
