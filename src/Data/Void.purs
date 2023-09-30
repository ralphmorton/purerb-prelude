module Data.Void (Void, absurd) where

newtype Void = Void Void

absurd :: forall a. Void -> a
absurd a = spin a
  where
  spin (Void b) = spin b
