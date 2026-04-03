let Prelude = ../../Deps/Prelude.dhall

let prefixEachLine
    : Text -> Text -> Text
    = ./prefixEachLine.dhall

let prefixEachNonEmptyLine
    : Text -> Text -> Text
    = \(prefix : Text) ->
      \(text : Text) ->
        Text/replace
          ("\n" ++ prefix ++ "\n")
          "\n\n"
          (prefixEachLine prefix text)

in  \(length : Natural) ->
      prefixEachNonEmptyLine (Prelude.Text.replicate length " ")
