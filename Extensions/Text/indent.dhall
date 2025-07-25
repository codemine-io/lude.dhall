let Prelude = ../../Prelude.dhall

in  \(length : Natural) ->
      let newlineReplacement = "\n" ++ Prelude.Text.replicate length " "

      in  Prelude.Text.replace newlineReplacement "\n"
