let Prelude = ../../Prelude.dhall

let equal = ./equal.dhall

let Equality = ./Type.dhall

let Extensions = ../../Extensions/package.dhall

in  { equalFunction =
      { naturalEqual =
          assert : equal Natural Extensions.Natural.equality 5 5 === True
      , naturalNotEqual =
          assert : equal Natural Extensions.Natural.equality 3 7 === False
      , listEqual =
            assert
          :     equal
                  (List Natural)
                  (Extensions.List.equality Natural Extensions.Natural.equality)
                  [ 1, 2, 3 ]
                  [ 1, 2, 3 ]
            ===  True
      , listNotEqual =
            assert
          :     equal
                  (List Natural)
                  (Extensions.List.equality Natural Extensions.Natural.equality)
                  [ 1, 2, 3 ]
                  [ 1, 2, 4 ]
            ===  False
      }
    }
