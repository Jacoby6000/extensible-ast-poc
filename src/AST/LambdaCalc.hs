{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeInType #-}

module AST.LambdaCalc (Symbol, LamCalc, Term) where

import Data.Kind
import AST.Core

data TermNode
type Term = 'NodeType TermNode

type Symbol = String

data family LamCalc (a :: NodeType -> *) (i :: NodeType)

data instance LamCalc a Term
  = Lam Symbol (a Term)
  | Var Symbol
  | App (a Term) (a Term)

