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
            ===  [ 1, 3, 5, 4, 2 ]
      , reverseOrder =
            assert
          :     dedupAndSortList
                  Natural
                  Extensions.Natural.order
                  [ 5, 4, 3, 2, 1 ]
            ===  [ 5, 3, 1, 2, 4 ]
      , withDuplicates =
            assert
          :     dedupAndSortList
                  Natural
                  Extensions.Natural.order
                  [ 3, 1, 4, 1, 5, 9, 2, 6, 5, 3 ]
            ===  [ 2, 3, 4, 5, 3, 5, 6, 9, 1, 1 ]
      , randomOrder =
            assert
          :     dedupAndSortList
                  Natural
                  Extensions.Natural.order
                  [ 7, 2, 9, 1, 5 ]
            ===  [ 7, 9, 5, 2, 1 ]
      }
    }
