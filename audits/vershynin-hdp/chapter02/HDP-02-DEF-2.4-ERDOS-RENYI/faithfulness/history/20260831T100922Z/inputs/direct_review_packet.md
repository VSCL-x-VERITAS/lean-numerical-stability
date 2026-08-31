# Declaration dossier for HDP-02-DEF-2.4-ERDOS-RENYI

This dossier describes the theorem statement only. Its proof is excluded.
Interpret every dependency from its supplied declaration; names are not definitions.

## Proof-free source declaration

```lean
theorem hdp_02_hdef_herdos_hrenyi_edge_pattern_probability
    (n : ℕ) (p : Set.Icc (0 : ℝ) 1)
    (E T : Finset (Sym2 (Fin n)))
    (hE : (E : Set (Sym2 (Fin n))) ⊆ Sym2.diagSetᶜ) (hT : T ⊆ E) :
    (hdp_02_hdef_herdos_hrenyi n p).graphLaw
        (NumStability.HDP.Scalar.IndependentSums.Chernoff.graphEdgesExactFinsetEvent E T) =
      (unitInterval.toNNReal p : ℝ≥0∞) ^ T.card *
        (unitInterval.toNNReal (unitInterval.symm p) : ℝ≥0∞) ^
          (E.card - T.card)
```

## Elaborated target type

```lean
∀ (n : Nat) (p : (Set.Icc 0 1).Elem) (E T : Finset (Sym2 (Fin n))),
  Set.instHasSubset.Subset (Finset.instSetLike.coe E) (Set.instCompl.compl Sym2.diagSet) →
    Finset.instHasSubset.Subset T E →
      Eq
        (MeasureTheory.Measure.instFunLike.coe (NumStability.HDP.Contract.hdp_02_hdef_herdos_hrenyi n p).graphLaw
          (NumStability.HDP.Scalar.IndependentSums.Chernoff.graphEdgesExactFinsetEvent E T))
        (instHMul.hMul (instHPow.hPow (ENNReal.ofNNReal (unitInterval.toNNReal p)) T.card)
          (instHPow.hPow (ENNReal.ofNNReal (unitInterval.toNNReal (unitInterval.symm p)))
            (instHSub.hSub E.card T.card)))
```

## Fully explicit elaborated target type

```lean
∀ (n : Nat)
  (p :
    @Set.Elem.{0} Real
      (@Set.Icc.{0} Real Real.instPreorder (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
        (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne))))
  (E T : Finset.{0} (Sym2.{0} (Fin n)))
  (hE :
    @HasSubset.Subset.{0} (Set.{0} (Sym2.{0} (Fin n))) (@Set.instHasSubset.{0} (Sym2.{0} (Fin n)))
      (@SetLike.coe.{0, 0} (Finset.{0} (Sym2.{0} (Fin n))) (Sym2.{0} (Fin n))
        (@Finset.instSetLike.{0} (Sym2.{0} (Fin n))) E)
      (@Compl.compl.{0} (Set.{0} (Sym2.{0} (Fin n))) (@Set.instCompl.{0} (Sym2.{0} (Fin n)))
        (@Sym2.diagSet.{0} (Fin n))))
  (hT : @HasSubset.Subset.{0} (Finset.{0} (Sym2.{0} (Fin n))) (@Finset.instHasSubset.{0} (Sym2.{0} (Fin n))) T E),
  @Eq.{1} ENNReal
    (@DFunLike.coe.{1, 1, 1}
      (@MeasureTheory.Measure.{0} (SimpleGraph.{0} (Fin n)) (@SimpleGraph.instMeasurableSpace.{0} (Fin n)))
      (Set.{0} (SimpleGraph.{0} (Fin n))) (fun (x : Set.{0} (SimpleGraph.{0} (Fin n))) => ENNReal)
      (@MeasureTheory.Measure.instFunLike.{0} (SimpleGraph.{0} (Fin n)) (@SimpleGraph.instMeasurableSpace.{0} (Fin n)))
      (@NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData.graphLaw n p
        (NumStability.HDP.Contract.hdp_02_hdef_herdos_hrenyi n p))
      (@NumStability.HDP.Scalar.IndependentSums.Chernoff.graphEdgesExactFinsetEvent.{0} (Fin n) E T))
    (@HMul.hMul.{0, 0, 0} ENNReal ENNReal ENNReal
      (@instHMul.{0} ENNReal
        (@Distrib.toMul.{0} ENNReal
          (@NonUnitalNonAssocSemiring.toDistrib.{0} ENNReal
            (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} ENNReal
              (@Semiring.toNonAssocSemiring.{0} ENNReal
                (@CommSemiring.toSemiring.{0} ENNReal ENNReal.instCommSemiring))))))
      (@HPow.hPow.{0, 0, 0} ENNReal Nat ENNReal
        (@instHPow.{0, 0} ENNReal Nat
          (@Monoid.toNatPow.{0} ENNReal
            (@MonoidWithZero.toMonoid.{0} ENNReal
              (@Semiring.toMonoidWithZero.{0} ENNReal
                (@CommSemiring.toSemiring.{0} ENNReal ENNReal.instCommSemiring)))))
        (ENNReal.ofNNReal (unitInterval.toNNReal p)) (@Finset.card.{0} (Sym2.{0} (Fin n)) T))
      (@HPow.hPow.{0, 0, 0} ENNReal Nat ENNReal
        (@instHPow.{0, 0} ENNReal Nat
          (@Monoid.toNatPow.{0} ENNReal
            (@MonoidWithZero.toMonoid.{0} ENNReal
              (@Semiring.toMonoidWithZero.{0} ENNReal
                (@CommSemiring.toSemiring.{0} ENNReal ENNReal.instCommSemiring)))))
        (ENNReal.ofNNReal (unitInterval.toNNReal (unitInterval.symm p)))
        (@HSub.hSub.{0, 0, 0} Nat Nat Nat (@instHSub.{0} Nat instSubNat) (@Finset.card.{0} (Sym2.{0} (Fin n)) E)
          (@Finset.card.{0} (Sym2.{0} (Fin n)) T))))
```

