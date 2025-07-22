let Prelude = ../../Prelude.dhall

let greaterThanEqual = ./greaterThanEqual.dhall

let Order = ./Type.dhall

let Extensions = ../../Extensions/package.dhall

let Comparison = ./Comparison.dhall

in  { greaterThanEqualFunction =
      { naturalGreater =
            assert
          : greaterThanEqual Natural Extensions.Natural.order 7 3 === True
      , naturalEqual =
            assert
          : greaterThanEqual Natural Extensions.Natural.order 5 5 === True
      , naturalLess =
            assert
          : greaterThanEqual Natural Extensions.Natural.order 3 7 === False
      , listGreater =
            assert
          :     greaterThanEqual
                  (List Natural)
                  (Extensions.List.order Natural Extensions.Natural.order)
                  [ 2, 3, 4 ]
                  [ 1, 2, 3 ]
            ===  True
      , listEqual =
            assert
          :     greaterThanEqual
                  (List Natural)
                  (Extensions.List.order Natural Extensions.Natural.order)
                  [ 1, 2, 3 ]
                  [ 1, 2, 3 ]
            ===  True
      , listLess =
            assert
          :     greaterThanEqual
                  (List Natural)
                  (Extensions.List.order Natural Extensions.Natural.order)
                  [ 1, 2, 3 ]
                  [ 2, 3, 4 ]
            ===  False
      }
    }
