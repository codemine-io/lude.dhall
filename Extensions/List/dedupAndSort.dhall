let Prelude = ../../Prelude.dhall

let Algebras = ../../Algebras/package.dhall

in  \(Element : Type) ->
    \(elementOrder : Algebras.Order.Type Element) ->
        Algebras.Order.dedupAndSortList Element elementOrder
      : List Element -> List Element
