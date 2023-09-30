module Data.Show
  ( class Show
  , show
  ) where

import Data.Unit (Unit)
import Data.Void (Void, absurd)

-- | The `Show` type class represents those types which can be converted into
-- | a human-readable `String` representation.
-- |
-- | While not required, it is recommended that for any expression `x`, the
-- | string `show x` be executable PureScript code which evaluates to the same
-- | value as the expression `x`.
class Show a where
  show :: a -> String

instance showUnit :: Show Unit where
  show _ = "unit"

instance showBoolean :: Show Boolean where
  show true = "true"
  show false = "false"

instance showInt :: Show Int where
  show = showImpl

instance showNumber :: Show Number where
  show = showImpl

instance showChar :: Show Char where
  show = showImpl

instance showString :: Show String where
  show = showImpl

instance showArray :: Show a => Show (Array a) where
  show = showArrayImpl show

instance showVoid :: Show Void where
  show = absurd

foreign import showImpl :: forall a. a -> String
foreign import showArrayImpl :: forall a. (a -> String) -> Array a -> String
