let Prelude = ../Deps/Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/package.dhall

in  \(compiled : Compiled Text) ->
      merge
        { Ok =
            \(payload : { warnings : List Report.Type, value : Text }) ->
                  ''
                  OK!
                  ''
              ++  Prelude.Text.concatMapSep
                    "\n"
                    Report.Type
                    (Report.toPlainText "Warning")
                    payload.warnings
              ++  "\n"
              ++  payload.value
        , Err =
            \(err : Report.Type) ->
                  ''
                  ERROR!
                  ''
              ++  Report.toPlainText "Error" err
        }
        compiled
