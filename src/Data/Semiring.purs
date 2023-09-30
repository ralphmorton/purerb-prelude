module Data.Semiring(
  class Semiring,
  add,
  (+),
  zero,
  mul,
  (*),
  one
) where

import Data.Unit (Unit, unit)

class Semiring a where
  add :: a -> a -> a
  zero :: a
  mul :: a -> a -> a
  one :: a

infixl 6 add as +
infixl 7 mul as *

instance semiringInt :: Semiring Int where
  add = add_
  zero = 0
  mul = mul_
  one = 1

instance semiringNumber :: Semiring Number where
  add = add_
  zero = 0.0
  mul = mul_
  one = 1.0

instance semiringFn :: Semiring b => Semiring (a -> b) where
  add f g x = f x + g x
  zero = \_ -> zero
  mul f g x = f x * g x
  one = \_ -> one

instance semiringUnit :: Semiring Unit where
  add _ _ = unit
  zero = unit
  mul _ _ = unit
  one = unit

foreign import add_ :: forall a. a -> a -> a
foreign import mul_ :: forall a. a -> a -> a