## Local import graph

- `AuditTarget` imports: `NumStability.HDP.Scalar.IndependentSums.Chernoff`
- `NumStability.HDP.Scalar.Preliminaries` imports: `Mathlib.Probability.Moments.Variance`, `Mathlib.Probability.CDF`, `Mathlib.MeasureTheory.Function.LpSpace.Basic`, `Mathlib.MeasureTheory.Function.LpSpace.Complete`, `Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm`, `Mathlib.MeasureTheory.Function.LpSeminorm.Indicator`, `Mathlib.Probability.UniformOn`, `Mathlib.Analysis.Convex.Integral`, `Mathlib.Analysis.Convex.Continuous`, `Mathlib.MeasureTheory.Integral.Bochner.Set`, `Mathlib.MeasureTheory.Integral.Lebesgue.Markov`, `Mathlib.MeasureTheory.Integral.Layercake`, `Mathlib.MeasureTheory.Measure.Lebesgue.Integral`, `Mathlib.Probability.Distributions.Cauchy`, `Mathlib.Analysis.SpecialFunctions.NonIntegrable`, `Mathlib.Analysis.SpecialFunctions.Pow.Integral`, `Mathlib.Tactic`
- `NumStability.HDP.Scalar.IndependentSums.Hoeffding` imports: `Mathlib.Probability.Independence.Integration`, `Mathlib.Probability.Moments.Basic`, `Mathlib.Probability.Moments.SubGaussian`, `Mathlib.Probability.ProbabilityMassFunction.Constructions`, `Mathlib.Probability.ProbabilityMassFunction.Integrals`, `Mathlib.Analysis.SpecialFunctions.Trigonometric.Series`, `Mathlib.Analysis.SpecialFunctions.ImproperIntegrals`, `Mathlib.Tactic`, `NumStability.HDP.Scalar.Preliminaries`
- `NumStability.HDP.Scalar.IndependentSums.GraphDegreeLaw` imports: `Mathlib.Probability.Combinatorics.BinomialRandomGraph.Defs`, `Mathlib.Combinatorics.SimpleGraph.Finite`, `Mathlib.Probability.HasLaw`, `Mathlib.Probability.ProbabilityMassFunction.Binomial`, `Mathlib.Tactic`
- `NumStability.HDP.Scalar.IndependentSums.Chernoff` imports: `Mathlib.Probability.Combinatorics.BinomialRandomGraph.Defs`, `Mathlib.Combinatorics.SimpleGraph.Finite`, `Mathlib.Probability.ProbabilityMassFunction.Integrals`, `Mathlib.Probability.HasLaw`, `Mathlib.Probability.Independence.Integration`, `Mathlib.Probability.Distributions.Poisson`, `Mathlib.MeasureTheory.Integral.Lebesgue.Countable`, `Mathlib.Analysis.Asymptotics.AsymptoticEquivalent`, `Mathlib.Analysis.SpecialFunctions.Stirling`, `Mathlib.Analysis.Complex.ExponentialBounds`, `Mathlib.Tactic`, `NumStability.HDP.Scalar.IndependentSums.Hoeffding`, `NumStability.HDP.Scalar.IndependentSums.GraphDegreeLaw`

## Semantic dependency inventory

`local` declarations are followed recursively through types and bodies. `external-frontier` declarations mark the one-level library trust boundary.

### D001: `NumStability.HDP.Contract.hdp_02_hdef_herdos_hrenyi`

