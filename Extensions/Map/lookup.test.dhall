let Prelude = ../../Deps/Prelude.dhall

let Typeclasses = ../../Deps/Typeclasses.dhall

let lookup = ./lookup.dhall

let Map = Prelude.Map

let subj = lookup Natural Typeclasses.Instances.Natural.ordering Text

in  { lookup =
      { emptyMap = assert : subj ([] : Map.Type Natural Text) 5 === None Text
      , singleEntryMap =
        { keyExists =
              assert
            : subj [ { mapKey = 42, mapValue = "hello" } ] 42 === Some "hello"
        , keyDoesNotExist =
              assert
            : subj [ { mapKey = 42, mapValue = "hello" } ] 99 === None Text
        }
      , multipleEntryMap =
        { firstEntry =
              assert
            :     subj
                    [ { mapKey = 1, mapValue = "first" }
                    , { mapKey = 2, mapValue = "second" }
                    , { mapKey = 3, mapValue = "third" }
                    ]
                    1
              ===  Some "first"
        , middleEntry =
              assert
            :     subj
                    [ { mapKey = 1, mapValue = "first" }
                    , { mapKey = 2, mapValue = "second" }
                    , { mapKey = 3, mapValue = "third" }
                    ]
                    2
              ===  Some "second"
        , lastEntry =
              assert
            :     subj
                    [ { mapKey = 1, mapValue = "first" }
                    , { mapKey = 2, mapValue = "second" }
                    , { mapKey = 3, mapValue = "third" }
                    ]
                    3
              ===  Some "third"
        , keyNotFound =
              assert
            :     subj
                    [ { mapKey = 1, mapValue = "first" }
                    , { mapKey = 2, mapValue = "second" }
                    , { mapKey = 3, mapValue = "third" }
                    ]
                    99
              ===  None Text
        }
      , duplicateKeys.firstOccurrenceFound
        =
            assert
          :     subj
                  [ { mapKey = 5, mapValue = "first" }
                  , { mapKey = 5, mapValue = "second" }
                  , { mapKey = 5, mapValue = "third" }
                  ]
                  5
            ===  Some "first"
      , specialValues =
        { zeroKey =
              assert
            :     subj
                    [ { mapKey = 0, mapValue = "zero" }
                    , { mapKey = 1, mapValue = "one" }
                    ]
                    0
              ===  Some "zero"
        , largeKey =
              assert
            :     subj
                    [ { mapKey = 1000000, mapValue = "large" }
                    , { mapKey = 999999, mapValue = "smaller" }
                    ]
                    1000000
              ===  Some "large"
        , emptyStringValue =
            assert : subj [ { mapKey = 1, mapValue = "" } ] 1 === Some ""
        }
      , orderIndependence.unsortedMap
        =
            assert
          :     subj
                  [ { mapKey = 10, mapValue = "ten" }
                  , { mapKey = 5, mapValue = "five" }
                  , { mapKey = 15, mapValue = "fifteen" }
                  , { mapKey = 1, mapValue = "one" }
                  ]
                  5
            ===  Some "five"
      , complexScenarios =
        { manyEntriesLookupFirst =
            let entries =
                  [ { mapKey = 100, mapValue = "hundred" }
                  , { mapKey = 200, mapValue = "two hundred" }
                  , { mapKey = 300, mapValue = "three hundred" }
                  , { mapKey = 400, mapValue = "four hundred" }
                  , { mapKey = 500, mapValue = "five hundred" }
                  ]

            in  assert : subj entries 100 === Some "hundred"
        , manyEntriesLookupLast =
            let entries =
                  [ { mapKey = 100, mapValue = "hundred" }
                  , { mapKey = 200, mapValue = "two hundred" }
                  , { mapKey = 300, mapValue = "three hundred" }
                  , { mapKey = 400, mapValue = "four hundred" }
                  , { mapKey = 500, mapValue = "five hundred" }
                  ]

            in  assert : subj entries 500 === Some "five hundred"
        , manyEntriesKeyNotFound =
            let entries =
                  [ { mapKey = 100, mapValue = "hundred" }
                  , { mapKey = 200, mapValue = "two hundred" }
                  , { mapKey = 300, mapValue = "three hundred" }
                  , { mapKey = 400, mapValue = "four hundred" }
                  , { mapKey = 500, mapValue = "five hundred" }
                  ]

            in  assert : subj entries 250 === None Text
        }
      }
    }
