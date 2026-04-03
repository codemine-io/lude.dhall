let Prelude = ../../Deps/Prelude.dhall

let prefixEachNonEmptyLine
    : Text -> Text -> Text
    = ./prefixEachNonEmptyLine.dhall

in  \(length : Natural) ->
      prefixEachNonEmptyLine (Prelude.Text.replicate length " ")
