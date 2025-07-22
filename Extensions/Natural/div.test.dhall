let div = ./div.dhall

in  { roundsDown = assert : div 3 2 === Some 1
    , producesZeroWhenBaseIsZero = assert : div 0 1 === Some 0
    , dividingByZeroProducesNone = assert : div 1 0 === None Natural
    , worksOnLargeNumbers = assert : div 1000000000 3 === Some 333333333
    }
