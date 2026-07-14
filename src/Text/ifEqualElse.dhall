-- | Select `valueIfEqual` when `a` equals `b`, `valueIfNotEqual` otherwise.
-- Dhall has no `Text/equal` built-in and this needs no sentinel character:
-- `Text/replace` alone is enough to encode equality as "emptiness", which
-- makes it total over arbitrary input, including text containing any
-- characters.
--
-- Credit: https://github.com/dhall-lang/dhall-lang/issues/1431#issuecomment-4945213241
\(a : Text) ->
\(b : Text) ->
\(valueIfEqual : Text) ->
\(valueIfNotEqual : Text) ->
  let emptyIffEqual = Text/replace a "" b ++ Text/replace b "" a

  let emptyIffNotEqual =
        Text/replace (Text/replace emptyIffEqual "x" emptyIffEqual) "" "x"

  in      Text/replace emptyIffNotEqual valueIfEqual emptyIffNotEqual
      ++  Text/replace emptyIffEqual valueIfNotEqual emptyIffEqual
