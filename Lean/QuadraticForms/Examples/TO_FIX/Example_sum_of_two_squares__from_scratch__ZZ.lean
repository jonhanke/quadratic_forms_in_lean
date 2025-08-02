/-
E14_sum_of_two_squares.lean

A quadratic form representing (x,y) ↦ x^2 + y^2
over any commutative ring, built with the Mathlib4 QuadraticMap API.
-/
import Mathlib.LinearAlgebra.QuadraticForm.Basic

open QuadraticMap

/-- The map `(x,y) ↦ x^2 + y^2` as a quadratic form on `R × R`. -/
def sumOfTwoSquares {R : Type*} [CommRing R] : QuadraticForm R (R × R) :=
  ofPolar (N:=R) (M:=R×R)
    (toFun := fun p: R × R => p.1 * p.1 + p.2 * p.2)
    (by
      -- Q (a • (x,y)) = a • Q (x,y)
      intros a p
      rcases p with ⟨x,y⟩
      dsimp
      ring)
    (by
      -- bilinear in first argument of `polar`
      intros p q r
      rcases p with ⟨x1,x2⟩
      rcases q with ⟨y1,y2⟩
      rcases r with ⟨z1,z2⟩
      dsimp [polar]
      -- polar Q (p + q) r = Q(p+q+r) - Q(p+q) - Q r
      ring)
    (by
      -- bilinear in second argument of `polar`
      intros a p q
      rcases p with ⟨x1,x2⟩
      rcases q with ⟨y1,y2⟩
      dsimp [polar]
      ring)

/-- Instantiate `sumOfTwoSquares` at `Int`. -/
def sumOfTwoSquaresInt : QuadraticForm Int (Int × Int) := sumOfTwoSquares

@[simp]
theorem sumOfTwoSquaresInt_toFun (p : Int × Int) :
    sumOfTwoSquaresInt p = p.1 * p.1 + p.2 * p.2 := rfl

/-- A quick `example` showing what `polar` does:  --/
example (p q : Int × Int) :
    polar sumOfTwoSquaresInt p q = 2 * (p.1 * q.1 + p.2 * q.2) := by
  -- `polar Q p q = Q(p+q) - Q p - Q q`
  simp [polar]; ring_nf

-- Some `#eval` tests:
#eval sumOfTwoSquaresInt (0, 0)   -- 0
#eval sumOfTwoSquaresInt (1, 0)   -- 1
#eval sumOfTwoSquaresInt (1, 2)   -- 1 + 4 = 5
#eval sumOfTwoSquaresInt (-3, 4)  -- 9 + 16 = 25