- Role: `local`
- Owner module: `AuditTarget`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8628f65869be312265f62e2c6b0c2f499137b9f2e77ffdeab777569b8a8e571f`

Type:

```lean
(n : Nat) → (p : (Set.Icc 0 1).Elem) → NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData n p
```

Fully explicit type:

```lean
(n : Nat) →
  (p :
      @Set.Elem.{0} Real
        (@Set.Icc.{0} Real Real.instPreorder (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
          (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))) →
    NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData n p
```

Definition body (one-level semantic boundary):

```lean
fun n p => NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p
```

### D002: `NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData.graphLaw`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Chernoff`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `5aab30157ea453be8d27b91764e4832d22b6024b0fc27176504cfeb63c3617de`

Type:

```lean
{n : Nat} →
  {p : (Set.Icc 0 1).Elem} →
    NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData n p →
      MeasureTheory.Measure (SimpleGraph (Fin n))
```

Fully explicit type:

```lean
{n : Nat} →
  {p :
      @Set.Elem.{0} Real
        (@Set.Icc.{0} Real Real.instPreorder (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
          (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))} →
    (self : NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData n p) →
      @MeasureTheory.Measure.{0} (SimpleGraph.{0} (Fin n)) (@SimpleGraph.instMeasurableSpace.{0} (Fin n))
```

Definition body (one-level semantic boundary):

```lean
fun n p self => self.1
```

### D003: `NumStability.HDP.Scalar.IndependentSums.Chernoff.graphEdgesExactFinsetEvent`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.GraphDegreeLaw`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `6a487c666f07e69c3e84fc897475543ac0e93ad89eac5074730cc1550acf85cf`

Type:

```lean
{V : Type u_1} → Finset (Sym2 V) → Finset (Sym2 V) → Set (SimpleGraph V)
```

Fully explicit type:

```lean
{V : Type u_1} → (E T : Finset.{u_1} (Sym2.{u_1} V)) → Set.{u_1} (SimpleGraph.{u_1} V)
```

Definition body (one-level semantic boundary):

```lean
fun {V} E T =>
  setOf fun G =>
    ∀ (e : Sym2 V),
      SetLike.instMembership.mem E e → Iff (Set.instMembership.mem G.edgeSet e) (SetLike.instMembership.mem T e)
```

### D004: `NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Chernoff`
- Declaration kind: `inductive`
- Distance from target type: `2`
- Semantic SHA-256: `578d1aed125505ca062adacfcd7a5ffbd1e047e1fbf2e82d5c6b29454460559f`

Type:

```lean
Nat → (Set.Icc 0 1).Elem → Type
```

Fully explicit type:

```lean
(n : Nat) →
  (p :
      @Set.Elem.{0} Real
        (@Set.Icc.{0} Real Real.instPreorder (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
          (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))) →
    Type
```

### D005: `NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Chernoff`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `89accc6373784447d3dcd081264b197c6b48ad76deb30f5d604aae5d8f652625`

Type:

```lean
(n : Nat) → (p : (Set.Icc 0 1).Elem) → NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData n p
```

Fully explicit type:

```lean
(n : Nat) →
  (p :
      @Set.Elem.{0} Real
        (@Set.Icc.{0} Real Real.instPreorder (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
          (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))) →
    NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData n p
```

Definition body (one-level semantic boundary):

```lean
fun n p => { graphLaw := SimpleGraph.binomialRandom (Fin n) p, degree := fun v G => G.degree v }
```

### D006: `NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData.mk`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Chernoff`
- Declaration kind: `constructor`
- Distance from target type: `3`
- Semantic SHA-256: `3c50fa3a2c0b228b433c11798f2f1561a07c63e50e6e5c862d05b22b541bf4a0`

Type:

```lean
{n : Nat} →
  {p : (Set.Icc 0 1).Elem} →
    MeasureTheory.Measure (SimpleGraph (Fin n)) →
      (Fin n → SimpleGraph (Fin n) → Nat) → NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData n p
```

Fully explicit type:

```lean
{n : Nat} →
  {p :
      @Set.Elem.{0} Real
        (@Set.Icc.{0} Real Real.instPreorder (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
          (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))} →
    (graphLaw : @MeasureTheory.Measure.{0} (SimpleGraph.{0} (Fin n)) (@SimpleGraph.instMeasurableSpace.{0} (Fin n))) →
      (degree : Fin n → SimpleGraph.{0} (Fin n) → Nat) →
        NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData n p
```

### D007: `NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel._proof_1`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Chernoff`
- Declaration kind: `theorem`
- Distance from target type: `3`
- Semantic SHA-256: `d164441942be509603bbc71e69ee9b346370aa21399f4a6aafedc9888f9f6ebb`

Type:

```lean
∀ (n : Nat) (v : Fin n) (G : SimpleGraph (Fin n)), Finite (Subtype fun x => Set.instMembership.mem (G.neighborSet v) x)
```

Fully explicit type:

```lean
∀ (n : Nat) (v : Fin n) (G : SimpleGraph.{0} (Fin n)),
  Finite.{1}
    (@Subtype.{1} (Fin n) fun (x : Fin n) =>
      @Membership.mem.{0, 0} (Fin n) (Set.{0} (Fin n)) (@Set.instMembership.{0} (Fin n))
        (@SimpleGraph.neighborSet.{0} (Fin n) G v) x)
```

### D008: `CommSemiring.toSemiring`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `bcda2e78d6b7602d359ab954baf5c3bd0f6b2503b3ec9a72e1a21a48b9d18d89`

Type:

```lean
{R : Type u} → [self : CommSemiring R] → Semiring R
```

Fully explicit type:

```lean
{R : Type u} → [self : CommSemiring.{u} R] → Semiring.{u} R
```

Definition body (one-level semantic boundary):

```lean
fun R [self : CommSemiring R] => self.1
```

### D009: `Compl.compl`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Notation`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `97ac957a633d20ee7ada7d24db7ac913936b4f266b46e20a4d98c97d24b5d0f3`

Type:

```lean
{α : Type u_1} → [self : Compl α] → α → α
```

Fully explicit type:

```lean
{α : Type u_1} → [self : Compl.{u_1} α] → α → α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : Compl α] => self.1
```

### D010: `DFunLike.coe`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.FunLike.Basic`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `9db5c150b3c86d10b50e19602d0c0af9e5012dfe5f13b0d7b57925729f2478f0`

Type:

```lean
{F : Sort u_1} → {α : outParam (Sort u_2)} → {β : outParam (α → Sort u_3)} → [self : DFunLike F α β] → F → (a : α) → β a
```

Fully explicit type:

```lean
{F : Sort u_1} →
  {α : outParam.{u_2 + 1} (Sort u_2)} →
    {β : outParam.{max u_2 (u_3 + 1)} (α → Sort u_3)} → [self : DFunLike.{u_1, u_2, u_3} F α β] → F → (a : α) → β a
```

Definition body (one-level semantic boundary):

```lean
fun F {α} {β} [self : DFunLike F α β] => self.1
```

### D011: `Distrib.toMul`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `1d05ddf657021fb5615c5054f46b4863aec4ca856ca48fbb75add25e1f0fe06f`

Type:

```lean
{R : Type u_1} → [self : Distrib R] → Mul R
```

Fully explicit type:

```lean
{R : Type u_1} → [self : Distrib.{u_1} R] → Mul.{u_1} R
```

Definition body (one-level semantic boundary):

```lean
fun R [self : Distrib R] => self.1
```

### D012: `ENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5b8f4d61311ebccecf6a54ceca44191d394e0108c8596129a77f03c15a7e457f`

Type:

```lean
Type
```

Fully explicit type:

```lean
Type
```

Definition body (one-level semantic boundary):

```lean
WithTop NNReal
```

### D013: `ENNReal.instCommSemiring`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `0641453ddd31d2b679655d5c2b4fc302ecf7b88a815424716c8ac4e525cf14b8`

Type:

```lean
CommSemiring ENNReal
```

Fully explicit type:

```lean
CommSemiring.{0} ENNReal
```

Definition body (one-level semantic boundary):

```lean
inferInstanceAs (CommSemiring (WithTop NNReal))
```

### D014: `ENNReal.ofNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `e9a7a03a1ff1a27277d98d3c565782e24ef8e1e6caf44b4e987e13cb00ef978f`

Type:

```lean
NNReal → ENNReal
```

Fully explicit type:

```lean
NNReal → ENNReal
```

Definition body (one-level semantic boundary):

```lean
WithTop.some
```

### D015: `Eq`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `63e9afa87e04d13393a2fe09e8e76489d96be3982734b4b40a52fc6ebea863d7`

Type:

```lean
{α : Sort u_1} → α → α → Prop
```

Fully explicit type:

```lean
{α : Sort u_1} → α → α → Prop
```

### D016: `Fin`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `59788903be5da78a88e4dc3844df38effdaabdfa82bb364602790d2271da7fda`

Type:

```lean
Nat → Type
```

Fully explicit type:

```lean
(n : Nat) → Type
```

### D017: `Finset`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Finset.Defs`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `56a880af39b5f8e2e55560abe97637994d5830a3a7ed0adaa46c44b8c3eaf831`

Type:

```lean
Type u_4 → Type u_4
```

Fully explicit type:

```lean
(α : Type u_4) → Type u_4
```

### D018: `Finset.card`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Finset.Card`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `53f5c09b147215efcd8844f0936a32a05334a5f290114ef711ebb1615f4504e4`

Type:

```lean
{α : Type u_1} → Finset α → Nat
```

Fully explicit type:

```lean
{α : Type u_1} → (s : Finset.{u_1} α) → Nat
```

Definition body (one-level semantic boundary):

```lean
fun {α} s => s.val.card
```

### D019: `Finset.instHasSubset`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Finset.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `69a612877b6112e479175009ff3380b7a42d8480050906edd4996240c8b175a0`

Type:

```lean
{α : Type u_1} → HasSubset (Finset α)
```

Fully explicit type:

```lean
{α : Type u_1} → HasSubset.{u_1} (Finset.{u_1} α)
```

Definition body (one-level semantic boundary):

```lean
fun {α} => { Subset := fun s t => ∀ ⦃a : α⦄, SetLike.instMembership.mem s a → SetLike.instMembership.mem t a }
```

### D020: `Finset.instSetLike`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Finset.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f43bd57c8a5e05334ba371d3e354fb5f1cd42a3177ae342e6448d872bd6428b6`

Type:

```lean
{α : Type u_1} → SetLike (Finset α) α
```

Fully explicit type:

```lean
{α : Type u_1} → SetLike.{u_1, u_1} (Finset.{u_1} α) α
```

Definition body (one-level semantic boundary):

```lean
fun {α} => { coe := fun s => setOf fun a => Multiset.instMembership.mem s.val a, coe_injective' := ⋯ }
```

### D021: `HMul.hMul`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `4e00447a4a8ef4c2ce13e307c56a1fbcd7fa8c732fe039a452b42477a50df2c6`

Type:

```lean
{α : Type u} → {β : Type v} → {γ : outParam (Type w)} → [self : HMul α β γ] → α → β → γ
```

Fully explicit type:

```lean
{α : Type u} → {β : Type v} → {γ : outParam.{w + 2} (Type w)} → [self : HMul.{u, v, w} α β γ] → α → β → γ
```

Definition body (one-level semantic boundary):

```lean
fun α β {γ} [self : HMul α β γ] => self.1
```

### D022: `HPow.hPow`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6196b8cbb884c4f39841ba74b23d75f3c753fe0d044cc402bd6e4e3bd59d5cb8`

Type:

```lean
{α : Type u} → {β : Type v} → {γ : outParam (Type w)} → [self : HPow α β γ] → α → β → γ
```

Fully explicit type:

```lean
{α : Type u} → {β : Type v} → {γ : outParam.{w + 2} (Type w)} → [self : HPow.{u, v, w} α β γ] → α → β → γ
```

Definition body (one-level semantic boundary):

```lean
fun α β {γ} [self : HPow α β γ] => self.1
```

### D023: `HSub.hSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `98025b38d523c0eadea77ba4961a20b2a913b23c079c4bfeba24a7bfaa24a4bc`

Type:

```lean
{α : Type u} → {β : Type v} → {γ : outParam (Type w)} → [self : HSub α β γ] → α → β → γ
```

Fully explicit type:

```lean
{α : Type u} → {β : Type v} → {γ : outParam.{w + 2} (Type w)} → [self : HSub.{u, v, w} α β γ] → α → β → γ
```

Definition body (one-level semantic boundary):

```lean
fun α β {γ} [self : HSub α β γ] => self.1
```

### D024: `HasSubset.Subset`

- Role: `external-frontier`
- Owner module: `Init.Core`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `7c9560733523c0ce0c86bc53889a57a7fea2b2cc4c4a116fba2021bed1745efa`

Type:

```lean
{α : Type u} → [self : HasSubset α] → α → α → Prop
```

Fully explicit type:

```lean
{α : Type u} → [self : HasSubset.{u} α] → α → α → Prop
```

Definition body (one-level semantic boundary):

```lean
fun α [self : HasSubset α] => self.1
```

### D025: `MeasureTheory.Measure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `ba8c23c70f3135407096406cee0b4d7d9f02d088e8b1d1a1e105071821a3a51b`

Type:

```lean
(α : Type u_6) → [MeasurableSpace α] → Type u_6
```

Fully explicit type:

```lean
(α : Type u_6) → [MeasurableSpace.{u_6} α] → Type u_6
```

### D026: `MeasureTheory.Measure.instFunLike`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `94b2becf9230ce3d438e9b668f79f08e69dbe28c937b1aaca32d96e94b64a5b2`

Type:

```lean
{α : Type u_1} → [inst : MeasurableSpace α] → FunLike (MeasureTheory.Measure α) (Set α) ENNReal
```

Fully explicit type:

```lean
{α : Type u_1} →
  [inst : MeasurableSpace.{u_1} α] →
    FunLike.{u_1 + 1, u_1 + 1, 1} (@MeasureTheory.Measure.{u_1} α inst) (Set.{u_1} α) ENNReal
```

Definition body (one-level semantic boundary):

```lean
fun {α} [MeasurableSpace α] =>
  { coe := fun μ => MeasureTheory.OuterMeasure.instFunLikeSetENNReal.coe μ.toOuterMeasure, coe_injective' := ⋯ }
```

### D027: `Monoid.toNatPow`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5b7373fe2de26535c1cdbf1b953ce34faf30f68aac8abd83ade2e78e6ec65b8a`

Type:

```lean
{M : Type u_2} → [Monoid M] → Pow M Nat
```

Fully explicit type:

```lean
{M : Type u_2} → [Monoid.{u_2} M] → Pow.{u_2, 0} M Nat
```

Definition body (one-level semantic boundary):

```lean
fun {M} [inst : Monoid M] => { pow := fun x n => inst.npow n x }
```

### D028: `MonoidWithZero.toMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.GroupWithZero.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `c0f91ccdc0415c148969849b7a83ce67d87cf4c402704186fa19f6313928d90f`

Type:

```lean
{M₀ : Type u} → [self : MonoidWithZero M₀] → Monoid M₀
```

Fully explicit type:

```lean
{M₀ : Type u} → [self : MonoidWithZero.{u} M₀] → Monoid.{u} M₀
```

Definition body (one-level semantic boundary):

```lean
fun M₀ [self : MonoidWithZero M₀] => self.1
```

### D029: `Nat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `2e1c25ca42e1e377a41827f0d2f09ae02cfb28ab155c30e277f1000f5e79b32c`

Type:

```lean
Type
```

Fully explicit type:

```lean
Type
```

### D030: `NonAssocSemiring.toNonUnitalNonAssocSemiring`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `1674e66231d0f66dfe9fae191c7ae33207a78635bcf5490a9cfbb402d16f9bc0`

Type:

```lean
{α : Type u} → [self : NonAssocSemiring α] → NonUnitalNonAssocSemiring α
```

Fully explicit type:

```lean
{α : Type u} → [self : NonAssocSemiring.{u} α] → NonUnitalNonAssocSemiring.{u} α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : NonAssocSemiring α] => self.1
```

### D031: `NonUnitalNonAssocSemiring.toDistrib`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `5b49ec28e539eea6192ab07a9aee6da537ed1b5e017f2b9ef44d3a0ae51d79c6`

Type:

```lean
{α : Type u} → [self : NonUnitalNonAssocSemiring α] → Distrib α
```

Fully explicit type:

```lean
{α : Type u} → [self : NonUnitalNonAssocSemiring.{u} α] → Distrib.{u} α
```

Definition body (one-level semantic boundary):

```lean
fun α self => { toMul := self.toMul, toAdd := self.toAdd, left_distrib := ⋯, right_distrib := ⋯ }
```

### D032: `OfNat.ofNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6a6a0720d091cfeb582747fe67b977e948f09706c0beae1f2f21830aa5821ead`

Type:

```lean
{α : Type u} → (x : Nat) → [self : OfNat α x] → α
```

Fully explicit type:

```lean
{α : Type u} → (x : Nat) → [self : OfNat.{u} α x] → α
```

Definition body (one-level semantic boundary):

```lean
fun α x [self : OfNat α x] => self.1
```

### D033: `One.toOfNat1`

- Role: `external-frontier`
- Owner module: `Init.Data.Zero`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `cc544b5b2a2aabc84389a9fe2f052127dc6dae9964782b117b9b19b773e542d5`

Type:

```lean
{α : Type u_1} → [One α] → OfNat α 1
```

Fully explicit type:

```lean
{α : Type u_1} → [One.{u_1} α] → OfNat.{u_1} α (nat_lit 1)
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : One α] => { ofNat := inst.one }
```

### D034: `Real`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `38529f0578472feffc4c79d5d0755fa10fc3edafb232ab5e442336d13630ee90`

Type:

```lean
Type
```

Fully explicit type:

```lean
Type
```

### D035: `Real.instOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `b4e24b050b7fb50c4c115c51d5cd4c1b180cae53633f58a38c7d5ce3ccf86c81`

Type:

```lean
One Real
```

Fully explicit type:

```lean
One.{0} Real
```

Definition body (one-level semantic boundary):

```lean
{ one := Real.one✝ }
```

### D036: `Real.instPreorder`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `896bb94fc15867c0df82ea0f639eb6116e90a24819a66a54db9442e47cba7274`

Type:

```lean
Preorder Real
```

Fully explicit type:

```lean
Preorder.{0} Real
```

Definition body (one-level semantic boundary):

```lean
inferInstance
```

### D037: `Real.instZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `860eaaa75b06ac6fccbf4f27e9e162807e8851d04bb42d2411332c6368b14882`

Type:

```lean
Zero Real
```

Fully explicit type:

```lean
Zero.{0} Real
```

Definition body (one-level semantic boundary):

```lean
{ zero := Real.zero✝ }
```

### D038: `Semiring.toMonoidWithZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `bf0d463c55fbfcd762eb28ad6f1672fe482a72dfed67d13a797c09f1f0431e64`

Type:

```lean
{α : Type u} → [self : Semiring α] → MonoidWithZero α
```

Fully explicit type:

```lean
{α : Type u} → [self : Semiring.{u} α] → MonoidWithZero.{u} α
```

Definition body (one-level semantic boundary):

```lean
fun α self =>
  { toMul := self.toMul, mul_assoc := ⋯, toOne := self.toOne, one_mul := ⋯, mul_one := ⋯, npow := self.npow,
    npow_zero := ⋯, npow_succ := ⋯, toZero := self.toZero, zero_mul := ⋯, mul_zero := ⋯ }
```

### D039: `Semiring.toNonAssocSemiring`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `33076e5ce1b65d0dacdacdea942f424abbe54f3ff639c158f37c0f533984f227`

Type:

```lean
{α : Type u} → [self : Semiring α] → NonAssocSemiring α
```

Fully explicit type:

```lean
{α : Type u} → [self : Semiring.{u} α] → NonAssocSemiring.{u} α
```

Definition body (one-level semantic boundary):

```lean
fun α self =>
  { toNonUnitalNonAssocSemiring := self.toNonUnitalNonAssocSemiring, toOne := self.toOne, one_mul := ⋯, mul_one := ⋯,
    toNatCast := self.toNatCast, natCast_zero := ⋯, natCast_succ := ⋯ }
```

### D040: `Set`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `a6e551515032966c16e4f42e4548ff1854c2dce05ffe51e98b66943caecc78ec`

Type:

```lean
Type u → Type u
```

Fully explicit type:

```lean
(α : Type u) → Type u
```

Definition body (one-level semantic boundary):

```lean
fun α => α → Prop
```

### D041: `Set.Elem`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Set.CoeSort`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `2fa7a863ddf7e954e2026c0d7547ac9d781f4a5cb94968d0c9ed2c720b524fdb`

Type:

```lean
{α : Type u} → Set α → Type u
```

Fully explicit type:

```lean
{α : Type u} → (s : Set.{u} α) → Type u
```

Definition body (one-level semantic boundary):

```lean
fun {α} s => Subtype fun x => Set.instMembership.mem s x
```

### D042: `Set.Icc`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Interval.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5d4d1d0cca151d5f96eb45776025e642f79e9040e66fffcf889bd1224442ecc8`

Type:

```lean
{α : Type u_1} → [Preorder α] → α → α → Set α
```

Fully explicit type:

```lean
{α : Type u_1} → [Preorder.{u_1} α] → (a b : α) → Set.{u_1} α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Preorder α] a b => setOf fun x => And (inst.le a x) (inst.le x b)
```

### D043: `Set.instCompl`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Set.Operations`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7dd389af46f7777e0d139df7083dd5c135cc1c15cf17a29a85311409cc08843a`

Type:

```lean
{α : Type u} → Compl (Set α)
```

Fully explicit type:

```lean
{α : Type u} → Compl.{u} (Set.{u} α)
```

Definition body (one-level semantic boundary):

```lean
fun {α} => { compl := fun s => setOf fun x => Not (Set.instMembership.mem s x) }
```

### D044: `Set.instHasSubset`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `11142942c466ba33b3ececb8fe039ee973b13ca9402508e46589944dfc90173a`

Type:

```lean
{α : Type u} → HasSubset (Set α)
```

Fully explicit type:

```lean
{α : Type u} → HasSubset.{u} (Set.{u} α)
```

Definition body (one-level semantic boundary):

```lean
fun {α} => { Subset := fun x1 x2 => Set.instLE.le x1 x2 }
```

### D045: `SetLike.coe`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.SetLike.Basic`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `9b4ffcf98b1d3e49843937a392db4c79a43be978d61fc2a2cc954170f5efcb7b`

Type:

```lean
{A : Type u_1} → {B : outParam (Type u_2)} → [self : SetLike A B] → A → Set B
```

Fully explicit type:

```lean
{A : Type u_1} → {B : outParam.{u_2 + 2} (Type u_2)} → [self : SetLike.{u_1, u_2} A B] → A → Set.{u_2} B
```

Definition body (one-level semantic boundary):

```lean
fun A {B} [self : SetLike A B] => self.1
```

### D046: `SimpleGraph`

- Role: `external-frontier`
- Owner module: `Mathlib.Combinatorics.SimpleGraph.Basic`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `92c46e19c8ae5bf29037355fa37f1cf9366755f85b12432f800f3f3435c27fa6`

Type:

```lean
Type u → Type u
```

Fully explicit type:

```lean
(V : Type u) → Type u
```

### D047: `SimpleGraph.instMeasurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Constructions.SimpleGraph`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `668769081f9d3ecc495649c7f45cb42c94814ab770e8c2edff7f16f9903000c7`

Type:

```lean
{V : Type u_1} → MeasurableSpace (SimpleGraph V)
```

Fully explicit type:

```lean
{V : Type u_1} → MeasurableSpace.{u_1} (SimpleGraph.{u_1} V)
```

Definition body (one-level semantic boundary):

```lean
fun {V} => MeasurableSpace.comap SimpleGraph.Adj inferInstance
```

### D048: `Sym2`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Sym.Sym2`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `7a462f6b5dbda314c6ee432ffc6f6c4796961aaa903f16e933f8c102cadfdb17`

Type:

```lean
Type u → Type u
```

Fully explicit type:

```lean
(α : Type u) → Type u
```

Definition body (one-level semantic boundary):

```lean
fun α => Quot (Sym2.Rel α)
```

### D049: `Sym2.diagSet`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Sym.Sym2`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `642ffaa672d3d2752d7f3925e278cc7f48b8dfe26be570a7b3532b4b86b79012`

Type:

```lean
{α : Type u_1} → Set (Sym2 α)
```

Fully explicit type:

```lean
{α : Type u_1} → Set.{u_1} (Sym2.{u_1} α)
```

Definition body (one-level semantic boundary):

```lean
fun {α} => setOf fun z => z.IsDiag
```

### D050: `Zero.toOfNat0`

- Role: `external-frontier`
- Owner module: `Init.Data.Zero`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f7ebe8a983de002c1ee751fd3c144a7c1933b3bb95c87c5001a3cabf5709031a`

Type:

```lean
{α : Type u_1} → [Zero α] → OfNat α 0
```

Fully explicit type:

```lean
{α : Type u_1} → [Zero.{u_1} α] → OfNat.{u_1} α (nat_lit 0)
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Zero α] => { ofNat := inst.zero }
```

### D051: `instHMul`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `1fd375514ac68e29e7941c94ba308ea936395db23d0fee63a5c69dcccd3b2bdc`

Type:

```lean
{α : Type u_1} → [Mul α] → HMul α α α
```

Fully explicit type:

```lean
{α : Type u_1} → [Mul.{u_1} α] → HMul.{u_1, u_1, u_1} α α α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Mul α] => { hMul := fun a b => inst.mul a b }
```

### D052: `instHPow`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `eb300d353d84392c776cad5e356479f878030744a43f9a1584942a89d16350b4`

Type:

```lean
{α : Type u_1} → {β : Type u_2} → [Pow α β] → HPow α β α
```

Fully explicit type:

```lean
{α : Type u_1} → {β : Type u_2} → [Pow.{u_1, u_2} α β] → HPow.{u_1, u_2, u_1} α β α
```

Definition body (one-level semantic boundary):

```lean
fun {α} {β} [inst : Pow α β] => { hPow := fun a b => inst.pow a b }
```

### D053: `instHSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `aa782f2b5af3d068f4c5340de4b32b193fece2c659a45582cc3024a19b550c87`

