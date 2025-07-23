let Prelude = ../../Prelude.dhall

let dedupAndSortList = ./dedupAndSortList.dhall

let Order = ./Type.dhall

let Extensions = ../../Extensions/package.dhall

in  { dedupAndSortListFunction =
      { emptyList =
            assert
          :     dedupAndSortList
                  Natural
                  Extensions.Natural.order
                  ([] : List Natural)
            ===  ([] : List Natural)
      , singleElement =
            assert
          : dedupAndSortList Natural Extensions.Natural.order [ 5 ] === [ 5 ]
      , alreadySorted =
            assert
          :     dedupAndSortList
                  Natural
                  Extensions.Natural.order
                  [ 1, 2, 3, 4, 5 ]
            ===  [ 1, 2, 3, 4, 5 ]
      , reverseOrder =
            assert
          :     dedupAndSortList
                  Natural
                  Extensions.Natural.order
                  [ 5, 4, 3, 2, 1 ]
            ===  [ 1, 2, 3, 4, 5 ]
      , withDuplicates =
            assert
          :     dedupAndSortList
                  Natural
                  Extensions.Natural.order
                  [ 3, 1, 4, 1, 5, 9, 2, 6, 5, 3 ]
            ===  [ 1, 2, 3, 4, 5, 6, 9 ]
      , randomOrder =
            assert
          :     dedupAndSortList
                  Natural
                  Extensions.Natural.order
                  [ 7, 2, 9, 1, 5 ]
            ===  [ 1, 2, 5, 7, 9 ]
      }
    }
