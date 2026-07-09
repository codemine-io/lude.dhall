let indent
    : Natural -> Text -> Text
    = ./indent.dhall

let prefixEachLine
    : Text -> Text -> Text
    = ./prefixEachLine.dhall

let indentNonEmpty
    : Natural -> Text -> Text
    = ./indentNonEmpty.dhall

let replaceIfEqual
    : Text -> Text -> Text -> Text
    = ./replaceIfEqual.dhall

let replaceIfOneOf
    : List Text -> Text -> Text -> Text
    = ./replaceIfOneOf.dhall

in  { indent, indentNonEmpty, prefixEachLine, replaceIfEqual, replaceIfOneOf }
