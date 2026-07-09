let replaceIfEquals = ./replaceIfEquals.dhall

in  { exactMatch = assert : replaceIfEquals "foo" "bar" "foo" === "bar"
    , noMatch = assert : replaceIfEquals "foo" "bar" "baz" === "baz"
    , substringButNotEqual =
        assert : replaceIfEquals "foo" "bar" "foobar" === "foobar"
    , emptyTargetAndOriginal = assert : replaceIfEquals "" "X" "" === "X"
    , emptyTargetNonEmptyOriginal =
        assert : replaceIfEquals "" "X" "abc" === "abc"
    }
