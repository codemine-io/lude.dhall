let Prelude = ../../Prelude.dhall

let Algebras = ../../Algebras/package.dhall

let Arbitrary = Algebras.Arbitrary

let NaturalExtensions = ../Natural/package.dhall

in  \(Element : Type) ->
    \(elementInstance : Arbitrary.Type Element) ->
      let generate
          : Natural -> Natural -> List Element
          = \(iteration : Natural) ->
            \(depth : Natural) ->
              let size = NaturalExtensions.div iteration depth

              let size = Prelude.Optional.default Natural 0 size

              in  Prelude.List.generate
                    size
                    Element
                    ( \(index : Natural) ->
                        elementInstance.generate
                          (size + index)
                          (Prelude.Natural.subtract 1 depth)
                    )

      in  { generate } : Arbitrary.Type (List Element)
