module Test.Main where

import Prelude
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Maybe (Maybe(..))
import Data.Union.Util (candidates, read)
import Effect (Effect)
import Test.Assert (assertEqual)

data Color
  = Red
  | Yellow
  | Blue

derive instance eqColor :: Eq Color

derive instance genericColor :: Generic Color _

instance showColor :: Show Color where
  show = genericShow

main :: Effect Unit
main = do
  assertEqual
    { actual: candidates
    , expected: [ Red, Yellow, Blue ]
    }
  assertEqual
    { actual: read "Red"
    , expected: Just Red
    }
  assertEqual
    { actual: read "Yellow"
    , expected: Just Yellow
    }
  assertEqual
    { actual: read "Blue"
    , expected: Just Blue
    }
  assertEqual
    { actual: read "red" :: Maybe Color
    , expected: Nothing
    }
