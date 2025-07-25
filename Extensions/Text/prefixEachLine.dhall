let Prelude = ../../Prelude.dhall

in  \(prefix : Text) ->
      let newlineReplacement = "\n" ++ prefix

      in  Prelude.Text.replace newlineReplacement "\n"
