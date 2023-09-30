module Data.Ring
  ( class Ring
  , sub
  , negate
  , (-)
  , module Data.Semiring
  ) where

import Data.Semiring (class Semiring, add, mul, one, zero, (*), (+))
import Data.Unit (Unit, unit)

class Semiring a <= Ring a where
  sub :: a -> a -> a

infixl 6 sub as -

instance ringInt :: Ring Int where
  sub = sub_

instance ringNumber :: Ring Number where
  sub = sub_

instance ringUnit :: Ring Unit where
  sub _ _ = unit

instance ringFn :: Ring b => Ring (a -> b) where
  sub f g x = f x - g x

-- | `negate x` can be used as a shorthand for `zero - x`.
negate :: forall a. Ring a => a -> a
negate a = zero - a

foreign import sub_ :: forall a. a -> a -> a
