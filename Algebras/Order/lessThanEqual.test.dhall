let Prelude = ../../Prelude.dhall

let lessThanEqual = ./lessThanEqual.dhall

let Order = ./Type.dhall

let Extensions = ../../Extensions/package.dhall

let Comparison = ./Comparison.dhall

in  { lessThanEqualFunction =
      { naturalLess =
          assert : lessThanEqual Natural Extensions.Natural.order 3 7 === True
      , naturalEqual =
          assert : lessThanEqual Natural Extensions.Natural.order 5 5 === True
      , naturalGreater =
          assert : lessThanEqual Natural Extensions.Natural.order 7 3 === False
      , listLess =
            assert
          :     lessThanEqual
                  (List Natural)
                  (Extensions.List.order Natural Extensions.Natural.order)
                  [ 1, 2, 3 ]
                  [ 2, 3, 4 ]
            ===  True
      , listEqual =
            assert
          :     lessThanEqual
                  (List Natural)
                  (Extensions.List.order Natural Extensions.Natural.order)
                  [ 1, 2, 3 ]
                  [ 1, 2, 3 ]
            ===  True
      , listGreater =
            assert
          :     lessThanEqual
                  (List Natural)
                  (Extensions.List.order Natural Extensions.Natural.order)
                  [ 2, 3, 4 ]
                  [ 1, 2, 3 ]
            ===  False
      }
    }
