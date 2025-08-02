--Seems to be a copy of Basic10.lean, keeping for now.

-- import Mathlib.LinearAlgebra.QuadraticForm.Basic

-- open QuadraticMap  -- brings `polar` and `polarBilin` into scope
-- open LinearMap    -- brings `BilinMap` into scope

-- namespace QuadraticForms

-- /-- A shorthand for “a quadratic form `Q : M → R` with the usual hypotheses.” -/
-- abbrev QuadForm (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M] :=
--   QuadraticForm R M

-- namespace QuadForm
-- variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]



-- /-- The companion bilinear map attached to a quadratic form. -/
-- def associatedBilinearMap (Q : QuadForm R M) : LinearMap.BilinMap R M R :=
--   Q.polarBilin

-- @[simp]
-- theorem associatedBilinearMap_apply (Q : QuadForm R M) (x y : M) :
--     associatedBilinearMap Q x y = Q (x + y) - Q x - Q y :=
-- rfl

-- /--  The symmetric bilinear form attached to `Q`.  -/
-- def associatedBilinForm (Q : QuadForm R M) : LinearMap.BilinForm R M :=
--   Q.polarBilin  -- a `BilinMap R M R` coerces to `BilinForm R M`

-- /--  `Q` is nondegenerate iff its associated bilinear form is.  -/
-- def Nondegenerate (Q : QuadForm R M) : Prop :=
--   Q.associatedBilinForm.Nondegenerate

-- -- Looked for the associated non-degenerate reference at, but didn't find one:
-- -- https://leanprover-community.github.io/mathlib4_docs/Mathlib/LinearAlgebra/BilinearMap.html#LinearMap.BilinMap



-- /-- A quadratic form is *anisotropic* if Q(x) = 0 implies x = 0. -/
-- def Anisotropic (Q : QuadForm R M) : Prop :=
--   ∀ x : M, Q x = 0 → x = 0

-- /-- A quadratic form is *isotropic* if there exists a nonzero x with Q(x) = 0. -/
-- def Isotropic (Q : QuadForm R M) : Prop :=
--   ∃ x : M, x ≠ 0 ∧ Q x = 0



-- /-- The scalar multiple of a quadratic form. -/
-- def smul (a : R) (Q : QuadForm R M) : QuadForm R M :=
--   a • Q

-- /-- Define and Alias for scalar multuplication --/
-- notation:70 a " •ₛ " Q => smul a Q





-- /-- The “orthogonal sum” of two forms on the *same* module, living on `M × M`. -/
-- def orthogonalSum (Q₁ Q₂ : QuadForm R M) : QuadForm R (M × M) :=
--   -- either use the built-in `prod`
--   Q₁.prod Q₂
--   -- or spell it out directly as
--   -- Q₁.comp (fst : M × M →ₗ[R] M) + Q₂.comp (snd : M × M →ₗ[R] M)

-- @[simp]
-- theorem orthogonalSum_apply (Q₁ Q₂ : QuadForm R M) (x y : M) :
--     orthogonalSum Q₁ Q₂ (x, y) = Q₁ x + Q₂ y :=
-- -- `prod_apply` is already a simp lemma in Mathlib4,
-- -- or if you wrote it by hand it’s just `rfl`.
-- QuadForm.prod_apply _ _ _ _




-- /-- The orthogonal sum of two quadratic forms on `M`, living on `M × M`. -/
-- def orthogonalSum (Q₁ Q₂ : QuadForm R M) : QuadForm R (M × M) :=
--   Q₁.comp (Prod.fst : (M × M) →ₗ[R] M) +
--   Q₂.comp (Prod.snd : (M × M) →ₗ[R] M)

-- @[simp]
-- theorem orthogonalSum_apply (Q₁ Q₂ : QuadForm R M) (x y : M) :
--   orthogonalSum Q₁ Q₂ (x, y) = Q₁ x + Q₂ y :=
-- rfl

-- /-- Scalar multiplication distributes over orthogonal sums. -/
-- example (a : R) (Q₁ Q₂ : QuadForm R M) :
--     a •ₛ (orthogonalSum Q₁ Q₂) = orthogonalSum (a •ₛ Q₁) (a •ₛ Q₂) := by
--   -- because `•ₛ` is just `•` on `QuadraticMap` and `comp`/`+` commute with `•`
--   show (a • Q₁.comp Prod.fst + a • Q₂.comp Prod.snd : QuadraticMap R (M × M) R)
--       = (a • Q₁).comp Prod.fst + (a • Q₂).comp Prod.snd
--   by simp




-- /- Lennas -/

-- /-- If Q is anisotropic, it has no nontrivial isotropic vectors. --/
-- example {Q : QuadForm R M} (h : Anisotropic Q) : ¬ Isotropic Q :=
--   by
--     rintro ⟨x, hx, hQ⟩
--     exact hx (h x hQ)



-- variable (Q₁ Q₂ : QuadForm R M) (a : R)

-- /-- Scalar multiplication distributes over orthogonal sums. --/
-- example : a •ₛ (orthogonalSum Q₁ Q₂) = orthogonalSum (a •ₛ Q₁) (a •ₛ Q₂) := by
--     rfl  -- This follows by definition in Mathlib


-- end QuadForm
-- end QuadraticForms
