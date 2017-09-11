```
$ stack ghci
extensible-ast-poc-0.1.0.0: initial-build-steps (lib)
Configuring GHCi with the following packages: extensible-ast-poc
GHCi, version 8.0.2: http://www.haskell.org/ghc/  :? for help
Loaded GHCi configuration from /Users/jacobbarber/.ghci
[1 of 7] Compiling AST.Core         ( /Users/jacobbarber/projects/extensible-ast-poc/src/AST/Core.hs, interpreted )
[2 of 7] Compiling AST.LambdaCalc   ( /Users/jacobbarber/projects/extensible-ast-poc/src/AST/LambdaCalc.hs, interpreted )
[3 of 7] Compiling AST.Primitives   ( /Users/jacobbarber/projects/extensible-ast-poc/src/AST/Primitives.hs, interpreted )
[4 of 7] Compiling AST.Alg.Eval     ( /Users/jacobbarber/projects/extensible-ast-poc/src/AST/Alg/Eval.hs, interpreted )
[5 of 7] Compiling AST.Alg.Simple   ( /Users/jacobbarber/projects/extensible-ast-poc/src/AST/Alg/Simple.hs, interpreted )
[6 of 7] Compiling AST.Alg          ( /Users/jacobbarber/projects/extensible-ast-poc/src/AST/Alg.hs, interpreted )
[7 of 7] Compiling AST              ( /Users/jacobbarber/projects/extensible-ast-poc/src/AST.hs, interpreted )
Ok, modules loaded: AST, AST.Alg, AST.Alg.Eval, AST.Alg.Simple, AST.Core, AST.LambdaCalc, AST.Primitives.
Loaded GHCi configuration from /private/var/folders/5s/7gqq0sgd0_1dsyygvmcsspw80000gn/T/ghci67153/ghci-script
𝝀> import Data.Comp.Multi.Ops
𝝀> import AST
𝝀> case exprAsString(Data.Comp.Multi.Term (Inl (Lam "x" (Data.Comp.Multi.Term(Inr(PrimTerm (Data.Comp.Multi.Term(Inr(PrimInt 5))))))))) of {Evaluated s -> s}
"\120640x.5"
```
