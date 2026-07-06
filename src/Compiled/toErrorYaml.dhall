let Compiled = ./Type.dhall

let Report = ./Report/package.dhall

in  \(A : Type) ->
    \(compiled : Compiled A) ->
      merge
        { Ok =
            \(payload : { warnings : List Report.Type, value : A }) -> None Text
        , Err = \(err : Report.Type) -> Some (Report.toPlainText "Error" err)
        }
        compiled
      : Optional Text
