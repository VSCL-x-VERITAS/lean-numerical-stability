import Mathlib.Data.Set.Finite.Basic
import Mathlib.Topology.MetricSpace.Pseudo.Defs
import Mathlib.Data.Fin.Tuple.Basic
import Mathlib.Tactic
import NumStability.HDP.Geometry.Covering

namespace NumStability.HDP.Applications.Coding

/-! Metric entropy and finite-resolution coding.  The code below fixes the
fiber convention used by Chapter 4: points assigned the same codeword must
be at distance at most `ε`.  The bit length is the least natural number for
which such a code exists; when no finite code exists, the definition uses the
explicit default value `0` and callers should retain the existence premise. -/

noncomputable def metricDiameter {α : Type*} [PseudoMetricSpace α] (K : Set α) : ℝ :=
  sSup ((fun p : α × α => dist p.1 p.2) '' (K ×ˢ K))

noncomputable def metricEntropy {α : Type*} [PseudoMetricSpace α]
    (K : Set α) (ε : ℝ) : ℝ :=
  if h : Geometry.Covering.coveringNumber K ε < Cardinal.aleph0 then
    Real.log (Cardinal.toNat (Geometry.Covering.coveringNumber K ε)) /
      Real.log 2
  else 0

def hasFiberDiameterCode {α : Type*} [PseudoMetricSpace α]
    (K : Set α) (ε : ℝ) (b : ℕ) : Prop :=
  ∃ code : K → Fin (2 ^ b),
    ∀ x y : K, code x = code y → dist x y ≤ ε

noncomputable def codingComplexity {α : Type*} [PseudoMetricSpace α]
    (K : Set α) (ε : ℝ) : ℕ :=
  by
    classical
    exact if h : ∃ b : ℕ, hasFiberDiameterCode K ε b then Nat.find h else 0

theorem codingComplexity_spec {α : Type*} [PseudoMetricSpace α]
    (K : Set α) (ε : ℝ)
    (h : ∃ b : ℕ, hasFiberDiameterCode K ε b) :
    hasFiberDiameterCode K ε (codingComplexity K ε) := by
  classical
  simp only [codingComplexity, dif_pos h]
  exact Nat.find_spec h

/-! Binary block-code vocabulary.  Encoding and decoding are kept as fields
of one structure, so the error-correction predicate cannot silently use a
different block length or message alphabet. -/

open NumStability.HDP.Geometry.Covering

structure BinaryErrorCorrectingCode (k n r : ℕ) where
  encode : (Fin k → Bool) → (Fin n → Bool)
  decode : (Fin n → Bool) → (Fin k → Bool)
  correct : ∀ (x : Fin k → Bool) (y : Fin n → Bool),
    hammingDistance y (encode x) ≤ r → decode y = x

def binaryErrorCorrectingCode (k n r : ℕ) :
    Type :=
  BinaryErrorCorrectingCode k n r

def codebook {k n r : ℕ} (C : BinaryErrorCorrectingCode k n r) :
    Set (Fin n → Bool) :=
  Set.range C.encode

def codeword {k n r : ℕ} (C : BinaryErrorCorrectingCode k n r)
    (x : Fin k → Bool) : Fin n → Bool :=
  C.encode x

theorem encode_injective_of_correct
    {k n r : ℕ} (C : BinaryErrorCorrectingCode k n r) :
    Function.Injective C.encode := by
  intro x₁ x₂ h
  have hzero : hammingDistance (C.encode x₁) (C.encode x₁) ≤ r := by
    simp [hammingDistance]
  have hfirst := C.correct x₁ (C.encode x₁) hzero
  have hsecond : C.decode (C.encode x₁) = x₂ := by
    rw [h]
    exact C.correct x₂ (C.encode x₂) (by simp [hammingDistance])
  exact hfirst.symm.trans hsecond

/-! A small, fully finite model of the repetition-code example.  The block is
indexed by a repetition coordinate and a message coordinate; this avoids an
irrelevant flattening convention in the statement. -/

def oddMajority (r : ℕ) (z : Fin (2 * r + 1) → Bool) : Bool :=
  if r < (Finset.univ.filter (fun i => z i = true)).card then true else false

