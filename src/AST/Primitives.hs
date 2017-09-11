{-# LANGUAGE TypeFamilies     #-}
{-# LANGUAGE TypeInType       #-}
{-# LANGUAGE GADTs            #-}
{-# LANGUAGE TemplateHaskell  #-}
{-# LANGUAGE FlexibleContexts #-}

module AST.Primitives (Primitive, PrimExt(..)) where

import Data.Kind
import AST.LambdaCalc
import AST.Core
import qualified Data.Comp.Multi
import Data.Comp.Multi.Derive


data Primitive

data PrimExt a i where
  PrimInt :: Int -> PrimExt a Primitive
  PrimTerm :: a Primitive -> PrimExt a Term

$(derive [makeHFunctor, makeHFoldable, makeHTraversable, makeShowHF, makeEqHF,
          makeOrdHF, smartConstructors, smartAConstructors]
          [''PrimExt])

