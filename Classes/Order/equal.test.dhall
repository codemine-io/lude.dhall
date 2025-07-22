let Prelude = ../../Prelude.dhall

let equal = ./equal.dhall

let Order = ./Type.dhall

let Extensions = ../../Extensions/package.dhall

let Comparison = ./Comparison.dhall

in  { matchesEqualOnNaturalWhen =
      { smallerByOne =
            assert
          :     equal Natural Extensions.Natural.order 4 5
            ===  Prelude.Natural.equal 4 5
      , largerByOne =
            assert
          :     equal Natural Extensions.Natural.order 5 4
            ===  Prelude.Natural.equal 5 4
      , equal =
            assert
          :     equal Natural Extensions.Natural.order 4 4
            ===  Prelude.Natural.equal 4 4
      , zero =
            assert
          :     equal Natural Extensions.Natural.order 0 0
            ===  Prelude.Natural.equal 0 0
      }
    }
