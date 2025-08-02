-- import Mathlib.Data.ZMod.Basic
-- import Mathlib.LinearAlgebra.BilinearForm.Basic
-- import Mathlib.LinearAlgebra.QuadraticForm.Basic

-- open scoped Classical

-- namespace QuadraticForms

-- -- The quadratic form x^2 from ℤ/2ℤ to ℤ/2ℤ
-- def squareFormChar2 : QuadraticForm (ZMod 2) (ZMod 2) where
--   toFun := fun x => x * x
--   toFun_smul := by
--     intros a x
--     simp [smul_eq_mul]
--     ring
--   exists_companion' :=
--     ⟨
--       { toFun := LinearMap.mk₂ (ZMod 2)
--           (fun _ _ => 0)
--           (by intros; ring) -- add_left
--           (by intros; ring) -- add_right
--           (by intros; simp [smul_zero]) -- smul_left
--           (by intros; simp [smul_zero]), -- smul_right
--         map_add' := by intros; simp, -- key change here
--         map_smul' := by intros; simp }, -- and here
--       by
--         intros x y
--         simp [smul_eq_mul]
--         ring
--     ⟩

-- end QuadraticForms
