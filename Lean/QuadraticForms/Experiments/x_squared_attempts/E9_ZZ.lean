-- import Mathlib.LinearAlgebra.QuadraticForm.Basic
-- DEFINED ELSEWHERE ALREADY
-- -- /-- A simple quadratic form representing x² from ℤ to ℤ -/
-- -- def squareForm : QuadraticForm ℤ ℤ where
-- --   toFun := fun x => x * x
-- --   toFun_smul := by
-- --     intro a x
-- --     simp only [smul_eq_mul]
-- --     ring
-- --   exists_companion' := by
-- --     -- We need to construct a BilinMap explicitly

-- --     -- First let's create a simple bilinear form function
-- --     let bfun : ℤ → ℤ → ℤ := fun x y => 2 * x * y

-- --     -- Now we need to properly construct the BilinMap
-- --     let companion : LinearMap.BilinMap ℤ ℤ ℤ := LinearMap.BilinMap.mk bfun
-- --       (by -- Prove linearity in first argument
-- --         intro a x₁ x₂ y
-- --         simp [bfun]
-- --         ring)
-- --       (by -- Prove linearity in second argument
-- --         intro a x y₁ y₂
-- --         simp [bfun]
-- --         ring)

-- --     -- Use our constructed bilinear map
-- --     exists companion

-- --     -- Prove it satisfies the quadratic form property
-- --     intro x y
-- --     simp [companion, bfun]
-- --     calc (x + y) * (x + y) = x * x + x * y + y * x + y * y := by ring
-- --                          _ = x * x + y * y + 2 * x * y := by
-- --                             rw [mul_comm y x]
-- --                             ring
