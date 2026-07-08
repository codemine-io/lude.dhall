let Prelude = ../Deps/Prelude.dhall

let Compiled = ./package.dhall

let CompiledType = ./Type.dhall

let Report = ./Report/Type.dhall

let listReverse = Prelude.List.reverse

let report = { path = [ "path" ], message = "message" } : Report

let okWithWarnings =
      \(value : Natural) ->
      \(warnings : List Report) ->
        (CompiledType Natural).Ok { warnings, value }

in  { mapWarnings =
      { okTransformsWarnings =
            assert
          :     Compiled.mapWarnings
                  Natural
                  (listReverse Report)
                  ( okWithWarnings
                      42
                      [ report // { message = "x" }
                      , report // { message = "y" }
                      ]
                  )
            ===  okWithWarnings
                   42
                   [ report // { message = "y" }, report // { message = "x" } ]
      , errLeavesReportUntouched =
            assert
          :     Compiled.mapWarnings
                  Natural
                  (listReverse Report)
                  (Compiled.err Natural [ "path" ] "error")
            ===  Compiled.err Natural [ "path" ] "error"
      }
    , appendWarnings =
      { okWithNoWarningsAppends =
            assert
          :     Compiled.appendWarnings
                  Natural
                  [ report ]
                  (Compiled.ok Natural 42)
            ===  okWithWarnings 42 [ report ]
      , okWithExistingWarningsAppends =
            assert
          :     Compiled.appendWarnings
                  Natural
                  [ report // { message = "extra" } ]
                  (okWithWarnings 42 [ report // { message = "existing" } ])
            ===  okWithWarnings
                   42
                   [ report // { message = "existing" }
                   , report // { message = "extra" }
                   ]
      , errLeavesReportUntouched =
            assert
          :     Compiled.appendWarnings
                  Natural
                  [ report ]
                  (Compiled.err Natural [ "path" ] "error")
            ===  Compiled.err Natural [ "path" ] "error"
      }
    }
