{ name = "spec-reporter-codewars"
, dependencies =
  [ "aff"
  , "bigints"
  , "console"
  , "datetime"
  , "debug"
  , "effect"
  , "exceptions"
  , "maybe"
  , "prelude"
  , "profunctor-lenses"
  , "quickcheck"
  , "rationals"
  , "spec"
  , "spec-discovery"
  , "spec-quickcheck"
  , "strings"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
