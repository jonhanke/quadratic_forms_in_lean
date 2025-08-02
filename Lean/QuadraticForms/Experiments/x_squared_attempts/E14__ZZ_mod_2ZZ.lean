/-
E14_ZMod2.lean

A simple quadratic form representing x ↦ x^2
over the finite field ℤ/2ℤ,
built with the Mathlib4 QuadraticMap API.
-/
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.Data.ZMod.Basic

open QuadraticMap

/-- The map `x ↦ x^2` as a quadratic form over any commutative ring. -/
def squareForm {R : Type*} [CommRing R] : QuadraticForm R R :=
  ofPolar (fun x => x * x)
    (by intros a x; simp; ring)                  -- Q (a • x) = a • Q x
    (by intros x y z; simp [polar]; ring)         -- bilinear in first arg
    (by intros a x y; simp [polar]; ring)         -- bilinear in second arg

/-- Instantiate the form at `ZMod 2`. -/
def squareZMod2 : QuadraticForm (ZMod 2) (ZMod 2) := squareForm

/--
Because `CoeFun` for `QuadraticMap` is definitional,
`(squareZMod2 : ZMod 2 → ZMod 2) x` literally reduces to `x*x`.
This `@[simp]` theorem gives that reduction to `simp`.
-/
@[simp] theorem squareZMod2_toFun (x : ZMod 2) : squareZMod2 x = x * x := rfl

#check ZMod.eq_zero_iff_even

/-- Now `polar squareZMod2 x y` unfolds to `(x+y)^2 - x^2 - y^2 = 2*x*y` in `ZMod 2`. -/
example (x y : ZMod 2) : polar squareZMod2 x y = 0 := by
  simp [polar]
  ring_nf
  have := (ZMod.eq_zero_iff_even (n:=2)).mpr
  specialize this (by simp)
  push_cast at this
  rw [mul_comm,this]
  simp
  -- In characteristic 2, 2*x*y = 0

-- Test the evaluation on some simple values
#eval squareZMod2 0  -- Output: 0
#eval squareZMod2 1  -- Output: 1
#eval squareZMod2 (-1 : ZMod 2)  -- Output: 1

-- Evaluate all input / output values
#eval List.map (fun x : ZMod 2 => (x, squareZMod2 x)) (List.finRange 2)