theorem oddMajority_eq_of_errors_le
    (r : ℕ) (z : Fin (2 * r + 1) → Bool) (x : Bool)
    (herrors : (Finset.univ.filter (fun i => z i ≠ x)).card ≤ r) :
    oddMajority r z = x := by
  classical
  cases x with
  | false =>
      have hcard := Finset.card_filter_add_card_filter_not
        (s := (Finset.univ : Finset (Fin (2 * r + 1))))
        (p := fun i => z i = true)
      have htrue : (Finset.univ.filter (fun i => z i = true)).card ≤ r := by
        simpa only [Bool.not_eq_false] using herrors
      simp [oddMajority, Nat.not_lt_of_ge htrue]
  | true =>
      have hcard := Finset.card_filter_add_card_filter_not
        (s := (Finset.univ : Finset (Fin (2 * r + 1))))
        (p := fun i => z i = true)
      have hfalse : (Finset.univ.filter (fun i => z i ≠ true)).card ≤ r := herrors
      have htrue : r < (Finset.univ.filter (fun i => z i = true)).card := by
        have hcard' :
            (Finset.univ.filter (fun i => z i = true)).card +
                (Finset.univ.filter (fun i => z i ≠ true)).card = 2 * r + 1 := by
          simpa [Finset.card_univ] using hcard
        omega
      simp [oddMajority, htrue]

def repetitionEncode (r k : ℕ) (x : Fin k → Bool) :
    Fin (2 * r + 1) × Fin k → Bool :=
  fun p => x p.2

def repetitionDecode (r k : ℕ)
    (y : Fin (2 * r + 1) × Fin k → Bool) : Fin k → Bool :=
  fun i => oddMajority r (fun t => y (t, i))

def repetitionCodeCorrectionStatement : Prop :=
  ∀ {r k : ℕ} (x : Fin k → Bool)
    (y : Fin (2 * r + 1) × Fin k → Bool),
    (∀ i : Fin k,
      (Finset.univ.filter (fun t => y (t, i) ≠ x i)).card ≤ r) →
      repetitionDecode r k y = x

theorem repetitionCodeCorrect : repetitionCodeCorrectionStatement := by
  intro r k x y h
  funext i
  simp only [repetitionDecode]
  exact oddMajority_eq_of_errors_le r (fun t => y (t, i)) (x i) (h i)

theorem repetitionFiberErrors_le_global
    {r k : ℕ} (x : Fin k → Bool)
    (y : Fin (2 * r + 1) × Fin k → Bool) (i : Fin k) :
    (Finset.univ.filter (fun t => y (t, i) ≠ x i)).card ≤
      (Finset.univ.filter (fun p => y p ≠ x p.2)).card := by
  classical
  let s := Finset.univ.filter (fun t : Fin (2 * r + 1) => y (t, i) ≠ x i)
  let g := Finset.univ.filter
    (fun p : Fin (2 * r + 1) × Fin k => y p ≠ x p.2)
  have hinj : Function.Injective (fun t : Fin (2 * r + 1) => (t, i)) := by
    intro a b hab
    exact congrArg Prod.fst hab
  have hsubset : s.image (fun t => (t, i)) ⊆ g := by
    intro p hp
    rcases Finset.mem_image.mp hp with ⟨t, ht, rfl⟩
    simpa [s, g] using ht
  calc
    s.card = (s.image (fun t => (t, i))).card := by
      rw [Finset.card_image_of_injective _ hinj]
    _ ≤ g.card := Finset.card_le_card hsubset

def repetitionCodeGlobalCorrectionStatement : Prop :=
  ∀ {r k : ℕ} (x : Fin k → Bool)
    (y : Fin (2 * r + 1) × Fin k → Bool),
    (Finset.univ.filter (fun p => y p ≠ x p.2)).card ≤ r →
      repetitionDecode r k y = x

theorem repetitionCodeCorrectOfGlobalErrors :
    repetitionCodeGlobalCorrectionStatement := by
  intro r k x y h
  apply repetitionCodeCorrect
  intro i
  exact (repetitionFiberErrors_le_global x y i).trans h

