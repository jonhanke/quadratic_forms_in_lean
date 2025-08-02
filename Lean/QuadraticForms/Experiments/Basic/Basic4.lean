import Mathlib.LinearAlgebra.QuadraticForm.Basic

open QuadraticMap  -- brings `polar` and `polarBilin` into scope
open LinearMap    -- brings `BilinMap` into scope

namespace QuadraticForms

/-- A shorthand for “a quadratic form `Q : M → R` with the usual hypotheses.” -/
abbrev QuadForm (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M] :=
  QuadraticForm R M

namespace QuadForm

-- now R, M, and their instances are fixed for everything below:
variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- The raw companion bilinear map attached to a quadratic form. -/
def associatedBilinearMap (Q : QuadForm R M) : LinearMap.BilinMap R M R :=
  Q.polarBilin

@[simp]
theorem associatedBilinearMap_apply (Q : QuadForm R M) (x y : M) :
    associatedBilinearMap Q x y = Q (x + y) - Q x - Q y :=
rfl

end QuadForm
end QuadraticForms
