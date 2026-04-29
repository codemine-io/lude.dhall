let indent
    : Natural -> Text -> Text
    = ./indent.dhall

let prefixEachLine
    : Text -> Text -> Text
    = ./prefixEachLine.dhall

let indentNonEmpty
    : Natural -> Text -> Text
    = ./indentNonEmpty.dhall

in  { indent, indentNonEmpty, prefixEachLine }
