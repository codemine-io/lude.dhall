let Prelude = ../../Deps/Prelude.dhall

let Typeclasses = ../../Deps/Typeclasses.dhall

in  \(Element : Type) ->
    \(elementOrder : Typeclasses.Classes.Ordering.Type Element) ->
        Typeclasses.Classes.Ordering.dedupAndSortList Element elementOrder
      : List Element -> List Element
