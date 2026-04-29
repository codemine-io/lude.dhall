--| Adaptation of https://github.com/winitzki/dhall-lang/blob/903d2acca1e3ea2c657f84b03e219f3039059ea2/Prelude/Natural/divMod.dhall which removes dependent types.
--
-- `divmod b x` computes x / b via integer division with remainder. The result is `{ div = ..., mod = ... }`. It is guaranteed that `x === b * div + mod` and that `b` is nonzero.
let Natural/lessThan =
        missing
          sha256:3381b66749290769badf8855d8a3f4af62e8de52d1364d838a9d1e20c94fa70c
      ? https://raw.githubusercontent.com/dhall-lang/dhall-lang/v23.1.0/Prelude/Natural/lessThan.dhall

let Result = { div : Natural, mod : Natural }

let Optional/default =
        missing
          sha256:5bd665b0d6605c374b3c4a7e2e2bd3b9c1e39323d41441149ed5e30d86e889ad
      ? https://raw.githubusercontent.com/dhall-lang/dhall-lang/v23.1.0/Prelude/Optional/default.dhall

let powersUntil
    -- `powersUntil b p q` will create a list [1, b, b^2, b^3, ..., b^k] where k is such that q * b ^ k <= p < q * b ^ (k + 1) .
    : Natural → Natural → Natural → List Natural
    = λ(b : Natural) →
      λ(p : Natural) →
      λ(q : Natural) →
        let appendNewPower =
              λ(prev : List Natural) →
                let nextPower =
                      b * Optional/default Natural 0 (List/last Natural prev)

                in  if    Natural/lessThan p (nextPower * q)
                    then  prev
                    else  prev # [ nextPower ]

        in  Natural/fold p (List Natural) appendNewPower [ 1 ]

let egyptianDivMod
    : Natural → Natural → Result
    =
      -- This algorithm is uniformly fast for computing x / y even for large x and/or y.
      λ(x : Natural) →
      λ(y : Natural) →
        let powers2 = powersUntil 2 x y

        let update
            : Natural → Result → Result
            = λ(power2 : Natural) →
              λ(prev : Result) →
                if    Natural/lessThan prev.mod (power2 * y)
                then  prev
                else  { div = prev.div + power2
                      , mod = Natural/subtract (power2 * y) prev.mod
                      }

        in  List/fold Natural powers2 Result update { div = 0, mod = x }

let divMod
    : Natural → Natural → Result
    = egyptianDivMod

let _ = assert : divMod 0 1 ≡ { div = 0, mod = 0 }

let _ = assert : divMod 10 1 ≡ { div = 10, mod = 0 }

let _ = assert : divMod 10 10 ≡ { div = 1, mod = 0 }

let _ = assert : divMod 10 11 ≡ { div = 0, mod = 10 }

let _ = assert : divMod 10 2 ≡ { div = 5, mod = 0 }

let _ = assert : divMod 11 2 ≡ { div = 5, mod = 1 }

let _ = assert : divMod 1000000000000 121 ≡ { div = 8264462809, mod = 111 }

let _ =
      assert : divMod 1000000000000 12121212121 ≡ { div = 82, mod = 6060606078 }

let safeDivMod
    : Natural → Natural → Optional Result
    = λ(x : Natural) →
      λ(y : Natural) →
        if Natural/isZero y then None Result else Some (divMod x y)

let _ = assert : safeDivMod 11 2 ≡ Some { div = 5, mod = 1 }

in  safeDivMod
