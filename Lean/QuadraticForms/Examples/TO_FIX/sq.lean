--import Mathlib.RingTheory.QuadraticForm.Basic



/-
Attribution:
Made with lots of help from Eric Wieser -- thank you! =)
-/



import Mathlib

noncomputable section

-- Define the quadratic map over the integers ZZ
def q : QuadraticForm ℤ ℤ :=
  QuadraticMap.sq

-- Evaluate the quadratic form at three numbers
def eval_at (a b c : ℤ) : ℤ × ℤ × ℤ :=
  (q a, q b, q c)

-- Example evaluation
#eval eval_at 2 5 (-3)



-- Define the quadratic map over the integers ZZ
def q2 : QuadraticForm (ZMod 2) (ZMod 2) :=
  QuadraticMap.sq



-- Evaluate the quadratic form at three numbers
def eval2_at (a b c : ZMod 2) : ZMod 2 × ZMod 2 × ZMod 2 :=
  (q2 a, q2 b, q2 c)

-- Example evaluation
#eval eval2_at 2 5 (-3)

def b' : Basis (Fin 1) (ZMod 2) (ZMod 2) := .singleton _ _
#eval QuadraticMap.polar q2 1 1
example : LinearMap.toMatrix₂ b b (q2.toBilin b) = !![sorry] := by
  ext  i j
  rw [Subsingleton.elim i 0, Subsingleton.elim j 0]
  simp
  rw [@QuadraticMap.toBilin_apply]
  simp [q2]
  sorry

#check 1+2+3


/- Check the type of a matrix -/
#check !![1, 2; 3, 4]

example := !![1, 2; 3, 4]


/- Some other ways to evaluate a matrix -/
#eval Matrix.of ![![1, 2], ![3, 4]]
#eval Matrix.of fun (i : Fin 2) (j : Fin 2) => ([[1, 2], [3, 4]][i]!)[j]!
#eval Matrix.of fun (i : Fin 2) (j : Fin 2) => ([[1, 2], [3, 4]][i]!)[j]!


/- Evaluate the double of a quadratic forms  -/
#eval (q2 + q2) (1 : ZMod 2)
#eval (q2 + q2) (0 : ZMod 2)
#eval (q2 + q2) 1



/-
#eval QuadraticMap.sq (3 : ZMod 5)
-/

/- Evaluate a quadratic map -/
#eval QuadraticMap.sq (R := ZMod 5) (3 : ZMod 5)


-- #eval QuadraticMap.sq (3 : ZMod 5)


-- Checking the bilinear form associated to x^2
#check QuadraticMap.toQuadraticMap_toBilin q (Basis.singleton _ _ )


-- Checking the bilinear form associated to x^2
example :=
  QuadraticMap.toQuadraticMap_toBilin q (Basis.singleton (Fin 1) _ )

-- almost.. need to print
-- #eval q.toBilin (Basis.singleton (Fin 1) _ )



#check (Basis.singleton (Fin 1) (ZMod 2) )

noncomputable section


-- Define the ring ZZ/2ZZ
abbrev ZMod2 := ZMod 2

section

section Single

variable [Zero M] {a a' : α}

/-- `single a b` is the finitely supported function with value `b` at `a` and zero otherwise. -/
def Finsupp.single' [DecidableEq α] [DecidableEq M] (a : α) (b : M) : α →₀ M where
  support :=
    if b = 0 then ∅ else {a}
  toFun :=
    Pi.single a b
  mem_support_toFun a' := sorry

end Single

-- -- Define the basis using Basis.singleton
-- abbrev b'' : Basis (Fin 1) ZMod2 ZMod2 :=
--   Basis.singleton (Fin 1) (ZMod 2)



-- -- Attempt to print a polar matrix created for the quadratic form x^2
-- -- #eval LinearMap.toMatrix₂ (q.toBilin (Basis.singleton (Fin 1) _ ) )




-- -- Define the ring ZZ/2ZZ
-- abbrev ZMod2' := ZMod 2

-- -- Define the basis using Basis.singleton
-- def b' : Basis (Fin 1) ZMod2 ZMod2 :=
--   Basis.singleton (Fin.mk 0 Nat.one) (1 : ZMod2)

-- -- Example usage: Get the basis element
-- #eval b' (Fin.mk 0 Nat.one)

-- -- Example usage: Check if it's a basis (it is by construction with Basis.singleton)
-- #eval b'.isBasis




-- -- Define the ring ZZ/2ZZ
-- abbrev ZMod2 := ZMod 2

-- -- Define the basis using Basis.singleton
-- def b : Basis (Fin 1) ZMod2 ZMod2 :=
--   Basis.singleton (Fin.mk 0 1) (1 : ZMod2)

-- -- Example usage: Get the basis element
-- #eval b (Fin.mk 0 1)

-- -- Example usage: Check if it's a basis (it is by construction with Basis.singleton)
-- #eval b.isBasis





-- Define the ring ZZ/2ZZ
--abbrev ZMod2 := ZMod 2

-- Define the basis using Basis.singleton
def b : Basis (Fin 1) ZMod2 ZMod2 :=
  Basis.singleton (Fin 1) (ZMod2)

-- Example usage: Get the basis element
#check (b (Fin.mk 0 (by linarith)))

-- Example usage: Check if it's a basis (it is by construction with Basis.singleton)
--#eval b.isBasis









-- Attempt to print a polar matrix created for the quadratic form x^2
--#check LinearMap.toMatrix₂ (q.toBilin (Basis.singleton (Fin 1) _ ) )






-- { } is the same as using _ for a ( ) argument
