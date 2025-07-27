let packResultInOptional
    : forall (A : Type) -> forall (B : Type) -> (A -> B) -> A -> Optional B
    = \(A : Type) -> \(B : Type) -> \(f : A -> B) -> \(a : A) -> Some (f a)

in  { packResultInOptional }
