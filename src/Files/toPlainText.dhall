let Prelude = ../Deps/Prelude.dhall

let Self = ./Type.dhall

let File = ../File/package.dhall

in    Prelude.Text.concatMapSep
        ''

        ---
        ''
        File.Type
        File.toPlainText
    : Self -> Text
