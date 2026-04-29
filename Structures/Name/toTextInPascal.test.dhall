let subj = ./toTextInPascal.dhall

let Word = ../LatinChars/package.dhall

let Char = ../LatinChar/Type.dhall

let WordOrNumber = ./WordOrNumber/package.dhall

in  { singleWord =
          assert
        :     subj
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
          ===  "Hello"
    , multipleWords =
          assert
        :     subj
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
          ===  "HelloWorldExample"
    , wordWithNumber =
          assert
        :     subj
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
          ===  "ApiV2"
    , numberInTail =
          assert
        :     subj
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
          ===  "User123Name"
    , singleCharWord =
          assert
        :     subj
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
          ===  "ABC"
    , emptyTail =
          assert
        :     subj
                { head =
                  { head = Char.T
                  , tail =
                    [ Char.E, Char.S, Char.T ]
                  }
                , tail = [] : List WordOrNumber.Type
                }
          ===  "Test"
    , mixedWordsAndNumbers =
          assert
        :     subj
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
          ===  "GetUser42Data"
    }
