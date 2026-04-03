let indentNonEmpty = ./indentNonEmpty.dhall

in  { skipsEmptyLines =
          assert
        :     indentNonEmpty
                2
                ''
                line one

                line two''
          ===  ''
               line one

                 line two''
    }
