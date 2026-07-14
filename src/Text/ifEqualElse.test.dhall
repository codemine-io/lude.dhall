let ifEqualElse = ./ifEqualElse.dhall

in  { equalSimple = assert : ifEqualElse "foo" "foo" "EQ" "NEQ" === "EQ"
    , notEqualSimple = assert : ifEqualElse "foo" "bar" "EQ" "NEQ" === "NEQ"
    , bothEmpty = assert : ifEqualElse "" "" "EQ" "NEQ" === "EQ"
    , emptyVsNonEmpty = assert : ifEqualElse "" "abc" "EQ" "NEQ" === "NEQ"
    , nonEmptyVsEmpty = assert : ifEqualElse "abc" "" "EQ" "NEQ" === "NEQ"
    , aIsPrefixOfB = assert : ifEqualElse "ab" "abab" "EQ" "NEQ" === "NEQ"
    , bIsPrefixOfA = assert : ifEqualElse "abab" "ab" "EQ" "NEQ" === "NEQ"
    , bIsARepeated = assert : ifEqualElse "a" "aaa" "EQ" "NEQ" === "NEQ"
    , overlappingTiling = assert : ifEqualElse "aa" "aaa" "EQ" "NEQ" === "NEQ"
    , disjointSubstrings = assert : ifEqualElse "ab" "cd" "EQ" "NEQ" === "NEQ"
    , oneCharEqual = assert : ifEqualElse "a" "a" "EQ" "NEQ" === "EQ"
    , unicodeEqual = assert : ifEqualElse "héllo" "héllo" "EQ" "NEQ" === "EQ"
    , unicodeNotEqual =
        assert : ifEqualElse "héllo" "hello" "EQ" "NEQ" === "NEQ"
    , inputsContainTheInternalPlaceholderCharEqual =
        assert : ifEqualElse "xyx" "xyx" "EQ" "NEQ" === "EQ"
    , inputsContainTheInternalPlaceholderCharNotEqual =
        assert : ifEqualElse "xyx" "xzx" "EQ" "NEQ" === "NEQ"
    , inputIsExactlyThePlaceholderCharEqual =
        assert : ifEqualElse "x" "x" "EQ" "NEQ" === "EQ"
    , inputIsExactlyThePlaceholderCharNotEqual =
        assert : ifEqualElse "x" "y" "EQ" "NEQ" === "NEQ"
    , branchValuesContainThePlaceholderCharEqual =
        assert : ifEqualElse "foo" "foo" "x-EQ-x" "x-NEQ-x" === "x-EQ-x"
    , branchValuesContainThePlaceholderCharNotEqual =
        assert : ifEqualElse "foo" "bar" "x-EQ-x" "x-NEQ-x" === "x-NEQ-x"
    , branchValuesAreEmptyEqual = assert : ifEqualElse "foo" "foo" "" "" === ""
    , branchValuesAreEmptyNotEqual =
        assert : ifEqualElse "foo" "bar" "" "" === ""
    , allArgumentsEmpty = assert : ifEqualElse "" "" "" "" === ""
    }
