import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.LinearAlgebra.BilinearForm.Basic  -- bring in `BilinForm.Nondegenerate`

open QuadraticMap  -- for `polarBilin`
open LinearMap.BilinForm  -- for `Nondegenerate`

namespace QuadraticForms

abbrev QuadForm (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M] :=
  QuadraticForm R M

namespace QuadForm

variable [CommRing R] [AddCommGroup M] [Module R M]

/--  The symmetric bilinear form attached to `Q`.  -/
def associatedBilinForm (Q : QuadForm R M) : LinearMap.BilinForm R M :=
  Q.polarBilin  -- a `BilinMap R M R` coerces to `BilinForm R M`

/--  `Q` is nondegenerate iff its associated bilinear form is.  -/
def Nondegenerate (Q : QuadForm R M) : Prop :=
  Q.associatedBilinForm.Nondegenerate

end QuadForm
end QuadraticForms
