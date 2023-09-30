module Data.Semigroup
  ( class Semigroup
  , append
  , (<>)
  ) where

import Data.Unit (Unit, unit)
import Data.Void (Void, absurd)

-- | The `Semigroup` type class identifies an associative operation on a type.
-- |
-- | Instances are required to satisfy the following law:
-- |
-- | - Associativity: `(x <> y) <> z = x <> (y <> z)`
-- |
-- | One example of a `Semigroup` is `String`, with `(<>)` defined as string
-- | concatenation. Another example is `List a`, with `(<>)` defined as
-- | list concatenation.
-- |
-- | ### Newtypes for Semigroup
-- |
-- | There are two other ways to implement an instance for this type class
-- | regardless of which type is used. These instances can be used by
-- | wrapping the values in one of the two newtypes below:
-- | 1. `First` - Use the first argument every time: `append first _ = first`.
-- | 2. `Last` - Use the last argument every time: `append _ last = last`.
class Semigroup a where
  append :: a -> a -> a

infixr 5 append as <>

instance semigroupString :: Semigroup String where
  append = concat

instance semigroupUnit :: Semigroup Unit where
  append _ _ = unit

instance semigroupVoid :: Semigroup Void where
  append _ = absurd

instance semigroupFn :: Semigroup s' => Semigroup (s -> s') where
  append f g x = f x <> g x

instance semigroupArray :: Semigroup (Array a) where
  append = concat

foreign import concat :: forall a. a -> a -> a
