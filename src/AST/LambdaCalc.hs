{-# LANGUAGE TypeFamilies     #-}
{-# LANGUAGE TypeInType       #-}
{-# LANGUAGE GADTs            #-}
{-# LANGUAGE TemplateHaskell  #-}
{-# LANGUAGE FlexibleContexts #-}


module AST.LambdaCalc (Symbol, LamCalc(..), Term) where

import Data.Kind
import AST.Core
import qualified Data.Comp.Multi
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