theorem repetitionCodeBlockLength (r k : ℕ) :
    Fintype.card (Fin (2 * r + 1) × Fin k) = (2 * r + 1) * k := by
  simp [Fintype.card_prod]

def repetitionCodeExampleStatement : Prop :=
  repetitionCodeGlobalCorrectionStatement ∧
    ∀ r k : ℕ,
      Fintype.card (Fin (2 * r + 1) × Fin k) = (2 * r + 1) * k

theorem repetitionCodeExample : repetitionCodeExampleStatement := by
  constructor
  · exact repetitionCodeCorrectOfGlobalErrors
  · exact repetitionCodeBlockLength

/-- A finite metric codebook with disjoint closed balls of radius `r`. -/
def PairwiseDisjointClosedBalls {α : Type*} [PseudoMetricSpace α]
    (C : Set α) (r : ℝ) : Prop :=
  ∀ c₁ ∈ C, ∀ c₂ ∈ C, c₁ ≠ c₂ →
    ¬ ∃ y, dist y c₁ ≤ r ∧ dist y c₂ ≤ r

/-- A decoder is nearest-codeword valued when it selects a codeword and no
other codeword is closer to the received point. -/
def IsNearestDecoder {α : Type*} [PseudoMetricSpace α]
    (C : Set α) (D : α → α) : Prop :=
  (∀ y, D y ∈ C) ∧ ∀ y c, c ∈ C → dist y (D y) ≤ dist y c

/-- Within a disjoint decoding ball, a nearest-codeword decoder returns its
unique center.  The finite-codebook hypothesis is explicit for the coding API;
the uniqueness step itself only needs the disjointness and nearest properties. -/
theorem nearestCodewordCorrect {α : Type*} [PseudoMetricSpace α]
    (C : Set α) (hfinite : C.Finite) (r : ℝ) (D : α → α)
    (hdecoder : IsNearestDecoder C D)
    (hballs : PairwiseDisjointClosedBalls C r)
    {x c : α} (hc : c ∈ C) (hxc : dist x c ≤ r) :
    D x = c := by
  by_contra hne
  have hDx : D x ∈ C := hdecoder.1 x
  have hnearest : dist x (D x) ≤ r :=
    (hdecoder.2 x c hc).trans hxc
  exact (hballs (D x) hDx c hc hne) ⟨x, hnearest, hxc⟩

end NumStability.HDP.Applications.Coding

namespace NumStability.HDP.Contract

def hdp_04_hdef_h4_d3_d3 (k n r : ℕ) :
    Type :=
  NumStability.HDP.Applications.Coding.binaryErrorCorrectingCode k n r

noncomputable def hdp_04_hdef_h4_d3_hmetric_hentropy
    {α : Type*} [PseudoMetricSpace α]
    (K : Set α) (ε : ℝ) :
    ℝ :=
  NumStability.HDP.Applications.Coding.metricEntropy K ε

theorem hdp_04_hexample_h4_d3_d2 :
    NumStability.HDP.Applications.Coding.repetitionCodeExampleStatement :=
  NumStability.HDP.Applications.Coding.repetitionCodeExample

theorem hdp_04_hexample_h4_d3_d2_hlength (r k : ℕ) :
    Fintype.card (Fin (2 * r + 1) × Fin k) = (2 * r + 1) * k :=
  NumStability.HDP.Applications.Coding.repetitionCodeBlockLength r k

theorem hdp_04_hproof_h4_d3_d4_hnn {α : Type*} [PseudoMetricSpace α]
    (C : Set α) (hfinite : C.Finite) (r : ℝ) (D : α → α)
    (hdecoder : NumStability.HDP.Applications.Coding.IsNearestDecoder C D)
    (hballs : NumStability.HDP.Applications.Coding.PairwiseDisjointClosedBalls C r)
    {x c : α} (hc : c ∈ C) (hxc : dist x c ≤ r) :
    D x = c :=
  NumStability.HDP.Applications.Coding.nearestCodewordCorrect
    C hfinite r D hdecoder hballs hc hxc

end NumStability.HDP.Contract
