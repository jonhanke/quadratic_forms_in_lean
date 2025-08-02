import Lake
open Lake DSL

package leanQuadraticForms

require mathlib from git "https://github.com/leanprover-community/mathlib4" @ "master"

@[default_target]
lean_lib QuadraticForms where
  srcDir := "Lean"  -- <--- 🔥 This tells lake where source files live
  globs := #[.submodules `QuadraticForms]

require checkdecls from git "https://github.com/PatrickMassot/checkdecls.git"

meta if get_config? env = some "dev" then
require «doc-gen4» from git
  "https://github.com/leanprover/doc-gen4" @ "main"