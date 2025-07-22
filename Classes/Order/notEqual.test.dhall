let Prelude = ../../Prelude.dhall

let notEqual = ./notEqual.dhall

let Order = ./Type.dhall

let Extensions = ../../Extensions/package.dhall

let Comparison = ./Comparison.dhall

in  { notEqualFunction =
      { naturalNotEqual =
          assert : notEqual Natural Extensions.Natural.order 3 7 === True
      , naturalEqual =
          assert : notEqual Natural Extensions.Natural.order 5 5 === False
      , listNotEqual =
            assert
          :     notEqual
                  (List Natural)
                  (Extensions.List.order Natural Extensions.Natural.order)
                  [ 1, 2, 3 ]
                  [ 1, 2, 4 ]
            ===  True
      , listEqual =
            assert
          :     notEqual
                  (List Natural)
                  (Extensions.List.order Natural Extensions.Natural.order)
                  [ 1, 2, 3 ]
                  [ 1, 2, 3 ]
            ===  False
      }
    }
