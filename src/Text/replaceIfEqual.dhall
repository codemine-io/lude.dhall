-- | Replace `target` with `replacement` only when `original` equals `target`.
let ifEqualElse
    : Text -> Text -> Text -> Text -> Text
    = ./ifEqualElse.dhall

in  \(target : Text) ->
    \(replacement : Text) ->
    \(original : Text) ->
      ifEqualElse target original replacement original
