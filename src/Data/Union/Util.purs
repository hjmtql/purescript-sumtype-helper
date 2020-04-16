module Data.Union.Util
  ( candidates
  , read
  ) where

import Prelude
import Data.Foldable (findMap)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Bounded (class GenericBottom, genericBottom)
import Data.Generic.Rep.Enum (class GenericEnum, genericSucc)
import Data.Generic.Rep.Show (class GenericShow, genericShow)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Data.Unfoldable1 (unfoldr1)

candidates :: forall a b. Generic a b => GenericBottom b => GenericEnum b => Array a
candidates = unfoldr1 (Tuple <*> genericSucc) genericBottom

read :: forall a b. Generic a b => GenericShow b => GenericBottom b => GenericEnum b => String -> Maybe a
read s = findMap f candidates
  where
  f c
    | s == genericShow c = Just c
    | otherwise = Nothing
