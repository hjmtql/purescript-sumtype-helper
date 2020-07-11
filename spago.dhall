{ name = "generic-sumtype-helper"
, dependencies =
  [ "assert"
  , "console"
  , "effect"
  , "generics-rep"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
