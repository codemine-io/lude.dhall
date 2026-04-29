let Prelude = ../Deps/Prelude.dhall

let Self = ./Type.dhall

in  \(file : Self) ->
      Prelude.Map.keyText file.path file.content : Prelude.Map.Entry Text Text
