let replaceIfEqual = ./replaceIfEqual.dhall

in  { exactMatch = assert : replaceIfEqual "foo" "bar" "foo" === "bar"
    , noMatch = assert : replaceIfEqual "foo" "bar" "baz" === "baz"
    , substringButNotEqual =
        assert : replaceIfEqual "foo" "bar" "foobar" === "foobar"
    , emptyTargetAndOriginal = assert : replaceIfEqual "" "X" "" === "X"
    , emptyTargetNonEmptyOriginal =
        assert : replaceIfEqual "" "X" "abc" === "abc"
    }
