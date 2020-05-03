{ name = "unionutil"
, dependencies =
  [ "assert"
  , "console"
  , "effect"
  , "generics-rep"
  , "psci-support"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
