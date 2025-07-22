let Prelude = ../../Prelude.dhall

let toEquality = ./toEquality.dhall

let Order = ./Type.dhall

let Equality = ../Equality/Type.dhall

let Extensions = ../../Extensions/package.dhall

in  { toEqualityFunction =
      { naturalEquality =
          let equalityFromOrder = toEquality Natural Extensions.Natural.order

          let directEquality = Extensions.Natural.equality

          in  { convertedEqual =
                    assert
                  : equalityFromOrder.equal 5 5 === directEquality.equal 5 5
              , convertedNotEqual =
                    assert
                  : equalityFromOrder.equal 3 7 === directEquality.equal 3 7
              }
      , listEquality =
          let equalityFromOrder =
                toEquality
                  (List Natural)
                  (Extensions.List.order Natural Extensions.Natural.order)

          let directEquality =
                Extensions.List.equality Natural Extensions.Natural.equality

          in  { convertedListEqual =
                    assert
                  :     equalityFromOrder.equal [ 1, 2, 3 ] [ 1, 2, 3 ]
                    ===  directEquality.equal [ 1, 2, 3 ] [ 1, 2, 3 ]
              , convertedListNotEqual =
                    assert
                  :     equalityFromOrder.equal [ 1, 2, 3 ] [ 1, 2, 4 ]
                    ===  directEquality.equal [ 1, 2, 3 ] [ 1, 2, 4 ]
              }
      }
    }
