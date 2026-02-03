let Prelude = ../../Deps/Prelude.dhall

let Typeclasses = ../../Deps/Typeclasses.dhall

in  \(Element : Type) ->
    \(equality : Typeclasses.Classes.Equality.Type Element) ->
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
          False
      : Bool
