{-# LANGUAGE TypeInType #-}

module AST.Core (NodeType) where

import Data.Kind

newtype NodeType = NodeType Type
