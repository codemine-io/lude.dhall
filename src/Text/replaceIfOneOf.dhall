let replaceIfEquals
    : Text -> Text -> Text -> Text
    = ./replaceIfEquals.dhall

in  \(candidates : List Text) ->
    \(replacement : Text) ->
    \(original : Text) ->
      List/fold
        Text
        candidates
        Text
        (\(candidate : Text) -> replaceIfEquals candidate replacement)
        original
