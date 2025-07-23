let Prelude = ../../Prelude.dhall

let insertIntoDedupedSortedList = ./insertIntoDedupedSortedList.dhall

let Order = ./Type.dhall

let Extensions = ../../Extensions/package.dhall

in  { insertIntoDedupedSortedListFunction =
      { insertIntoEmpty =
            assert
          :     insertIntoDedupedSortedList
                  Natural
                  Extensions.Natural.order
                  5
                  ([] : List Natural)
            ===  [ 5 ]
      , insertAtBeginning =
            assert
          :     insertIntoDedupedSortedList
                  Natural
                  Extensions.Natural.order
                  1
                  [ 2, 3, 4 ]
            ===  [ 1, 2, 3, 4 ]
      , insertInMiddle =
            assert
          :     insertIntoDedupedSortedList
                  Natural
                  Extensions.Natural.order
                  3
                  [ 1, 2, 4, 5 ]
            ===  [ 1, 2, 3, 4, 5 ]
      , insertAtEnd =
            assert
          :     insertIntoDedupedSortedList
                  Natural
                  Extensions.Natural.order
                  6
                  [ 1, 2, 3, 4, 5 ]
            ===  [ 1, 2, 3, 4, 5, 6 ]
      , insertDuplicate =
            assert
          :     insertIntoDedupedSortedList
                  Natural
                  Extensions.Natural.order
                  3
                  [ 3 ]
            ===  [ 3 ]
      }
    }
