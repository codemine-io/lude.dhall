let Prelude = ../Deps/Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/package.dhall

in  \(A : Type) ->
    \(compiled : Compiled A) ->
      merge
        { Ok =
            \(payload : { warnings : List Report.Type, value : A }) ->
              if    Prelude.List.null Report.Type payload.warnings
              then  None Text
              else  Some
                      ( Prelude.Text.concatMapSep
                          "\n"
                          Report.Type
                          (Report.toPlainText "Warning")
                          payload.warnings
                      )
        , Err = \(err : Report.Type) -> None Text
        }
        compiled
      : Optional Text