Type:

```lean
{α : Type u_1} → [Sub α] → HSub α α α
```

Fully explicit type:

```lean
{α : Type u_1} → [Sub.{u_1} α] → HSub.{u_1, u_1, u_1} α α α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Sub α] => { hSub := fun a b => inst.sub a b }
```

### D054: `instSubNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5b0e20a4d2b3e0a67bd35de1b5c84cc60d6dc867658112d84cad483055804868`

Type:

```lean
Sub Nat
```

Fully explicit type:

```lean
Sub.{0} Nat
```

Definition body (one-level semantic boundary):

```lean
{ sub := Nat.sub }
```

### D055: `unitInterval.symm`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.UnitInterval`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `86fa7e3be7a675cd221cf4339c6140a3b882ef1d3b971f213bd1930e27c881be`

Type:

```lean
unitInterval.Elem → unitInterval.Elem
```

Fully explicit type:

```lean
@Set.Elem.{0} Real unitInterval → @Set.Elem.{0} Real unitInterval
```

Definition body (one-level semantic boundary):

```lean
fun t => ⟨instHSub.hSub 1 t.val, ⋯⟩
```

### D056: `unitInterval.toNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.UnitInterval`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `60c99596717c55660a648a47b197bc6f18dc2de1667ecd83dfd83aa02192189f`

