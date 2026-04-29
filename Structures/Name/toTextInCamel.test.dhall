let toTextInCamel = ./toTextInCamel.dhall

let Word = ../LatinChars/package.dhall

let Char = ../LatinChar/Type.dhall

let WordOrNumber = ./WordOrNumber/package.dhall

in  { singleWord =
          assert
        :     toTextInCamel
                { head =
                  { head = Char.H
                  , tail =
                    [ Char.E
                    , Char.L
                    , Char.L
                    , Char.O
                    ]
                  }
                , tail = [] : List WordOrNumber.Type
                }
          ===  "hello"
    , multipleWords =
          assert
        :     toTextInCamel
                { head =
                  { head = Char.H
                  , tail =
                    [ Char.E
                    , Char.L
                    , Char.L
                    , Char.O
                    ]
                  }
                , tail =
                  [ WordOrNumber.Type.Word
                      { head = Char.W
                      , tail =
                        [ Char.O
                        , Char.R
                        , Char.L
                        , Char.D
                        ]
                      }
                  , WordOrNumber.Type.Word
                      { head = Char.E
                      , tail =
                        [ Char.X
                        , Char.A
                        , Char.M
                        , Char.P
                        , Char.L
                        , Char.E
                        ]
                      }
                  ]
                }
          ===  "helloWorldExample"
    , wordWithNumber =
          assert
        :     toTextInCamel
                { head =
                  { head = Char.A
                  , tail = [ Char.P, Char.I ]
                  }
                , tail =
                  [ WordOrNumber.Type.Word
                      { head = Char.V
                      , tail = [] : List Char
                      }
                  , WordOrNumber.Type.Number 2
                  ]
                }
          ===  "apiV2"
    , numberInTail =
          assert
        :     toTextInCamel
                { head =
                  { head = Char.U
                  , tail =
                    [ Char.S, Char.E, Char.R ]
                  }
                , tail =
                  [ WordOrNumber.Type.Number 123
                  , WordOrNumber.Type.Word
                      { head = Char.N
                      , tail =
                        [ Char.A, Char.M, Char.E ]
                      }
                  ]
                }
          ===  "user123Name"
    , singleCharWord =
          assert
        :     toTextInCamel
                { head =
                  { head = Char.A, tail = [] : List Char }
                , tail =
                  [ WordOrNumber.Type.Word
                      { head = Char.B
                      , tail = [] : List Char
                      }
                  , WordOrNumber.Type.Word
                      { head = Char.C
                      , tail = [] : List Char
                      }
                  ]
                }
          ===  "aBC"
    , emptyTail =
          assert
        :     toTextInCamel
                { head =
                  { head = Char.T
                  , tail =
                    [ Char.E, Char.S, Char.T ]
                  }
                , tail = [] : List WordOrNumber.Type
                }
          ===  "test"
    , mixedWordsAndNumbers =
          assert
        :     toTextInCamel
                { head =
                  { head = Char.G
                  , tail = [ Char.E, Char.T ]
                  }
                , tail =
                  [ WordOrNumber.Type.Word
                      { head = Char.U
                      , tail =
                        [ Char.S, Char.E, Char.R ]
                      }
                  , WordOrNumber.Type.Number 42
                  , WordOrNumber.Type.Word
                      { head = Char.D
                      , tail =
                        [ Char.A, Char.T, Char.A ]
                      }
                  ]
                }
          ===  "getUser42Data"
    , longWord =
          assert
        :     toTextInCamel
                { head =
                  { head = Char.S
                  , tail =
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
                  }
                , tail =
                  [ WordOrNumber.Type.Word
                      { head = Char.E
                      , tail =
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
                      }
                  ]
                }
          ===  "supercalifragilisticExpialidocious"
    }
