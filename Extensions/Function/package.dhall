let packResultInOptional
    : forall (A : Type) -> forall (B : Type) -> (A -> B) -> A -> Optional B
    = ./packResultInOptional.dhall

in  { packResultInOptional }
