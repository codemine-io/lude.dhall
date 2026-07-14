let indent
    : Natural -> Text -> Text
    = ./indent.dhall

let prefixEachLine
    : Text -> Text -> Text
    = ./prefixEachLine.dhall

let indentNonEmpty
    : Natural -> Text -> Text
    = ./indentNonEmpty.dhall

let ifEqualElse
    : Text -> Text -> Text -> Text -> Text
    = ./ifEqualElse.dhall

let replaceIfEqual
    : Text -> Text -> Text -> Text
    = ./replaceIfEqual.dhall

let replaceIfOneOf
    : List Text -> Text -> Text -> Text
    = ./replaceIfOneOf.dhall

in  { ifEqualElse
    , indent
    , indentNonEmpty
    , prefixEachLine
    , replaceIfEqual
    , replaceIfOneOf
    }
