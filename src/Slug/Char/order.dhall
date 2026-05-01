let Self = ./Type.dhall

let Typeclasses = ../../Deps/Typeclasses.dhall

let Prelude = ../../Deps/Prelude.dhall

let Ordering = Typeclasses.Classes.Ordering


let Order = < Less | Equal | Greater >

let rank =
      \(self : Self) ->
        merge
          { A = 0
          , B = 1
          , C = 2
          , D = 3
          , E = 4
          , F = 5
          , G = 6
          , H = 7
          , I = 8
          , J = 9
          , K = 10
          , L = 11
          , M = 12
          , N = 13
          , O = 14
          , P = 15
          , Q = 16
          , R = 17
          , S = 18
          , T = 19
          , U = 20
          , V = 21
          , W = 22
          , X = 23
          , Y = 24
          , Z = 25
          , _0 = 26
          , _1 = 27
          , _2 = 28
          , _3 = 29
          , _4 = 30
          , _5 = 31
          , _6 = 32
          , _7 = 33
          , _8 = 34
          , _9 = 35
          }
          self

let compare =
      \(left : Self) ->
      \(right : Self) ->
        let leftRank = rank left

        let rightRank = rank right

        in  if    Prelude.Natural.lessThan leftRank rightRank
            then  Order.Less
            else  if Prelude.Natural.lessThan rightRank leftRank
            then  Order.Greater
            else  Order.Equal

in  { order = compare } : Ordering.Type Self
