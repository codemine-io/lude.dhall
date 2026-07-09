let replaceIfOneOf = ./replaceIfOneOf.dhall

in  { firstCandidateMatches =
        assert : replaceIfOneOf [ "foo", "bar" ] "X" "foo" === "X"
    , secondCandidateMatches =
        assert : replaceIfOneOf [ "foo", "bar" ] "X" "bar" === "X"
    , noCandidateMatches =
        assert : replaceIfOneOf [ "foo", "bar" ] "X" "baz" === "baz"
    , substringDoesNotMatch =
        assert : replaceIfOneOf [ "foo", "bar" ] "X" "foobar" === "foobar"
    , orderMatters =
        assert : replaceIfOneOf [ "foo", "foobar" ] "X" "foo" === "X"
    }
