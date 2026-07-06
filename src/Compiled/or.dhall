let Compiled = ./Type.dhall

let Report = ./Report/Type.dhall

in  \(A : Type) ->
    \(left : Compiled A) ->
    \(right : Compiled A) ->
      merge
        { Ok = \(leftPayload : { warnings : List Report, value : A }) -> left
        , Err = \(err : Report) -> right
        }
        left
