{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE TypeInType            #-}
{-# LANGUAGE GADTs                 #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE MultiParamTypeClasses #-}


module AST.LambdaCalc (Symbol, LamCalc(..), Term) where

import AST.Alg.Eval
import Data.Comp.Multi.Derive

data Term

type Symbol = String

data LamCalc a i where
  Lam :: Symbol -> a Term -> LamCalc a Term
  Var :: Symbol -> LamCalc a Term
  App :: a Term -> a Term -> LamCalc a Term

$(derive [makeHFunctor, makeHFoldable, makeHTraversable, makeShowHF, makeEqHF,
          makeOrdHF, smartConstructors, smartAConstructors]
          [''LamCalc])

instance Eval LamCalc String where
  evalAlg (Lam s (Evaluated t)) = Evaluated ("𝝀" ++ s ++ "." ++ t)
  evalAlg (Var s) = Evaluated s
  evalAlg (App (Evaluated l) (Evaluated r)) = Evaluated (l ++ r)
