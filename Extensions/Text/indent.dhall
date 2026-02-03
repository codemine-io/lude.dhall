let Prelude = ../../Deps/Prelude.dhall

let prefixEachLine
    : Text -> Text -> Text
    = ./prefixEachLine.dhall

in  \(length : Natural) -> prefixEachLine (Prelude.Text.replicate length " ")
