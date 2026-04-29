let map2 = ./map2.dhall

let Natural/add = \(a : Natural) -> \(b : Natural) -> a + b

let Text/append = \(a : Text) -> \(b : Text) -> a ++ b

in  { bothSomeProduceSome =
          assert
        : map2 Natural Natural Natural Natural/add (Some 3) (Some 5) === Some 8
    , firstNoneProducesNone =
          assert
        :     map2 Natural Natural Natural Natural/add (None Natural) (Some 5)
          ===  None Natural
    , secondNoneProducesNone =
          assert
        :     map2 Natural Natural Natural Natural/add (Some 3) (None Natural)
          ===  None Natural
    , bothNoneProducesNone =
          assert
        :     map2
                Natural
                Natural
                Natural
                Natural/add
                (None Natural)
                (None Natural)
          ===  None Natural
    , worksWithDifferentTypes =
          assert
        :     map2
                Natural
                Text
                Text
                (\(n : Natural) -> \(t : Text) -> "${Natural/show n}: ${t}")
                (Some 42)
                (Some "hello")
          ===  Some "42: hello"
    , textConcatenation =
          assert
        :     map2 Text Text Text Text/append (Some "Hello ") (Some "World!")
          ===  Some "Hello World!"
    }
