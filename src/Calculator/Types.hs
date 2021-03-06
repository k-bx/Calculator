module Calculator.Types (Expr(..), Token(..), Assoc(..)) where

import Data.List (intercalate)

data Token = TNumber Double
           | TLPar
           | TRPar
           | TIdent String
           | TOp String
           | TComma
           | TEnd
           deriving (Show, Eq, Ord)

data Assoc = L | R deriving (Show, Eq, Ord)

data Expr = Number Double
          | Asgn String Expr
          | UDF String [String] Expr
          | UDO String Int Assoc Expr
          | OpCall String Expr Expr
          | UMinus Expr
          | Par Expr
          | FunCall String [Expr]
          | Id String
          deriving Eq

instance Show Expr where
  show = showExpr 0

showExpr :: Int -> Expr -> String
showExpr n e =
  let suf = case e of
        (UDF n a e)       -> n ++ "("++ intercalate ", " a ++ ")" ++ "\n" ++ s e
        (UDO n p a e)     -> n ++ "("++ show a ++ ", " ++ show p ++ ")" ++ "\n" ++ s e
        (Asgn i e)        -> "Assign " ++ i ++ "\n" ++ s e
        (Number x )       -> "Number " ++ show x
        (Par e)           -> "Par \n" ++ s e
        (UMinus e)        -> "UMinus \n" ++ s e
        (OpCall op e1 e2) -> "OpCall " ++ op ++ "\n" ++ s e1 ++ "\n" ++ s e2
        (FunCall n e)     -> "FunCall " ++ n ++ "\n" ++ intercalate "\n" (map s e)
        (Id s)            -> "Id " ++ s
  in replicate n ' ' ++ suf
  where s = showExpr (n+1)