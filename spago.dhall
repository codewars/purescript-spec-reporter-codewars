{ name = "spec-reporter-codewars"
, dependencies =
  [ "aff"
  , "datetime"
  , "effect"
  , "exceptions"
  , "foldable-traversable"
  , "maybe"
  , "prelude"
  , "quickcheck"
  , "spec"
  , "spec-discovery"
  , "spec-quickcheck"
  , "strings"
  , "transformers"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