Type:

```lean
unitInterval.Elem → NNReal
```

Fully explicit type:

```lean
@Set.Elem.{0} Real unitInterval → NNReal
```

Definition body (one-level semantic boundary):

```lean
fun i => ⟨i.val, ⋯⟩
```

### D057: `Iff`

- Role: `external-frontier`
- Owner module: `Init.Core`
- Declaration kind: `inductive`
- Distance from target type: `2`
- Semantic SHA-256: `b9f48489cd9ca513eeae7e3e4fb154f354b93867eda8b67d1630275c4cb4f30b`

Type:

```lean
Prop → Prop → Prop
```

Fully explicit type:

```lean
(a b : Prop) → Prop
```

### D058: `Membership.mem`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `941ea3346e809f919727c21bfcdeea342714a6b83f1cf871d648aa2cb14d6e9e`

Type:

```lean
{α : outParam (Type u)} → {γ : Type v} → [self : Membership α γ] → γ → α → Prop
```

Fully explicit type:

```lean
{α : outParam.{u + 2} (Type u)} → {γ : Type v} → [self : Membership.{u, v} α γ] → γ → α → Prop
```

Definition body (one-level semantic boundary):

```lean
fun {α} γ [self : Membership α γ] => self.1
```

### D059: `Set.instMembership`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `5858be77d319c5a0e238602f16818ed6fb2e2b52a81ff7edb07bc219d652f201`

