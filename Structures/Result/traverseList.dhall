let Self = ./Type.dhall

let Prelude = ../../Prelude.dhall

let sequenceList = ./sequenceList.dhall

in  \(Failure : Type) ->
    \(A : Type) ->
    \(B : Type) ->
    \(f : A -> Self Failure B) ->
    \(list : List A) ->
      sequenceList Failure B (Prelude.List.map A (Self Failure B) f list)
