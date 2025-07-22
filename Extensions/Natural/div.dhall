-- Safe division of Natural numbers.
let Prelude = ../../Prelude.dhall

let quotient =
      https://github.com/jcaesar/dhall-div/releases/download/1/quotient.dhall
        sha256:d6a994f4b431081e877a0beac02f5dcc98f3ea5b027986114487578056cb3db9

in  \(a : Natural) ->
    \(b : Natural) ->
      if Prelude.Natural.isZero b then None Natural else Some (quotient a b).q
