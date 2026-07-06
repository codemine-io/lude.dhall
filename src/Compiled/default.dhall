let Compiled = ./Type.dhall

in  \(A : Type) -> (Compiled A).Err { path = [] : List Text, message = "" }
