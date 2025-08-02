import Mathlib.LinearAlgebra.QuadraticForm.Basic
-- if you really want the `BilinForm` structure you can also do:
-- import Mathlib.LinearAlgebra.BilinearForm.Basic

open QuadraticMap  -- brings `polarBilin` into scope
open LinearMap    -- brings `BilinMap` (and `BilinForm` if you imported its file) into scope

namespace QuadraticForms

abbrev QuadForm (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M] :=
  QuadraticForm R M

namespace QuadForm

variable (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M]
/-- The raw companion bilinear map attached to a quadratic form. -/
def associatedBilinearMap (Q : QuadForm R M) : LinearMap.BilinMap R M R :=
  Q.polarBilin

/-- If you prefer to see it as a `BilinForm` rather than a `LinearMap.BilinMap`,
    just swap the return type to `BilinForm R M` (and import `BilinearForm.Basic`). -/
def associatedBilinearForm (Q : QuadForm R M) : LinearMap.BilinMap R M R :=
  Q.polarBilin

@[simp]
theorem associatedBilinearMap_apply (Q : QuadForm R M) (x y : M) :
    (associatedBilinearMap R M Q) x y = Q (x + y) - Q x - Q y :=
by
  -- `Q.polarBilin` was built out of your `ofPolar` companion hypothesis,
  -- but the raw `polar` function is definitionally `fun x y => Q (x+y)-Q x -Q y`.
  rfl

end QuadForm
end QuadraticForms
