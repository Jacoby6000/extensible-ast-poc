{-# LANGUAGE TypeFamilies #-}

module AST.Primitives (Primitive, PrimitiveExt) where

import Data.Kind
import AST.LambdaCalc

data Primitive

data family PrimitiveExt (a :: * -> *) (i :: *)

data instance PrimitiveExt a Primitive
  = PrimInt Int
  | PrimStr String

data instance PrimitiveExt a Term
  = PrimTerm (a Primitive)


