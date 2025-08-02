-- import Mathlib.Data.Int.Basic
-- import Mathlib.LinearAlgebra.QuadraticForm.Basic

-- open scoped Classical

-- namespace QuadraticForms

-- def squareFormZZ : QuadraticForm ℤ ℤ where
--   toFun := fun x => x * x
--   toFun_smul := by
--     intros a x
--     simp [smul_eq_mul]
--     ring
--   exists_companion' :=
--     ⟨
--       { toFun := LinearMap.mk₂ ℤ
--           (fun x y => 2 * x * y)
--           (by intros; ring) -- add_left
--           (by intros; ring_nf) -- add_right
--           (by intros; ring) -- smul_left
--           (by intros; ring), -- smul_right
--         map_add' := by intros; ring,
--         map_smul' := by intros; ring },
--       by
--         intros x y
--         calc
--           (x + y) * (x + y)
--               = x * x + y * y + 2 * x * y := by ring
--           _ = (x * x) + (y * y) + (2 * x * y) := by ring
--     ⟩

-- end QuadraticForms
