let subj = ./toTextInKebab.dhall

let Prelude = ../Deps/Prelude.dhall

let Char = ./Char/Type.dhall

let Word = Prelude.NonEmpty.Type Char

let Slug = ./Type.dhall

let word = \(head : Char) -> \(tail : List Char) -> { head, tail } : Word

let slug = \(head : Word) -> \(tail : List Word) -> { head, tail } : Slug

in  { singleWord =
          assert
        :     subj
                ( slug
                    (word Char.H [ Char.E, Char.L, Char.L, Char.O ])
                    ([] : List Word)
                )
          ===  "hello"
    , multipleWords =
          assert
        :     subj
                ( slug
                    (word Char.H [ Char.E, Char.L, Char.L, Char.O ])
                    [ word Char.W [ Char.O, Char.R, Char.L, Char.D ]
                    , word
                        Char.E
                        [ Char.X, Char.A, Char.M, Char.P, Char.L, Char.E ]
                    ]
                )
          ===  "hello-world-example"
    , wordWithNumber =
          assert
        :     subj
                ( slug
                    (word Char.A [ Char.P, Char.I ])
                    [ word Char.V ([] : List Char)
                    , word Char._2 ([] : List Char)
                    ]
                )
          ===  "api-v-2"
    , numberInTail =
          assert
        :     subj
                ( slug
                    (word Char.U [ Char.S, Char.E, Char.R ])
                    [ word Char._1 [ Char._2, Char._3 ]
                    , word Char.N [ Char.A, Char.M, Char.E ]
                    ]
                )
          ===  "user-123-name"
    , singleCharWord =
          assert
        :     subj
                ( slug
                    (word Char.A ([] : List Char))
                    [ word Char.B ([] : List Char)
                    , word Char.C ([] : List Char)
                    ]
                )
          ===  "a-b-c"
    , emptyTail =
          assert
        :     subj
                (slug (word Char.T [ Char.E, Char.S, Char.T ]) ([] : List Word))
          ===  "test"
    , mixedWordsAndNumbers =
          assert
        :     subj
                ( slug
                    (word Char.G [ Char.E, Char.T ])
                    [ word Char.U [ Char.S, Char.E, Char.R ]
                    , word Char._4 [ Char._2 ]
                    , word Char.D [ Char.A, Char.T, Char.A ]
                    ]
                )
          ===  "get-user-42-data"
    }
