let ifEqualElse = ./ifEqualElse.dhall

in  { equalSimple = assert : ifEqualElse "EQ" "NEQ" "foo" "foo" === "EQ"
    , notEqualSimple = assert : ifEqualElse "EQ" "NEQ" "foo" "bar" === "NEQ"
    , bothEmpty = assert : ifEqualElse "EQ" "NEQ" "" "" === "EQ"
    , emptyVsNonEmpty = assert : ifEqualElse "EQ" "NEQ" "" "abc" === "NEQ"
    , nonEmptyVsEmpty = assert : ifEqualElse "EQ" "NEQ" "abc" "" === "NEQ"
    , candidateIsPrefixOfSubject =
        assert : ifEqualElse "EQ" "NEQ" "ab" "abab" === "NEQ"
    , subjectIsPrefixOfCandidate =
        assert : ifEqualElse "EQ" "NEQ" "abab" "ab" === "NEQ"
    , subjectIsCandidateRepeated =
        assert : ifEqualElse "EQ" "NEQ" "a" "aaa" === "NEQ"
    , overlappingTiling = assert : ifEqualElse "EQ" "NEQ" "aa" "aaa" === "NEQ"
    , disjointSubstrings = assert : ifEqualElse "EQ" "NEQ" "ab" "cd" === "NEQ"
    , oneCharEqual = assert : ifEqualElse "EQ" "NEQ" "a" "a" === "EQ"
    , unicodeEqual = assert : ifEqualElse "EQ" "NEQ" "héllo" "héllo" === "EQ"
    , unicodeNotEqual =
        assert : ifEqualElse "EQ" "NEQ" "héllo" "hello" === "NEQ"
    , inputsContainTheInternalPlaceholderCharEqual =
        assert : ifEqualElse "EQ" "NEQ" "xyx" "xyx" === "EQ"
    , inputsContainTheInternalPlaceholderCharNotEqual =
        assert : ifEqualElse "EQ" "NEQ" "xyx" "xzx" === "NEQ"
    , inputIsExactlyThePlaceholderCharEqual =
        assert : ifEqualElse "EQ" "NEQ" "x" "x" === "EQ"
    , inputIsExactlyThePlaceholderCharNotEqual =
        assert : ifEqualElse "EQ" "NEQ" "x" "y" === "NEQ"
    , branchValuesContainThePlaceholderCharEqual =
        assert : ifEqualElse "x-EQ-x" "x-NEQ-x" "foo" "foo" === "x-EQ-x"
    , branchValuesContainThePlaceholderCharNotEqual =
        assert : ifEqualElse "x-EQ-x" "x-NEQ-x" "foo" "bar" === "x-NEQ-x"
    , branchValuesAreEmptyEqual = assert : ifEqualElse "" "" "foo" "foo" === ""
    , branchValuesAreEmptyNotEqual =
        assert : ifEqualElse "" "" "foo" "bar" === ""
    , allArgumentsEmpty = assert : ifEqualElse "" "" "" "" === ""
    }
