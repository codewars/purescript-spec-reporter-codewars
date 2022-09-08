{ name = "spec-reporter-codewars"
, dependencies =
  [ "aff"
  , "bigints"
  , "console"
  , "datetime"
  , "debug"
  , "effect"
  , "exceptions"
  , "foldable-traversable"
  , "maybe"
  , "prelude"
  , "profunctor-lenses"
  , "quickcheck"
  , "rationals"
  , "spec"
  , "spec-discovery"
  , "spec-quickcheck"
  , "strings"
  , "transformers"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