Type:

```lean
{α : Type u} → Membership α (Set α)
```

Fully explicit type:

```lean
{α : Type u} → Membership.{u, u} α (Set.{u} α)
```

Definition body (one-level semantic boundary):

```lean
fun {α} => { mem := Set.Mem }
```

### D060: `SetLike.instMembership`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.SetLike.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `47a75450bbb51c4e8fdd9e8881cc3fa741dfb5f1f186d952055686e285c081e4`

Type:

```lean
{A : Type u_1} → {B : Type u_2} → [i : SetLike A B] → Membership B A
```

Fully explicit type:

```lean
{A : Type u_1} → {B : Type u_2} → [i : SetLike.{u_1, u_2} A B] → Membership.{u_2, u_1} B A
```

Definition body (one-level semantic boundary):

```lean
fun {A} {B} [i : SetLike A B] => { mem := fun p x => Set.instMembership.mem (i.coe p) x }
```

### D061: `SimpleGraph.edgeSet`

- Role: `external-frontier`
- Owner module: `Mathlib.Combinatorics.SimpleGraph.Basic`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `aaf6ed7d70f4d638696b47074fdec93d8c86b11f7de64649b7cb7760a696ea1c`

Type:

```lean
{V : Type u} → SimpleGraph V → Set (Sym2 V)
```

