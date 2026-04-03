let prefixEachNonEmptyLine
    : Text → Text → Text
    = ./prefixEachNonEmptyLine.dhall

let indentNonEmpty
    : Natural → Text → Text
    = ./indentNonEmpty.dhall

in  { prefixEachNonEmptyLineSkipsEmptyLines =
          assert
        :   prefixEachNonEmptyLine
              ">> "
              ''
              line one

              line two''
          ≡ ''
            line one

            >> line two''
    , indentNonEmptySkipsEmptyLines =
          assert
        :   indentNonEmpty
              2
              ''
              line one

              line two''
          ≡ ''
            line one

              line two''
    }
