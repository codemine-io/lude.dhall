-- | Select `valueIfEqual` when `candidate` equals `subject`, `valueIfNotEqual`
-- otherwise.
-- Dhall has no `Text/equal` built-in and this needs no sentinel character:
-- `Text/replace` alone is enough to encode equality as "emptiness", which
-- makes it total over arbitrary input, including text containing any
-- characters.
--
-- Credit: https://github.com/dhall-lang/dhall-lang/issues/1431#issuecomment-4945213241
\(valueIfEqual : Text) ->
\(valueIfNotEqual : Text) ->
\(candidate : Text) ->
\(subject : Text) ->
  let emptyIffEqual =
        Text/replace candidate "" subject ++ Text/replace subject "" candidate

  let emptyIffNotEqual =
        Text/replace (Text/replace emptyIffEqual "x" emptyIffEqual) "" "x"

  in      Text/replace emptyIffNotEqual valueIfEqual emptyIffNotEqual
      ++  Text/replace emptyIffEqual valueIfNotEqual emptyIffEqual
