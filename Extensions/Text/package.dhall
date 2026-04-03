let indent
    : Natural -> Text -> Text
    = ./indent.dhall

let prefixEachLine
    : Text -> Text -> Text
    = ./prefixEachLine.dhall

let indentNonEmpty
    : Natural -> Text -> Text
    = ./indentNonEmpty.dhall

let prefixEachNonEmptyLine
    : Text -> Text -> Text
    = ./prefixEachNonEmptyLine.dhall

in  { indent, indentNonEmpty, prefixEachLine, prefixEachNonEmptyLine }
