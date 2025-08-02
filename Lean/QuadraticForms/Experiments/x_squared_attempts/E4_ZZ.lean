--import Mathlib.LinearAlgebra.QuadraticForm.Basic
--DEFINED ELSEWHERE
-- A simple quadratic form representing x² from ℤ to ℤ

-- def squareForm : QuadraticForm ℤ ℤ where
--   toFun := fun x => x * x
--   toFun_smul := by
--     intro a x
--     simp only [smul_eq_mul]
--     ring  -- Should handle (a*x)² = a²*x²
--   exists_companion' := by
--     -- For the square function, the companion is B(x,y) = 2*x*y
--     -- We need to show there exists a bilinear form satisfying the properties

--     -- Define our companion function
--     let B : ℤ → ℤ → ℤ := fun x y => 2 * x * y

--     -- Now we need to prove it's bilinear and satisfies the quadratic form property
--     -- We'll construct a BilinMap from it
--     refine ⟨?_, ?_⟩

--     -- First construct the bilinear map
--     · exact {
--         toFun := B
--         map_add_left := by
--           intro x₁ x₂ y
--           simp [B]
--           ring_nf
--         map_smul_left := by
--           intro r x y
--           simp [B, smul_eq_mul]
--           ring_nf
--         map_add_right := by
--           intro x y₁ y₂
--           simp [B]
--           ring_nf
--         map_smul_right := by
--           intro r x y
--           simp [B, smul_eq_mul]
--           ring_nf
--       }

--     -- Then prove it satisfies (x+y)² = x² + y² + B(x,y)
--     · intro x y
--       simp [B]
--       ring
