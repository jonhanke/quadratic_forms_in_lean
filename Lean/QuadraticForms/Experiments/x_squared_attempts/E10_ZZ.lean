-- import Mathlib.LinearAlgebra.QuadraticForm.Basic

-- open QuadraticForm

-- def squareForm : QuadraticForm ℤ ℤ :=
--   ofPolar (fun x => x * x)
--     -- Q (a • x) = a * a * Q x
--     (by intros a x; simp; ring)
--     -- polar_add_left
--     (by intros x x' y; simp [polar]; ring)
--     -- polar_smul_left
--     (by intros a x y; simp [polar]; ring)
--DEFINED ELSEWHERE
