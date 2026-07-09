let indent
    : Natural -> Text -> Text
    = ./indent.dhall

let prefixEachLine
    : Text -> Text -> Text
    = ./prefixEachLine.dhall

let indentNonEmpty
    : Natural -> Text -> Text
    = ./indentNonEmpty.dhall

let replaceIfEquals
    : Text -> Text -> Text -> Text
    = ./replaceIfEquals.dhall

let replaceIfOneOf
    : List Text -> Text -> Text -> Text
    = ./replaceIfOneOf.dhall

in  { indent, indentNonEmpty, prefixEachLine, replaceIfEquals, replaceIfOneOf }
