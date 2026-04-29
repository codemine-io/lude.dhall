-- Rendering for inspection purposes.
let Self = ./Type.dhall

let Text/indent = ../Text/indent.dhall

in  \(file : Self) ->
      Text/indent 2 (file.path ++ ":" ++ "\n\n" ++ file.content)
