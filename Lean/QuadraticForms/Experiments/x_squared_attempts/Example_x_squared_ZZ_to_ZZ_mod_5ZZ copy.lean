/-
E14_ZMod5.lean

A simple quadratic form representing x ↦ x^2
over the finite field ℤ/5ℤ,
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





variable {R : Type u} [CommRing R]

#check smul_eq_mul


/-- The quadratic map `x ↦ x^2`. -/
def squareMap : QuadraticMap R R R :=
  ofPolar (R:=R) (M:=R) (N:=R)
    (fun x => x * x)                            -- Q x = x^2
    (by intros a x; simp;ring)   -- Q (a•x) = a^2 • Q x
    (by intros x y z; simp [polar]; ring)       -- bilinear in the first arg
    (by intros a x y; simp [polar]; ring)       -- bilinear in the second arg

@[simp] lemma squareMap_apply (x : R) : squareMap.toFun x = x * x := rfl


--ALREADY DEFINED

-- /-- The quadratic map `x ↦ x^2`, with companion `B(x,y)=2*x*y`. -/
-- def squareMap : QuadraticMap R R R where
--   toFun x := x * x
--   toFun_smul a x := by
--     -- Q (a • x) = (a*x)*(a*x) = (a*a) • (x*x)
--     simp [smul_eq_mul]; ring

--   exists_companion' :=
--     ⟨ -- here is your bilinear form packaged as a BilinMap:
--       mk (fun x y => (2 : R) * x * y)
--          (by intros x x' y; simp [add_mul];      ring)  -- add in left
--          (by intros a x y; simp [smul_eq_mul];  ring)  -- smul in left
--          (by intros x y y'; simp [mul_add];      ring)  -- add in right
--          (by intros a x y; simp [smul_eq_mul];  ring), -- smul in right
--       -- now prove (x+y)^2 = x^2 + y^2 + B(x,y):
--       by intros x y; simp [add_mul, mul_add]; ring ⟩

-- @[simp] lemma squareMap_apply (x : R) : squareMap.toFun x = x * x := rfl




-- /-- The quadratic map `x ↦ x^2`, by hand. -/
-- def squareMap₂ : QuadraticMap R R R where
--   toFun x := x * x
--   toFun_smul a x := by simp [smul_eq_mul]; ring
--   exists_companion' :=
--     ⟨ { toFun := fun x y => (2 : R) * x * y,
--         map_add_left  := by intros x x' y; simp [add_mul]; ring,
--         map_smul_left := by intros a x y; simp [smul_eq_mul]; ring,
--         map_add_right := by intros x y y'; simp [mul_add]; ring,
--         map_smul_right:= by intros a x y; simp [smul_eq_mul]; ring },
--       by intros x y; simp [add_mul, mul_add]; ring ⟩



-- /-- The quadratic map `x ↦ x^2`. -/
-- def squareMap : QuadraticMap R R R :=
--   ofPolar
--     (fun x y => x * y + y * x)        -- companion bilinear form
--     (by intros a x; simp [smul_eq_mul]; ring)      -- Q (a•x) = a² • Q x
--     (by intros x y z; simp; ring)                -- bilinear in first arg
--     (by intros a x y; simp [smul_eq_mul]; ring)   -- bilinear in second arg




-- variable {R : Type u} [CommSemiring R]



-- /-- The quadratic map `x ↦ x^2`. -/
-- def squareMap : QuadraticMap R R R where
--   toFun x := x * x
--   toFun_smul a x := by
--     -- Q (a • x) = (a * x) * (a * x) = (a * a) • (x * x)
--     simp [smul_eq_mul]; ring
--   exists_companion' :=
--     ⟨fun x y => (2 : R) * x * y, by
--       -- (x + y)^2 = x^2 + y^2 + 2*x*y
--       intro x y
--       simp [add_mul, mul_add, smul_eq_mul]; ring⟩

-- @[simp] lemma squareMap_apply (x : R) : squareMap.toFun x = x * x := rfl



-- /-- The quadratic map `x ↦ x^2`. -/
-- def squareMap : QuadraticMap R R R where
--   toFun x := x * x
--   toFun_smul a x := by
--     -- Q (a • x) = (a • x) * (a • x) = (a * x) * (a * x) = a^2 * (x * x)
--     simp [smul_eq_mul]; ring
--   exists_companion' :=
--     ⟨fun x y => (2 : R) * x * y, by
--       -- (x + y)^2 = x^2 + y^2 + 2*x*y
--       intro x y
--       simp [add_mul, mul_add, smul_eq_mul]; ring⟩






/- The map `x ↦ x^2` from ZZ to ZZ/5ZZ -/
-- def squareQuadraticMapZZ_to_ZZ5 {R : Type*}


/-- Instantiate the form at `ZMod 5`. -/
def squareZMod5 : QuadraticForm (ZMod 5) (ZMod 5) := squareForm

/--
Because `CoeFun` for `QuadraticMap` is definitional,
`(squareZMod5 : ZMod 5 → ZMod 5) x` literally reduces to `x*x`.
This `@[simp]` theorem gives that reduction to `simp`.
-/
@[simp] theorem squareZMod5_toFun (x : ZMod 5) : squareZMod5 x = x * x := rfl

/-- Now `polar squareZMod5 x y` unfolds to `(x+y)^2 - x^2 - y^2 = 2*x*y` in `ZMod 5`. -/
example (x y : ZMod 5) : polar squareZMod5 x y = 2 * x * y := by
  simp [polar]; ring_nf

-- Test the evaluation on some simple values
#eval squareZMod5 0  -- Output: 0
#eval squareZMod5 1  -- Output: 1
#eval squareZMod5 2  -- Output: 4
#eval squareZMod5 3  -- Output: 4
#eval squareZMod5 4  -- Output: 1
#eval squareZMod5 (-1 : ZMod 5)  -- Output: 1

-- THIS FAILS
-- #eval squareZMod5 -1  -- Output: 1

-- Evaluate all input / output values
#eval List.map (fun x : ZMod 5 => (x, squareZMod5 x)) (List.finRange 5)
