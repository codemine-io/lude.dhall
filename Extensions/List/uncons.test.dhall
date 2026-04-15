let Prelude = ../../Deps/Prelude.dhall

let uncons = ./uncons.dhall

in  { emptyList =
          assert
        :     uncons Natural ([] : List Natural)
          ===  None (Prelude.NonEmpty.Type Natural)
    , nonEmptyList =
          assert
        : uncons Natural [ 1, 2, 3 ] === Some { head = 1, tail = [ 2, 3 ] }
    }
