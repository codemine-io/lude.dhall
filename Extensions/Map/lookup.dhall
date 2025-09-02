let Prelude = ../../Prelude.dhall

let Typeclasses = ../../Typeclasses.dhall

let Map = Prelude.Map

in  \(Key : Type) ->
    \(keyOrder : Typeclasses.Classes.Ordering.Type Key) ->
    \(Value : Type) ->
      let Entry = Map.Entry Key Value

      let step =
            \(key : Key) ->
            \(acc : Optional Value) ->
            \(entry : Entry) ->
              merge
                { Some = \(value : Value) -> Some value
                , None =
                    if    Typeclasses.Classes.Ordering.equal
                            Key
                            keyOrder
                            key
                            entry.mapKey
                    then  Some entry.mapValue
                    else  None Value
                }
                acc

      in  \(map : Map.Type Key Value) ->
          \(key : Key) ->
            Prelude.List.foldLeft
              Entry
              map
              (Optional Value)
              (step key)
              (None Value)
