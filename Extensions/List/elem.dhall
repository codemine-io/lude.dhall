let Prelude = ../../Prelude.dhall

let Algebras = ../../Algebras/package.dhall

in  \(Element : Type) ->
    \(equality : Algebras.Equality.Type Element) ->
    \(needle : Element) ->
    \(list : List Element) ->
      Prelude.List.fold
        Element
        list
        Bool
        ( \(element : Element) ->
          \(acc : Bool) ->
            equality.equal element needle || acc
        )
