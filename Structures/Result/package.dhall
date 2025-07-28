let Self
    : forall (Failure : Type) -> forall (Success : Type) -> Type
    = ./Type.dhall

let mapError
    : forall (Failure1 : Type) ->
      forall (Failure2 : Type) ->
      forall (Success : Type) ->
      (Failure1 -> Failure2) ->
      Self Failure1 Success ->
        Self Failure2 Success
    = ./mapError.dhall

let mapSuccess
    : forall (Failure : Type) ->
      forall (Success1 : Type) ->
      forall (Success2 : Type) ->
      (Success1 -> Success2) ->
      Self Failure Success1 ->
        Self Failure Success2
    = ./mapSuccess.dhall

let mapBoth
    : forall (Failure1 : Type) ->
      forall (Failure2 : Type) ->
      forall (Success1 : Type) ->
      forall (Success2 : Type) ->
      (Failure1 -> Failure2) ->
      (Success1 -> Success2) ->
      Self Failure1 Success1 ->
        Self Failure2 Success2
    = ./mapBoth.dhall

let andThen
    : forall (Failure : Type) ->
      forall (Success1 : Type) ->
      forall (Success2 : Type) ->
      (Success1 -> Self Failure Success2) ->
      Self Failure Success1 ->
        Self Failure Success2
    = ./andThen.dhall

let traverseList
    : forall (Failure : Type) ->
      forall (A : Type) ->
      forall (B : Type) ->
      (A -> Self Failure B) ->
      List A ->
        Self Failure (List B)
    = ./traverseList.dhall

let sequenceList
    : forall (Failure : Type) ->
      forall (Success : Type) ->
      List (Self Failure Success) ->
        Self Failure (List Success)
    = ./sequenceList.dhall

in  { Type = Self
    , mapError
    , mapSuccess
    , mapBoth
    , andThen
    , traverseList
    , sequenceList
    }
