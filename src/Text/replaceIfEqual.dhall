-- | Replace `target` with `replacement` only when `original` equals `target`.
-- Dhall has no `Text/equal` built-in, so both strings are wrapped in a sentinel
-- character that is extremely unlikely to appear in ordinary input (U+E000 PRIVATE USE CHARACTER).
let sentinel = ""

in  \(target : Text) ->
    \(replacement : Text) ->
    \(original : Text) ->
      let wrappedTarget = sentinel ++ target ++ sentinel

      let wrappedReplacement = sentinel ++ replacement ++ sentinel

      let wrappedOriginal = sentinel ++ original ++ sentinel

      in  Text/replace
            sentinel
            ""
            (Text/replace wrappedTarget wrappedReplacement wrappedOriginal)
