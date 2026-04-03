let prefixEachLine
    : Text -> Text -> Text
    = ./prefixEachLine.dhall

in  \(prefix : Text) ->
    \(text : Text) ->
      Text/replace ("\n" ++ prefix ++ "\n") "\n\n" (prefixEachLine prefix text)
