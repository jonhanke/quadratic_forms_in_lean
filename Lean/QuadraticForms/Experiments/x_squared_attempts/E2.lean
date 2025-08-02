import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.BilinearForm.Basic
import Mathlib.LinearAlgebra.QuadraticForm.Basic

open scoped Classical

namespace QuadraticForms
#check LinearMap.mk
-- The quadratic form x^2 from ℤ/2ℤ to ℤ/2ℤ
def squareFormChar2 : QuadraticForm (ZMod 2) (ZMod 2) where
  toFun := fun x => x * x
  toFun_smul := by
    intros a x
    simp [smul_eq_mul]
    ring
  exists_companion' := by
   let B:LinearMap.BilinForm (ZMod 2) (ZMod 2) :=
    {
      toFun := fun _ ↦ 0
      map_add' := by simp
      map_smul' := by simp
    }
   use B
   intro x y
   ring
   suffices h: (B x) y = x*y*2 by
    rw [h]; ring
   rfl


end QuadraticForms
