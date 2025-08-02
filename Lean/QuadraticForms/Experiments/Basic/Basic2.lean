import Mathlib.LinearAlgebra.QuadraticForm.Basic



namespace QuadraticForms
open LinearMap
-- open QuadraticForm

-- A *quadratic form* over a module M is a map Q : M → R
-- satisfying Q(ax) = a² Q(x) and the polarization identity.

-- We alias Mathlib's definition for convenience.
abbrev QuadForm (R : Type*) (M : Type*) [CommRing R] [AddCommGroup M] [Module R M] :=
  QuadraticForm R M

variable {R : Type*} {M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

namespace QuadForm


--Adding sorries for it to build, largely covered in basic 10

/-- The associated symmetric bilinear form of a quadratic form. -/
def associatedBilinearForm (Q : QuadForm R M) : LinearMap.BilinForm R M :=
  sorry
  --Q.polarization

/-- A quadratic form is called *nondegenerate* if its associated bilinear form is nondegenerate. -/
def Nondegenerate (Q : QuadForm R M) : Prop :=
  sorry
  --BilinForm.Nondegenerate (associatedBilinearForm Q)

/-- A quadratic form is *anisotropic* if Q(x) = 0 implies x = 0. -/
def Anisotropic (Q : QuadForm R M) : Prop :=
  ∀ x : M, Q x = 0 → x = 0

/-- A quadratic form is *isotropic* if there exists a nonzero x with Q(x) = 0. -/
def Isotropic (Q : QuadForm R M) : Prop :=
  ∃ x : M, x ≠ 0 ∧ Q x = 0

end QuadForm

end QuadraticForms



#check QuadraticMap

#check QuadraticForm