Fully explicit type:

```lean
{V : Type u} → (G : SimpleGraph.{u} V) → Set.{u} (Sym2.{u} V)
```

Definition body (one-level semantic boundary):

```lean
fun {V} G => (instFunLikeOrderEmbedding (SimpleGraph V) (Set (Sym2 V))).coe (SimpleGraph.edgeSetEmbedding V) G
```

### D062: `setOf`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `cee4433aebd78c308ec85f62ccd30489c00ec9cc23a98f4d2139c17f840f4988`

Type:

```lean
{α : Type u} → (α → Prop) → Set α
```

Fully explicit type:

```lean
{α : Type u} → (p : α → Prop) → Set.{u} α
```

Definition body (one-level semantic boundary):

```lean
fun {α} p => p
```

### D063: `Fintype.ofFinite`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Fintype.EquivFin`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `b1750c9a619b9b950014bf300edca8639934bfa9ec4fa4b387b3c0c752a0461b`

Type:

```lean
(α : Type u_4) → [Finite α] → Fintype α
```

Fully explicit type:

```lean
(α : Type u_4) → [Finite.{u_4 + 1} α] → Fintype.{u_4} α
```

Definition body (one-level semantic boundary):

```lean
fun α [Finite α] => ⋯.some
```

### D064: `SimpleGraph.binomialRandom`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.Combinatorics.BinomialRandomGraph.Defs`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `5d550211974c376aa5ced20f62a15496d1439400a62440076cc623e2f858ed99`

