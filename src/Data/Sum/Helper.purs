module Data.Sum.Helper
  ( candidates
  , read
  , write
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

candidates ::
  forall a rep.
  Generic a rep =>
  GenericBottom rep =>
  GenericEnum rep =>
  Array a
candidates = unfoldr1 (Tuple <*> genericSucc) genericBottom

read ::
  forall a rep.
  Generic a rep =>
  GenericShow rep =>
  GenericBottom rep =>
  GenericEnum rep =>
  String -> Maybe a
read s = findMap f candidates
  where
  f c
    | s == write c = Just c
    | otherwise = Nothing

write ::
  forall a rep.
  Generic a rep =>
  GenericShow rep =>
  a -> String
write = genericShow
