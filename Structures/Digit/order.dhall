let Self = ./Type.dhall

let Typeclasses = ../../Typeclasses.dhall

let Order = Typeclasses.Classes.Ordering.Order.Type

let order
    : Self -> Self -> Order
    = \(left : Self) ->
      \(right : Self) ->
        merge
          { Zero =
              merge
                { Zero = Order.Equal
                , One = Order.Less
                , Two = Order.Less
                , Three = Order.Less
                , Four = Order.Less
                , Five = Order.Less
                , Six = Order.Less
                , Seven = Order.Less
                , Eight = Order.Less
                , Nine = Order.Less
                }
                right
          , One =
              merge
                { Zero = Order.Greater
                , One = Order.Equal
                , Two = Order.Less
                , Three = Order.Less
                , Four = Order.Less
                , Five = Order.Less
                , Six = Order.Less
                , Seven = Order.Less
                , Eight = Order.Less
                , Nine = Order.Less
                }
                right
          , Two =
              merge
                { Zero = Order.Greater
                , One = Order.Greater
                , Two = Order.Equal
                , Three = Order.Less
                , Four = Order.Less
                , Five = Order.Less
                , Six = Order.Less
                , Seven = Order.Less
                , Eight = Order.Less
                , Nine = Order.Less
                }
                right
          , Three =
              merge
                { Zero = Order.Greater
                , One = Order.Greater
                , Two = Order.Greater
                , Three = Order.Equal
                , Four = Order.Less
                , Five = Order.Less
                , Six = Order.Less
                , Seven = Order.Less
                , Eight = Order.Less
                , Nine = Order.Less
                }
                right
          , Four =
              merge
                { Zero = Order.Greater
                , One = Order.Greater
                , Two = Order.Greater
                , Three = Order.Greater
                , Four = Order.Equal
                , Five = Order.Less
                , Six = Order.Less
                , Seven = Order.Less
                , Eight = Order.Less
                , Nine = Order.Less
                }
                right
          , Five =
              merge
                { Zero = Order.Greater
                , One = Order.Greater
                , Two = Order.Greater
                , Three = Order.Greater
                , Four = Order.Greater
                , Five = Order.Equal
                , Six = Order.Less
                , Seven = Order.Less
                , Eight = Order.Less
                , Nine = Order.Less
                }
                right
          , Six =
              merge
                { Zero = Order.Greater
                , One = Order.Greater
                , Two = Order.Greater
                , Three = Order.Greater
                , Four = Order.Greater
                , Five = Order.Greater
                , Six = Order.Equal
                , Seven = Order.Less
                , Eight = Order.Less
                , Nine = Order.Less
                }
                right
          , Seven =
              merge
                { Zero = Order.Greater
                , One = Order.Greater
                , Two = Order.Greater
                , Three = Order.Greater
                , Four = Order.Greater
                , Five = Order.Greater
                , Six = Order.Greater
                , Seven = Order.Equal
                , Eight = Order.Less
                , Nine = Order.Less
                }
                right
          , Eight =
              merge
                { Zero = Order.Greater
                , One = Order.Greater
                , Two = Order.Greater
                , Three = Order.Greater
                , Four = Order.Greater
                , Five = Order.Greater
                , Six = Order.Greater
                , Seven = Order.Greater
                , Eight = Order.Equal
                , Nine = Order.Less
                }
                right
          , Nine =
              merge
                { Zero = Order.Greater
                , One = Order.Greater
                , Two = Order.Greater
                , Three = Order.Greater
                , Four = Order.Greater
                , Five = Order.Greater
                , Six = Order.Greater
                , Seven = Order.Greater
                , Eight = Order.Greater
                , Nine = Order.Equal
                }
                right
          }
          left

in  { order } : Typeclasses.Classes.Ordering.Type Self