Type:

```lean
(V : Type u_1) → unitInterval.Elem → MeasureTheory.Measure (SimpleGraph V)
```

Fully explicit type:

```lean
(V : Type u_1) →
  (p : @Set.Elem.{0} Real unitInterval) →
    @MeasureTheory.Measure.{u_1} (SimpleGraph.{u_1} V) (@SimpleGraph.instMeasurableSpace.{u_1} V)
```

Definition body (one-level semantic boundary):

```lean
fun V p =>
  MeasureTheory.Measure.comap SimpleGraph.edgeSet (ProbabilityTheory.setBernoulli (Set.instCompl.compl Sym2.diagSet) p)
```

### D065: `SimpleGraph.degree`

- Role: `external-frontier`
- Owner module: `Mathlib.Combinatorics.SimpleGraph.Finite`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `ee55c1bc28f6cb2d8b2c398e9cf28ec1279efeec7656bd4e3a76ed825b3bc910`

Type:

```lean
{V : Type u_1} → (G : SimpleGraph V) → (v : V) → [Fintype (G.neighborSet v).Elem] → Nat
```

Fully explicit type:

```lean
{V : Type u_1} →
  (G : SimpleGraph.{u_1} V) → (v : V) → [Fintype.{u_1} (@Set.Elem.{u_1} V (@SimpleGraph.neighborSet.{u_1} V G v))] → Nat
```

Definition body (one-level semantic boundary):

```lean
fun {V} G v [Fintype (G.neighborSet v).Elem] => (G.neighborFinset v).card
```

### D066: `SimpleGraph.neighborSet`

- Role: `external-frontier`
- Owner module: `Mathlib.Combinatorics.SimpleGraph.Basic`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `bf7238776e298f4c2764a44b104e97d7022a104357e30eff3633803645f8249b`

Type:

```lean
{V : Type u} → SimpleGraph V → V → Set V
```

Fully explicit type:

```lean
{V : Type u} → (G : SimpleGraph.{u} V) → (v : V) → Set.{u} V
```

Definition body (one-level semantic boundary):

```lean
fun {V} G v => setOf fun w => G.Adj v w
```

### D067: `Finite`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Finite.Defs`
- Declaration kind: `inductive`
- Distance from target type: `4`
- Semantic SHA-256: `537db26f6ac8c8862510b4e62d2075a1b3bc15b0d8f9ac538484e1258a3070a4`

Type:

```lean
Sort u_3 → Prop
```

Fully explicit type:

```lean
(α : Sort u_3) → Prop
```

### D068: `Subtype`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `4`
- Semantic SHA-256: `3b0bb8433bd0c981dbdb4d6256bf74c50e9883207dae8d309dcb705135cf932c`

Type:

```lean
{α : Sort u} → (α → Prop) → Sort (max 1 u)
```

Fully explicit type:

```lean
{α : Sort u} → (p : α → Prop) → Sort (max 1 u)
```
