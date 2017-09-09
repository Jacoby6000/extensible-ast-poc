{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeInType #-}

module AST.Primitives (Primitive, PrimitiveExt) where

import Data.Kind
import AST.LambdaCalc
import AST.Core

data PrimitiveNode
type Primitive = 'NodeType PrimitiveNode

data family PrimitiveExt (a :: NodeType -> *) (i :: NodeType)

data instance PrimitiveExt a Primitive
  = PrimInt Int
  | PrimStr String

data instance PrimitiveExt a Term
  = PrimTerm (a Primitive)


