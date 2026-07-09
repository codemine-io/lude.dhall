let replaceIfEqual
    : Text -> Text -> Text -> Text
    = ./replaceIfEqual.dhall

in  \(candidates : List Text) ->
    \(replacement : Text) ->
    \(original : Text) ->
      List/fold
        Text
        candidates
        Text
        (\(candidate : Text) -> replaceIfEqual candidate replacement)
        original
