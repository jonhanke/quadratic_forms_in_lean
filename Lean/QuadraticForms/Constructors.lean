
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Algebra.CharP.Defs


/- Constructors -/

-- Construct a quadratic form from a quadratic polynomial
open Polynomial

variable {R: Type u} [CommSemiring R] (P: R[X]) (hP: (P.natDegree = 2)) {hChar: ringChar R ≠ 2}
[Neg R]

structure QuadraticPolynomial where
 carrier := R
 poly := P
 hdeg2 : poly.degree = 2
 hChar : (ringChar R ≠ 2)

#check QuadraticForm.associated_isSymm
#check P.eval
#check P.eval_eq_sum_range


#check Polynomial.eval_add
#check Finset.sum_eq_add_of_mem
#check Finset.mul_sum
#check P.C_comp
#check P.degree_pow_le
#check P.natDegree_pos_of_eraseLead_ne_zero
#check P.eraseLead
#check P.eval_eq_sum_range
#check P.natDegree_eraseLead
#check Monic.coeff_natDegree
#check monic_mul_leadingCoeff_inv
#check monic_of_natDegree_le_of_coeff_eq_one
#check Polynomial.eraseLead_natDegree_lt_or_eraseLead_eq_zero


noncomputable section






def QuadraticForm_of_poly: (P:R[X]) → (hP: (P.natDegree = 2)) → (hChar: ringChar R ≠ 2)
  → Monic P → QuadraticForm R R := by
    intro Qp hP hChar hMonic
    apply QuadraticMap.mk (R:=R) (N:=R) (toFun := fun a:R ↦ ((Qp.eval a) + ((Qp.eraseLead).eval (-a))))
    · intro a x
      simp
      rw [←pow_two]
      rw [eval_eq_sum_range (a*x),eval_eq_sum_range x]
      rw [eval_eq_sum_range (-(a*x)),eval_eq_sum_range (-x)]
      simp [hP]
      ring
      have:= Qp.natDegree_eraseLead (by sorry)
      simp [this]
      --simp only [show (1 +(Qp.natDegree -1) = Qp.natDegree) by rw [sub_eq_add_neg Qp.natDegree] ]
      sorry
    · sorry




-- Construct a quadratic form from an upper-triangular matrix

-- Construct a diagonal quadratic form from a list of numbers in R

-- Construct the sum of n squares form in R
