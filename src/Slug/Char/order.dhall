let Self = ./Type.dhall

let Typeclasses = ../../Deps/Typeclasses.dhall

let Prelude = ../../Deps/Prelude.dhall

let Ordering = Typeclasses.Classes.Ordering

let lessThan = Prelude.Natural.lessThan

let OrderType = < Less | Equal | Greater >

let rank =
      \(self : Self) ->
        merge
          { Zero = 0
          , One = 1
          , Two = 2
          , Three = 3
          , Four = 4
          , Five = 5
          , Six = 6
          , Seven = 7
          , Eight = 8
          , Nine = 9
          , A = 10
          , B = 11
          , C = 12
          , D = 13
          , E = 14
          , F = 15
          , G = 16
          , H = 17
          , I = 18
          , J = 19
          , K = 20
          , L = 21
          , M = 22
          , N = 23
          , O = 24
          , P = 25
          , Q = 26
          , R = 27
          , S = 28
          , T = 29
          , U = 30
          , V = 31
          , W = 32
          , X = 33
          , Y = 34
          , Z = 35
          }
          self

let compare =
      \(left : Self) ->
      \(right : Self) ->
        let leftRank = rank left

        let rightRank = rank right

        in  if    lessThan leftRank rightRank
            then  OrderType.Less
            else  if lessThan rightRank leftRank
            then  OrderType.Greater
            else  OrderType.Equal

in  { order = compare } : Ordering.Type Self
