{-# LANGUAGE TypeOperators  #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}

-- all of this bummed off of the compdata Multi Examples.

module AST.Alg.Eval (Eval(..), Evaluated(..), eval) where

import Data.Comp.Multi hiding (Term)
import qualified Data.Comp.Multi (Term)
import Data.Comp.Multi.Derive

newtype Evaluated o i = Evaluated o

class Eval f o where
  evalAlg :: Alg f (Evaluated o)

$(derive [liftSum] [''Eval])

eval :: (HFunctor f, Eval f o) => Data.Comp.Multi.Term f i -> Evaluated o i
eval = cata evalAlg

