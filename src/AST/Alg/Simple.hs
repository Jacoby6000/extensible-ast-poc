{-# LANGUAGE GADTs                 #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE TypeOperators         #-}

module AST.Alg.Simple (exprAsString, Expr) where

import Data.Comp.Multi hiding (Term)
import qualified Data.Comp.Multi
import AST.Alg.Eval
import AST.LambdaCalc
import AST.Primitives

instance Eval LamCalc String where
  evalAlg (Lam s (Evaluated t)) = Evaluated ("𝝀" ++ s ++ "." ++ t)
  evalAlg (Var s) = Evaluated s
  evalAlg (App (Evaluated l) (Evaluated r)) = Evaluated (l ++ r)

instance Eval PrimExt String where
  evalAlg (PrimInt n) = Evaluated (show n)
  evalAlg (PrimTerm (Evaluated n)) = Evaluated n

type Expr = LamCalc :+: PrimExt

exprAsString :: Data.Comp.Multi.Term Expr i -> Evaluated String i
exprAsString term = eval(term)
