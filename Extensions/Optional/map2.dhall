-- Combine two Optional values with a binary function
let Prelude = ../../Prelude.dhall

in  \(A : Type) ->
    \(B : Type) ->
    \(C : Type) ->
    \(f : A -> B -> C) ->
    \(optA : Optional A) ->
    \(optB : Optional B) ->
      Prelude.Optional.fold
        A
        optA
        (Optional C)
        ( \(a : A) ->
            Prelude.Optional.fold
              B
              optB
              (Optional C)
              (\(b : B) -> Some (f a b))
              (None C)
        )
        (None C)
