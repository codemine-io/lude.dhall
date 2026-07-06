let Prelude = ../Deps/Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/package.dhall

let toWarningsYaml = ./toWarningsYaml.dhall

let FileMap = Prelude.Map.Type Text Text

in  \(compiled : Compiled FileMap) ->
      let warningsYaml
          : Optional Text
          = toWarningsYaml FileMap compiled

      let fromOptional
          : Text -> Optional Text -> FileMap
          = \(path : Text) ->
            \(optionalContent : Optional Text) ->
              merge
                { None = Prelude.Map.empty Text Text
                , Some =
                    \(content : Text) -> [ Prelude.Map.keyText path content ]
                }
                optionalContent

      let fileMap
          : FileMap
          =   fromOptional "warnings.yaml" warningsYaml
            # merge
                { Ok =
                    \ ( payload
                      : { warnings : List Report.Type, value : FileMap }
                      ) ->
                      payload.value
                , Err =
                    \(err : Report.Type) ->
                      [ Prelude.Map.keyText
                          "error.yaml"
                          (Report.toPlainText "Error" err)
                      ]
                }
                compiled

      in  fileMap
