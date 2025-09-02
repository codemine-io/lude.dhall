# Copilot Instructions for lude.dhall

## Project Overview

This repository contains **lude.dhall**, a Dhall library that provides extensions to the standard Dhall Prelude for advanced users. The library includes basic typeclasses, extra functions, and additional data structures organized into three main modules:

- **Algebras**: Mathematical typeclasses and algebraic structures (Functor, Monad, Applicative, etc.)
- **Extensions**: Enhanced functionality for standard types (Natural, List, Map, Text, etc.)
- **Structures**: Additional data types and structures (Result, Digit, LatinChar, etc.)

## Code Structure

The project follows a hierarchical package structure where each module has:
- A `package.dhall` file that exports the module's interface
- Individual `.dhall` files for specific functionality
- Test files with `.test.dhall` suffix for validation

### Main Entry Points
- `package.dhall` - Main library interface exporting all modules
- `Prelude.dhall` - Reference to the standard Dhall Prelude (v23.1.0)

## Key References

When working with this codebase, refer to these essential resources:

- **[Dhall Prelude source code](https://github.com/dhall-lang/dhall-lang/tree/v23.1.0/Prelude)** - Dhall standard library
- [Dhall Language Semantics](https://raw.githubusercontent.com/dhall-lang/dhall-lang/6d4c9d6b8812ed3df1f45aabeca3deaf0615ba7b/standard/README.md) - Core language reference
- [Dhall Language ABNF Grammar](https://raw.githubusercontent.com/dhall-lang/dhall-lang/6d4c9d6b8812ed3df1f45aabeca3deaf0615ba7b/standard/dhall.abnf)

## Development Guidelines

### Dhall Syntax and Patterns
- Use type annotations for clarity: `\(x : Natural) -> x + 1`
- Leverage Dhall's strong typing system for safety
- Follow functional programming principles (immutability, pure functions)
- Use record syntax for structured data: `{ field1 = value1, field2 = value2 }`

### Module Organization
- Each algebra/typeclass should define its `Type` in a separate file
- Extensions should enhance existing Prelude functionality, not replace it
- Package files should export clean, consistent interfaces
- Test files should validate both type checking and runtime behavior

### Typeclass Patterns
When implementing algebraic structures:
- Define the typeclass as a function taking the container type: `\(F : Type -> Type) -> { ... }`
- Include required methods as record fields with proper type signatures
- Follow mathematical laws and conventions from category theory
- Provide clear examples in comments or separate example files

### Testing
- Use `.test.dhall` files to validate functionality
- Include both positive and negative test cases
- Test type checking with `dhall type`
- Test evaluation with `dhall` command
- Validate against the standard Prelude behavior where applicable

### Common Dhall Idioms
- Use `let` bindings for complex expressions
- Prefer `assert` for compile-time checks
- Use `merge` for union type handling
- Leverage `forall` for polymorphic functions
- Use `//` for record updates and merging

## Working with Dependencies

This library depends on the Dhall Prelude v23.1.0. When extending functionality:
- Import from `../Prelude.dhall` rather than directly from remote URLs
- Maintain compatibility with the target Prelude version
- Document any assumptions about Prelude behavior

## Code Style

- Use clear, descriptive names that reflect mathematical or functional programming concepts
- Maintain consistent indentation (2 spaces)
- Add type annotations for public interfaces
- Use meaningful variable names (`map`, `fold`, `acc` rather than `f`, `x`, `y`)
- Group related functionality in the same module

## Examples

### Defining a Typeclass
```dhall
-- Algebras/Functor/Type.dhall
\(F : Type -> Type) ->
  { map : forall (A : Type) -> forall (B : Type) -> (A -> B) -> F A -> F B }
```

### Extending Standard Types
```dhall
-- Extensions/Natural/div.dhall
let Prelude = ../../Prelude.dhall
let Natural/subtract = Prelude.Natural.subtract
in \(n : Natural) -> \(d : Natural) -> 
  if Natural/isZero d then None Natural else Some (n / d)
```

### Package Structure
```dhall
-- package.dhall
{ Algebras = ./Algebras/package.dhall
, Extensions = ./Extensions/package.dhall  
, Structures = ./Structures/package.dhall
}
```

This structure ensures the library remains modular, testable, and compatible with the broader Dhall ecosystem.
