let Prelude = ../../Prelude.dhall

let lessThan = ./lessThan.dhall

let Order = ./Type.dhall

let Extensions = ../../Extensions/package.dhall

let Comparison = ./Comparison.dhall

in  { lessThanFunction =
      { naturalLess =
          assert : lessThan Natural Extensions.Natural.order 3 7 === True
      , naturalGreater =
          assert : lessThan Natural Extensions.Natural.order 7 3 === False
      , naturalEqual =
          assert : lessThan Natural Extensions.Natural.order 5 5 === False
      , listLess =
            assert
          :     lessThan
                  (List Natural)
                  (Extensions.List.order Natural Extensions.Natural.order)
                  [ 1, 2, 3 ]
                  [ 2, 3, 4 ]
            ===  True
      , listGreater =
            assert
          :     lessThan
                  (List Natural)
                  (Extensions.List.order Natural Extensions.Natural.order)
                  [ 2, 3, 4 ]
                  [ 1, 2, 3 ]
            ===  False
      }
    }
