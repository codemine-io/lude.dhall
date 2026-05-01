let toTextInCamel = ./toTextInCamel.dhall

let Prelude = ../Deps/Prelude.dhall

let Char = ./Char/Type.dhall

let Word = Prelude.NonEmpty.Type Char

let Slug = ./Type.dhall

let word = \(head : Char) -> \(tail : List Char) -> { head, tail } : Word

let slug = \(head : Word) -> \(tail : List Word) -> { head, tail } : Slug

in  { singleWord =
          assert
        :     toTextInCamel
                ( slug
                    (word Char.H [ Char.E, Char.L, Char.L, Char.O ])
                    ([] : List Word)
                )
          ===  "hello"
    , multipleWords =
          assert
        :     toTextInCamel
                ( slug
                    (word Char.H [ Char.E, Char.L, Char.L, Char.O ])
                    [ word Char.W [ Char.O, Char.R, Char.L, Char.D ]
                    , word
                        Char.E
                        [ Char.X, Char.A, Char.M, Char.P, Char.L, Char.E ]
                    ]
                )
          ===  "helloWorldExample"
    , wordWithNumber =
          assert
        :     toTextInCamel
                ( slug
                    (word Char.A [ Char.P, Char.I ])
                    [ word Char.V ([] : List Char)
                    , word Char.Two ([] : List Char)
                    ]
                )
          ===  "apiV2"
    , numberInTail =
          assert
        :     toTextInCamel
                ( slug
                    (word Char.U [ Char.S, Char.E, Char.R ])
                    [ word Char.One [ Char.Two, Char.Three ]
                    , word Char.N [ Char.A, Char.M, Char.E ]
                    ]
                )
          ===  "user123Name"
    , singleCharWord =
          assert
        :     toTextInCamel
                ( slug
                    (word Char.A ([] : List Char))
                    [ word Char.B ([] : List Char)
                    , word Char.C ([] : List Char)
                    ]
                )
          ===  "aBC"
    , emptyTail =
          assert
        :     toTextInCamel
                (slug (word Char.T [ Char.E, Char.S, Char.T ]) ([] : List Word))
          ===  "test"
    , mixedWordsAndNumbers =
          assert
        :     toTextInCamel
                ( slug
                    (word Char.G [ Char.E, Char.T ])
                    [ word Char.U [ Char.S, Char.E, Char.R ]
                    , word Char.Four [ Char.Two ]
                    , word Char.D [ Char.A, Char.T, Char.A ]
                    ]
                )
          ===  "getUser42Data"
    , longWord =
          assert
        :     toTextInCamel
                ( slug
                    ( word
                        Char.S
                        [ Char.U
                        , Char.P
                        , Char.E
                        , Char.R
                        , Char.C
                        , Char.A
                        , Char.L
                        , Char.I
                        , Char.F
                        , Char.R
                        , Char.A
                        , Char.G
                        , Char.I
                        , Char.L
                        , Char.I
                        , Char.S
                        , Char.T
                        , Char.I
                        , Char.C
                        ]
                    )
                    [ word
                        Char.E
                        [ Char.X
                        , Char.P
                        , Char.I
                        , Char.A
                        , Char.L
                        , Char.I
                        , Char.D
                        , Char.O
                        , Char.C
                        , Char.I
                        , Char.O
                        , Char.U
                        , Char.S
                        ]
                    ]
                )
          ===  "supercalifragilisticExpialidocious"
    }
