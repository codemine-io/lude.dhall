let Prelude = ../../Prelude.dhall

let notEqual = ./notEqual.dhall

let Equality = ./Type.dhall

let Extensions = ../../Extensions/package.dhall

in  { notEqualFunction =
      { naturalNotEqual =
          assert : notEqual Natural Extensions.Natural.equality 3 7 === True
      , naturalEqual =
          assert : notEqual Natural Extensions.Natural.equality 5 5 === False
      , listNotEqual =
            assert
          :     notEqual
                  (List Natural)
                  (Extensions.List.equality Natural Extensions.Natural.equality)
                  [ 1, 2, 3 ]
                  [ 1, 2, 4 ]
            ===  True
      , listEqual =
            assert
          :     notEqual
                  (List Natural)
                  (Extensions.List.equality Natural Extensions.Natural.equality)
                  [ 1, 2, 3 ]
                  [ 1, 2, 3 ]
            ===  False
      }
    }
