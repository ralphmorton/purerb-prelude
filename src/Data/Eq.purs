module Data.Eq
  ( class Eq
  , eq
  , (==)
  , notEq
  , (/=)
  , class Eq1
  , eq1
  , notEq1
  ) where

import Data.Unit (Unit)
import Data.Void (Void)

class Eq a where
  eq :: a -> a -> Boolean

infix 4 eq as ==

-- | `notEq` tests whether one value is _not equal_ to another. Shorthand for
-- | `not (eq x y)`.
notEq :: forall a. Eq a => a -> a -> Boolean
notEq x y = (x == y) == false

infix 4 notEq as /=

instance eqBoolean :: Eq Boolean where
  eq = eqImpl

instance eqInt :: Eq Int where
  eq = eqImpl

instance eqNumber :: Eq Number where
  eq = eqImpl

instance eqChar :: Eq Char where
  eq = eqImpl

instance eqString :: Eq String where
  eq = eqImpl

instance eqUnit :: Eq Unit where
  eq _ _ = true

instance eqVoid :: Eq Void where
  eq _ _ = true

instance eqArray :: Eq a => Eq (Array a) where
  eq = eqArrayImpl eq

foreign import eqImpl :: forall a. a -> a -> Boolean

foreign import eqArrayImpl :: forall a. (a -> a -> Boolean) -> Array a -> Array a -> Boolean

-- | The `Eq1` type class represents type constructors with decidable equality.
class Eq1 f where
  eq1 :: forall a. Eq a => f a -> f a -> Boolean

instance eq1Array :: Eq1 Array where
  eq1 = eq

notEq1 :: forall f a. Eq1 f => Eq a => f a -> f a -> Boolean
notEq1 x y = (x `eq1` y) == false
