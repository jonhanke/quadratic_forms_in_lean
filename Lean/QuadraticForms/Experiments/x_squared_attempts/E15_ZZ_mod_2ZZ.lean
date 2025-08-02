/-
E14_ZMod2.lean

A simple quadratic form representing x ↦ x^2
over the finite field ZMod 2,
built with the Mathlib4 QuadraticMap API.
-/
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.Data.ZMod.Basic

open QuadraticMap

/-- The map `x ↦ x^2` as a quadratic form over any commutative ring. -/
def squareForm {R : Type*} [CommRing R] : QuadraticForm R R :=
  ofPolar (fun x => x * x)
    (by intros a x; simp; ring)
    (by intros x y z; simp [polar]; ring)
    (by intros a x y; simp [polar]; ring)

/-- Instantiate the form at `ZMod 2`. -/
def squareZMod2 : QuadraticForm (ZMod 2) (ZMod 2) :=
  squareForm

@[simp] theorem squareZMod2_toFun (x : ZMod 2) :
    squareZMod2 x = x * x := rfl

/--
In characteristic 2 the bilinear (polar) form attached to `squareZMod2`
is zero, since
\[
  \mathrm{polar}\,Q\,x\,y
  = (x + y)^2 - x^2 - y^2
  = 2·x·y = 0
\]
in `ZMod 2`.
-/
theorem polar_squareZMod2 (x y : ZMod 2) :
    polar squareZMod2 x y = 0 := by
  -- `simp` uses `polar` unfolded plus the fact `(2 : ZMod 2) = 0`
  simp [polar]
  ring
  have := (ZMod.eq_zero_iff_even (n:=2)).mpr
  specialize this (by simp)
  push_cast at this
  rw [mul_comm,this]
  simp

-- Quick `#eval` tests:
#eval squareZMod2 0   -- 0
#eval squareZMod2 1   -- 1
#eval List.map (fun x => (x, squareZMod2 x)) (List.finRange 2)
  -- [(0, 0), (1, 1)]
