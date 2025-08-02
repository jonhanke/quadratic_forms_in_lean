import Mathlib.LinearAlgebra.QuadraticForm.Basic

open QuadraticMap  -- brings `polar` and `polarBilin` into scope
-- open LinearMap    -- brings `BilinMap` into scope

namespace QuadraticForms

/-- A shorthand for “a quadratic form `Q : M → R` with the usual hypotheses.” -/
abbrev QuadForm (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M] :=
  QuadraticForm R M

namespace QuadForm
variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- The companion bilinear map attached to a quadratic form. -/
def associatedBilinearMap (Q : QuadForm R M) : LinearMap.BilinMap R M R :=
  Q.polarBilin

@[simp]
theorem associatedBilinearMap_apply (Q : QuadForm R M) (x y : M) :
    associatedBilinearMap Q x y = Q (x + y) - Q x - Q y :=
rfl


/-- A quadratic form is called *nondegenerate* if its associated bilinear form is nondegenerate. -/
def Nondegenerate (Q : QuadForm R M) : Prop :=
   (associatedBilinearMap Q).Nondegenerate
  --LinearMap.BilinMap.Nondegenerate (associatedBilinearForm Q)

-- Looked for the associated non-degenerate reference at, but didn't find one:
-- https://leanprover-community.github.io/mathlib4_docs/Mathlib/LinearAlgebra/BilinearMap.html#LinearMap.BilinMap


end QuadForm
end QuadraticForms
