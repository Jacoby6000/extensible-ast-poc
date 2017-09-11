import AST

main :: IO ()
main = putStrLn (show (exprAsString (Lam "x" (PrimInt 5))))
