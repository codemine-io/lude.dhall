let Prelude = ../../Prelude.dhall

let greaterThan = ./greaterThan.dhall

let Order = ./Type.dhall

let Extensions = ../../Extensions/package.dhall

let Comparison = ./Comparison.dhall

in  { greaterThanFunction =
      { naturalGreater =
          assert : greaterThan Natural Extensions.Natural.order 7 3 === True
      , naturalLess =
          assert : greaterThan Natural Extensions.Natural.order 3 7 === False
      , naturalEqual =
          assert : greaterThan Natural Extensions.Natural.order 5 5 === False
      , listGreater =
            assert
          :     greaterThan
                  (List Natural)
                  (Extensions.List.order Natural Extensions.Natural.order)
                  [ 2, 3, 4 ]
                  [ 1, 2, 3 ]
            ===  True
      , listLess =
            assert
          :     greaterThan
                  (List Natural)
                  (Extensions.List.order Natural Extensions.Natural.order)
                  [ 1, 2, 3 ]
                  [ 2, 3, 4 ]
            ===  False
      }
    }
