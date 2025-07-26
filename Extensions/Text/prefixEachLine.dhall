let Prelude = ../../Prelude.dhall

in  \(prefix : Text) -> Prelude.Text.replace "\n" ("\n" ++ prefix)
