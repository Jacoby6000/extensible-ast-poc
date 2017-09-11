{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE TypeInType            #-}
{-# LANGUAGE GADTs                 #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module AST.Primitives (Primitive, PrimExt(..)) where

import AST.LambdaCalc
import AST.Alg.Eval
import Data.Comp.Multi.Derive


data Primitive

data PrimExt a i where
  PrimInt :: Int -> PrimExt a Primitive
  PrimTerm :: a Primitive -> PrimExt a Term

$(derive [makeHFunctor, makeHFoldable, makeHTraversable, makeShowHF, makeEqHF,
          makeOrdHF, smartConstructors, smartAConstructors]
          [''PrimExt])

instance Eval PrimExt String where
  evalAlg (PrimInt n) = Evaluated (show n)
  evalAlg (PrimTerm (Evaluated n)) = Evaluated n

