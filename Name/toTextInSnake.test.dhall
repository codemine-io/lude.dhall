let subj = ./toTextInSnake.dhall

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
          ===  "hello"
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
          ===  "hello_world_example"
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
          ===  "api_v_2"
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
          ===  "user_123_name"
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
          ===  "a_b_c"
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
          ===  "test"
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
          ===  "get_user_42_data"
    }
