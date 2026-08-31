# Declaration dossier for HDP-02-EQ-2.1

This dossier describes the theorem statement only. Its proof is excluded.
Interpret every dependency from its supplied declaration; names are not definitions.

## Proof-free source declaration

```lean
theorem hdp_02_heq_h2_d1
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool}
    (hN : 0 < Fintype.card ι)
    (hB : ∀ i, Measurable (B i))
    (hIndep : iIndepFun B μ)
    (hLaw : ∀ i, Measure.map (B i) μ = fairBernoulliPMF.toMeasure) :
    μ.real {ω | ∑ i, bernoulliIndicator (B i ω) ≥
        (3 / 4 : ℝ) * (Fintype.card ι : ℝ)} ≤
      μ.real {ω | |∑ i, bernoulliIndicator (B i ω) -
        (Fintype.card ι : ℝ) / 2| ≥
          (Fintype.card ι : ℝ) / 4} ∧
    μ.real {ω | |∑ i, bernoulliIndicator (B i ω) -
        (Fintype.card ι : ℝ) / 2| ≥
          (Fintype.card ι : ℝ) / 4} ≤
      4 / (Fintype.card ι : ℝ)
```

## Elaborated target type

```lean
∀ {ι : Type u_1} {Ω : Type u_2} [inst : Fintype ι] [inst_1 : MeasurableSpace Ω] {μ : MeasureTheory.Measure Ω}
  [MeasureTheory.IsProbabilityMeasure μ] {B : ι → Ω → Bool},
  instLTNat.lt 0 (Fintype.card ι) →
    (∀ (i : ι), Measurable (B i)) →
      ProbabilityTheory.iIndepFun B μ →
        (∀ (i : ι),
            Eq (MeasureTheory.Measure.map (B i) μ)
              NumStability.HDP.Scalar.IndependentSums.Hoeffding.fairBernoulliPMF.toMeasure) →
          And
            (Real.instLE.le
              (μ.real
                (setOf fun ω =>
                  GE.ge
                    (Finset.univ.sum fun i =>
                      NumStability.HDP.Scalar.IndependentSums.Hoeffding.bernoulliIndicator (B i ω))
                    (instHMul.hMul (3 / 4) (Fintype.card ι).cast)))
              (μ.real
                (setOf fun ω =>
                  GE.ge
                    (abs
                      (instHSub.hSub
                        (Finset.univ.sum fun i =>
                          NumStability.HDP.Scalar.IndependentSums.Hoeffding.bernoulliIndicator (B i ω))
                        (instHDiv.hDiv (Fintype.card ι).cast 2)))
                    (instHDiv.hDiv (Fintype.card ι).cast 4))))
            (Real.instLE.le
              (μ.real
                (setOf fun ω =>
                  GE.ge
                    (abs
                      (instHSub.hSub
                        (Finset.univ.sum fun i =>
                          NumStability.HDP.Scalar.IndependentSums.Hoeffding.bernoulliIndicator (B i ω))
                        (instHDiv.hDiv (Fintype.card ι).cast 2)))
                    (instHDiv.hDiv (Fintype.card ι).cast 4)))
              (instHDiv.hDiv 4 (Fintype.card ι).cast))
```

## Fully explicit elaborated target type

```lean
∀ {ι : Type u_1} {Ω : Type u_2} [inst : Fintype.{u_1} ι] [inst_1 : MeasurableSpace.{u_2} Ω]
  {μ : @MeasureTheory.Measure.{u_2} Ω inst_1} [@MeasureTheory.IsProbabilityMeasure.{u_2} Ω inst_1 μ] {B : ι → Ω → Bool}
  (hN :
    @LT.lt.{0} Nat instLTNat (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))) (@Fintype.card.{u_1} ι inst))
  (hB : ∀ (i : ι), @Measurable.{u_2, 0} Ω Bool inst_1 Bool.instMeasurableSpace (B i))
  (hIndep :
    @ProbabilityTheory.iIndepFun.{u_2, u_1, 0} Ω ι inst_1 (fun (x : ι) => Bool)
      (fun (x : ι) => Bool.instMeasurableSpace) B μ)
  (hLaw :
    ∀ (i : ι),
      @Eq.{1} (@MeasureTheory.Measure.{0} Bool Bool.instMeasurableSpace)
        (@MeasureTheory.Measure.map.{u_2, 0} Ω Bool inst_1 Bool.instMeasurableSpace (B i) μ)
        (@PMF.toMeasure.{0} Bool Bool.instMeasurableSpace
          NumStability.HDP.Scalar.IndependentSums.Hoeffding.fairBernoulliPMF)),
  And
    (@LE.le.{0} Real Real.instLE
      (@MeasureTheory.Measure.real.{u_2} Ω inst_1 μ
        (@setOf.{u_2} Ω fun (ω : Ω) =>
          @GE.ge.{0} Real Real.instLE
            (@Finset.sum.{u_1, 0} ι Real Real.instAddCommMonoid (@Finset.univ.{u_1} ι inst) fun (i : ι) =>
              NumStability.HDP.Scalar.IndependentSums.Hoeffding.bernoulliIndicator (B i ω))
            (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
              (@HDiv.hDiv.{0, 0, 0} Real Real Real
                (@instHDiv.{0} Real (@DivInvMonoid.toDiv.{0} Real Real.instDivInvMonoid))
                (@OfNat.ofNat.{0} Real (nat_lit 3)
                  (@instOfNatAtLeastTwo.{0} Real (nat_lit 3) Real.instNatCast
                    (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2)))
                      (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))))))
                (@OfNat.ofNat.{0} Real (nat_lit 4)
                  (@instOfNatAtLeastTwo.{0} Real (nat_lit 4) Real.instNatCast
                    (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 3) (instOfNatNat (nat_lit 3)))
                      (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))))))))
              (@Nat.cast.{0} Real Real.instNatCast (@Fintype.card.{u_1} ι inst)))))
      (@MeasureTheory.Measure.real.{u_2} Ω inst_1 μ
        (@setOf.{u_2} Ω fun (ω : Ω) =>
          @GE.ge.{0} Real Real.instLE
            (@abs.{0} Real Real.lattice Real.instAddGroup
              (@HSub.hSub.{0, 0, 0} Real Real Real (@instHSub.{0} Real Real.instSub)
                (@Finset.sum.{u_1, 0} ι Real Real.instAddCommMonoid (@Finset.univ.{u_1} ι inst) fun (i : ι) =>
                  NumStability.HDP.Scalar.IndependentSums.Hoeffding.bernoulliIndicator (B i ω))
                (@HDiv.hDiv.{0, 0, 0} Real Real Real
                  (@instHDiv.{0} Real (@DivInvMonoid.toDiv.{0} Real Real.instDivInvMonoid))
                  (@Nat.cast.{0} Real Real.instNatCast (@Fintype.card.{u_1} ι inst))
                  (@OfNat.ofNat.{0} Real (nat_lit 2)
                    (@instOfNatAtLeastTwo.{0} Real (nat_lit 2) Real.instNatCast
                      (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                        (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))))
            (@HDiv.hDiv.{0, 0, 0} Real Real Real
              (@instHDiv.{0} Real (@DivInvMonoid.toDiv.{0} Real Real.instDivInvMonoid))
              (@Nat.cast.{0} Real Real.instNatCast (@Fintype.card.{u_1} ι inst))
              (@OfNat.ofNat.{0} Real (nat_lit 4)
                (@instOfNatAtLeastTwo.{0} Real (nat_lit 4) Real.instNatCast
                  (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 3) (instOfNatNat (nat_lit 3)))
                    (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2)))))))))))
    (@LE.le.{0} Real Real.instLE
      (@MeasureTheory.Measure.real.{u_2} Ω inst_1 μ
        (@setOf.{u_2} Ω fun (ω : Ω) =>
          @GE.ge.{0} Real Real.instLE
            (@abs.{0} Real Real.lattice Real.instAddGroup
              (@HSub.hSub.{0, 0, 0} Real Real Real (@instHSub.{0} Real Real.instSub)
                (@Finset.sum.{u_1, 0} ι Real Real.instAddCommMonoid (@Finset.univ.{u_1} ι inst) fun (i : ι) =>
                  NumStability.HDP.Scalar.IndependentSums.Hoeffding.bernoulliIndicator (B i ω))
                (@HDiv.hDiv.{0, 0, 0} Real Real Real
                  (@instHDiv.{0} Real (@DivInvMonoid.toDiv.{0} Real Real.instDivInvMonoid))
                  (@Nat.cast.{0} Real Real.instNatCast (@Fintype.card.{u_1} ι inst))
                  (@OfNat.ofNat.{0} Real (nat_lit 2)
                    (@instOfNatAtLeastTwo.{0} Real (nat_lit 2) Real.instNatCast
                      (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                        (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))))
            (@HDiv.hDiv.{0, 0, 0} Real Real Real
              (@instHDiv.{0} Real (@DivInvMonoid.toDiv.{0} Real Real.instDivInvMonoid))
              (@Nat.cast.{0} Real Real.instNatCast (@Fintype.card.{u_1} ι inst))
              (@OfNat.ofNat.{0} Real (nat_lit 4)
                (@instOfNatAtLeastTwo.{0} Real (nat_lit 4) Real.instNatCast
                  (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 3) (instOfNatNat (nat_lit 3)))
                    (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))))))))))
      (@HDiv.hDiv.{0, 0, 0} Real Real Real (@instHDiv.{0} Real (@DivInvMonoid.toDiv.{0} Real Real.instDivInvMonoid))
        (@OfNat.ofNat.{0} Real (nat_lit 4)
          (@instOfNatAtLeastTwo.{0} Real (nat_lit 4) Real.instNatCast
            (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 3) (instOfNatNat (nat_lit 3)))
              (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2)))))))
        (@Nat.cast.{0} Real Real.instNatCast (@Fintype.card.{u_1} ι inst))))
```

## Local import graph

- `AuditTarget` imports: `NumStability.HDP.ContractSignatures.C_02_heq_h2_d1`, `NumStability.HDP.Scalar.IndependentSums.FairCoinChebyshev`
- `NumStability.HDP.Scalar.Preliminaries` imports: `Mathlib.Probability.Moments.Variance`, `Mathlib.Probability.CDF`, `Mathlib.MeasureTheory.Function.LpSpace.Basic`, `Mathlib.MeasureTheory.Function.LpSpace.Complete`, `Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm`, `Mathlib.MeasureTheory.Function.LpSeminorm.Indicator`, `Mathlib.Probability.UniformOn`, `Mathlib.Analysis.Convex.Integral`, `Mathlib.Analysis.Convex.Continuous`, `Mathlib.MeasureTheory.Integral.Bochner.Set`, `Mathlib.MeasureTheory.Integral.Lebesgue.Markov`, `Mathlib.MeasureTheory.Integral.Layercake`, `Mathlib.MeasureTheory.Measure.Lebesgue.Integral`, `Mathlib.Probability.Distributions.Cauchy`, `Mathlib.Analysis.SpecialFunctions.NonIntegrable`, `Mathlib.Analysis.SpecialFunctions.Pow.Integral`, `Mathlib.Tactic`
- `NumStability.HDP.Scalar.IndependentSums.Hoeffding` imports: `Mathlib.Probability.Independence.Integration`, `Mathlib.Probability.Moments.Basic`, `Mathlib.Probability.Moments.SubGaussian`, `Mathlib.Probability.ProbabilityMassFunction.Constructions`, `Mathlib.Probability.ProbabilityMassFunction.Integrals`, `Mathlib.Analysis.SpecialFunctions.Trigonometric.Series`, `Mathlib.Analysis.SpecialFunctions.ImproperIntegrals`, `Mathlib.Tactic`, `NumStability.HDP.Scalar.Preliminaries`
- `NumStability.HDP.ContractSignatures.C_02_heq_h2_d1` imports: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- `NumStability.HDP.Scalar.LimitTheorems` imports: `Mathlib.Probability.ProbabilityMassFunction.Binomial`, `Mathlib.Probability.ProbabilityMassFunction.Integrals`, `Mathlib.Probability.Distributions.Gaussian.Real`, `Mathlib.Probability.Distributions.Poisson`, `Mathlib.MeasureTheory.Function.ConvergenceInDistribution`, `Mathlib.Probability.StrongLaw`, `Mathlib.Tactic`
- `NumStability.HDP.Scalar.IndependentSums.FairCoinMoments` imports: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`, `NumStability.HDP.Scalar.LimitTheorems`
- `NumStability.HDP.Scalar.IndependentSums.FairCoinChebyshev` imports: `NumStability.HDP.Scalar.IndependentSums.FairCoinMoments`, `NumStability.HDP.Scalar.Preliminaries`

## Semantic dependency inventory

`local` declarations are followed recursively through types and bodies. `external-frontier` declarations mark the one-level library trust boundary.

### D001: `NumStability.HDP.Scalar.IndependentSums.Hoeffding.bernoulliIndicator`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8fe24fc567ec54d8d7fdb9c642cfc70285a0b7b19e899881369cf903aeffdcd3`

Type:

```lean
Bool → Real
```

Fully explicit type:

```lean
Bool → Real
```

Definition body (one-level semantic boundary):

```lean
fun b => ite (Eq b Bool.true) 1 0
```

### D002: `NumStability.HDP.Scalar.IndependentSums.Hoeffding.fairBernoulliPMF`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `b14818e70aebdac5c9e5ea27f71c3d9e026e8b8695a96e4acfe16e214944dd5c`

Type:

```lean
PMF Bool
```

Fully explicit type:

```lean
PMF.{0} Bool
```

Definition body (one-level semantic boundary):

```lean
PMF.bernoulli (1 / 2) NumStability.HDP.Scalar.IndependentSums.Hoeffding.fairBernoulliPMF._proof_2
```

### D003: `NumStability.HDP.Scalar.IndependentSums.Hoeffding.fairBernoulliPMF._proof_1`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `75a4aea7a385e7e8816c5be3a4a7a68e18119e6cc978c9f3f0eec2a8b01df2f5`

Type:

```lean
(instHAdd.hAdd 1 1).AtLeastTwo
```

Fully explicit type:

```lean
Nat.AtLeastTwo
  (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat)
    (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
    (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))
```

### D004: `NumStability.HDP.Scalar.IndependentSums.Hoeffding.fairBernoulliPMF._proof_2`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `0fc148c3c64ed465884d43136a114c0fcee7f4edd1860a2809a6f8b3f9788ccf`

Type:

```lean
instPartialOrderNNReal.le (1 / 2) 1
```

Fully explicit type:

```lean
@LE.le.{0} NNReal (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
  (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal (@instHDiv.{0} NNReal NNReal.instDiv)
    (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
    (@OfNat.ofNat.{0} NNReal (nat_lit 2)
      (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
        (@AddMonoidWithOne.toNatCast.{0} NNReal
          (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
            (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
              (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
        NumStability.HDP.Scalar.IndependentSums.Hoeffding.fairBernoulliPMF._proof_1)))
  (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
```

### D005: `And`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `37ecdc009aa953e3d4924ef10e6a1fb591f6af993cd344fd5a6b5321466517c9`

Type:

```lean
Prop → Prop → Prop
```

Fully explicit type:

```lean
(a b : Prop) → Prop
```

### D006: `Bool`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `e95da6be35714acbe5505fa5c6ba913c979305a6d87f38e35096664b551ce829`

Type:

```lean
Type
```

Fully explicit type:

```lean
Type
```

### D007: `Bool.instMeasurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.MeasurableSpace.Instances`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `96b5217594b08e71c430879f1ab3e811ca0f8e6f27d49a544c2fe3d0bd6e1c82`

Type:

```lean
MeasurableSpace Bool
```

Fully explicit type:

```lean
MeasurableSpace.{0} Bool
```

Definition body (one-level semantic boundary):

```lean
MeasurableSpace.instCompleteLattice.top
```

### D008: `DivInvMonoid.toDiv`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `cf21e4a4c962ee0db8a97bd649d849a798a693692bf09312f7855ddcbeb125ea`

Type:

```lean
{G : Type u} → [self : DivInvMonoid G] → Div G
```

Fully explicit type:

```lean
{G : Type u} → [self : DivInvMonoid.{u} G] → Div.{u} G
```

Definition body (one-level semantic boundary):

```lean
fun G [self : DivInvMonoid G] => self.3
```

### D009: `Eq`

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

### D010: `Finset.sum`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.BigOperators.Group.Finset.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `931ceac4e9efb5833f58970d10ced4621362e020ea1119492a8d379b7e692372`

Type:

```lean
{ι : Type u_1} → {M : Type u_3} → [AddCommMonoid M] → Finset ι → (ι → M) → M
```

Fully explicit type:

```lean
{ι : Type u_1} → {M : Type u_3} → [AddCommMonoid.{u_3} M] → (s : Finset.{u_1} ι) → (f : ι → M) → M
```

Definition body (one-level semantic boundary):

```lean
fun {ι} {M} [AddCommMonoid M] s f => (Multiset.map f s.val).sum
```

### D011: `Finset.univ`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Fintype.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `194413a784fbc0b27d0cb6b1ab67ed060210172bf16ba24045aa439e58f9a8c7`

Type:

```lean
{α : Type u_1} → [Fintype α] → Finset α
```

Fully explicit type:

```lean
{α : Type u_1} → [Fintype.{u_1} α] → Finset.{u_1} α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Fintype α] => inst.elems
```

### D012: `Fintype`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Fintype.Defs`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `ff39697629d53c72a76ae41500ef08888ff834898920af48012f83225b729e55`

Type:

```lean
Type u_4 → Type u_4
```

Fully explicit type:

```lean
(α : Type u_4) → Type u_4
```

### D013: `Fintype.card`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Fintype.Card`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `d671060b6c3404522971da5a02da4d36f016d436f12fae1266ef0720d68247cd`

Type:

```lean
(α : Type u_4) → [Fintype α] → Nat
```

Fully explicit type:

```lean
(α : Type u_4) → [Fintype.{u_4} α] → Nat
```

Definition body (one-level semantic boundary):

```lean
fun α [Fintype α] => Finset.univ.card
```

### D014: `GE.ge`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `131874e93bc48da13f8ebac9085b31e74f8526201dea35f9078e764147586ec3`

Type:

```lean
{α : Type u} → [LE α] → α → α → Prop
```

Fully explicit type:

```lean
{α : Type u} → [LE.{u} α] → (a b : α) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : LE α] a b => inst.le b a
```

### D015: `HDiv.hDiv`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `10d75d9f08ad8c923109392866fba5fb3645de144bc824cefdd353658fe9f06b`

Type:

```lean
{α : Type u} → {β : Type v} → {γ : outParam (Type w)} → [self : HDiv α β γ] → α → β → γ
```

Fully explicit type:

```lean
{α : Type u} → {β : Type v} → {γ : outParam.{w + 2} (Type w)} → [self : HDiv.{u, v, w} α β γ] → α → β → γ
```

Definition body (one-level semantic boundary):

```lean
fun α β {γ} [self : HDiv α β γ] => self.1
```

### D016: `HMul.hMul`

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

### D017: `HSub.hSub`

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

### D018: `LE.le`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `54a32f2661f788eb2b860006c4d1e8031e126febafe1c8d03ce50529b773dc48`

Type:

```lean
{α : Type u} → [self : LE α] → α → α → Prop
```

Fully explicit type:

```lean
{α : Type u} → [self : LE.{u} α] → α → α → Prop
```

Definition body (one-level semantic boundary):

```lean
fun α [self : LE α] => self.1
```

### D019: `LT.lt`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `fd5699899f1a49c91982cb363d3a71557ab1b53ee772cd777c9ee7717abc2009`

Type:

```lean
{α : Type u} → [self : LT α] → α → α → Prop
```

Fully explicit type:

```lean
{α : Type u} → [self : LT.{u} α] → α → α → Prop
```

Definition body (one-level semantic boundary):

```lean
fun α [self : LT α] => self.1
```

### D020: `Measurable`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.MeasurableSpace.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `6d56983cd98232a62c5c1b4a0368519a8b381777b32b6e8301ade2ccd7f4c3a4`

Type:

```lean
{α : Type u_1} → {β : Type u_2} → [MeasurableSpace α] → [MeasurableSpace β] → (α → β) → Prop
```

Fully explicit type:

```lean
{α : Type u_1} → {β : Type u_2} → [MeasurableSpace.{u_1} α] → [MeasurableSpace.{u_2} β] → (f : α → β) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun {α} {β} [MeasurableSpace α] [MeasurableSpace β] f =>
  ∀ ⦃t : Set β⦄, MeasurableSet t → MeasurableSet (Set.preimage f t)
```

### D021: `MeasurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.MeasurableSpace.Defs`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `6825e55082259c6be2028d5ee0624c796293eccdd78af118da4583180067d196`

Type:

```lean
Type u_7 → Type u_7
```

Fully explicit type:

```lean
(α : Type u_7) → Type u_7
```

### D022: `MeasureTheory.IsProbabilityMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Typeclasses.Probability`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `f88b269cb95d165125e7553fd22f97d6e5f9b1b9bcdec7f6738a781dc674bf89`

Type:

```lean
{α : Type u_1} → {m0 : MeasurableSpace α} → MeasureTheory.Measure α → Prop
```

Fully explicit type:

```lean
{α : Type u_1} → {m0 : MeasurableSpace.{u_1} α} → (μ : @MeasureTheory.Measure.{u_1} α m0) → Prop
```

### D023: `MeasureTheory.Measure`

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

### D024: `MeasureTheory.Measure.map`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Map`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `35d0f192bfc92d083756f0df86ca1ad37f0c1f0bfa39120f6adf90414c4a3b75`

Type:

```lean
{α : Type u_4} →
  {β : Type u_5} →
    [inst : MeasurableSpace α] →
      [inst_1 : MeasurableSpace β] → (α → β) → MeasureTheory.Measure α → MeasureTheory.Measure β
```

Fully explicit type:

```lean
{α : Type u_4} →
  {β : Type u_5} →
    [inst : MeasurableSpace.{u_4} α] →
      [inst_1 : MeasurableSpace.{u_5} β] →
        (f : α → β) → (μ : @MeasureTheory.Measure.{u_4} α inst) → @MeasureTheory.Measure.{u_5} β inst_1
```

Definition body (one-level semantic boundary):

```lean
MeasureTheory.Measure.wrapped✝.1
```

### D025: `MeasureTheory.Measure.real`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `4723537c549f4ae1a83b89820f96e884bcbc0bc734ccd6e543bbf82330bffc29`

Type:

```lean
{α : Type u_6} → {m : MeasurableSpace α} → MeasureTheory.Measure α → Set α → Real
```

Fully explicit type:

```lean
{α : Type u_6} → {m : MeasurableSpace.{u_6} α} → (μ : @MeasureTheory.Measure.{u_6} α m) → (s : Set.{u_6} α) → Real
```

Definition body (one-level semantic boundary):

```lean
fun {α} {m} μ s => (MeasureTheory.Measure.instFunLike.coe μ s).toReal
```

### D026: `Nat`

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

### D027: `Nat.cast`

- Role: `external-frontier`
- Owner module: `Init.Data.Cast`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `6e24327ea908b1837083bb15aef27d593e950a2ff8ade81d8aa94bfe33b64450`

Type:

```lean
{R : Type u} → [NatCast R] → Nat → R
```

Fully explicit type:

```lean
{R : Type u} → [NatCast.{u} R] → Nat → R
```

Definition body (one-level semantic boundary):

```lean
fun {R} [inst : NatCast R] => inst.natCast
```

### D028: `Nat.instAtLeastTwoHAddOfNat`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Init`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `309ef94c4b7cfbe2e668952e6915279353921d5d48b6123a30f90dd932dac3e6`

Type:

```lean
∀ (n : Nat) [NeZero n], (instHAdd.hAdd n 1).AtLeastTwo
```

Fully explicit type:

```lean
∀ (n : Nat) [@NeZero.{0} Nat (@Zero.ofOfNat0.{0} Nat (instOfNatNat (nat_lit 0))) n],
  Nat.AtLeastTwo
    (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) n
      (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))
```

### D029: `Nat.instNeZeroSucc`

- Role: `external-frontier`
- Owner module: `Init.Data.Nat.Basic`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `a0735a528184c05594c4c79312c1225bb4dcffcdf0df7eb1a50c5733047c85ad`

Type:

```lean
∀ {n : Nat}, NeZero (instHAdd.hAdd n 1)
```

Fully explicit type:

```lean
∀ {n : Nat},
  @NeZero.{0} Nat (@Zero.ofOfNat0.{0} Nat (instOfNatNat (nat_lit 0)))
    (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) n
      (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))
```

### D030: `OfNat.ofNat`

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

### D031: `PMF.toMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8ced32cd3241e2bc9f46b87ddce71f2df9ec2334668bbaee227f0214d496a02d`

Type:

```lean
{α : Type u_1} → [inst : MeasurableSpace α] → PMF α → MeasureTheory.Measure α
```

Fully explicit type:

```lean
{α : Type u_1} → [inst : MeasurableSpace.{u_1} α] → (p : PMF.{u_1} α) → @MeasureTheory.Measure.{u_1} α inst
```

Definition body (one-level semantic boundary):

```lean
fun {α} [MeasurableSpace α] p => p.toOuterMeasure.toMeasure ⋯
```

### D032: `ProbabilityTheory.iIndepFun`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.Independence.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `fc42c9fb6cb6d72ada8e7605b71644561e188fc9c555246dd3ef51d84fa13130`

Type:

```lean
{Ω : Type u_1} →
  {ι : Type u_2} →
    {_mΩ : MeasurableSpace Ω} →
      {β : ι → Type u_6} →
        [m : (x : ι) → MeasurableSpace (β x)] →
          ((x : ι) → Ω → β x) → autoParam (MeasureTheory.Measure Ω) ProbabilityTheory.iIndepFun._auto_1 → Prop
```

Fully explicit type:

```lean
{Ω : Type u_1} →
  {ι : Type u_2} →
    {_mΩ : MeasurableSpace.{u_1} Ω} →
      {β : ι → Type u_6} →
        [m : (x : ι) → MeasurableSpace.{u_6} (β x)] →
          (f : (x : ι) → Ω → β x) →
            (μ : autoParam.{u_1 + 1} (@MeasureTheory.Measure.{u_1} Ω _mΩ) ProbabilityTheory.iIndepFun._auto_1) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} {ι} {_mΩ} {β} [(x : ι) → MeasurableSpace (β x)] f μ =>
  ProbabilityTheory.Kernel.iIndepFun f (ProbabilityTheory.Kernel.const Unit μ) (MeasureTheory.Measure.dirac Unit.unit)
```

### D033: `Real`

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

### D034: `Real.instAddCommMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `11a549e6c9caa007a4627570dd86aea756ada755f141da0356b8766788f2eef7`

Type:

```lean
AddCommMonoid Real
```

Fully explicit type:

```lean
AddCommMonoid.{0} Real
```

Definition body (one-level semantic boundary):

```lean
inferInstance
```

### D035: `Real.instAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f0de8cbc2c873a19be749cd9b2d3cc9a6edb9ebc92020a1877714a50c23d9dc0`

Type:

```lean
AddGroup Real
```

Fully explicit type:

```lean
AddGroup.{0} Real
```

Definition body (one-level semantic boundary):

```lean
inferInstance
```

### D036: `Real.instDivInvMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `166f2abb65bf1271e5e8d70fdb78c55672c7e366b30439e83b517f803cdefac3`

Type:

```lean
DivInvMonoid Real
```

Fully explicit type:

```lean
DivInvMonoid.{0} Real
```

Definition body (one-level semantic boundary):

```lean
{ toMonoid := Real.instMonoid, toInv := Real.instInv, div := DivInvMonoid.div',
  div_eq_mul_inv := Real.instDivInvMonoid._proof_1, zpow := zpowRec, zpow_zero' := Real.instDivInvMonoid._proof_2,
  zpow_succ' := Real.instDivInvMonoid._proof_3, zpow_neg' := Real.instDivInvMonoid._proof_4 }
```

### D037: `Real.instLE`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `144d825fc543455e17044e843560e0415f8e4e9da60afb52f34edb809b7c34d3`

Type:

```lean
LE Real
```

Fully explicit type:

```lean
LE.{0} Real
```

Definition body (one-level semantic boundary):

```lean
{ le := Real.le✝ }
```

### D038: `Real.instMul`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `459ccbe28a1d29ccd2b329ea29e1a84b329b8064b8a8ecc52764b69b23e229ed`

Type:

```lean
Mul Real
```

Fully explicit type:

```lean
Mul.{0} Real
```

Definition body (one-level semantic boundary):

```lean
{ mul := Real.mul✝ }
```

### D039: `Real.instNatCast`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5fc7a7becbc71d472fa1a28bd92d79b4c6ea4fdc643db7380031a2b890ca7e15`

Type:

```lean
NatCast Real
```

Fully explicit type:

```lean
NatCast.{0} Real
```

Definition body (one-level semantic boundary):

```lean
{ natCast := fun n => { cauchy := n.cast } }
```

### D040: `Real.instSub`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `926d9e8fcca2819a885d446e168b20c7c8aac2e542d59ed2b48e32c9a4659a36`

Type:

```lean
Sub Real
```

Fully explicit type:

```lean
Sub.{0} Real
```

Definition body (one-level semantic boundary):

```lean
{ sub := fun a b => instHAdd.hAdd a (Real.instNeg.neg b) }
```

### D041: `Real.lattice`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5bccf78d647cf08233ff548c19523f80b1d1bf11b5a76aa50396199e2c0c7510`

Type:

```lean
Lattice Real
```

Fully explicit type:

```lean
Lattice.{0} Real
```

Definition body (one-level semantic boundary):

```lean
inferInstance
```

### D042: `abs`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Order.Group.Unbundled.Abs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8ec55bade8dee4d49822a9bdbd84db24c019b8d568452329d9766390229a9c1b`

Type:

```lean
{α : Type u_1} → [Lattice α] → [AddGroup α] → α → α
```

Fully explicit type:

```lean
{α : Type u_1} → [Lattice.{u_1} α] → [AddGroup.{u_1} α] → (a : α) → α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [Lattice α] [AddGroup α] a =>
  SemilatticeSup.toMax.max a (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg a)
```

### D043: `instHDiv`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `ea3478ce3daf37e2cbdcd4bfaf7b5142fd7d274b56d75d2fae007c15e1b89871`

Type:

```lean
{α : Type u_1} → [Div α] → HDiv α α α
```

Fully explicit type:

```lean
{α : Type u_1} → [Div.{u_1} α] → HDiv.{u_1, u_1, u_1} α α α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Div α] => { hDiv := fun a b => inst.div a b }
```

### D044: `instHMul`

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

### D045: `instHSub`

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

### D046: `instLTNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `4054f2341fdda887b2040c624c0867866ab56eabf3441d6ffc9451c94ae1663c`

Type:

```lean
LT Nat
```

Fully explicit type:

```lean
LT.{0} Nat
```

Definition body (one-level semantic boundary):

```lean
{ lt := Nat.lt }
```

### D047: `instOfNatAtLeastTwo`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `37355febc51d6fa8ff12fc8e7b429771db340390d46411d7608c566bdffd358d`

Type:

```lean
{R : Type u_1} → {n : Nat} → [NatCast R] → [n.AtLeastTwo] → OfNat R n
```

Fully explicit type:

```lean
{R : Type u_1} → {n : Nat} → [NatCast.{u_1} R] → [Nat.AtLeastTwo n] → OfNat.{u_1} R n
```

Definition body (one-level semantic boundary):

```lean
fun {R} {n} [NatCast R] [n.AtLeastTwo] => { ofNat := n.cast }
```

### D048: `instOfNatNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7018dea92aae8c272f3a065f25e2bedb9732a0b602c3d54b166fa0cf2ce1ea92`

Type:

```lean
(n : Nat) → OfNat Nat n
```

Fully explicit type:

```lean
(n : Nat) → OfNat.{0} Nat n
```

Definition body (one-level semantic boundary):

```lean
fun n => { ofNat := n }
```

### D049: `setOf`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D050: `AddCommMonoidWithOne.toAddMonoidWithOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `07f48d3cfc3c7c30b6298df8531409d9844ab8c7e0ba94dea2a3fd29879320af`

Type:

```lean
{R : Type u_2} → [self : AddCommMonoidWithOne R] → AddMonoidWithOne R
```

Fully explicit type:

```lean
{R : Type u_2} → [self : AddCommMonoidWithOne.{u_2} R] → AddMonoidWithOne.{u_2} R
```

Definition body (one-level semantic boundary):

```lean
fun R [self : AddCommMonoidWithOne R] => self.1
```

### D051: `AddMonoidWithOne.toNatCast`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `6b956e88ee642e7533983b76ff8087f4537eea04f025165ce1fa45dc80e795a2`

Type:

```lean
{R : Type u_2} → [self : AddMonoidWithOne R] → NatCast R
```

Fully explicit type:

```lean
{R : Type u_2} → [self : AddMonoidWithOne.{u_2} R] → NatCast.{u_2} R
```

Definition body (one-level semantic boundary):

```lean
fun R [self : AddMonoidWithOne R] => self.1
```

### D052: `Bool.true`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `constructor`
- Distance from target type: `2`
- Semantic SHA-256: `97e763ea95d8452117cf5762fd67acddd549677f08ccfa348c4bf23db7eaa9d8`

Type:

```lean
Bool
```

Fully explicit type:

```lean
Bool
```

### D053: `NNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `490ebc1f72b3ced8506e1bcbd0016d4c351adf097644509fd1dd17a93c4e950f`

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
Subtype fun r => Real.instLE.le 0 r
```

### D054: `NNReal.instDiv`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `db7c02aebe99430b40db2791a53ab6674123591ebf2c7ce532fb26b074337486`

Type:

```lean
Div NNReal
```

Fully explicit type:

```lean
Div.{0} NNReal
```

Definition body (one-level semantic boundary):

```lean
{ div := fun x y => ⟨instHDiv.hDiv x.toReal y.toReal, ⋯⟩ }
```

### D055: `NonAssocSemiring.toAddCommMonoidWithOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `6e4c898b19286580a5053df0525278998daaf3b1687c7526ed8df20324dc7aa0`

Type:

```lean
{α : Type u} → [self : NonAssocSemiring α] → AddCommMonoidWithOne α
```

Fully explicit type:

```lean
{α : Type u} → [self : NonAssocSemiring.{u} α] → AddCommMonoidWithOne.{u} α
```

Definition body (one-level semantic boundary):

```lean
fun α self =>
  { toNatCast := self.toNatCast, toAddMonoid := self.toAddMonoid, toOne := self.toOne, natCast_zero := ⋯,
    natCast_succ := ⋯, add_comm := ⋯ }
```

### D056: `One.toOfNat1`

- Role: `external-frontier`
- Owner module: `Init.Data.Zero`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D057: `PMF`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `5cdd3cb545c2651a0d9472303e779ab9bdd063a0c7b1e1e553a96f7f194b1a15`

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
fun α => Subtype fun f => HasSum f 1
```

### D058: `PMF.bernoulli`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Constructions`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `bba28f3661de43e15fcaea9407d11973130e7602dc95b0d69470efe600d7b74f`

Type:

```lean
(p : NNReal) → instPartialOrderNNReal.le p 1 → PMF Bool
```

Fully explicit type:

```lean
(p : NNReal) →
  (h :
      @LE.le.{0} NNReal (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal)) p
        (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))) →
    PMF.{0} Bool
```

Definition body (one-level semantic boundary):

```lean
fun p h => PMF.ofFintype (fun b => bif b then ENNReal.ofNNReal p else instHSub.hSub 1 (ENNReal.ofNNReal p)) ⋯
```

### D059: `Real.instOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D060: `Real.instZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D061: `Semiring.toNonAssocSemiring`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `2`
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

### D062: `Zero.toOfNat0`

- Role: `external-frontier`
- Owner module: `Init.Data.Zero`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D063: `instDecidableEqBool`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `dedf43b35e221c78c811d0b7268b7be703d67b744ad16b23df01af14b2aa5899`

Type:

```lean
DecidableEq Bool
```

Fully explicit type:

```lean
DecidableEq.{1} Bool
```

Definition body (one-level semantic boundary):

```lean
Bool.decEq
```

### D064: `instOneNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `be1ba7c9e9b4395e59c17c7a89b726801d594c6c78763ffff9bb49c61ecf93a2`

Type:

```lean
One NNReal
```

Fully explicit type:

```lean
One.{0} NNReal
```

Definition body (one-level semantic boundary):

```lean
Nonneg.one
```

### D065: `instSemiringNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `3e4e8247feefdb8229f2843910b9a5df0fb872cbeba12353f5c00b1549c1f2b5`

Type:

```lean
Semiring NNReal
```

Fully explicit type:

```lean
Semiring.{0} NNReal
```

Definition body (one-level semantic boundary):

```lean
Nonneg.semiring
```

### D066: `ite`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `3029bae29d2d16b5aeb879ad3c12a1b3c4e78998083bf1ab4614942fafdece0e`

Type:

```lean
{α : Sort u} → (c : Prop) → [h : Decidable c] → α → α → α
```

Fully explicit type:

```lean
{α : Sort u} → (c : Prop) → [h : Decidable c] → (t e : α) → α
```

Definition body (one-level semantic boundary):

```lean
fun {α} c [h : Decidable c] t e => Decidable.casesOn h (fun x => e) fun x => t
```

### D067: `HAdd.hAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `3`
- Semantic SHA-256: `e0bf2a92addd6ea713343e4ef69f67e4e1155781d08f46957b9f71412d865f59`

Type:

```lean
{α : Type u} → {β : Type v} → {γ : outParam (Type w)} → [self : HAdd α β γ] → α → β → γ
```

Fully explicit type:

```lean
{α : Type u} → {β : Type v} → {γ : outParam.{w + 2} (Type w)} → [self : HAdd.{u, v, w} α β γ] → α → β → γ
```

Definition body (one-level semantic boundary):

```lean
fun α β {γ} [self : HAdd α β γ] => self.1
```

### D068: `Nat.AtLeastTwo`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Init`
- Declaration kind: `inductive`
- Distance from target type: `3`
- Semantic SHA-256: `318e11b8f9340f2f451d638786dd4fca470dece62824f4adc3bd18b5289aa911`

Type:

```lean
Nat → Prop
```

Fully explicit type:

```lean
(n : Nat) → Prop
```

### D069: `PartialOrder.toPreorder`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Defs.PartialOrder`
- Declaration kind: `abbrev`
- Distance from target type: `3`
- Semantic SHA-256: `079686fa1ec6d596bcdb475c56a12b7f5a0594bf346c64220c2c992e0f0aae3b`

Type:

```lean
{α : Type u_2} → [self : PartialOrder α] → Preorder α
```

Fully explicit type:

```lean
{α : Type u_2} → [self : PartialOrder.{u_2} α] → Preorder.{u_2} α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : PartialOrder α] => self.1
```

### D070: `Preorder.toLE`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Defs.PartialOrder`
- Declaration kind: `abbrev`
- Distance from target type: `3`
- Semantic SHA-256: `a2229e231e0928e24fffee5432201e35fadad80e7f6e4738e0d251c3c01a4676`

Type:

```lean
{α : Type u_2} → [self : Preorder α] → LE α
```

Fully explicit type:

```lean
{α : Type u_2} → [self : Preorder.{u_2} α] → LE.{u_2} α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : Preorder α] => self.1
```

### D071: `instAddNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `a1534bcd3e1888406ac787d30eeff8a284cb6688c23f5e8de09351dda91a280c`

Type:

```lean
Add Nat
```

Fully explicit type:

```lean
Add.{0} Nat
```

Definition body (one-level semantic boundary):

```lean
{ add := Nat.add }
```

### D072: `instHAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `38066efd17aeeca52ec2890d9aafca2fa3cce8fda7f5843c1b8e5da130d93981`

Type:

```lean
{α : Type u_1} → [Add α] → HAdd α α α
```

Fully explicit type:

```lean
{α : Type u_1} → [Add.{u_1} α] → HAdd.{u_1, u_1, u_1} α α α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Add α] => { hAdd := fun a b => inst.add a b }
```

### D073: `instPartialOrderNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `f4a763f4ba425a9513216d6fa2ff1928b1eb5120c77749230299df64cb590bb5`

Type:

```lean
PartialOrder NNReal
```

Fully explicit type:

```lean
PartialOrder.{0} NNReal
```

Definition body (one-level semantic boundary):

```lean
Subtype.partialOrder fun r => Real.instLE.le 0 r
```

## Complete local imported sources

### `NumStability.HDP.Scalar.Preliminaries`

Path: `lean-numerical-stability/NumStability/HDP/Scalar/Preliminaries.lean`
SHA-256: `2b46619bdaa0a7414311b311eb89aabf2e19b0904631502d5d174ea758f88007`

```lean
import Mathlib.Probability.Moments.Variance
import Mathlib.Probability.CDF
import Mathlib.MeasureTheory.Function.LpSpace.Basic
import Mathlib.MeasureTheory.Function.LpSpace.Complete
import Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm
import Mathlib.MeasureTheory.Function.LpSeminorm.Indicator
import Mathlib.Probability.UniformOn
import Mathlib.Analysis.Convex.Integral
import Mathlib.Analysis.Convex.Continuous
import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.MeasureTheory.Integral.Lebesgue.Markov
import Mathlib.MeasureTheory.Integral.Layercake
import Mathlib.MeasureTheory.Measure.Lebesgue.Integral
import Mathlib.Probability.Distributions.Cauchy
import Mathlib.Analysis.SpecialFunctions.NonIntegrable
import Mathlib.Analysis.SpecialFunctions.Pow.Integral
import Mathlib.Tactic

/-!
# Expectation and variance

This module gives the Chapter 1, Section 1.1 source-facing bridge.  The
underlying expectation is the Bochner integral, while variance is the
expectation of the squared centered variable.  Integrability is made explicit
in the centered-variable API, since the textbook suppresses it.
-/

noncomputable section

open MeasureTheory
open Probability

namespace NumStability.HDP.Scalar.Preliminaries

/-- The distribution (pushforward law) of `X` under `μ`. -/
noncomputable def distribution {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) : Measure ℝ :=
  Measure.map X μ

/-- The extended-real CDF of `X`, evaluated at `t`. -/
noncomputable def cdf {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) (t : ℝ) : ENNReal :=
  distribution μ X (Set.Iic t)

/-- The extended-real upper tail probability of `X` at `t`. -/
noncomputable def upperTail {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) (t : ℝ) : ENNReal :=
  distribution μ X (Set.Ioi t)

/-- The source-facing distribution, CDF, and upper-tail interface. -/
structure CDFTailModelData
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) where
  distribution : Measure ℝ
  cdf : ℝ → ENNReal
  upperTail : ℝ → ENNReal

/-- Package the distribution, CDF, and upper-tail definitions for `X`. -/
noncomputable def cdfTailModel
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) : CDFTailModelData μ X :=
  { distribution := distribution μ X
    cdf := cdf μ X
    upperTail := upperTail μ X }

/-- A measurable random variable pushes a probability measure to a probability law. -/
theorem distribution_isProbabilityMeasure
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hX : AEMeasurable X μ) :
    IsProbabilityMeasure (distribution μ X) := by
  exact Measure.isProbabilityMeasure_map hX

/-- The CDF is the probability of the corresponding lower half-line. -/
theorem cdf_eq_measure_preimage
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X : Ω → ℝ} (hX : AEMeasurable X μ) (t : ℝ) :
    cdf μ X t = μ (X ⁻¹' Set.Iic t) := by
  rw [cdf, distribution, Measure.map_apply_of_aemeasurable hX measurableSet_Iic]

/-- The upper tail is one minus the CDF under a probability measure. -/
theorem upperTail_eq_one_sub_cdf
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hX : AEMeasurable X μ) (t : ℝ) :
    upperTail μ X t = 1 - cdf μ X t := by
  letI : IsProbabilityMeasure (distribution μ X) :=
    distribution_isProbabilityMeasure hX
  unfold upperTail cdf
  rw [← Set.compl_Iic]
  exact prob_compl_eq_one_sub measurableSet_Iic

/-- The CDF is monotone in its threshold. -/
theorem monotone_cdf
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) :
    Monotone (cdf μ X) := by
  intro s t hst
  exact measure_mono (Set.Iic_subset_Iic.2 hst)

/-! The CDF uniqueness bridge for real probability laws. -/
theorem cdfDeterminesLaw
    {μ ν : Measure ℝ} [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] :
    (∀ t : ℝ, μ (Set.Iic t) = ν (Set.Iic t)) ↔ μ = ν := by
  constructor
  · intro h
    apply Measure.eq_of_cdf μ ν
    ext t
    rw [ProbabilityTheory.cdf_eq_real, ProbabilityTheory.cdf_eq_real]
    simpa [measureReal_def] using congrArg ENNReal.toReal (h t)
  · intro h t
    rw [h]

/-- The book's mean notation, represented by the Bochner integral. -/
def expectation {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) : ℝ :=
  ∫ ω, X ω ∂μ

/- The source notation `1_E`, represented as the real-valued indicator. -/
def indicatorFunction {Ω : Type*} [MeasurableSpace Ω]
    (E : Set Ω) : Ω → ℝ :=
  Set.indicator E (fun _ => 1)

/- The expectation identity is stated with `Measure.real`, the real-valued
  form of a measure, because the Bochner integral is real-valued. -/
theorem indicatorExpectation
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (E : Set Ω) (hE : MeasurableSet E) :
    expectation μ (indicatorFunction E) = μ.real E := by
  unfold expectation indicatorFunction
  exact integral_indicator_one hE

/-- Raw moments are restricted to natural exponents. -/
def rawMoment
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) (n : ℕ) : ℝ :=
  expectation μ (fun ω => X ω ^ n)

/-- Positive-real moments use the absolute value before real exponentiation. -/
def absoluteMoment
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) (p : ℝ) : ENNReal :=
  ∫⁻ ω, ENNReal.ofReal (Real.rpow |X ω| p) ∂μ

/-! The representative and quotient-level `Lᵖ` interface. -/
structure LpNormSpaceModelData
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (p : ENNReal) where
  representativeNorm : (Ω → ℝ) → ENNReal
  representativeNorm_eq : ∀ X, representativeNorm X = eLpNorm X p μ
  representativeMember : (Ω → ℝ) → Prop
  representativeMember_iff : ∀ X, representativeMember X ↔ MemLp X p μ
  quotient : AddSubgroup (Ω →ₘ[μ] ℝ)
  quotient_eq : quotient = MeasureTheory.Lp ℝ p μ

def lpNormSpaceModel
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (p : ENNReal) : LpNormSpaceModelData μ p :=
  { representativeNorm := fun X => eLpNorm X p μ
    representativeNorm_eq := fun _ => rfl
    representativeMember := fun X => MemLp X p μ
    representativeMember_iff := fun _ => Iff.rfl
    quotient := MeasureTheory.Lp ℝ p μ
    quotient_eq := rfl }

/-- Finite raw moment predicate for a natural exponent. -/
def HasFiniteRawMoment
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) (n : ℕ) : Prop :=
  Integrable (fun ω => X ω ^ n) μ

/-- Finite absolute moment predicate for a positive real exponent. -/
def HasFiniteAbsoluteMoment
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) (p : ℝ) : Prop :=
  absoluteMoment μ X p < (⊤ : ENNReal)

/-- The nonnegative exponential integrand used by the extended MGF. -/
def exponentialIntegrand
    {α : Type*} (X : α → ℝ) (t : ℝ) : α → ℝ :=
  fun x => Real.exp (t * X x)

/-- The unconditional, extended-real moment generating function. -/
def mgf
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) (t : ℝ) : ENNReal :=
  ∫⁻ ω, ENNReal.ofReal (exponentialIntegrand X t ω) ∂μ

/-- The parameter values at which the extended MGF is finite. -/
def mgfDomain
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) : Set ℝ :=
  {t | mgf μ X t < (⊤ : ENNReal)}

/-- Exponential integrability permits the usual real-valued MGF notation. -/
def HasExponentialIntegrability
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) (t : ℝ) : Prop :=
  Integrable (exponentialIntegrand X t) μ

/-- The real-valued MGF on an explicitly integrable parameter. -/
def realMgf
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) (t : ℝ) : ℝ :=
  expectation μ (exponentialIntegrand X t)

/-- Source-facing extended and finite-real MGF interfaces. -/
structure MGFModelData
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) where
  measurable : AEMeasurable X μ
  extended : ℝ → ENNReal
  extended_eq : ∀ t, extended t = mgf μ X t
  domain : Set ℝ
  domain_eq : domain = mgfDomain μ X
  real : ℝ → ℝ
  real_eq : ∀ t, real t = realMgf μ X t
  real_domain : ∀ t, t ∈ domain → HasExponentialIntegrability μ X t

theorem no_real_square_root_neg_one :
    ¬ ∃ y : ℝ, y ^ 2 = -1 := by
  rintro ⟨y, hy⟩
  nlinarith [sq_nonneg y]

/-- Corrected raw/absolute moment interface, including the printed obstruction. -/
structure MomentModelData
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) where
  raw : ℕ → ℝ
  raw_eq : ∀ n, raw n = rawMoment μ X n
  absolute : ℝ → ENNReal
  absolute_eq : ∀ p, absolute p = absoluteMoment μ X p
  finite_raw : ∀ n, HasFiniteRawMoment μ X n
  finite_absolute : ∀ p, 0 < p → HasFiniteAbsoluteMoment μ X p
  source_obstruction : ¬ ∃ y : ℝ, y ^ 2 = -1

def momentModelData
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ)
    (hraw : ℕ → ℝ)
    (hraw_eq : ∀ n, hraw n = rawMoment μ X n)
    (habsolute : ℝ → ENNReal)
    (habsolute_eq : ∀ p, habsolute p = absoluteMoment μ X p)
    (hfinite_raw : ∀ n, HasFiniteRawMoment μ X n)
    (hfinite_absolute : ∀ p, 0 < p → HasFiniteAbsoluteMoment μ X p) :
    MomentModelData μ X where
  raw := hraw
  raw_eq := hraw_eq
  absolute := habsolute
  absolute_eq := habsolute_eq
  finite_raw := hfinite_raw
  finite_absolute := hfinite_absolute
  source_obstruction := no_real_square_root_neg_one

/-- Whole-domain convexity interface reused by Jensen's inequality. -/
def convexFunctionInterface (φ : ℝ → ℝ) : Prop :=
  ConvexOn ℝ Set.univ φ

theorem convexFunction_sublevel_convex
    {φ : ℝ → ℝ} (hφ : convexFunctionInterface φ) (r : ℝ) :
    Convex ℝ {x : ℝ | x ∈ (Set.univ : Set ℝ) ∧ φ x ≤ r} := by
  exact hφ.convex_le r

/-! Jensen's inequality for a whole-domain real convex function. -/
theorem jensenIntegral
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {φ : ℝ → ℝ}
    (hφ : ConvexOn ℝ Set.univ φ)
    (hX : Integrable X μ)
    (hφX : Integrable (fun ω => φ (X ω)) μ) :
    φ (expectation μ X) ≤ expectation μ (fun ω => φ (X ω)) := by
  have h := hφ.map_integral_le (s := (Set.univ : Set ℝ))
    (f := X) (g := φ) (hφ.continuousOn isOpen_univ) isClosed_univ
    (Filter.Eventually.of_forall (fun _ => Set.mem_univ _)) hX hφX
  simpa [expectation, Function.comp_def] using h

/-- The book's variance, represented by the centered second moment. -/
def variance {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) : ℝ :=
  expectation μ (fun ω => (X ω - expectation μ X) ^ 2)

/-!
  Representative-level real `L²` geometry.  The formulas stay in the
  chapter's Bochner-expectation convention; quotient-space identification is
  delegated to Mathlib's `MeasureTheory.Lp`.
-/
def l2InnerProduct {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X Y : Ω → ℝ) : ℝ :=
  expectation μ (fun ω => X ω * Y ω)

noncomputable def l2Norm {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) : ℝ :=
  Real.sqrt (expectation μ (fun ω => (X ω) ^ 2))

/-- The source-facing standard deviation, with the square root made explicit. -/
def standardDeviation {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) : ℝ :=
  Real.sqrt (variance μ X)

/-- The representative-level covariance of two real random variables. -/
def covariance {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X Y : Ω → ℝ) : ℝ :=
  expectation μ (fun ω =>
    (X ω - expectation μ X) * (Y ω - expectation μ Y))

/-! The two geometric identities from Remark 1.1.1 are definitional once the
source quantities are represented by the centered expectation formulas. -/
theorem stdevCovarianceIdentities
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X Y : Ω → ℝ) :
    (l2Norm μ (fun ω => X ω - expectation μ X) = standardDeviation μ X) ∧
      (covariance μ X Y =
        l2InnerProduct μ
          (fun ω => X ω - expectation μ X)
          (fun ω => Y ω - expectation μ Y)) := by
  constructor
  · rfl
  · rfl

structure L2GeometryModelData
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X Y : Ω → ℝ) where
  inner_product : ℝ
  inner_product_eq : inner_product = l2InnerProduct μ X Y
  x_norm : ℝ
  x_norm_eq : x_norm = l2Norm μ X
  y_norm : ℝ
  y_norm_eq : y_norm = l2Norm μ Y

def l2GeometryModel
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X Y : Ω → ℝ) :
    L2GeometryModelData μ X Y :=
  { inner_product := l2InnerProduct μ X Y
    inner_product_eq := rfl
    x_norm := l2Norm μ X
    x_norm_eq := rfl
    y_norm := l2Norm μ Y
    y_norm_eq := rfl }

/-- The centered variable has zero expectation under the book's probability assumptions. -/
theorem expectation_centered
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hX : Integrable X μ) :
    expectation μ (fun ω => X ω - expectation μ X) = 0 := by
  unfold expectation
  change (∫ ω, X ω - expectation μ X ∂μ) = 0
  rw [integral_sub hX (integrable_const (expectation μ X))]
  simp [expectation]

/-- Variance is definitionally the expectation of the squared centered variable. -/
theorem variance_eq_centered_expectation
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) :
    variance μ X = expectation μ (fun ω => (X ω - expectation μ X) ^ 2) :=
  rfl

/-! The pointwise layer-cake identity used in the proof of Lemma 1.2.1. -/
theorem layerCakePointwise {x : ℝ} (hx : 0 ≤ x) :
    x = (∫ t in Set.Ioc 0 x, (1 : ℝ) ∂volume) ∧
      ENNReal.ofReal x =
        ∫⁻ t in Set.Ioi 0,
          (Set.Iio x).indicator (fun _ => (1 : ENNReal)) t ∂volume := by
  have hset : Set.Iio x ∩ Set.Ioi 0 = Set.Ioo 0 x := by
    ext t
    simp [and_comm]
  constructor
  · rw [MeasureTheory.setIntegral_const]
    simp [Real.volume_real_Ioc_of_le hx]
  · calc
      ENNReal.ofReal x = ENNReal.ofReal (x - 0) := by simp
      _ = volume (Set.Ioo 0 x) := by rw [Real.volume_Ioo]
      _ = ∫⁻ t in Set.Ioo 0 x, (1 : ENNReal) ∂volume := by
        rw [MeasureTheory.setLIntegral_one]
      _ = ∫⁻ t in Set.Iio x ∩ Set.Ioi 0, (1 : ENNReal) ∂volume := by
        rw [hset]
      _ = ∫⁻ t in Set.Ioi 0,
          (Set.Iio x).indicator (fun _ => (1 : ENNReal)) t ∂volume := by
        symm
        rw [MeasureTheory.setLIntegral_indicator measurableSet_Iio]

/-! The expectation/tail identity from Lemma 1.2.1. -/
theorem layerCakeExpectationExtended
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hX : Measurable X)
    (hNonneg : ∀ ω, 0 ≤ X ω) :
    (∫⁻ ω, ENNReal.ofReal (X ω) ∂μ) =
      ∫⁻ t in Set.Ioi 0, μ {ω | t < X ω} := by
  exact MeasureTheory.lintegral_eq_lintegral_meas_lt μ
    (Filter.Eventually.of_forall hNonneg) hX.aemeasurable

theorem layerCakeExpectationFinite
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hX : Measurable X)
    (hNonneg : ∀ ω, 0 ≤ X ω) (hInt : Integrable X μ) :
    expectation μ X =
      ∫ t in Set.Ioi 0, μ.real {ω | t < X ω} := by
  exact hInt.integral_eq_integral_meas_lt
    (Filter.Eventually.of_forall hNonneg)

theorem layerCakeExpectation
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hX : Measurable X)
    (hNonneg : ∀ ω, 0 ≤ X ω) :
    ((∫⁻ ω, ENNReal.ofReal (X ω) ∂μ) =
        ∫⁻ t in Set.Ioi 0, μ {ω | t < X ω}) ∧
      (∀ hInt : Integrable X μ,
        expectation μ X =
          ∫ t in Set.Ioi 0, μ.real {ω | t < X ω}) := by
  refine ⟨layerCakeExpectationExtended hX hNonneg, ?_⟩
  intro hInt
  exact layerCakeExpectationFinite hX hNonneg hInt

/-! The corrected positive/negative-part form of Exercise 1.2.2.  The
    textbook's signed tail subtraction is only used after integrability has
    made both real integrals finite; the two extended identities remain
    separate nonnegative statements. -/
theorem exercise122PositiveNegativeLayerCake
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hX : Measurable X) :
    (∫⁻ ω, ENNReal.ofReal (max (X ω) 0) ∂μ =
        ∫⁻ t in Set.Ioi 0, μ {ω | t < max (X ω) 0}) ∧
      (∫⁻ ω, ENNReal.ofReal (max (-X ω) 0) ∂μ =
        ∫⁻ t in Set.Ioi 0, μ {ω | t < max (-X ω) 0}) := by
  have hpos : Measurable (fun ω => max (X ω) 0) := hX.max measurable_const
  have hneg : Measurable (fun ω => max (-X ω) 0) :=
    (hX.neg).max measurable_const
  exact ⟨layerCakeExpectationExtended hpos
      (fun ω => le_max_right (X ω) 0),
    layerCakeExpectationExtended hneg
      (fun ω => le_max_right (-X ω) 0)⟩

theorem exercise122CorrectedSignedTailFormula
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hX : Measurable X) (hInt : Integrable X μ) :
    ∫ ω, X ω ∂μ =
      (∫ t in Set.Ioi 0, μ.real {a | t < X a}) -
        (∫ t in Set.Iio 0, μ.real {a | X a < t}) := by
  have hintpos : Integrable (fun ω => max (X ω) 0) μ := by
    have h' := hInt.real_toNNReal
    convert h' using 1
  have hintneg : Integrable (fun ω => max (-X ω) 0) μ := by
    have h' := hInt.neg.real_toNNReal
    convert h' using 1
  have hfinitepos := hintpos.integral_eq_integral_meas_lt
    (Filter.Eventually.of_forall (fun ω => le_max_right (X ω) 0))
  rw [integral_eq_integral_pos_part_sub_integral_neg_part hInt]
  have hpos_eq : (fun ω => (Real.toNNReal (X ω) : ℝ)) =
      (fun ω => max (X ω) 0) := by
    funext ω
    by_cases hx : 0 ≤ X ω
    · rw [Real.toNNReal_of_nonneg hx]
      simp [max_eq_left hx]
    · have hx' : X ω ≤ 0 := le_of_not_ge hx
      rw [Real.toNNReal_of_nonpos hx']
      simp [max_eq_right hx']
  have hneg_eq : (fun ω => (Real.toNNReal (-X ω) : ℝ)) =
      (fun ω => max (-X ω) 0) := by
    funext ω
    by_cases hx : 0 ≤ -X ω
    · rw [Real.toNNReal_of_nonneg hx]
      simp [max_eq_left hx]
    · have hx' : -X ω ≤ 0 := le_of_not_ge hx
      rw [Real.toNNReal_of_nonpos hx']
      simp [max_eq_right hx']
  rw [hpos_eq, hneg_eq, hfinitepos]
  have hfinneg := hintneg.integral_eq_integral_meas_lt
    (Filter.Eventually.of_forall (fun ω => le_max_right (-X ω) 0))
  rw [hfinneg]
  have hpos_tail :
      (∫ t in Set.Ioi 0, μ.real {a | t < max (X a) 0}) =
        ∫ t in Set.Ioi 0, μ.real {a | t < X a} := by
    apply setIntegral_congr_fun measurableSet_Ioi
    intro t ht
    apply congrArg μ.real
    ext a
    change (t < max (X a) 0) ↔ t < X a
    constructor
    · intro h
      exact (lt_max_iff.mp h).resolve_right (not_lt_of_ge ht.le)
    · intro h
      exact lt_max_iff.mpr (Or.inl h)
  have hneg_tail :
      (∫ t in Set.Ioi 0, μ.real {a | t < max (-X a) 0}) =
        ∫ t in Set.Iio 0, μ.real {a | X a < t} := by
    calc
      (∫ t in Set.Ioi 0, μ.real {a | t < max (-X a) 0}) =
          ∫ t in Set.Ioi 0, μ.real {a | X a < -t} := by
            apply setIntegral_congr_fun measurableSet_Ioi
            intro t ht
            apply congrArg μ.real
            ext a
            change (t < max (-X a) 0) ↔ X a < -t
            constructor
            · intro h
              have h' := (lt_max_iff.mp h).resolve_right
                (not_lt_of_ge ht.le)
              linarith
            · intro h
              exact lt_max_iff.mpr (Or.inl (by linarith))
      _ = ∫ t in Set.Iic 0, μ.real {a | X a < t} := by
        simpa only [neg_zero] using
          (integral_comp_neg_Ioi 0
            (fun t : ℝ => μ.real {a | X a < t}))
      _ = ∫ t in Set.Iio 0, μ.real {a | X a < t} :=
        integral_Iic_eq_integral_Iio
  convert congrArg₂ (· - ·) hpos_tail hneg_tail using 1

theorem exercise122Corrected
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hX : Measurable X) :
    ((∫⁻ ω, ENNReal.ofReal (max (X ω) 0) ∂μ =
        ∫⁻ t in Set.Ioi 0, μ {ω | t < max (X ω) 0}) ∧
      (∫⁻ ω, ENNReal.ofReal (max (-X ω) 0) ∂μ =
        ∫⁻ t in Set.Ioi 0, μ {ω | t < max (-X ω) 0})) ∧
      (∀ hInt : Integrable X μ,
        (∫ ω, X ω ∂μ) =
          (∫ t in Set.Ioi 0, μ.real {a | t < X a}) -
            (∫ t in Set.Iio 0, μ.real {a | X a < t})) := by
  exact ⟨exercise122PositiveNegativeLayerCake hX,
    fun hInt => exercise122CorrectedSignedTailFormula hX hInt⟩

/-! The source-level Cauchy obstruction for the unqualified signed formula. -/
lemma not_integrable_cauchy_pos :
    ¬ Integrable (fun x : ℝ => max x 0) (cauchyMeasure 0 1) := by
  intro h
  have hlin :
      (∫⁻ x, ENNReal.ofReal (max x 0) ∂cauchyMeasure 0 1) ≠ ⊤ := by
    apply (MeasureTheory.lintegral_ofReal_ne_top_iff_integrable
      ((measurable_id.max measurable_const).aestronglyMeasurable)
      (Filter.Eventually.of_forall (fun x => by positivity))).2
    exact h
  have hc : cauchyMeasure (0 : ℝ) (1 : NNReal) =
      volume.withDensity (cauchyPDF (0 : ℝ) (1 : NNReal)) :=
    cauchyMeasure_of_scale_ne_zero (0 : ℝ) (γ := (1 : NNReal)) one_ne_zero
  rw [hc] at hlin
  have hwd := MeasureTheory.lintegral_withDensity_eq_lintegral_mul₀
    (μ := (volume : Measure ℝ)) (f := cauchyPDF (0 : ℝ) (1 : NNReal))
    (g := fun x : ℝ => ENNReal.ofReal (max x 0))
    (measurable_cauchyPDF (0 : ℝ) (1 : NNReal)).aemeasurable
    ((measurable_id.max measurable_const).ennreal_ofReal).aemeasurable
  rw [hwd] at hlin
  have hprod :
      (∫⁻ x, ENNReal.ofReal
        (max x 0 * cauchyPDFReal 0 1 x) ∂volume) ≠ ⊤ := by
    have hpoint (x : ℝ) :
        (cauchyPDF (0 : ℝ) (1 : NNReal) x) * ENNReal.ofReal (max x 0) =
          ENNReal.ofReal (max x 0 * cauchyPDFReal 0 1 x) := by
      rw [cauchyPDF]
      calc
        ENNReal.ofReal (cauchyPDFReal 0 1 x) * ENNReal.ofReal (max x 0) =
            ENNReal.ofReal (cauchyPDFReal 0 1 x * max x 0) :=
          (ENNReal.ofReal_mul
            (cauchyPDF_pos (0 : ℝ) (by simp : (1 : NNReal) ≠ 0) x).le).symm
        _ = ENNReal.ofReal (max x 0 * cauchyPDFReal 0 1 x) := by
          rw [mul_comm]
    simpa only [Pi.mul_apply, hpoint] using hlin
  have hreal : Integrable
      (fun x : ℝ => max x 0 * cauchyPDFReal 0 1 x) volume := by
    apply (MeasureTheory.lintegral_ofReal_ne_top_iff_integrable (by fun_prop)
      (Filter.Eventually.of_forall (fun x =>
        mul_nonneg (by positivity)
          (cauchyPDF_pos (0 : ℝ) (by simp : (1 : NNReal) ≠ 0) x).le))).1
    exact hprod
  have htail : Integrable
      (fun x : ℝ => (2 * Real.pi) * (max x 0 * cauchyPDFReal 0 1 x))
      (volume.restrict (Set.Ioi 1)) := by
    apply (hreal.const_mul (2 * Real.pi)).mono_measure
    exact Measure.restrict_le_self
  have hinv : Integrable (fun x : ℝ => x⁻¹) (volume.restrict (Set.Ioi 1)) := by
    apply htail.mono' (by fun_prop)
    filter_upwards [ae_restrict_mem measurableSet_Ioi] with x hx
    have hx1 : 1 < x := hx
    have hx0 : 0 < x := lt_trans zero_lt_one hx1
    rw [Real.norm_eq_abs, abs_of_pos (inv_pos.mpr hx0),
      max_eq_left (show (0 : ℝ) ≤ x from hx0.le), Probability.cauchyPDFReal_def]
    norm_num
    field_simp
    nlinarith [sq_nonneg x, Real.pi_pos]
  exact not_integrableOn_Ioi_inv (a := 1) hinv

lemma cauchy_pos_lintegral_top :
    (∫⁻ x, ENNReal.ofReal (max x 0) ∂cauchyMeasure 0 1) = ⊤ := by
  by_contra htop
  apply not_integrable_cauchy_pos
  apply (MeasureTheory.lintegral_ofReal_ne_top_iff_integrable
    ((measurable_id.max measurable_const).aestronglyMeasurable)
    (Filter.Eventually.of_forall (fun x => by positivity))).1
  exact htop

lemma cauchy_pos_tail_top :
    (∫⁻ t in Set.Ioi 0,
      cauchyMeasure 0 1 {x | t < x}) = ⊤ := by
  have hcake := NumStability.HDP.Scalar.Preliminaries.layerCakeExpectationExtended
    (μ := cauchyMeasure 0 1) (X := fun x : ℝ => max x 0)
    (measurable_id.max measurable_const)
    (fun x => le_max_right x 0)
  have hset :
      (∫⁻ t in Set.Ioi 0,
        cauchyMeasure 0 1 {x | t < max x 0}) =
        ∫⁻ t in Set.Ioi 0,
          cauchyMeasure 0 1 {x | t < x} := by
    apply setLIntegral_congr_fun measurableSet_Ioi
    intro t ht
    have ht0 : 0 < t := ht
    apply congrArg (cauchyMeasure 0 1)
    ext x
    constructor
    · intro h
      change t < max x 0 at h
      exact (lt_max_iff.mp h).resolve_right (not_lt_of_ge ht0.le)
    · intro h
      change t < x at h
      exact lt_max_iff.mpr (Or.inl h)
  calc
    (∫⁻ t in Set.Ioi 0, cauchyMeasure 0 1 {x | t < x}) =
        ∫⁻ t in Set.Ioi 0,
          cauchyMeasure 0 1 {x | t < max x 0} := hset.symm
    _ = ∫⁻ x, ENNReal.ofReal (max x 0) ∂cauchyMeasure 0 1 :=
      hcake.symm
    _ = ⊤ := cauchy_pos_lintegral_top

lemma not_integrable_cauchy_neg :
    ¬ Integrable (fun x : ℝ => max (-x) 0) (cauchyMeasure 0 1) := by
  intro h
  have hlin :
      (∫⁻ x, ENNReal.ofReal (max (-x) 0) ∂cauchyMeasure 0 1) ≠ ⊤ := by
    apply (MeasureTheory.lintegral_ofReal_ne_top_iff_integrable
      ((measurable_neg.max measurable_const).aestronglyMeasurable)
      (Filter.Eventually.of_forall (fun x => by positivity))).2
    exact h
  have hc : cauchyMeasure (0 : ℝ) (1 : NNReal) =
      volume.withDensity (cauchyPDF (0 : ℝ) (1 : NNReal)) :=
    cauchyMeasure_of_scale_ne_zero (0 : ℝ) (γ := (1 : NNReal)) one_ne_zero
  rw [hc] at hlin
  have hwd := MeasureTheory.lintegral_withDensity_eq_lintegral_mul₀
    (μ := (volume : Measure ℝ)) (f := cauchyPDF (0 : ℝ) (1 : NNReal))
    (g := fun x : ℝ => ENNReal.ofReal (max (-x) 0))
    (measurable_cauchyPDF (0 : ℝ) (1 : NNReal)).aemeasurable
    ((measurable_neg.max measurable_const).ennreal_ofReal).aemeasurable
  rw [hwd] at hlin
  have hprod :
      (∫⁻ x, ENNReal.ofReal
        (max (-x) 0 * cauchyPDFReal 0 1 x) ∂volume) ≠ ⊤ := by
    have hpoint (x : ℝ) :
        (cauchyPDF (0 : ℝ) (1 : NNReal) x) * ENNReal.ofReal (max (-x) 0) =
          ENNReal.ofReal (max (-x) 0 * cauchyPDFReal 0 1 x) := by
      rw [cauchyPDF]
      calc
        ENNReal.ofReal (cauchyPDFReal 0 1 x) * ENNReal.ofReal (max (-x) 0) =
            ENNReal.ofReal (cauchyPDFReal 0 1 x * max (-x) 0) :=
          (ENNReal.ofReal_mul
            (cauchyPDF_pos (0 : ℝ) (by simp : (1 : NNReal) ≠ 0) x).le).symm
        _ = ENNReal.ofReal (max (-x) 0 * cauchyPDFReal 0 1 x) := by
          rw [mul_comm]
    simpa only [Pi.mul_apply, hpoint] using hlin
  have hreal : Integrable
      (fun x : ℝ => max (-x) 0 * cauchyPDFReal 0 1 x) volume := by
    apply (MeasureTheory.lintegral_ofReal_ne_top_iff_integrable (by fun_prop)
      (Filter.Eventually.of_forall (fun x =>
        mul_nonneg (by positivity)
          (cauchyPDF_pos (0 : ℝ) (by simp : (1 : NNReal) ≠ 0) x).le))).1
    exact hprod
  have htail : Integrable
      (fun x : ℝ => (2 * Real.pi) * (max (-x) 0 * cauchyPDFReal 0 1 x))
      (volume.restrict (Set.Iio (-1))) := by
    apply (hreal.const_mul (2 * Real.pi)).mono_measure
    exact Measure.restrict_le_self
  have hinvneg : Integrable (fun x : ℝ => (-x)⁻¹)
      (volume.restrict (Set.Iio (-1))) := by
    apply htail.mono' (measurable_neg.inv.aestronglyMeasurable)
    filter_upwards [ae_restrict_mem measurableSet_Iio] with x hx
    have hx1 : x < -1 := hx
    have hx0 : x < 0 := lt_trans hx1 (by norm_num)
    rw [Real.norm_eq_abs, abs_of_pos (inv_pos.mpr (neg_pos.mpr hx0)),
      max_eq_left (neg_nonneg.mpr hx0.le), Probability.cauchyPDFReal_def]
    simp only [sub_zero, NNReal.coe_one, one_pow, mul_one]
    have hbasic : (-x)⁻¹ ≤ 2 * (-x) / ((-x) ^ 2 + 1) := by
      rw [inv_eq_one_div]
      apply (div_le_iff₀ (neg_pos.mpr hx0)).2
      have hmult : 1 ≤ (2 * (-x) * (-x)) / ((-x) ^ 2 + 1) := by
        apply (le_div_iff₀ (by positivity : 0 < (-x) ^ 2 + 1)).2
        nlinarith [sq_nonneg (x + 1)]
      convert hmult using 1 <;> ring
    calc
      (-x)⁻¹ ≤ 2 * (-x) / (x ^ 2 + 1) := by
        convert hbasic using 1 <;> ring
      _ = 2 * Real.pi * (-(x) * (Real.pi⁻¹ * (x ^ 2 + 1)⁻¹)) := by
        field_simp [Real.pi_ne_zero, ne_of_lt hx0]
  have hpos : IntegrableOn (fun x : ℝ => x⁻¹) (Set.Ioi 1) volume := by
    have hinvneg_on : IntegrableOn (fun x : ℝ => x⁻¹) (Set.Iio (-1)) volume := by
      change Integrable (fun x : ℝ => x⁻¹) (volume.restrict (Set.Iio (-1)))
      exact hinvneg.neg.congr (Filter.Eventually.of_forall (fun x => by
        simp [inv_neg]))
    have hcomp : IntegrableOn ((fun y : ℝ => y⁻¹) ∘ Neg.neg)
        (Neg.neg ⁻¹' Set.Iio (-1)) volume :=
      ((Measure.measurePreserving_neg (volume : Measure ℝ)).integrableOn_comp_preimage
        measurableEmbedding_neg).2 hinvneg_on
    have hcomp_neg : Integrable (fun x : ℝ => -(x⁻¹))
        (volume.restrict (Set.Ioi 1)) := by
      simpa [IntegrableOn, Function.comp_def, inv_neg] using hcomp
    change IntegrableOn (fun x : ℝ => x⁻¹) (Set.Ioi 1) volume
    change Integrable (fun x : ℝ => x⁻¹) (volume.restrict (Set.Ioi 1))
    exact hcomp_neg.neg.congr (Filter.Eventually.of_forall (fun x => by
      simp))
  exact not_integrableOn_Ioi_inv (a := 1) hpos

lemma cauchy_neg_lintegral_top :
    (∫⁻ x, ENNReal.ofReal (max (-x) 0) ∂cauchyMeasure 0 1) = ⊤ := by
  by_contra htop
  apply not_integrable_cauchy_neg
  apply (MeasureTheory.lintegral_ofReal_ne_top_iff_integrable
    ((measurable_neg.max measurable_const).aestronglyMeasurable)
    (Filter.Eventually.of_forall (fun x => by positivity))).1
  exact htop

lemma cauchy_neg_tail_top :
    (∫⁻ t in Set.Iio 0,
      cauchyMeasure 0 1 {x | x < t}) = ⊤ := by
  have hcake := NumStability.HDP.Scalar.Preliminaries.layerCakeExpectationExtended
    (μ := cauchyMeasure 0 1) (X := fun x : ℝ => max (-x) 0)
    (measurable_neg.max measurable_const)
    (fun x => le_max_right (-x) 0)
  have hset :
      (∫⁻ t in Set.Ioi 0,
        cauchyMeasure 0 1 {x | t < max (-x) 0}) =
        ∫⁻ t in Set.Iio 0,
          cauchyMeasure 0 1 {x | x < t} := by
    calc
      (∫⁻ t in Set.Ioi 0,
          cauchyMeasure 0 1 {x | t < max (-x) 0}) =
          ∫⁻ t in Set.Ioi 0,
            cauchyMeasure 0 1 {x | x < -t} := by
              apply setLIntegral_congr_fun measurableSet_Ioi
              intro t ht
              have ht0 : 0 < t := ht
              apply congrArg (cauchyMeasure 0 1)
              ext x
              constructor
              · intro h
                change t < max (-x) 0 at h
                have h' : t < -x :=
                  (lt_max_iff.mp h).resolve_right (not_lt_of_ge ht0.le)
                simpa using (neg_lt_neg h')
              · intro h
                change x < -t at h
                have h' : t < -x := by
                  simpa using (neg_lt_neg h)
                exact lt_max_iff.mpr (Or.inl h')
      _ = ∫⁻ t in Set.Iio 0,
          cauchyMeasure 0 1 {x | x < t} := by
            have hmp : MeasurePreserving (Neg.neg : ℝ → ℝ)
                (volume.restrict (Set.Ioi 0))
                (volume.restrict (Set.Iio 0)) := by
              have hmp' :=
                (Measure.measurePreserving_neg (volume : Measure ℝ)).restrict_preimage_emb
                  measurableEmbedding_neg (Set.Iio 0)
              have hpre : (Neg.neg : ℝ → ℝ) ⁻¹' Set.Iio 0 = Set.Ioi 0 := by
                ext x
                simp
              rw [hpre] at hmp'
              exact hmp'
            have hchange := MeasurePreserving.lintegral_comp_emb hmp
                measurableEmbedding_neg
                (fun t : ℝ => cauchyMeasure 0 1 {x | x < t})
            simpa [Function.comp_def] using hchange
  calc
    (∫⁻ t in Set.Iio 0,
        cauchyMeasure 0 1 {x | x < t}) =
        ∫⁻ t in Set.Ioi 0,
          cauchyMeasure 0 1 {x | t < max (-x) 0} := hset.symm
    _ = ∫⁻ x, ENNReal.ofReal (max (-x) 0) ∂cauchyMeasure 0 1 :=
      hcake.symm
    _ = ⊤ := cauchy_neg_lintegral_top

theorem exercise122CauchyObstruction :
    ((∫⁻ t in Set.Ioi 0,
        cauchyMeasure 0 1 {x | t < x}) = ⊤) ∧
      ((∫⁻ t in Set.Iio 0,
        cauchyMeasure 0 1 {x | x < t}) = ⊤) := by
  exact ⟨cauchy_pos_tail_top, cauchy_neg_tail_top⟩

theorem exercise122CorrectedWithCauchy
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hX : Measurable X) :
    (
      (((∫⁻ ω, ENNReal.ofReal (max (X ω) 0) ∂μ =
        ∫⁻ t in Set.Ioi 0, μ {ω | t < max (X ω) 0}) ∧
      (∫⁻ ω, ENNReal.ofReal (max (-X ω) 0) ∂μ =
        ∫⁻ t in Set.Ioi 0, μ {ω | t < max (-X ω) 0})) ∧
      (∀ hInt : Integrable X μ,
        (∫ ω, X ω ∂μ) =
          (∫ t in Set.Ioi 0, μ.real {a | t < X a}) -
            (∫ t in Set.Iio 0, μ.real {a | X a < t})))
      ∧
        ((∫⁻ t in Set.Ioi 0,
          cauchyMeasure 0 1 {x | t < x}) = ⊤) ∧
        ((∫⁻ t in Set.Iio 0,
          cauchyMeasure 0 1 {x | x < t}) = ⊤)
    ) := by
  exact ⟨exercise122Corrected hX, exercise122CauchyObstruction⟩

/-! The weighted layer-cake identity for positive real moments. -/
theorem momentTailFormula
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hX : Measurable X) {p : ℝ} (hp : 0 < p) :
    (absoluteMoment μ X p =
        ENNReal.ofReal p *
          ∫⁻ t in Set.Ioi 0,
            μ {ω | t < |X ω|} * ENNReal.ofReal (t ^ (p - 1))) ∧
      (∀ hfinite :
          absoluteMoment μ X p < (⊤ : ENNReal) ∨
            ENNReal.ofReal p *
                ∫⁻ t in Set.Ioi 0,
                  μ {ω | t < |X ω|} * ENNReal.ofReal (t ^ (p - 1)) <
              (⊤ : ENNReal),
        (absoluteMoment μ X p).toReal =
          (ENNReal.ofReal p *
            ∫⁻ t in Set.Ioi 0,
              μ {ω | t < |X ω|} * ENNReal.ofReal (t ^ (p - 1))).toReal) := by
  have hnonneg : 0 ≤ᵐ[μ] (fun ω => |X ω|) :=
    Filter.Eventually.of_forall (fun ω => abs_nonneg _)
  have hmeas : AEMeasurable (fun ω => |X ω|) μ :=
    (hX.norm).aemeasurable
  have hformula :=
    MeasureTheory.lintegral_rpow_eq_lintegral_meas_lt_mul
      (μ := μ) hnonneg hmeas hp
  constructor
  · simpa [absoluteMoment, Real.norm_eq_abs] using hformula
  · intro _
    exact congrArg ENNReal.toReal (by
      simpa [absoluteMoment, Real.norm_eq_abs] using hformula)

/-! The pointwise indicator inequality used in the proof of Markov's bound. -/
theorem markovIndicatorBound {x t : ℝ} (hx : 0 ≤ x) (ht : 0 < t) :
    t * Set.indicator (Set.Ici t) (fun _ => (1 : ℝ)) x ≤ x := by
  by_cases hxt : t ≤ x
  · have hmem : x ∈ Set.Ici t := hxt
    rw [Set.indicator_of_mem hmem]
    simpa using hxt
  · have htx : x < t := lt_of_not_ge hxt
    simp [Set.indicator, not_le.mpr htx]
    exact hx

/-! The extended and finite forms of Markov's inequality. -/
theorem markovInequalityExtended
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X : Ω → ℝ} (hX : Measurable X)
    (hNonneg : ∀ᵐ ω ∂μ, 0 ≤ X ω) {t : ℝ} (ht : 0 < t) :
    μ (X ⁻¹' Set.Ici t) ≤
      (∫⁻ ω, ENNReal.ofReal (X ω) ∂μ) / ENNReal.ofReal t := by
  have hmarkov :=
    MeasureTheory.meas_ge_le_lintegral_div
      (μ := μ) (f := fun ω => ENNReal.ofReal (X ω))
      hX.ennreal_ofReal.aemeasurable (ENNReal.ofReal_pos.mpr ht).ne'
      ENNReal.ofReal_ne_top
  have hsubset : X ⁻¹' Set.Ici t ⊆
      {ω | ENNReal.ofReal t ≤ ENNReal.ofReal (X ω)} := by
    intro ω hω
    exact ENNReal.ofReal_le_ofReal hω
  exact (measure_mono hsubset).trans hmarkov

theorem markovInequalityFinite
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X : Ω → ℝ} (hX : Measurable X)
    (hNonneg : ∀ᵐ ω ∂μ, 0 ≤ X ω) (hInt : Integrable X μ)
    {t : ℝ} (ht : 0 < t) :
    μ.real (X ⁻¹' Set.Ici t) ≤ expectation μ X / t := by
  have hext := markovInequalityExtended hX hNonneg ht
  have hIntegralTop :
      (∫⁻ ω, ENNReal.ofReal (X ω) ∂μ) ≠ (⊤ : ENNReal) :=
    hInt.lintegral_lt_top.ne
  have hDenPos : 0 < ENNReal.ofReal t := ENNReal.ofReal_pos.mpr ht
  have hRightTop :
      (∫⁻ ω, ENNReal.ofReal (X ω) ∂μ) / ENNReal.ofReal t ≠ (⊤ : ENNReal) :=
    ENNReal.div_ne_top hIntegralTop hDenPos.ne'
  have hLeftTop : μ (X ⁻¹' Set.Ici t) ≠ (⊤ : ENNReal) :=
    ne_top_of_le_ne_top hRightTop hext
  have hreal :=
    (ENNReal.toReal_le_toReal hLeftTop hRightTop).2 hext
  have hIntegral :
      (∫⁻ ω, ENNReal.ofReal (X ω) ∂μ) =
        ENNReal.ofReal (expectation μ X) := by
    symm
    exact ofReal_integral_eq_lintegral_ofReal hInt hNonneg
  have hExpectationNonneg : 0 ≤ expectation μ X := by
    exact integral_nonneg_of_ae hNonneg
  change (μ (X ⁻¹' Set.Ici t)).toReal ≤ expectation μ X / t
  rw [hIntegral, ENNReal.toReal_div,
    ENNReal.toReal_ofReal hExpectationNonneg,
    ENNReal.toReal_ofReal ht.le] at hreal
  exact hreal

theorem markovInequality
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X : Ω → ℝ} (hX : Measurable X)
    (hNonneg : ∀ᵐ ω ∂μ, 0 ≤ X ω) (hInt : Integrable X μ)
    {t : ℝ} (ht : 0 < t) :
    (μ.real (X ⁻¹' Set.Ici t) ≤ expectation μ X / t) ∧
      (μ (X ⁻¹' Set.Ici t) ≤
        (∫⁻ ω, ENNReal.ofReal (X ω) ∂μ) / ENNReal.ofReal t) := by
  have hmarkov :=
    MeasureTheory.meas_ge_le_lintegral_div
      (μ := μ) (f := fun ω => ENNReal.ofReal (X ω))
      hX.ennreal_ofReal.aemeasurable (ENNReal.ofReal_pos.mpr ht).ne'
      ENNReal.ofReal_ne_top
  have hsubset : X ⁻¹' Set.Ici t ⊆
      {ω | ENNReal.ofReal t ≤ ENNReal.ofReal (X ω)} := by
    intro ω hω
    exact ENNReal.ofReal_le_ofReal hω
  have hext : μ (X ⁻¹' Set.Ici t) ≤
      (∫⁻ ω, ENNReal.ofReal (X ω) ∂μ) / ENNReal.ofReal t :=
    (measure_mono hsubset).trans hmarkov
  have hIntegralTop :
      (∫⁻ ω, ENNReal.ofReal (X ω) ∂μ) ≠ (⊤ : ENNReal) :=
    hInt.lintegral_lt_top.ne
  have hDenPos : 0 < ENNReal.ofReal t := ENNReal.ofReal_pos.mpr ht
  have hRightTop :
      (∫⁻ ω, ENNReal.ofReal (X ω) ∂μ) / ENNReal.ofReal t ≠ (⊤ : ENNReal) :=
    ENNReal.div_ne_top hIntegralTop hDenPos.ne'
  have hLeftTop : μ (X ⁻¹' Set.Ici t) ≠ (⊤ : ENNReal) :=
    ne_top_of_le_ne_top hRightTop hext
  have hreal :=
    (ENNReal.toReal_le_toReal hLeftTop hRightTop).2 hext
  have hIntegral :
      (∫⁻ ω, ENNReal.ofReal (X ω) ∂μ) =
        ENNReal.ofReal (expectation μ X) := by
    symm
    exact ofReal_integral_eq_lintegral_ofReal hInt hNonneg
  have hExpectationNonneg : 0 ≤ expectation μ X := by
    exact integral_nonneg_of_ae hNonneg
  have hfinite : μ.real (X ⁻¹' Set.Ici t) ≤ expectation μ X / t := by
    change (μ (X ⁻¹' Set.Ici t)).toReal ≤ expectation μ X / t
    rw [hIntegral, ENNReal.toReal_div,
      ENNReal.toReal_ofReal hExpectationNonneg,
      ENNReal.toReal_ofReal ht.le] at hreal
    exact hreal
  exact ⟨hfinite, hext⟩

/-! The squared-deviation derivation of Chebyshev's bound. -/
theorem chebyshevEventBound
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X : Ω → ℝ} (hX : Measurable X)
    (hInt : Integrable X μ)
    (hSqInt : Integrable (fun ω => (X ω - expectation μ X) ^ 2) μ)
    {t : ℝ} (ht : 0 < t) :
    μ.real {ω | |X ω - expectation μ X| ≥ t} ≤ variance μ X / t ^ 2 := by
  have hY : Measurable (fun ω => (X ω - expectation μ X) ^ 2) :=
    (hX.sub measurable_const).pow_const 2
  have hMarkov :=
    markovInequalityFinite (X := fun ω => (X ω - expectation μ X) ^ 2)
      hY (ae_of_all μ (fun ω => sq_nonneg _)) hSqInt (sq_pos_of_pos ht)
  have hEvent :
      (fun ω => (X ω - expectation μ X) ^ 2) ⁻¹' Set.Ici (t ^ 2) =
        {ω | |X ω - expectation μ X| ≥ t} := by
    ext ω
    constructor
    · intro hω
      have hs : t ^ 2 ≤ (X ω - expectation μ X) ^ 2 := hω
      have hs' : |t| ≤ |X ω - expectation μ X| := (sq_le_sq).mp hs
      simpa [abs_of_pos ht] using hs'
    · intro hω
      have habs : t ≤ |X ω - expectation μ X| := hω
      have hs' : |t| ≤ |X ω - expectation μ X| := by
        simpa [abs_of_pos ht] using habs
      exact (sq_le_sq).mpr hs'
  rw [← hEvent]
  simpa [variance, expectation] using hMarkov

/-! The source-facing Minkowski bridge reuses Mathlib's `eLpNorm` API. -/
theorem minkowskiEpnorm
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X Y : Ω → ℝ} {p : ENNReal}
    (hX : AEStronglyMeasurable X μ) (hY : AEStronglyMeasurable Y μ)
    (hp : 1 ≤ p) :
    eLpNorm (X + Y) p μ ≤ eLpNorm X p μ + eLpNorm Y p μ := by
  exact eLpNorm_add_le hX hY hp

/-! The corrected positive-exponent form of the chapter's Lp monotonicity
  claim.  Mathlib's representative-level eLpNorm is used directly, so the
  endpoint q = ∞ is included.  The printed p = 0 endpoint is excluded:
  under the pinned API eLpNorm X 0 μ = 0, which is not an L0 norm. -/
theorem lpNormMonoProbability
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {p q : ENNReal}
    (hpq : p ≤ q) (hX : AEStronglyMeasurable X μ) :
    eLpNorm X p μ ≤ eLpNorm X q μ := by
  simpa using
    (eLpNorm_le_eLpNorm_mul_rpow_measure_univ (f := X) hpq hX)

theorem lpNormExponentZero
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X : Ω → ℝ} :
    eLpNorm X 0 μ = 0 := by
  simp

/-! The source-facing Hölder inequality and its two endpoint branches. -/
theorem holderIntegralBound
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X Y : Ω → ℝ} {p q : ℝ}
    (hpq : p.HolderConjugate q)
    (hX : MemLp X (ENNReal.ofReal p) μ)
    (hY : MemLp Y (ENNReal.ofReal q) μ) :
    ‖expectation μ (fun ω => X ω * Y ω)‖ ≤
      (∫ ω, ‖X ω‖ ^ p ∂μ) ^ (1 / p) *
        (∫ ω, ‖Y ω‖ ^ q ∂μ) ^ (1 / q) := by
  calc
    ‖expectation μ (fun ω => X ω * Y ω)‖ ≤
        ∫ ω, ‖X ω * Y ω‖ ∂μ := by
      exact norm_integral_le_integral_norm _
    _ = ∫ ω, ‖X ω‖ * ‖Y ω‖ ∂μ := by
      apply integral_congr_ae
      filter_upwards with ω
      rw [norm_mul]
    _ ≤ (∫ ω, ‖X ω‖ ^ p ∂μ) ^ (1 / p) *
        (∫ ω, ‖Y ω‖ ^ q ∂μ) ^ (1 / q) :=
      integral_mul_norm_le_Lp_mul_Lq hpq hX hY

theorem holderEndpointOneTop
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X Y : Ω → ℝ}
    (hX : MemLp X 1 μ) (hY : MemLp Y (⊤ : ENNReal) μ) :
    ‖expectation μ (fun ω => X ω * Y ω)‖ ≤
      (eLpNorm X 1 μ).toReal * (eLpNorm Y (⊤ : ENNReal) μ).toReal := by
  letI : ENNReal.HolderConjugate 1 (⊤ : ENNReal) := inferInstance
  have hprod : MemLp (fun ω => X ω * Y ω) 1 μ := by
    exact hY.mul' hX
  calc
    ‖expectation μ (fun ω => X ω * Y ω)‖ ≤
        ∫ ω, ‖X ω * Y ω‖ ∂μ := by
      exact norm_integral_le_integral_norm _
    _ = (eLpNorm (fun ω => X ω * Y ω) 1 μ).toReal := by
      rw [eLpNorm_one_eq_lintegral_enorm]
      rw [integral_eq_lintegral_of_nonneg_ae]
      · simp only [ofReal_norm_eq_enorm]
      · exact Filter.Eventually.of_forall (fun ω => norm_nonneg _)
      · exact hprod.1.norm
    _ ≤ (eLpNorm X 1 μ * eLpNorm Y (⊤ : ENNReal) μ).toReal := by
      exact ENNReal.toReal_mono (ENNReal.mul_ne_top hX.eLpNorm_ne_top hY.eLpNorm_ne_top)
        (by
          simpa using
            (eLpNorm_le_eLpNorm_mul_eLpNorm_top 1 hX.1 Y (fun x y => x * y) 1
              (.of_forall fun _ => by simp [enorm_eq_nnnorm])))
    _ = (eLpNorm X 1 μ).toReal * (eLpNorm Y (⊤ : ENNReal) μ).toReal := by
      simp only [ENNReal.toReal_mul]

theorem holderEndpointTopOne
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X Y : Ω → ℝ}
    (hX : MemLp X (⊤ : ENNReal) μ) (hY : MemLp Y 1 μ) :
    ‖expectation μ (fun ω => X ω * Y ω)‖ ≤
      (eLpNorm X (⊤ : ENNReal) μ).toReal * (eLpNorm Y 1 μ).toReal := by
  simpa [mul_comm] using holderEndpointOneTop (μ := μ) (X := Y) (Y := X) hY hX

structure HolderModelData
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X Y : Ω → ℝ) where
  interior : ∀ {p q : ℝ}, p.HolderConjugate q →
    MemLp X (ENNReal.ofReal p) μ → MemLp Y (ENNReal.ofReal q) μ →
    ‖expectation μ (fun ω => X ω * Y ω)‖ ≤
      (∫ ω, ‖X ω‖ ^ p ∂μ) ^ (1 / p) *
        (∫ ω, ‖Y ω‖ ^ q ∂μ) ^ (1 / q)
  one_top : MemLp X 1 μ → MemLp Y (⊤ : ENNReal) μ →
    ‖expectation μ (fun ω => X ω * Y ω)‖ ≤
      (eLpNorm X 1 μ).toReal * (eLpNorm Y (⊤ : ENNReal) μ).toReal
  top_one : MemLp X (⊤ : ENNReal) μ → MemLp Y 1 μ →
    ‖expectation μ (fun ω => X ω * Y ω)‖ ≤
      (eLpNorm X (⊤ : ENNReal) μ).toReal * (eLpNorm Y 1 μ).toReal

def holderModel
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X Y : Ω → ℝ) : HolderModelData μ X Y :=
  { interior := fun hpq hX hY => holderIntegralBound hpq hX hY
    one_top := holderEndpointOneTop
    top_one := holderEndpointTopOne }

/-! The real `L²` Cauchy--Schwarz representative-level interface. -/
theorem cauchySchwarzIntegralBound
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X Y : Ω → ℝ}
    (hX : MemLp X 2 μ) (hY : MemLp Y 2 μ) :
    ‖expectation μ (fun ω => X ω * Y ω)‖ ≤
      (eLpNorm X 2 μ).toReal * (eLpNorm Y 2 μ).toReal := by
  letI : ENNReal.HolderConjugate 2 2 := inferInstance
  have hprod : MemLp (fun ω => X ω * Y ω) 1 μ := by
    exact hY.mul' hX
  calc
    ‖expectation μ (fun ω => X ω * Y ω)‖ ≤
        ∫ ω, ‖X ω * Y ω‖ ∂μ := by
      exact norm_integral_le_integral_norm _
    _ = (eLpNorm (fun ω => X ω * Y ω) 1 μ).toReal := by
      rw [eLpNorm_one_eq_lintegral_enorm]
      rw [integral_eq_lintegral_of_nonneg_ae]
      · simp only [ofReal_norm_eq_enorm]
      · exact Filter.Eventually.of_forall (fun ω => norm_nonneg _)
      · exact hprod.1.norm
    _ ≤ (eLpNorm X 2 μ * eLpNorm Y 2 μ).toReal := by
      apply ENNReal.toReal_mono
        (ENNReal.mul_ne_top hX.eLpNorm_ne_top hY.eLpNorm_ne_top)
      simpa using eLpNorm_le_eLpNorm_mul_eLpNorm_of_nnnorm
        (p := (2 : ENNReal)) (q := 2) (r := 1) hX.1 hY.1
        (fun x y => x * y) 1 (.of_forall fun _ => by simp)
    _ = (eLpNorm X 2 μ).toReal * (eLpNorm Y 2 μ).toReal := by
      simp only [ENNReal.toReal_mul]

/-! The pinned representative L2 norm agrees with the chapter's
  square-root-of-second-moment representative norm. -/
theorem eLpNormTwoToL2Norm
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {Z : Ω → ℝ}
    (hZ : MemLp Z 2 μ) :
    (eLpNorm Z 2 μ).toReal = l2Norm μ Z := by
  rw [toReal_eLpNorm hZ.1]
  rw [lpNorm_eq_integral_norm_rpow_toReal (by norm_num) (by norm_num) hZ.1]
  simp [l2Norm, expectation, Real.sqrt_eq_rpow, Real.norm_eq_abs, ← sq_abs]

/-- Centering contracts the real `L²` seminorm. This is Equation (2.19) in
Vershynin, *High-Dimensional Probability*. -/
theorem centered_eLpNorm_two_le
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hX : MemLp X 2 μ) :
    eLpNorm (fun ω => X ω - ∫ x, X x ∂μ) 2 μ ≤ eLpNorm X 2 μ := by
  rw [eLpNorm_eq_lintegral_rpow_enorm_toReal two_ne_zero ENNReal.ofNat_ne_top,
    eLpNorm_eq_lintegral_rpow_enorm_toReal two_ne_zero ENNReal.ofNat_ne_top]
  norm_num only [ENNReal.toReal_ofNat]
  apply ENNReal.rpow_le_rpow ?_ (by norm_num)
  have hvariance :
      ProbabilityTheory.evariance X μ ≤ ∫⁻ ω, ‖X ω‖ₑ ^ 2 ∂μ := by
    rw [ProbabilityTheory.evariance_def' hX.1]
    exact tsub_le_self
  simpa only [ProbabilityTheory.evariance, ENNReal.rpow_two] using hvariance

/-! Remark 1.1.1: covariance is controlled by the product of the two
  centered L2 norms, hence by the product of the source standard deviations. -/
theorem covarianceCauchySchwarzBound
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X Y : Ω → ℝ}
    (hX : MemLp X 2 μ) (hY : MemLp Y 2 μ) :
    ‖covariance μ X Y‖ ≤ standardDeviation μ X * standardDeviation μ Y := by
  have hXc : MemLp (fun ω => X ω - expectation μ X) 2 μ := by
    simpa using hX.sub (memLp_const (expectation μ X))
  have hYc : MemLp (fun ω => Y ω - expectation μ Y) 2 μ := by
    simpa using hY.sub (memLp_const (expectation μ Y))
  have hbound := cauchySchwarzIntegralBound hXc hYc
  have hnormX := eLpNormTwoToL2Norm hXc
  have hnormY := eLpNormTwoToL2Norm hYc
  calc
    ‖covariance μ X Y‖ =
        ‖expectation μ (fun ω =>
          (X ω - expectation μ X) * (Y ω - expectation μ Y))‖ := by
      rfl
    _ ≤
        (eLpNorm (fun ω => X ω - expectation μ X) 2 μ).toReal *
          (eLpNorm (fun ω => Y ω - expectation μ Y) 2 μ).toReal := hbound
    _ = l2Norm μ (fun ω => X ω - expectation μ X) *
          l2Norm μ (fun ω => Y ω - expectation μ Y) := by
      rw [hnormX, hnormY]
    _ = standardDeviation μ X * standardDeviation μ Y := by
      rw [(stdevCovarianceIdentities μ X Y).1]
      rw [(stdevCovarianceIdentities μ Y X).1]

/-! A concrete two-point witness that the displayed `Lᵖ` functional need not
be subadditive below one. -/
theorem twoPointLpTriangleFailure :
    ∃ (μ : Measure (Fin 2)) (f g : Fin 2 → ℝ),
      IsProbabilityMeasure μ ∧
        ¬ eLpNorm (f + g) (1 / 2 : ENNReal) μ ≤
          eLpNorm f (1 / 2 : ENNReal) μ + eLpNorm g (1 / 2 : ENNReal) μ := by
  let μ : Measure (Fin 2) := ProbabilityTheory.uniformOn Set.univ
  let f : Fin 2 → ℝ := Set.indicator ({0} : Set (Fin 2)) (fun _ => 1)
  let g : Fin 2 → ℝ := Set.indicator ({1} : Set (Fin 2)) (fun _ => 1)
  have hμ : IsProbabilityMeasure μ := by
    dsimp [μ]
    infer_instance
  have hμ0 : μ ({0} : Set (Fin 2)) = (1 / 2 : ENNReal) := by
    dsimp [μ]
    rw [ProbabilityTheory.uniformOn_univ]
    simp [Measure.count_apply]
  have hμ1 : μ ({1} : Set (Fin 2)) = (1 / 2 : ENNReal) := by
    dsimp [μ]
    rw [ProbabilityTheory.uniformOn_univ]
    simp [Measure.count_apply]
  refine ⟨μ, f, g, hμ, ?_⟩
  have hf : eLpNorm f (1 / 2 : ENNReal) μ = (2 : ENNReal)⁻¹ ^ 2 := by
    dsimp [f]
    rw [eLpNorm_indicator_const (s := ({0} : Set (Fin 2)))
      (c := (1 : ℝ)) (measurableSet_singleton (0 : Fin 2)) (by norm_num) (by norm_num)]
    rw [hμ0]
    norm_num
  have hg : eLpNorm g (1 / 2 : ENNReal) μ = (2 : ENNReal)⁻¹ ^ 2 := by
    dsimp [g]
    rw [eLpNorm_indicator_const (s := ({1} : Set (Fin 2)))
      (c := (1 : ℝ)) (measurableSet_singleton (1 : Fin 2)) (by norm_num) (by norm_num)]
    rw [hμ1]
    norm_num
  have hsum : f + g = (fun _ : Fin 2 => (1 : ℝ)) := by
    funext x
    fin_cases x <;> simp [f, g]
  rw [hsum, eLpNorm_const _ (by norm_num) (by simp [μ]), hf, hg]
  simp [hμ.measure_univ]
  have hquarter : (2 : ENNReal)⁻¹ ^ 2 < (2 : ENNReal)⁻¹ := by
    rw [pow_two]
    calc
      (2 : ENNReal)⁻¹ * 2⁻¹ < 1 * 2⁻¹ :=
        ENNReal.mul_lt_mul_left (by norm_num) (by norm_num)
          ENNReal.one_half_lt_one
      _ = (2 : ENNReal)⁻¹ := one_mul _
  calc
    (2 : ENNReal)⁻¹ ^ 2 + 2⁻¹ ^ 2 < 2⁻¹ + 2⁻¹ :=
      ENNReal.add_lt_add hquarter hquarter
    _ = 1 := ENNReal.inv_two_add_inv_two

/-! The `p ≥ 1` branch of the source-facing Banach-space statement. -/
structure LpQuotientBanachModelData
    {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) (p : ENNReal)
    [Fact (1 ≤ p)] : Prop where
  normed : Nonempty (NormedAddCommGroup (MeasureTheory.Lp ℝ p μ))
  complete : Nonempty (CompleteSpace (MeasureTheory.Lp ℝ p μ))
  counterexample :
    ∃ (μ : Measure (Fin 2)) (f g : Fin 2 → ℝ),
      IsProbabilityMeasure μ ∧
        ¬ eLpNorm (f + g) (1 / 2 : ENNReal) μ ≤
          eLpNorm f (1 / 2 : ENNReal) μ + eLpNorm g (1 / 2 : ENNReal) μ

theorem lpQuotientBanach
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (p : ENNReal) [Fact (1 ≤ p)] :
    LpQuotientBanachModelData μ p :=
  { normed := ⟨inferInstance⟩
    complete := ⟨inferInstance⟩
    counterexample := twoPointLpTriangleFailure }

/-- A source-facing package of mean, variance, and the centered-variable fact. -/
structure ExpectationVarianceModelData
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ]
    (X : Ω → ℝ) (hX : Integrable X μ) where
  mean : ℝ
  variance : ℝ
  mean_eq : mean = expectation μ X
  variance_eq : variance = Preliminaries.variance μ X
  centered_mean : expectation μ (fun ω => X ω - mean) = 0

/-- The Chapter 1 expectation/variance interface for an integrable random variable. -/
def expectationVarianceModel
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ]
    (X : Ω → ℝ) (hX : Integrable X μ) :
    ExpectationVarianceModelData μ X hX :=
  { mean := expectation μ X
    variance := variance μ X
    mean_eq := rfl
    variance_eq := rfl
    centered_mean := by
      simpa using expectation_centered hX }

end NumStability.HDP.Scalar.Preliminaries
```

### `NumStability.HDP.Scalar.IndependentSums.Hoeffding`

Path: `lean-numerical-stability/NumStability/HDP/Scalar/IndependentSums/Hoeffding.lean`
SHA-256: `374e1393ee79a49ac90546f7e2c10e2c5c49ffaa7f784ff37e6e44966ab39622`

```lean
import Mathlib.Probability.Independence.Integration
import Mathlib.Probability.Moments.Basic
import Mathlib.Probability.Moments.SubGaussian
import Mathlib.Probability.ProbabilityMassFunction.Constructions
import Mathlib.Probability.ProbabilityMassFunction.Integrals
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Series
import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals
import Mathlib.Tactic
import NumStability.HDP.Scalar.Preliminaries

/-!
# MGF tensorization for independent sums

This module records the finite mutual-independence bridge behind the MGF
calculation in Chapter 2.  The exponential integrability hypotheses keep the
real-valued expectation interface honest; the weighted form includes the
unweighted sum by taking every coefficient to be one.
-/

noncomputable section

open MeasureTheory
open ProbabilityTheory
open scoped BigOperators ENNReal NNReal

namespace NumStability.HDP.Scalar.IndependentSums.Hoeffding

/-! The symmetric Bernoulli/Rademacher law from Definition 2.2.1. -/

/-- The affine encoding of a Boolean outcome as a Rademacher value. -/
def rademacherValue : Bool → ℝ := fun b => if b then 1 else -1

/-- The corresponding `{0,1}`-valued Bernoulli indicator. -/
def bernoulliIndicator : Bool → ℝ := fun b => if b then 1 else 0

/-- The fair Bernoulli law used by the canonical coupling. -/
noncomputable def fairBernoulliPMF : PMF Bool :=
  PMF.bernoulli (1 / 2 : ℝ≥0) (by norm_num)

/-- The symmetric Bernoulli/Rademacher law on `{-1,1}`. -/
noncomputable def rademacherPMF : PMF ℝ :=
  fairBernoulliPMF.map rademacherValue

/-- Pointwise, the Rademacher encoding is `2X-1` for a fair indicator. -/
theorem rademacherValue_eq_affine (b : Bool) :
    rademacherValue b = 2 * bernoulliIndicator b - 1 := by
  cases b
  · norm_num [rademacherValue, bernoulliIndicator]
  · norm_num [rademacherValue, bernoulliIndicator] <;> rfl

/-- The affine map which sends the usual Bernoulli support `{0, 1}` to the
Rademacher support `{-1, 1}`. -/
def affineBernoulliValue (x : ℝ) : ℝ := 2 * x - 1

/-- The inverse affine map from the Rademacher scale to the usual Bernoulli
scale. -/
def inverseAffineBernoulliValue (z : ℝ) : ℝ := (z + 1) / 2

/-- The fair usual Bernoulli law, represented on the real support `{0, 1}`. -/
noncomputable def fairBernoulliRealPMF : PMF ℝ :=
  fairBernoulliPMF.map bernoulliIndicator

/-- A real-valued law is the usual fair Bernoulli law exactly when its affine
image under `x ↦ 2x - 1` is the symmetric Bernoulli/Rademacher law.  This is
the arbitrary-law form of the equivalence following Definition 2.2.1. -/
theorem affineLawIsRademacherIff (q : PMF ℝ) :
    q.map affineBernoulliValue = rademacherPMF ↔
      q = fairBernoulliRealPMF := by
  constructor
  · intro h
    have h' := congrArg (fun law : PMF ℝ =>
      law.map inverseAffineBernoulliValue) h
    unfold rademacherPMF at h'
    change (q.map affineBernoulliValue).map inverseAffineBernoulliValue =
      (fairBernoulliPMF.map rademacherValue).map
        inverseAffineBernoulliValue at h'
    rw [PMF.map_comp, PMF.map_comp] at h'
    have hinv : inverseAffineBernoulliValue ∘ affineBernoulliValue = id := by
      funext x
      simp only [Function.comp_apply, affineBernoulliValue,
        inverseAffineBernoulliValue, id_eq]
      ring
    have hbool : inverseAffineBernoulliValue ∘ rademacherValue =
        bernoulliIndicator := by
      funext b
      cases b <;> norm_num [Function.comp_apply, inverseAffineBernoulliValue,
        rademacherValue, bernoulliIndicator]
    rw [hinv, hbool, PMF.map_id] at h'
    exact h'
  · intro h
    subst q
    unfold fairBernoulliRealPMF rademacherPMF
    rw [PMF.map_comp]
    congr 1
    funext b
    cases b <;> norm_num [Function.comp_apply, affineBernoulliValue,
      rademacherValue, bernoulliIndicator] <;> rfl

/-- An arbitrary real probability measure is the ordinary fair Bernoulli law
exactly when its affine image under `x ↦ 2x - 1` is the Rademacher law.  Unlike
the PMF specialization, this theorem retains the source sentence's full law
domain and does not assume discreteness in advance. -/
theorem affineMeasureIsRademacherIff (mu : Measure ℝ) :
    Measure.map affineBernoulliValue mu = rademacherPMF.toMeasure ↔
      mu = fairBernoulliRealPMF.toMeasure := by
  have hAffine : Measurable affineBernoulliValue := by
    unfold affineBernoulliValue
    fun_prop
  have hInverse : Measurable inverseAffineBernoulliValue := by
    unfold inverseAffineBernoulliValue
    fun_prop
  have hinv : inverseAffineBernoulliValue ∘ affineBernoulliValue = id := by
    funext x
    simp only [Function.comp_apply, affineBernoulliValue,
      inverseAffineBernoulliValue, id_eq]
    ring
  have hbool : inverseAffineBernoulliValue ∘ rademacherValue =
      bernoulliIndicator := by
    funext b
    cases b <;> norm_num [Function.comp_apply, inverseAffineBernoulliValue,
      rademacherValue, bernoulliIndicator]
  have href : Measure.map inverseAffineBernoulliValue
      rademacherPMF.toMeasure = fairBernoulliRealPMF.toMeasure := by
    rw [PMF.toMeasure_map inverseAffineBernoulliValue rademacherPMF hInverse]
    congr 1
    unfold rademacherPMF fairBernoulliRealPMF
    rw [PMF.map_comp, hbool]
  constructor
  · intro h
    have h' := congrArg (Measure.map inverseAffineBernoulliValue) h
    change Measure.map inverseAffineBernoulliValue
        (Measure.map affineBernoulliValue mu) =
      Measure.map inverseAffineBernoulliValue rademacherPMF.toMeasure at h'
    rw [Measure.map_map hInverse hAffine, hinv,
      Measure.map_id, href] at h'
    exact h'
  · intro h
    subst mu
    rw [PMF.toMeasure_map affineBernoulliValue fairBernoulliRealPMF hAffine]
    exact congrArg PMF.toMeasure
      ((affineLawIsRademacherIff fairBernoulliRealPMF).2 rfl)

@[simp]
theorem rademacherPMF_mass_one : rademacherPMF 1 = 1 / 2 := by
  simp [rademacherPMF, fairBernoulliPMF, rademacherValue, PMF.map_apply,
    PMF.bernoulli_apply]
  norm_num

@[simp]
theorem rademacherPMF_mass_neg_one : rademacherPMF (-1) = 1 / 2 := by
  simp [rademacherPMF, fairBernoulliPMF, rademacherValue, PMF.map_apply,
    PMF.bernoulli_apply]
  norm_num

theorem rademacherPMF_mean :
    ∫ x : ℝ, x ∂rademacherPMF.toMeasure = 0 := by
  let f : Bool → ℝ := rademacherValue
  have hf : Measurable f := measurable_of_countable f
  unfold rademacherPMF
  rw [← PMF.toMeasure_map f]
  · change (∫ y : ℝ, id y ∂Measure.map f
      fairBernoulliPMF.toMeasure) = 0
    rw [MeasureTheory.integral_map hf.aemeasurable
      (continuous_id.aestronglyMeasurable)]
    rw [PMF.integral_eq_sum]
    simp [f, fairBernoulliPMF, rademacherValue, PMF.bernoulli_apply]
    norm_num
  · exact hf

theorem rademacherPMF_variance :
    ∫ x : ℝ, (x - 0) ^ 2 ∂rademacherPMF.toMeasure = 1 := by
  let f : Bool → ℝ := rademacherValue
  have hf : Measurable f := measurable_of_countable f
  unfold rademacherPMF
  rw [← PMF.toMeasure_map f]
  · change (∫ y : ℝ, (id y - 0) ^ 2 ∂Measure.map f
      fairBernoulliPMF.toMeasure) = 1
    rw [MeasureTheory.integral_map hf.aemeasurable
      (((continuous_id.sub continuous_const).pow 2).aestronglyMeasurable)]
    rw [PMF.integral_eq_sum]
    simp [f, fairBernoulliPMF, rademacherValue, PMF.bernoulli_apply]
  · exact hf

theorem rademacherPMF_abs :
    ∫ x : ℝ, |x| ∂rademacherPMF.toMeasure = 1 := by
  let f : Bool → ℝ := rademacherValue
  have hf : Measurable f := measurable_of_countable f
  unfold rademacherPMF
  rw [← PMF.toMeasure_map f]
  · change (∫ y : ℝ, |y| ∂Measure.map f
      fairBernoulliPMF.toMeasure) = 1
    rw [MeasureTheory.integral_map hf.aemeasurable
      (continuous_abs.aestronglyMeasurable)]
    rw [PMF.integral_eq_sum]
    simp [f, fairBernoulliPMF, rademacherValue, PMF.bernoulli_apply]
  · exact hf

/-- The affine Bernoulli coupling is Rademacher exactly at the fair parameter. -/
theorem affineBernoulliIsRademacherIff {p : ℝ≥0} (hp : p ≤ 1) :
    PMF.map rademacherValue (PMF.bernoulli p hp) = rademacherPMF ↔
      p = (1 / 2 : ℝ≥0) := by
  constructor
  · intro h
    have h1 := congrArg (fun q : PMF ℝ => q 1) h
    have hneq : (1 : ℝ) ≠ -1 := by norm_num
    have h1simp : (p : ℝ≥0∞) = (1 / 2 : ℝ≥0∞) := by
      simpa [rademacherPMF, fairBernoulliPMF, PMF.map_apply,
        rademacherValue, PMF.bernoulli_apply, hneq] using h1
    have h1nn : (p : ℝ≥0∞) = ((1 / 2 : ℝ≥0) : ℝ≥0∞) := by
      convert h1simp using 1 <;> norm_num
    exact_mod_cast h1nn
  · intro hp'
    subst p
    rfl

/-- The complete source-facing package for Definition 2.2.1. -/
structure RademacherModelData where
  law : PMF ℝ
  mass_one : law 1 = 1 / 2
  mass_neg_one : law (-1) = 1 / 2
  affine_bernoulli_iff :
    ∀ {p : ℝ≥0} (hp : p ≤ 1),
      PMF.map rademacherValue (PMF.bernoulli p hp) = law ↔
        p = (1 / 2 : ℝ≥0)
  mean : ∫ x : ℝ, x ∂law.toMeasure = 0
  variance : ∫ x : ℝ, (x - 0) ^ 2 ∂law.toMeasure = 1
  abs_mean : ∫ x : ℝ, |x| ∂law.toMeasure = 1

/-- Canonical Rademacher law and its defining Bernoulli coupling and moments. -/
noncomputable def rademacherModel : RademacherModelData :=
  { law := rademacherPMF
    mass_one := rademacherPMF_mass_one
    mass_neg_one := rademacherPMF_mass_neg_one
    affine_bernoulli_iff := fun hp => affineBernoulliIsRademacherIff hp
    mean := rademacherPMF_mean
    variance := rademacherPMF_variance
    abs_mean := rademacherPMF_abs }

/-- The MGF of a weighted finite sum factors under mutual independence. -/
theorem mgfIndependentSum
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} (lam : ℝ) (a : ι → ℝ)
    (hX : iIndepFun X μ)
    (hExp : ∀ i, Integrable (fun ω => Real.exp (lam * (a i * X i ω))) μ) :
    ∫ ω, Real.exp (lam * ∑ i, a i * X i ω) ∂μ =
      ∏ i, ∫ ω, Real.exp (lam * (a i * X i ω)) ∂μ := by
  let Y : ι → Ω → ℝ := fun i ω => Real.exp (lam * (a i * X i ω))
  have hY : iIndepFun Y μ := by
    let g : ∀ i, ℝ → ℝ := fun i x => Real.exp (lam * (a i * x))
    have hg : ∀ i, Measurable (g i) := by
      intro i
      fun_prop
    have h := hX.comp g hg
    simpa [Y, g, Function.comp_def] using h
  have hY_meas : ∀ i, AEStronglyMeasurable (Y i) μ := by
    intro i
    exact (hExp i).aestronglyMeasurable
  calc
    ∫ ω, Real.exp (lam * ∑ i, a i * X i ω) ∂μ =
        ∫ ω, ∏ i, Y i ω ∂μ := by
          apply integral_congr_ae
          filter_upwards [] with ω
          simp only [Y]
          rw [Finset.mul_sum, Real.exp_sum]
    _ = ∏ i, ∫ ω, Y i ω ∂μ := by
      simpa only [Finset.prod_apply] using
        hY.integral_prod_eq_prod_integral hY_meas
    _ = ∏ i, ∫ ω, Real.exp (lam * (a i * X i ω)) ∂μ := by
      rfl

/-- The centered bounded-variable Hoeffding lemma, with all real MGF
parameters bundled by Mathlib's sub-Gaussian interface. -/
theorem hoeffdingBoundedMGF
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {a b : ℝ}
    (hX : AEMeasurable X μ)
    (hbound : ∀ᵐ ω ∂μ, X ω ∈ Set.Icc a b)
    (hmean : ∫ ω, X ω ∂μ = 0) :
    HasSubgaussianMGF X ((‖b - a‖₊ / 2) ^ 2) μ :=
  ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc_of_integral_eq_zero
    hX hbound hmean

/-- The noncentered bounded-variable form, obtained by subtracting the mean. -/
theorem hoeffdingCenteredMGF
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {a b : ℝ}
    (hX : AEMeasurable X μ)
    (hbound : ∀ᵐ ω ∂μ, X ω ∈ Set.Icc a b) :
    HasSubgaussianMGF (fun ω => X ω - ∫ y, X y ∂μ)
      ((‖b - a‖₊ / 2) ^ 2) μ :=
  ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc hX hbound

/-! The one-variable quadratic optimization used by the Hoeffding tail proof. -/
theorem hoeffdingOptimization {v t : ℝ} (hv : 0 < v) (ht : 0 ≤ t) :
    (∀ u : ℝ, 0 ≤ u →
      -t ^ 2 / (2 * v) ≤ -u * t + u ^ 2 * v / 2) ∧
      (-(t / v) * t + (t / v) ^ 2 * v / 2 = -t ^ 2 / (2 * v)) := by
  constructor
  · intro u hu
    have hsq : 0 ≤ (u * v - t) ^ 2 := sq_nonneg (u * v - t)
    field_simp
    nlinarith
  · field_simp
    ring

/-! The coefficientwise hyperbolic-cosine estimate used by Rademacher MGF bounds. -/
theorem coshLeExpHalfSq (x : ℝ) :
    Real.cosh x ≤ Real.exp (x ^ 2 / 2) :=
  Real.cosh_le_exp_half_sq x

/-! The one-sided finite exponential-Markov upper tail bound. -/
theorem exponentialMarkovUpper
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {S : Ω → ℝ} (hS : Measurable S)
    {lam t : ℝ} (hlam : 0 < lam)
    (hExp : Integrable (fun ω => Real.exp (lam * S ω)) μ) :
    μ.real (S ⁻¹' Set.Ici t) ≤
      Real.exp (-(lam * t)) * (∫ ω, Real.exp (lam * S ω) ∂μ) := by
  let Y : Ω → ℝ := fun ω => Real.exp (lam * S ω)
  have hY : Measurable Y := by
    simpa [Y] using (hS.const_mul lam).exp
  have hY_nonneg : ∀ᵐ ω ∂μ, 0 ≤ Y ω :=
    Filter.Eventually.of_forall (fun ω => le_of_lt (Real.exp_pos _))
  have hY_int : Integrable Y μ := by
    simpa [Y] using hExp
  have hY_markov :=
    NumStability.HDP.Scalar.Preliminaries.markovInequalityFinite
      hY hY_nonneg hY_int (Real.exp_pos (lam * t))
  have measureReal_mono_prob {A B : Set Ω} (hAB : A ⊆ B) :
      μ.real A ≤ μ.real B := by
    rw [Measure.real_def, Measure.real_def]
    exact ENNReal.toReal_mono (measure_ne_top μ B) (measure_mono hAB)
  have hsubset : S ⁻¹' Set.Ici t ⊆
      Y ⁻¹' Set.Ici (Real.exp (lam * t)) := by
    intro ω hω
    change t ≤ S ω at hω
    change Real.exp (lam * t) ≤ Real.exp (lam * S ω)
    exact (Real.exp_le_exp).2 (mul_le_mul_of_nonneg_left hω hlam.le)
  calc
    μ.real (S ⁻¹' Set.Ici t) ≤ μ.real (Y ⁻¹' Set.Ici (Real.exp (lam * t))) :=
      measureReal_mono_prob hsubset
    _ ≤ (∫ ω, Y ω ∂μ) / Real.exp (lam * t) := by
      simpa [Preliminaries.expectation] using hY_markov
    _ = Real.exp (-(lam * t)) * (∫ ω, Real.exp (lam * S ω) ∂μ) := by
      simp [Y, Real.exp_neg, div_eq_mul_inv]
      ring

/-! The exact one-coordinate MGF of a Rademacher law. -/
theorem rademacherWeightedMGFEqCosh
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hX : Measurable X)
    (hLaw : Measure.map X μ = rademacherPMF.toMeasure)
    (lam a : ℝ) :
    (∫ ω, Real.exp (lam * (a * X ω)) ∂μ) = Real.cosh (lam * a) := by
  let f : ℝ → ℝ := fun x => Real.exp (lam * (a * x))
  have hf : Measurable f := by fun_prop
  have hmap_integral :
      (∫ ω, Real.exp (lam * (a * X ω)) ∂μ) =
        ∫ x : ℝ, Real.exp (lam * (a * x)) ∂Measure.map X μ := by
    symm
    rw [MeasureTheory.integral_map hX.aemeasurable hf.aestronglyMeasurable]
  rw [hmap_integral, hLaw]
  unfold rademacherPMF
  rw [← PMF.toMeasure_map rademacherValue]
  · rw [MeasureTheory.integral_map
      (measurable_of_countable rademacherValue).aemeasurable
      hf.aestronglyMeasurable]
    rw [PMF.integral_eq_sum]
    simp [f, fairBernoulliPMF, rademacherValue, PMF.bernoulli_apply]
    calc
      2⁻¹ * Real.exp (lam * a) +
          (1 - 2⁻¹) * Real.exp (-(lam * a)) =
          (Real.exp (lam * a) + Real.exp (-(lam * a))) / 2 := by ring
      _ = Real.cosh (lam * a) := by rw [Real.cosh_eq]
  · exact measurable_of_countable rademacherValue

/-! The one-coordinate MGF estimate for a Rademacher law. -/
theorem rademacherWeightedMGFLe
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hX : Measurable X)
    (hLaw : Measure.map X μ = rademacherPMF.toMeasure)
    (lam a : ℝ) :
    (∫ ω, Real.exp (lam * (a * X ω)) ∂μ) ≤
      Real.exp ((lam * a) ^ 2 / 2) := by
  calc
    (∫ ω, Real.exp (lam * (a * X ω)) ∂μ) = Real.cosh (lam * a) :=
      rademacherWeightedMGFEqCosh hX hLaw lam a
    _ ≤ Real.exp ((lam * a) ^ 2 / 2) := coshLeExpHalfSq (lam * a)

/-! One-sided Rademacher Hoeffding, with the positive coefficient-energy branch
made explicit so the optimized exponent never divides by zero. -/
theorem integrable_exp_mul_rademacher
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ}
    (hX : Measurable X)
    (hLaw : Measure.map X μ = rademacherPMF.toMeasure)
    (lam a : ℝ) :
    Integrable (fun ω => Real.exp (lam * (a * X ω))) μ := by
  let f : ℝ → ℝ := fun x => Real.exp (lam * (a * x))
  have hf_bool :
      Integrable (fun b : Bool => f (rademacherValue b)) fairBernoulliPMF.toMeasure :=
    Integrable.of_finite
  have hf_rademacher : Integrable f rademacherPMF.toMeasure := by
    unfold rademacherPMF
    rw [← PMF.toMeasure_map]
    · rw [integrable_map_measure (by fun_prop)
          (measurable_of_countable rademacherValue).aemeasurable]
      simpa [Function.comp_def] using hf_bool
    · exact measurable_of_countable rademacherValue
  have hf_map : Integrable f (Measure.map X μ) := by
    rw [hLaw]
    exact hf_rademacher
  simpa [f, Function.comp_def] using hf_map.comp_measurable hX

theorem rademacherHoeffding
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {a : ι → ℝ} {t : ℝ}
    (hX : ∀ i, Measurable (X i))
    (hIndep : iIndepFun X μ)
    (hLaw : ∀ i, Measure.map (X i) μ =
      NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF.toMeasure)
    (hExp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam * (a i * X i ω))) μ)
    (ht : 0 ≤ t) (hv : 0 < ∑ i, (a i) ^ 2) :
    μ.real {ω | ∑ i, a i * X i ω ≥ t} ≤
      Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) := by
  let v : ℝ := ∑ i, (a i) ^ 2
  let S : Ω → ℝ := fun ω => ∑ i, a i * X i ω
  have hS_meas : Measurable S := by
    dsimp [S]
    exact Finset.measurable_sum Finset.univ
      (fun i _ => (hX i).const_mul (a i))
  have hS_exp (lam : ℝ) :
      Integrable (fun ω => Real.exp (lam * S ω)) μ := by
    let Y : ι → Ω → ℝ := fun i ω => a i * X i ω
    have hY_meas : ∀ i, Measurable (Y i) := by
      intro i
      simpa [Y] using (hX i).const_mul (a i)
    have hY_indep : iIndepFun Y μ := by
      have hcomp := hIndep.comp (fun i x => a i * x)
        (fun _ => by fun_prop)
      simpa [Y, Function.comp_def] using hcomp
    have hY_exp : ∀ i, Integrable (fun ω => Real.exp (lam * Y i ω)) μ := by
      intro i
      simpa [Y] using hExp lam i
    have h := hY_indep.integrable_exp_mul_sum hY_meas
      (s := Finset.univ) (fun i _ => hY_exp i)
    simpa [S, Y] using h
  have hmgf (lam : ℝ) :
      (∫ ω, Real.exp (lam * S ω) ∂μ) =
        ∏ i, ∫ ω, Real.exp (lam * (a i * X i ω)) ∂μ := by
    simpa [S] using
      (mgfIndependentSum (μ := μ) (X := X) lam a hIndep (hExp lam))
  have hfactor (lam : ℝ) (i : ι) :
      (∫ ω, Real.exp (lam * (a i * X i ω)) ∂μ) ≤
        Real.exp ((lam * a i) ^ 2 / 2) :=
    rademacherWeightedMGFLe (hX i) (hLaw i) lam (a i)
  by_cases ht0 : t = 0
  · rw [ht0]
    have hprob : μ.real {ω | ∑ i, a i * X i ω ≥ 0} ≤ 1 := by
      rw [Measure.real_def]
      exact ENNReal.toReal_mono ENNReal.one_ne_top prob_le_one
    simpa [v] using hprob
  · have htpos : 0 < t := lt_of_le_of_ne ht (Ne.symm ht0)
    let lam : ℝ := t / v
    have hlam : 0 < lam := div_pos htpos (by simpa [v] using hv)
    have hupper := exponentialMarkovUpper hS_meas (lam := lam) (t := t)
      hlam (hS_exp lam)
    have hprod :
        (∏ i, ∫ ω, Real.exp (lam * (a i * X i ω)) ∂μ) ≤
          ∏ i, Real.exp ((lam * a i) ^ 2 / 2) := by
      apply Finset.prod_le_prod
      · intro i hi
        exact MeasureTheory.integral_nonneg (fun ω => Real.exp_nonneg _)
      · intro i hi
        exact hfactor lam i
    have hmgf_upper :
        (∫ ω, Real.exp (lam * S ω) ∂μ) ≤
          Real.exp (lam ^ 2 * v / 2) := by
      rw [hmgf lam]
      calc
        (∏ i, ∫ ω, Real.exp (lam * (a i * X i ω)) ∂μ) ≤
            ∏ i, Real.exp ((lam * a i) ^ 2 / 2) := hprod
        _ = Real.exp (lam ^ 2 * v / 2) := by
          rw [← Real.exp_sum]
          congr 1
          dsimp [v]
          ring_nf
          rw [Finset.mul_sum, Finset.sum_mul]
    calc
      μ.real {ω | ∑ i, a i * X i ω ≥ t} =
          μ.real (S ⁻¹' Set.Ici t) := by rfl
      _ ≤ Real.exp (-(lam * t)) * (∫ ω, Real.exp (lam * S ω) ∂μ) := by
        simpa using hupper
      _ ≤ Real.exp (-(lam * t)) * Real.exp (lam ^ 2 * v / 2) :=
        mul_le_mul_of_nonneg_left hmgf_upper (Real.exp_nonneg _)
      _ = Real.exp (-t ^ 2 / (2 * v)) := by
        rw [← Real.exp_add]
        congr 1
        dsimp [lam]
        field_simp [ne_of_gt (by simpa [v] using hv)]
        ring
      _ = Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) := by rfl

/-- Source-form one-sided Rademacher Hoeffding.  The exponential moments are
automatic from the Rademacher laws, and the zero-energy branch has right-hand
side one under the real-division convention. -/
theorem rademacherHoeffdingAll
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {a : ι → ℝ} {t : ℝ}
    (hX : ∀ i, Measurable (X i))
    (hIndep : iIndepFun X μ)
    (hLaw : ∀ i, Measure.map (X i) μ = rademacherPMF.toMeasure)
    (ht : 0 ≤ t) :
    μ.real {ω | ∑ i, a i * X i ω ≥ t} ≤
      Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) := by
  have hExp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam * (a i * X i ω))) μ := by
    intro lam i
    exact integrable_exp_mul_rademacher (hX i) (hLaw i) lam (a i)
  by_cases hv : 0 < ∑ i, (a i) ^ 2
  · exact rademacherHoeffding hX hIndep hLaw hExp ht hv
  · have hv_nonneg : 0 ≤ ∑ i, (a i) ^ 2 :=
      Finset.sum_nonneg fun i _ => sq_nonneg (a i)
    have hv_zero : ∑ i, (a i) ^ 2 = 0 :=
      le_antisymm (le_of_not_gt hv) hv_nonneg
    have hprob : μ.real {ω | ∑ i, a i * X i ω ≥ t} ≤ 1 := by
      rw [Measure.real_def]
      exact ENNReal.toReal_mono ENNReal.one_ne_top prob_le_one
    simpa [hv_zero] using hprob

/-- Zero coefficient energy is the deterministic zero-sum branch. -/
theorem rademacherHoeffdingZero
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {a : ι → ℝ} {t : ℝ}
    (ha : ∀ i, a i = 0) (ht : 0 < t) :
    μ.real {ω | ∑ i, a i * X i ω ≥ t} = 0 := by
  have hevent : {ω | ∑ i, a i * X i ω ≥ t} = (∅ : Set Ω) := by
    ext ω
    simp [ha, ht]
  rw [hevent]
  simp

/-! Two-sided Rademacher Hoeffding, using the explicit sign-symmetry law. -/
theorem rademacherTwoSidedHoeffding
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {a : ι → ℝ} {t : ℝ}
    (hX : ∀ i, Measurable (X i))
    (hIndep : iIndepFun X μ)
    (hLaw : ∀ i, Measure.map (X i) μ = rademacherPMF.toMeasure)
    (hNegLaw : ∀ i, Measure.map (fun ω => -X i ω) μ = rademacherPMF.toMeasure)
    (hExp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam * (a i * X i ω))) μ)
    (ht : 0 < t) (hv : 0 < ∑ i, (a i) ^ 2) :
    μ.real {ω | |∑ i, a i * X i ω| ≥ t} ≤
      2 * Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) := by
  let S : Ω → ℝ := fun ω => ∑ i, a i * X i ω
  let A : Set Ω := {ω | S ω ≥ t}
  let B : Set Ω := {ω | -S ω ≥ t}
  have hupper := rademacherHoeffding hX hIndep hLaw hExp ht.le hv
  let Y : ι → Ω → ℝ := fun i ω => -X i ω
  have hY_meas : ∀ i, Measurable (Y i) := by
    intro i
    simpa [Y] using (hX i).neg
  have hY_indep : iIndepFun Y μ := by
    have hcomp := hIndep.comp (fun _ x => -x) (fun _ => by fun_prop)
    simpa [Y, Function.comp_def] using hcomp
  have hY_exp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam * (a i * Y i ω))) μ := by
    intro lam i
    simpa [Y, mul_assoc, mul_left_comm, mul_comm] using hExp (-lam) i
  have hY_law : ∀ i, Measure.map (Y i) μ = rademacherPMF.toMeasure := by
    intro i
    simpa [Y] using hNegLaw i
  have hlower := rademacherHoeffding hY_meas hY_indep hY_law hY_exp ht.le hv
  have measureReal_mono_prob {C D : Set Ω} (hCD : C ⊆ D) :
      μ.real C ≤ μ.real D := by
    rw [Measure.real_def, Measure.real_def]
    exact ENNReal.toReal_mono (measure_ne_top μ D) (measure_mono hCD)
  have hsubset : {ω | |S ω| ≥ t} ⊆ A ∪ B := by
    intro ω hω
    change t ≤ |S ω| at hω
    change t ≤ S ω ∨ t ≤ -S ω
    by_cases hupperS : t ≤ S ω
    · exact Or.inl hupperS
    · right
      have hSlt : S ω < t := lt_of_not_ge hupperS
      by_contra hnot
      have hneglt : -S ω < t := lt_of_not_ge hnot
      exact (not_lt_of_ge hω) ((abs_lt).2 (by constructor <;> linarith))
  have hmeasure_union : μ.real (A ∪ B) ≤ μ.real A + μ.real B := by
    rw [Measure.real_def, Measure.real_def, Measure.real_def]
    calc
      (μ (A ∪ B)).toReal ≤ (μ A + μ B).toReal := by
        apply ENNReal.toReal_mono
        · exact ENNReal.add_ne_top.mpr ⟨measure_ne_top μ A, measure_ne_top μ B⟩
        · exact measure_union_le A B
      _ = (μ A).toReal + (μ B).toReal :=
        ENNReal.toReal_add (measure_ne_top μ A) (measure_ne_top μ B)
  have hupperA : μ.real A ≤
      Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) := by
    simpa [A, S] using hupper
  have hlowerB : μ.real B ≤
      Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) := by
    simpa [B, S, Y, Finset.sum_neg_distrib] using hlower
  calc
    μ.real {ω | |∑ i, a i * X i ω| ≥ t} = μ.real {ω | |S ω| ≥ t} := by rfl
    _ ≤ μ.real (A ∪ B) := measureReal_mono_prob hsubset
    _ ≤ μ.real A + μ.real B := hmeasure_union
    _ ≤ Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) +
        Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) :=
      add_le_add hupperA hlowerB
    _ = 2 * Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) := by ring

/-! The fair-coin application before Remark 2.2.4. -/
theorem fairCoinHoeffding
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool}
    (hB : ∀ i, Measurable (B i))
    (hIndep : iIndepFun B μ)
    (hLaw : ∀ i, Measure.map (B i) μ = fairBernoulliPMF.toMeasure)
    (hExp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam * rademacherValue (B i ω))) μ)
    (hN : 0 < Fintype.card ι) :
    μ.real {ω | ∑ i, bernoulliIndicator (B i ω) ≥
      (3 / 4 : ℝ) * (Fintype.card ι : ℝ)} ≤
      Real.exp (-(Fintype.card ι : ℝ) / 8) := by
  let R : ι → Ω → ℝ := fun i ω => rademacherValue (B i ω)
  have hR : ∀ i, Measurable (R i) := by
    intro i
    simpa [R, Function.comp_def] using
      (measurable_of_countable rademacherValue).comp (hB i)
  have hR_indep : iIndepFun R μ := by
    have hcomp := hIndep.comp (fun _ b => rademacherValue b)
      (fun _ => measurable_of_countable rademacherValue)
    simpa [R, Function.comp_def] using hcomp
  have hR_law : ∀ i, Measure.map (R i) μ = rademacherPMF.toMeasure := by
    intro i
    rw [show R i = rademacherValue ∘ B i by rfl]
    rw [← MeasureTheory.Measure.map_map
      (measurable_of_countable rademacherValue) (hB i)]
    rw [hLaw i]
    change Measure.map rademacherValue fairBernoulliPMF.toMeasure =
      (PMF.map rademacherValue fairBernoulliPMF).toMeasure
    exact PMF.toMeasure_map rademacherValue fairBernoulliPMF
      (measurable_of_countable rademacherValue)
  have hR_exp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam * (1 * R i ω))) μ := by
    intro lam i
    simpa [R] using hExp lam i
  have htail := rademacherHoeffding (X := R) (a := fun _ => (1 : ℝ))
    (t := (Fintype.card ι : ℝ) / 2) hR hR_indep hR_law hR_exp
    (by positivity) (by simpa using hN)
  let A : Set Ω := {ω | ∑ i, bernoulliIndicator (B i ω) ≥
    (3 / 4 : ℝ) * (Fintype.card ι : ℝ)}
  let C : Set Ω := {ω | ∑ i, R i ω ≥ (Fintype.card ι : ℝ) / 2}
  have hAC : A ⊆ C := by
    intro ω hω
    have hsum : ∑ i, R i ω =
        2 * ∑ i, bernoulliIndicator (B i ω) - (Fintype.card ι : ℝ) := by
      simp_rw [R, rademacherValue_eq_affine]
      rw [Finset.sum_sub_distrib, ← Finset.mul_sum]
      simp
    change (Fintype.card ι : ℝ) / 2 ≤ ∑ i, R i ω
    rw [hsum]
    change (3 / 4 : ℝ) * (Fintype.card ι : ℝ) ≤
      ∑ i, bernoulliIndicator (B i ω) at hω
    linarith
  have hmeasure : μ.real A ≤ μ.real C := by
    rw [Measure.real_def, Measure.real_def]
    exact ENNReal.toReal_mono (measure_ne_top μ C) (measure_mono hAC)
  calc
    μ.real {ω | ∑ i, bernoulliIndicator (B i ω) ≥
        (3 / 4 : ℝ) * (Fintype.card ι : ℝ)} = μ.real A := by rfl
    _ ≤ μ.real C := hmeasure
    _ ≤ Real.exp (-((Fintype.card ι : ℝ) / 2) ^ 2 /
        (2 * ∑ i, (1 : ℝ) ^ 2)) := by
      simpa [C] using htail
    _ = Real.exp (-(Fintype.card ι : ℝ) / 8) := by
      congr 1
      have hNreal : 0 < (Fintype.card ι : ℝ) := by exact_mod_cast hN
      simp only [one_pow]
      rw [show (∑ i : ι, (1 : ℝ)) = (Fintype.card ι : ℝ) by simp]
      field_simp [ne_of_gt hNreal]
      ring

/-! The positive-total-width branch of the bounded-variable Hoeffding theorem. -/
theorem boundedIndependentHoeffding
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {m M : ι → ℝ} {t : ℝ}
    (hX : ∀ i, Measurable (X i))
    (hIndep : iIndepFun X μ)
    (hbound : ∀ i, ∀ᵐ ω ∂μ, X i ω ∈ Set.Icc (m i) (M i))
    (ht : 0 < t) (hv : 0 < ∑ i, ‖M i - m i‖ ^ 2) :
    μ.real {ω | ∑ i, (X i ω - ∫ y, X i y ∂μ) ≥ t} ≤
      Real.exp (-2 * t ^ 2 / (∑ i, ‖M i - m i‖ ^ 2)) := by
  let b : ι → ℝ := fun i => ∫ y, X i y ∂μ
  let Y : ι → Ω → ℝ := fun i ω => X i ω - b i
  let S : Ω → ℝ := fun ω => ∑ i, Y i ω
  let v : ℝ := ∑ i, ‖M i - m i‖ ^ 2
  have hY_meas : ∀ i, Measurable (Y i) := by
    intro i
    simpa [Y, b] using (hX i).sub measurable_const
  have hY_indep : iIndepFun Y μ := by
    have hcomp := hIndep.comp (fun i x => x - b i)
      (fun _ => by fun_prop)
    simpa [Y, b, Function.comp_def] using hcomp
  have hY_sub : ∀ i, HasSubgaussianMGF (Y i)
      ((‖M i - m i‖₊ / 2) ^ 2) μ := by
    intro i
    simpa [Y, b] using
      (hoeffdingCenteredMGF (μ := μ) (X := X i) (a := m i) (b := M i)
        (hX i).aemeasurable (hbound i))
  have hY_exp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam * Y i ω)) μ := by
    intro lam i
    simpa using (hY_sub i).integrable_exp_mul lam
  have hS_meas : Measurable S := by
    dsimp [S]
    exact Finset.measurable_sum Finset.univ (fun i _ => hY_meas i)
  have hS_exp (lam : ℝ) :
      Integrable (fun ω => Real.exp (lam * S ω)) μ := by
    have h := hY_indep.integrable_exp_mul_sum hY_meas
      (s := Finset.univ) (fun i _ => hY_exp lam i)
    simpa [S] using h
  have hmgf (lam : ℝ) :
      (∫ ω, Real.exp (lam * S ω) ∂μ) =
        ∏ i, ∫ ω, Real.exp (lam * (1 * Y i ω)) ∂μ := by
    simpa [S] using
      (mgfIndependentSum (μ := μ) (X := Y) lam (fun _ => (1 : ℝ))
        hY_indep (fun i => by simpa using hY_exp lam i))
  have hfactor (lam : ℝ) (i : ι) :
      (∫ ω, Real.exp (lam * (1 * Y i ω)) ∂μ) ≤
        Real.exp ((lam * ‖M i - m i‖) ^ 2 / 8) := by
    have hle := (hY_sub i).mgf_le lam
    convert hle using 1 <;>
      simp [ProbabilityTheory.mgf, Y, b, div_eq_mul_inv] <;> ring
  have hmgf_upper (lam : ℝ) :
      (∫ ω, Real.exp (lam * S ω) ∂μ) ≤
        Real.exp (lam ^ 2 * v / 8) := by
    have hprod :
        (∏ i, ∫ ω, Real.exp (lam * (1 * Y i ω)) ∂μ) ≤
          ∏ i, Real.exp ((lam * ‖M i - m i‖) ^ 2 / 8) := by
      apply Finset.prod_le_prod
      · intro i hi
        exact MeasureTheory.integral_nonneg (fun ω => Real.exp_nonneg _)
      · intro i hi
        exact hfactor lam i
    rw [hmgf]
    calc
      (∏ i, ∫ ω, Real.exp (lam * (1 * Y i ω)) ∂μ) ≤
          ∏ i, Real.exp ((lam * ‖M i - m i‖) ^ 2 / 8) := hprod
      _ = Real.exp (lam ^ 2 * v / 8) := by
        rw [← Real.exp_sum]
        congr 1
        dsimp [v]
        ring_nf
        rw [Finset.mul_sum, Finset.sum_mul]
  have hupper (lam : ℝ) (hlam : 0 < lam) :
      μ.real (S ⁻¹' Set.Ici t) ≤
        Real.exp (-(lam * t)) * Real.exp (lam ^ 2 * v / 8) := by
    calc
      μ.real (S ⁻¹' Set.Ici t) ≤
          Real.exp (-(lam * t)) * (∫ ω, Real.exp (lam * S ω) ∂μ) :=
        exponentialMarkovUpper hS_meas hlam (hS_exp lam)
      _ ≤ Real.exp (-(lam * t)) * Real.exp (lam ^ 2 * v / 8) :=
        mul_le_mul_of_nonneg_left (hmgf_upper lam) (Real.exp_nonneg _)
  have hv' : 0 < v := by simpa [v] using hv
  let lam : ℝ := 4 * t / v
  have hlam : 0 < lam := div_pos (by positivity) hv'
  have hupper' := hupper lam hlam
  calc
    μ.real {ω | ∑ i, (X i ω - ∫ y, X i y ∂μ) ≥ t} =
        μ.real (S ⁻¹' Set.Ici t) := by rfl
    _ ≤ Real.exp (-(lam * t)) * Real.exp (lam ^ 2 * v / 8) := hupper'
    _ = Real.exp (-2 * t ^ 2 / v) := by
      rw [← Real.exp_add]
      congr 1
      dsimp [lam]
      field_simp [ne_of_gt hv']
      ring
    _ = Real.exp (-2 * t ^ 2 / (∑ i, ‖M i - m i‖ ^ 2)) := by rfl

/-! Deterministic zero-width companion for the bounded-variable theorem. -/
theorem boundedIndependentHoeffdingZero
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {m : ι → ℝ} {t : ℝ}
    (hconst : ∀ i ω, X i ω = m i) (ht : 0 < t) :
    μ.real {ω | ∑ i, (X i ω - ∫ y, X i y ∂μ) ≥ t} = 0 := by
  have hmean : ∀ i, (∫ y, X i y ∂μ) = m i := by
    intro i
    simp [hconst i]
  have hevent : {ω | ∑ i, (X i ω - ∫ y, X i y ∂μ) ≥ t} = (∅ : Set Ω) := by
    ext ω
    simp [hconst, hmean, ht]
  rw [hevent]
  simp

/-! Majority-vote amplification from the bounded Hoeffding theorem. -/
theorem majorityVoteHoeffding
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {W : ι → Ω → ℝ} {δ ε : ℝ}
    (hW : ∀ i, Measurable (W i))
    (hIndep : iIndepFun W μ)
    (hbound : ∀ i, ∀ᵐ ω ∂μ, W i ω ∈ Set.Icc 0 1)
    (hmean : ∀ i, (∫ y, W i y ∂μ) ≤ 1 / 2 - δ)
    (hδ : 0 < δ) (hε0 : 0 < ε) (hε1 : ε < 1)
    (hN : 0 < Fintype.card ι)
    (hNlarge : Real.log (1 / ε) / (2 * δ ^ 2) ≤ (Fintype.card ι : ℝ)) :
    μ.real {ω | ∑ i, W i ω ≥ (Fintype.card ι : ℝ) / 2} ≤ ε := by
  let N : ℝ := Fintype.card ι
  let A : Set Ω := {ω | ∑ i, W i ω ≥ N / 2}
  let C : Set Ω := {ω | ∑ i, (W i ω - ∫ y, W i y ∂μ) ≥ N * δ}
  have hNpos : 0 < N := by simpa [N] using hN
  have htail := boundedIndependentHoeffding (X := W)
    (m := fun _ => (0 : ℝ)) (M := fun _ => (1 : ℝ)) (t := N * δ)
    hW hIndep hbound (by positivity)
    (by simpa [N] using hN)
  have hsum_mean : ∑ i, (∫ y, W i y ∂μ) ≤ N * (1 / 2 - δ) := by
    calc
      ∑ i, (∫ y, W i y ∂μ) ≤ ∑ i, (1 / 2 - δ) := by
        exact Finset.sum_le_sum (fun i hi => hmean i)
      _ = N * (1 / 2 - δ) := by simp [N]; ring
  have hAC : A ⊆ C := by
    intro ω hω
    have hsum : ∑ i, (W i ω - ∫ y, W i y ∂μ) =
        (∑ i, W i ω) - ∑ i, (∫ y, W i y ∂μ) := by
      rw [Finset.sum_sub_distrib]
    change N * δ ≤ ∑ i, (W i ω - ∫ y, W i y ∂μ)
    rw [hsum]
    change N / 2 ≤ ∑ i, W i ω at hω
    linarith
  have hmeasure : μ.real A ≤ μ.real C := by
    rw [Measure.real_def, Measure.real_def]
    exact ENNReal.toReal_mono (measure_ne_top μ C) (measure_mono hAC)
  have htailC : μ.real C ≤ Real.exp (-2 * (N * δ) ^ 2 / N) := by
    simpa [C, N] using htail
  have htailN : μ.real C ≤ Real.exp (-2 * N * δ ^ 2) := by
    calc
      μ.real C ≤ Real.exp (-2 * (N * δ) ^ 2 / N) := htailC
      _ = Real.exp (-2 * N * δ ^ 2) := by
        congr 1
        field_simp [ne_of_gt hNpos]
  have hlog_bound : -2 * N * δ ^ 2 ≤ Real.log ε := by
    have hden : 0 < 2 * δ ^ 2 := by positivity
    have hscaled := (div_le_iff₀ hden).1 hNlarge
    have hscaled' : -Real.log ε ≤ N * (2 * δ ^ 2) := by
      simpa [N, one_div, Real.log_inv] using hscaled
    linarith
  have hexp : Real.exp (-2 * N * δ ^ 2) ≤ ε := by
    calc
      Real.exp (-2 * N * δ ^ 2) ≤ Real.exp (Real.log ε) :=
        (Real.exp_le_exp).2 hlog_bound
      _ = ε := Real.exp_log hε0
  calc
    μ.real {ω | ∑ i, W i ω ≥ (Fintype.card ι : ℝ) / 2} = μ.real A := by rfl
    _ ≤ μ.real C := hmeasure
    _ ≤ Real.exp (-2 * N * δ ^ 2) := htailN
    _ ≤ ε := hexp

/-- A probability density supported on the nonnegative half-line and bounded by one. -/
structure BoundedDensityOnNonnegative (f : ℝ → ℝ) : Prop where
  nonnegative : ∀ᵐ x ∂(volume : Measure ℝ), 0 ≤ f x
  supported : ∀ᵐ x ∂(volume : Measure ℝ), x < 0 → f x = 0
  bounded : ∀ᵐ x ∂(volume : Measure ℝ), 0 ≤ x → f x ≤ 1
  integrable : Integrable f volume
  normalized : ∫ x, f x ∂volume = 1

/-- The Laplace transform of a nonnegative density bounded by one is at most `1 / t`. -/
theorem laplaceTransformLeInv {f : ℝ → ℝ}
    (hf : BoundedDensityOnNonnegative f) {t : ℝ} (ht : 0 < t) :
    ∫ x, Real.exp (-t * x) * f x ∂(volume : Measure ℝ) ≤ 1 / t := by
  let g : ℝ → ℝ := Set.indicator (Set.Ioi 0) (fun x => Real.exp (-t * x))
  have hg_on : IntegrableOn (fun x : ℝ => Real.exp (-t * x)) (Set.Ioi 0) := by
    simpa [mul_comm] using
      (integrableOn_exp_mul_Ioi (a := -t) (by linarith) (0 : ℝ))
  have hg : Integrable g (volume : Measure ℝ) :=
    hg_on.integrable_indicator measurableSet_Ioi
  have hnonneg : 0 ≤ᵐ[(volume : Measure ℝ)] fun x => Real.exp (-t * x) * f x := by
    filter_upwards [hf.nonnegative] with x hfx
    exact mul_nonneg (Real.exp_nonneg _) hfx
  have hle : (fun x => Real.exp (-t * x) * f x) ≤ᵐ[(volume : Measure ℝ)] g := by
    filter_upwards [hf.supported, hf.bounded, (volume : Measure ℝ).ae_ne 0] with x hs hb hx0
    by_cases hx : 0 ≤ x
    · have hx' : 0 < x := lt_of_le_of_ne hx (Ne.symm hx0)
      rw [show g x = Real.exp (-t * x) by simp [g, Set.mem_Ioi.mpr hx']]
      simpa using mul_le_mul_of_nonneg_left (hb hx) (Real.exp_nonneg (-t * x))
    · have hx' : x < 0 := lt_of_not_ge hx
      rw [show g x = 0 by simp [g, Set.mem_Ioi, not_lt.mpr (le_of_lt hx')], hs hx', mul_zero]
  calc
    ∫ x, Real.exp (-t * x) * f x ∂(volume : Measure ℝ)
        ≤ ∫ x, g x ∂(volume : Measure ℝ) :=
      integral_mono_of_nonneg hnonneg hg hle
    _ = ∫ x in Set.Ioi 0, Real.exp (-t * x) ∂(volume : Measure ℝ) := by
      simp [g, integral_indicator measurableSet_Ioi]
    _ = -Real.exp ((-t) * 0) / (-t) :=
      integral_exp_mul_Ioi (by linarith) 0
    _ = 1 / t := by simp

/-! The finite exponential-Markov upper and lower tail bounds. -/
theorem exponentialMarkov
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {S : Ω → ℝ} (hS : Measurable S)
    {lam t : ℝ} (hlam : 0 < lam)
    (hExp : Integrable (fun ω => Real.exp (lam * S ω)) μ)
    (hExpNeg : Integrable (fun ω => Real.exp (lam * (-S ω))) μ) :
    (μ.real (S ⁻¹' Set.Ici t) ≤
        Real.exp (-(lam * t)) *
          (∫ ω, Real.exp (lam * S ω) ∂μ)) ∧
      (μ.real ((fun ω => -S ω) ⁻¹' Set.Ici t) ≤
        Real.exp (-(lam * t)) *
          (∫ ω, Real.exp (lam * (-S ω)) ∂μ)) := by
  let Y : Ω → ℝ := fun ω => Real.exp (lam * S ω)
  have hY : Measurable Y := by
    simpa [Y] using (hS.const_mul lam).exp
  have hY_nonneg : ∀ᵐ ω ∂μ, 0 ≤ Y ω :=
    Filter.Eventually.of_forall (fun ω => le_of_lt (Real.exp_pos _))
  have hY_int : Integrable Y μ := by
    simpa [Y] using hExp
  have hY_markov :=
    NumStability.HDP.Scalar.Preliminaries.markovInequalityFinite
      hY hY_nonneg hY_int (Real.exp_pos (lam * t))
  have measureReal_mono_prob {A B : Set Ω} (hAB : A ⊆ B) :
      μ.real A ≤ μ.real B := by
    rw [Measure.real_def, Measure.real_def]
    exact ENNReal.toReal_mono (measure_ne_top μ B) (measure_mono hAB)
  have hupper_subset : S ⁻¹' Set.Ici t ⊆
      Y ⁻¹' Set.Ici (Real.exp (lam * t)) := by
    intro ω hω
    change t ≤ S ω at hω
    change Real.exp (lam * t) ≤ Real.exp (lam * S ω)
    exact (Real.exp_le_exp).2 (mul_le_mul_of_nonneg_left hω hlam.le)
  have hupper : μ.real (S ⁻¹' Set.Ici t) ≤
      Real.exp (-(lam * t)) * (∫ ω, Real.exp (lam * S ω) ∂μ) := by
    calc
      μ.real (S ⁻¹' Set.Ici t) ≤ μ.real (Y ⁻¹' Set.Ici (Real.exp (lam * t))) :=
        measureReal_mono_prob hupper_subset
      _ ≤ (∫ ω, Y ω ∂μ) / Real.exp (lam * t) := by
        simpa [Preliminaries.expectation] using hY_markov
      _ = Real.exp (-(lam * t)) * (∫ ω, Real.exp (lam * S ω) ∂μ) := by
        simp [Y, Real.exp_neg, div_eq_mul_inv]
        ring
  let Z : Ω → ℝ := fun ω => -S ω
  let W : Ω → ℝ := fun ω => Real.exp (lam * Z ω)
  have hZ : Measurable Z := by
    simpa [Z] using hS.neg
  have hW : Measurable W := by
    simpa [W] using (hZ.const_mul lam).exp
  have hW_nonneg : ∀ᵐ ω ∂μ, 0 ≤ W ω :=
    Filter.Eventually.of_forall (fun ω => le_of_lt (Real.exp_pos _))
  have hW_int : Integrable W μ := by
    simpa [W, Z] using hExpNeg
  have hW_markov :=
    NumStability.HDP.Scalar.Preliminaries.markovInequalityFinite
      hW hW_nonneg hW_int (Real.exp_pos (lam * t))
  have hlower_subset : Z ⁻¹' Set.Ici t ⊆
      W ⁻¹' Set.Ici (Real.exp (lam * t)) := by
    intro ω hω
    change t ≤ Z ω at hω
    change Real.exp (lam * t) ≤ Real.exp (lam * Z ω)
    exact (Real.exp_le_exp).2 (mul_le_mul_of_nonneg_left hω hlam.le)
  have hlower : μ.real (Z ⁻¹' Set.Ici t) ≤
      Real.exp (-(lam * t)) * (∫ ω, Real.exp (lam * (-S ω)) ∂μ) := by
    calc
      μ.real (Z ⁻¹' Set.Ici t) ≤ μ.real (W ⁻¹' Set.Ici (Real.exp (lam * t))) :=
        measureReal_mono_prob hlower_subset
      _ ≤ (∫ ω, W ω ∂μ) / Real.exp (lam * t) := by
        simpa [Preliminaries.expectation] using hW_markov
      _ = Real.exp (-(lam * t)) * (∫ ω, Real.exp (lam * (-S ω)) ∂μ) := by
        simp [W, Z, Real.exp_neg, div_eq_mul_inv]
        ring
  exact ⟨hupper, hlower⟩

/-! The finite independent-sum small-ball estimate from Exercise 2.2.10(b). -/
theorem smallBallProbability
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {ε : ℝ} (hε : 0 < ε)
    (hX : ∀ i, Measurable (X i)) (hIndep : iIndepFun X μ)
    (hLaplace : ∀ i,
      Integrable (fun ω => Real.exp (-(1 / ε) * X i ω)) μ ∧
        (∫ ω, Real.exp (-(1 / ε) * X i ω) ∂μ) ≤ ε) :
    μ.real {ω | ∑ i, X i ω ≤ ε * (Fintype.card ι : ℝ)} ≤
      (Real.exp 1 * ε) ^ Fintype.card ι := by
  let a : ι → ℝ := fun _ => -(1 / ε)
  let Z : ι → Ω → ℝ := fun i ω => a i * X i ω
  let S : Ω → ℝ := fun ω => ∑ i, Z i ω
  have ha_meas : ∀ i, Measurable (fun x : ℝ => a i * x) := by
    intro i
    fun_prop
  have hZ_meas : ∀ i, Measurable (Z i) := by
    intro i
    simpa [Z] using (hX i).const_mul (a i)
  have hZ_indep : iIndepFun Z μ := by
    simpa [Z, Function.comp_def] using hIndep.comp (fun i x => a i * x) ha_meas
  have hZ_exp : ∀ i, Integrable (fun ω => Real.exp (Z i ω)) μ := by
    intro i
    simpa [Z, a] using (hLaplace i).1
  have hS_meas : Measurable S := by
    dsimp [S]
    exact Finset.measurable_sum Finset.univ (fun i _ => hZ_meas i)
  have hS_exp : Integrable (fun ω => Real.exp (S ω)) μ := by
    simpa [S] using
      (hZ_indep.integrable_exp_mul_sum (t := (1 : ℝ)) hZ_meas
        (s := Finset.univ) (fun i _ => by simpa using hZ_exp i))
  have hmgf := mgfIndependentSum (μ := μ) (X := X) 1 a hIndep (by
    intro i
    simpa [Z, a] using hZ_exp i)
  have hupper := exponentialMarkovUpper hS_meas (lam := (1 : ℝ))
    (t := -(Fintype.card ι : ℝ)) one_pos (by simpa using hS_exp)
  have hS_formula : ∀ ω, S ω = -(∑ i, X i ω) / ε := by
    intro ω
    dsimp [S, Z, a]
    rw [← Finset.mul_sum]
    field_simp
  have hevent :
      {ω | ∑ i, X i ω ≤ ε * (Fintype.card ι : ℝ)} =
        S ⁻¹' Set.Ici (-(Fintype.card ι : ℝ)) := by
    ext ω
    rw [Set.mem_setOf_eq, Set.mem_preimage, Set.mem_Ici]
    rw [hS_formula]
    constructor
    · intro h
      apply (le_div_iff₀ hε).2
      linarith
    · intro h
      have h' := (le_div_iff₀ hε).1 h
      linarith
  have hmgfS :
      (∫ ω, Real.exp (S ω) ∂μ) =
        ∏ i, ∫ ω, Real.exp (a i * X i ω) ∂μ := by
    calc
      (∫ ω, Real.exp (S ω) ∂μ) =
          ∫ ω, Real.exp (1 * ∑ i, a i * X i ω) ∂μ := by
            simp [S, Z]
      _ = ∏ i, ∫ ω, Real.exp (1 * (a i * X i ω)) ∂μ := hmgf
      _ = ∏ i, ∫ ω, Real.exp (a i * X i ω) ∂μ := by
        simp
  have hprod :
      (∏ i, ∫ ω, Real.exp (a i * X i ω) ∂μ) ≤ ε ^ Fintype.card ι := by
    calc
      (∏ i, ∫ ω, Real.exp (a i * X i ω) ∂μ) ≤
          ∏ i, ε := Finset.prod_le_prod
            (fun i _ => integral_nonneg_of_ae
              (Filter.Eventually.of_forall (fun ω => le_of_lt (Real.exp_pos _))))
            (fun i _ => by simpa [a] using (hLaplace i).2)
      _ = ε ^ Fintype.card ι := by simp
  rw [hevent]
  calc
    μ.real (S ⁻¹' Set.Ici (-(Fintype.card ι : ℝ))) ≤
        Real.exp (Fintype.card ι : ℝ) * (∫ ω, Real.exp (S ω) ∂μ) := by
      simpa using hupper
    _ = Real.exp (Fintype.card ι : ℝ) *
        (∏ i, ∫ ω, Real.exp (a i * X i ω) ∂μ) := by rw [hmgfS]
    _ ≤ Real.exp (Fintype.card ι : ℝ) * ε ^ Fintype.card ι :=
      mul_le_mul_of_nonneg_left hprod (le_of_lt (Real.exp_pos _))
    _ = (Real.exp 1 * ε) ^ Fintype.card ι := by
      rw [mul_pow]
      congr 1
      rw [← Real.exp_nat_mul]
      norm_num

end NumStability.HDP.Scalar.IndependentSums.Hoeffding

namespace NumStability.HDP.Contract

/-! Stable source-facing alias for Theorem 2.2.2. -/
theorem hdp_02_hthm_h2_d2_d2
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {a : ι → ℝ} {t : ℝ}
    (hX : ∀ i, Measurable (X i))
    (hIndep : iIndepFun X μ)
    (hLaw : ∀ i, Measure.map (X i) μ =
      NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF.toMeasure)
    (ht : 0 ≤ t) :
    μ.real {ω | ∑ i, a i * X i ω ≥ t} ≤
      Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherHoeffdingAll
    hX hIndep hLaw ht

/-! Stable source-facing alias for Theorem 2.2.5. -/
theorem hdp_02_hthm_h2_d2_d5
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {a : ι → ℝ} {t : ℝ}
    (hX : ∀ i, Measurable (X i))
    (hIndep : iIndepFun X μ)
    (hLaw : ∀ i, Measure.map (X i) μ =
      NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF.toMeasure)
    (hNegLaw : ∀ i, Measure.map (fun ω => -X i ω) μ =
      NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF.toMeasure)
    (hExp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam * (a i * X i ω))) μ)
    (ht : 0 < t) (hv : 0 < ∑ i, (a i) ^ 2) :
    μ.real {ω | |∑ i, a i * X i ω| ≥ t} ≤
      2 * Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherTwoSidedHoeffding
    hX hIndep hLaw hNegLaw hExp ht hv

/-! Stable Chapter 2 alias for the fair-coin Hoeffding application. -/
theorem hdp_02_hex_hfair_hcoin_hhoeffding
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool}
    (hB : ∀ i, Measurable (B i))
    (hIndep : iIndepFun B μ)
    (hLaw : ∀ i, Measure.map (B i) μ =
      NumStability.HDP.Scalar.IndependentSums.Hoeffding.fairBernoulliPMF.toMeasure)
    (hExp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam *
        NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherValue (B i ω))) μ)
    (hN : 0 < Fintype.card ι) :
    μ.real {ω | ∑ i,
        NumStability.HDP.Scalar.IndependentSums.Hoeffding.bernoulliIndicator (B i ω) ≥
      (3 / 4 : ℝ) * (Fintype.card ι : ℝ)} ≤
      Real.exp (-(Fintype.card ι : ℝ) / 8) :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.fairCoinHoeffding
    hB hIndep hLaw hExp hN

/-! Stable Chapter 2 alias for the bounded-variable Hoeffding theorem. -/
theorem hdp_02_hthm_h2_d2_d6
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {m M : ι → ℝ} {t : ℝ}
    (hX : ∀ i, Measurable (X i))
    (hIndep : iIndepFun X μ)
    (hbound : ∀ i, ∀ᵐ ω ∂μ, X i ω ∈ Set.Icc (m i) (M i))
    (ht : 0 < t) (hv : 0 < ∑ i, ‖M i - m i‖ ^ 2) :
    μ.real {ω | ∑ i, (X i ω - ∫ y, X i y ∂μ) ≥ t} ≤
      Real.exp (-2 * t ^ 2 / (∑ i, ‖M i - m i‖ ^ 2)) :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.boundedIndependentHoeffding
    hX hIndep hbound ht hv

/-! Stable Chapter 2 alias for the bounded-variable proof exercise. -/
theorem hdp_02_hex_h2_d2_d7
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {m M : ι → ℝ} {t : ℝ}
    (hX : ∀ i, Measurable (X i))
    (hIndep : iIndepFun X μ)
    (hbound : ∀ i, ∀ᵐ ω ∂μ, X i ω ∈ Set.Icc (m i) (M i))
    (ht : 0 < t) (hv : 0 < ∑ i, ‖M i - m i‖ ^ 2) :
    μ.real {ω | ∑ i, (X i ω - ∫ y, X i y ∂μ) ≥ t} ≤
      Real.exp (-2 * t ^ 2 / (∑ i, ‖M i - m i‖ ^ 2)) :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.boundedIndependentHoeffding
    hX hIndep hbound ht hv

/-! Stable Chapter 2 alias for the majority-vote amplification exercise. -/
theorem hdp_02_hex_h2_d2_d8
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {W : ι → Ω → ℝ} {δ ε : ℝ}
    (hW : ∀ i, Measurable (W i))
    (hIndep : iIndepFun W μ)
    (hbound : ∀ i, ∀ᵐ ω ∂μ, W i ω ∈ Set.Icc 0 1)
    (hmean : ∀ i, (∫ y, W i y ∂μ) ≤ 1 / 2 - δ)
    (hδ : 0 < δ) (hε0 : 0 < ε) (hε1 : ε < 1)
    (hN : 0 < Fintype.card ι)
    (hNlarge : Real.log (1 / ε) / (2 * δ ^ 2) ≤ (Fintype.card ι : ℝ)) :
    μ.real {ω | ∑ i, W i ω ≥ (Fintype.card ι : ℝ) / 2} ≤ ε :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.majorityVoteHoeffding
    hW hIndep hbound hmean hδ hε0 hε1 hN hNlarge

/-- Stable Chapter 2 alias for the centered bounded-variable Hoeffding lemma. -/
theorem hdp_02_hlem_hhoeffding_hbounded_hmgf
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {a b : ℝ}
    (hX : AEMeasurable X μ)
    (hbound : ∀ᵐ ω ∂μ, X ω ∈ Set.Icc a b)
    (hmean : ∫ ω, X ω ∂μ = 0) :
    HasSubgaussianMGF X ((‖b - a‖₊ / 2) ^ 2) μ :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.hoeffdingBoundedMGF
    hX hbound hmean

theorem hdp_02_hlem_hhoeffding_hoptimization {v t : ℝ} (hv : 0 < v)
    (ht : 0 ≤ t) :
    (∀ u : ℝ, 0 ≤ u →
      -t ^ 2 / (2 * v) ≤ -u * t + u ^ 2 * v / 2) ∧
      (-(t / v) * t + (t / v) ^ 2 * v / 2 = -t ^ 2 / (2 * v)) :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.hoeffdingOptimization hv ht

/-- Stable Chapter 2 alias for Exercise 2.2.3. -/
theorem hdp_02_hex_h2_d2_d3 (x : ℝ) :
    Real.cosh x ≤ Real.exp (x ^ 2 / 2) :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.coshLeExpHalfSq x

/-- Stable Chapter 2 alias for Exercise 2.2.10(a). -/
theorem hdp_02_hex_h2_d2_d10a {f : ℝ → ℝ}
    (hf : NumStability.HDP.Scalar.IndependentSums.Hoeffding.BoundedDensityOnNonnegative f)
    {t : ℝ} (ht : 0 < t) :
    ∫ x, Real.exp (-t * x) * f x ∂(volume : Measure ℝ) ≤ 1 / t :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.laplaceTransformLeInv hf ht

end NumStability.HDP.Contract
```

### `NumStability.HDP.ContractSignatures.C_02_heq_h2_d1`

Path: `lean-numerical-stability/NumStability/HDP/ContractSignatures/C_02_heq_h2_d1.lean`
SHA-256: `6f4689ed4d235a0903dc83bd8575baccdd5202735244473b4ad3609990995e61`

```lean
import NumStability.HDP.Scalar.IndependentSums.Hoeffding

/-! Frozen proof-free signature for Equation (2.1). -/

noncomputable section

open MeasureTheory ProbabilityTheory
open scoped BigOperators ENNReal NNReal

namespace NumStability.HDP.Contract

open NumStability.HDP.Scalar.IndependentSums.Hoeffding

def hdp_02_heq_h2_d1__contract_type : Prop :=
  ∀ {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool},
    0 < Fintype.card ι →
      (∀ i, Measurable (B i)) →
      iIndepFun B μ →
      (∀ i, Measure.map (B i) μ = fairBernoulliPMF.toMeasure) →
      μ.real {ω | ∑ i, bernoulliIndicator (B i ω) ≥
          (3 / 4 : ℝ) * (Fintype.card ι : ℝ)} ≤
        μ.real {ω | |∑ i, bernoulliIndicator (B i ω) -
          (Fintype.card ι : ℝ) / 2| ≥
            (Fintype.card ι : ℝ) / 4} ∧
      μ.real {ω | |∑ i, bernoulliIndicator (B i ω) -
          (Fintype.card ι : ℝ) / 2| ≥
            (Fintype.card ι : ℝ) / 4} ≤
        4 / (Fintype.card ι : ℝ)

end NumStability.HDP.Contract
```

### `NumStability.HDP.Scalar.LimitTheorems`

Path: `lean-numerical-stability/NumStability/HDP/Scalar/LimitTheorems.lean`
SHA-256: `373c13e8ab8f8e5c97ed1d9fd4524a7e693aedb416287ed8305515c12b53d4ed`

```lean
import Mathlib.Probability.ProbabilityMassFunction.Binomial
import Mathlib.Probability.ProbabilityMassFunction.Integrals
import Mathlib.Probability.Distributions.Gaussian.Real
import Mathlib.Probability.Distributions.Poisson
import Mathlib.MeasureTheory.Function.ConvergenceInDistribution
import Mathlib.Probability.StrongLaw
import Mathlib.Tactic

/-!
# Bernoulli and binomial laws

This is the first current-main port from the archival Vershynin formalization.
The source target is Chapter 1, Section 1.3, p. 10.  The canonical laws are
Mathlib PMFs; the natural-valued Bernoulli law is the pushforward of the Bool
Bernoulli PMF, and the binomial law is the pushforward of Mathlib's finite
binomial PMF.
-/

noncomputable section

open MeasureTheory Filter
open ProbabilityTheory
open scoped BigOperators ENNReal NNReal Function

namespace NumStability.HDP.Scalar.LimitTheorems

/-- The probability law of an almost-everywhere measurable real random variable. -/
noncomputable def probabilityLaw
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : Ω → ℝ) (hX : AEMeasurable X μ) :
    MeasureTheory.ProbabilityMeasure ℝ :=
  ⟨Measure.map X μ, Measure.isProbabilityMeasure_map hX⟩

/-- Convergence in distribution as weak convergence of pushforward probability laws. -/
noncomputable def convergenceInDistribution
    {Ω ι : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ]
    (X : ι → Ω → ℝ) (l : Filter ι) (Z : Ω → ℝ)
    (hX : ∀ i, AEMeasurable (X i) μ) (hZ : AEMeasurable Z μ) : Prop :=
  Filter.Tendsto (fun i => probabilityLaw (X i) (hX i)) l
    (nhds (probabilityLaw Z hZ))

/-! The local foundation helper that closes the strong-law prerequisite. -/
theorem foundation_ext_slln
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X : ℕ → Ω → ℝ}
    (hInt : Integrable (X 0) μ)
    (hIndep : Pairwise ((· ⟂ᵢ[μ] ·) on X))
    (hIdent : ∀ i, IdentDistrib (X i) (X 0) μ μ) :
    ∀ᵐ ω ∂μ, Tendsto
      (fun n : ℕ => (∑ i ∈ Finset.range n, X i ω) / n) atTop
      (nhds (∫ ω, X 0 ω ∂μ)) := by
  exact ProbabilityTheory.strong_law_ae_real X hInt hIndep hIdent

/-! Chapter 1's strong law of large numbers. -/
theorem strongLaw
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X : ℕ → Ω → ℝ}
    (hInt : Integrable (X 0) μ)
    (hIndep : Pairwise ((· ⟂ᵢ[μ] ·) on X))
    (hIdent : ∀ i, IdentDistrib (X i) (X 0) μ μ) :
    ∀ᵐ ω ∂μ, Tendsto
      (fun n : ℕ => (∑ i ∈ Finset.range n, X i ω) / n) atTop
      (nhds (∫ ω, X 0 ω ∂μ)) := by
  exact foundation_ext_slln hInt hIndep hIdent

/-! ## Variance of a finite independent sum -/

theorem independentVarianceSum
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ]
    {X : ι → Ω → ℝ} (hX : ∀ i, MemLp (X i) 2 μ)
    (hIndep : Pairwise ((· ⟂ᵢ[μ] ·) on X)) :
    Var[∑ i, X i; μ] = ∑ i, Var[X i; μ] := by
  simpa using (ProbabilityTheory.IndepFun.variance_sum
    (μ := μ) (X := X) (s := Finset.univ)
    (fun i _ => hX i) (by
      intro i hi j hj hij
      exact hIndep hij))

/-! ## Variance of an iid sample mean -/

/--
The finite-sample variance identity from Chapter 1, equation (1.5).
The explicit `Fin N` index and `0 < N` hypothesis make the textbook's
`N ≥ 1` condition and the distinguished reference sample unambiguous.
-/
theorem iidSampleMeanVariance
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ]
    (N : ℕ) (hN : 0 < N)
    {X : Fin N → Ω → ℝ}
    (hX : ∀ i, MemLp (X i) 2 μ)
    (hIndep : Pairwise ((· ⟂ᵢ[μ] ·) on X))
    (hIdent : ∀ i, IdentDistrib (X i) (X ⟨0, hN⟩) μ μ) :
    Var[fun ω => (N : ℝ)⁻¹ * ∑ i, X i ω; μ] =
      (N : ℝ)⁻¹ * Var[X ⟨0, hN⟩; μ] := by
  have hsum := independentVarianceSum hX hIndep
  have hscale := ProbabilityTheory.variance_const_mul
    (μ := μ) (N : ℝ)⁻¹ (fun ω => ∑ i, X i ω)
  calc
    Var[fun ω => (N : ℝ)⁻¹ * ∑ i, X i ω; μ] =
        (N : ℝ)⁻¹ ^ 2 * Var[fun ω => ∑ i, X i ω; μ] := by
          simpa using hscale
    _ = (N : ℝ)⁻¹ ^ 2 * ∑ i, Var[X i; μ] := by
      have hfun : (fun ω => ∑ i, X i ω) = ∑ i, X i := by
        funext ω
        simp
      rw [hfun, hsum]
    _ = (N : ℝ)⁻¹ * Var[X ⟨0, hN⟩; μ] := by
      simp_rw [fun i => (hIdent i).variance_eq]
      rw [Finset.sum_const, Finset.card_fin]
      field_simp
      simp [nsmul_eq_mul]

/-! ## Expected absolute deviation of an iid sample mean -/

/-- On a probability space, the first absolute moment is bounded by the square
root of the second moment. -/
theorem expectedAbs_le_sqrt_secondMoment
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {Y : Ω → ℝ} (hY : MemLp Y 2 μ) :
    ∫ ω, |Y ω| ∂μ ≤ Real.sqrt (∫ ω, (Y ω) ^ 2 ∂μ) := by
  have hf : MemLp (fun ω => |Y ω|) (ENNReal.ofReal (2 : ℝ)) μ := by
    simpa [Real.norm_eq_abs] using hY.norm
  have hg : MemLp (fun _ω : Ω => (1 : ℝ))
      (ENNReal.ofReal (2 : ℝ)) μ := memLp_const (1 : ℝ)
  have hcs := integral_mul_le_Lp_mul_Lq_of_nonneg
    (μ := μ) (f := fun ω => |Y ω|) (g := fun _ => 1)
    (by
      rw [Real.holderConjugate_iff]
      norm_num : (2 : ℝ).HolderConjugate 2)
    (ae_of_all _ fun _ => abs_nonneg _)
    (ae_of_all _ fun _ => by norm_num) hf hg
  have hcs' :
      ∫ ω, |Y ω| ∂μ ≤
        (∫ ω, |Y ω| ^ (2 : ℝ) ∂μ) ^ ((1 : ℝ) / 2) *
          (∫ _ω : Ω, (1 : ℝ) ^ (2 : ℝ) ∂μ) ^ ((1 : ℝ) / 2) := by
    simpa using hcs
  norm_num only [Real.rpow_two] at hcs'
  have huniv : (∫ _ω : Ω, (1 : ℝ) ∂μ) = 1 := by simp
  rw [huniv] at hcs'
  simpa [Real.sqrt_eq_rpow, sq_abs] using hcs'

/-- The exact finite-sample estimate underlying Exercise 1.3.3. -/
theorem iidSampleMeanExpectedAbsDeviation
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (N : ℕ) (hN : 0 < N)
    {X : Fin N → Ω → ℝ}
    (hX : ∀ i, MemLp (X i) 2 μ)
    (hIndep : Pairwise ((· ⟂ᵢ[μ] ·) on X))
    (hIdent : ∀ i, IdentDistrib (X i) (X ⟨0, hN⟩) μ μ) :
    ∫ ω, |(N : ℝ)⁻¹ * ∑ i, X i ω -
        ∫ ω, X ⟨0, hN⟩ ω ∂μ| ∂μ ≤
      Real.sqrt ((N : ℝ)⁻¹ * Var[X ⟨0, hN⟩; μ]) := by
  let M : Ω → ℝ := fun ω => (N : ℝ)⁻¹ * ∑ i, X i ω
  have hM : MemLp M 2 μ := by
    dsimp [M]
    exact (memLp_finset_sum Finset.univ (fun i _ => hX i)).const_mul (N : ℝ)⁻¹
  have hMean : (∫ ω, M ω ∂μ) = ∫ ω, X ⟨0, hN⟩ ω ∂μ := by
    dsimp [M]
    rw [integral_const_mul, integral_finset_sum]
    · simp_rw [fun i => (hIdent i).integral_eq]
      rw [Finset.sum_const, Finset.card_fin]
      field_simp
      simp [nsmul_eq_mul]
    · intro i _
      exact (hX i).integrable (by norm_num)
  have hCentered :
      MemLp (fun ω => M ω - ∫ ω, X ⟨0, hN⟩ ω ∂μ) 2 μ :=
    hM.sub (memLp_const _)
  have hbound := expectedAbs_le_sqrt_secondMoment hCentered
  have hsecond :
      (∫ ω, (M ω - ∫ ω, X ⟨0, hN⟩ ω ∂μ) ^ 2 ∂μ) = Var[M; μ] := by
    rw [variance_eq_integral hM.aemeasurable, hMean]
  rw [hsecond] at hbound
  have hvariance := iidSampleMeanVariance N hN hX hIndep hIdent
  change Var[M; μ] = _ at hvariance
  rw [hvariance] at hbound
  change (∫ ω, |M ω - ∫ ω, X ⟨0, hN⟩ ω ∂μ| ∂μ) ≤ _
  exact hbound

/-! ## The standard normal law -/

/--
The standard normal law from Chapter 1, equation (1.6).  Mathlib's
`gaussianReal` is parameterized by mean and variance, so the source law is the
specialization `(μ, v) = (0, 1)`.
-/
noncomputable def standardNormalLaw : Measure ℝ :=
  ProbabilityTheory.gaussianReal 0 1

/-- A random variable has the Chapter 1 standard-normal law. -/
def HasStandardNormalLaw {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) : Prop :=
  ProbabilityTheory.HasLaw X standardNormalLaw μ

/-- The standard normal law is a probability measure. -/
instance standardNormalLaw.isProbabilityMeasure :
    IsProbabilityMeasure standardNormalLaw := by
  dsimp [standardNormalLaw]
  infer_instance

/-- The real density of `standardNormalLaw` is the density printed in (1.6). -/
theorem standardNormalLaw_pdf :
    ProbabilityTheory.gaussianPDFReal 0 1 =
      fun x : ℝ => (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-(x ^ 2) / 2) := by
  funext x
  simp only [ProbabilityTheory.gaussianPDFReal, NNReal.coe_one, sub_zero,
    one_mul, Nat.cast_ofNat]
  congr 1
  · congr 1
    ring
  · ring

/-! ## The Poisson law -/

/--
The Poisson law from Chapter 1, equation (1.8).  The nonnegative rate is
represented by Mathlib's `NNReal` parameter, and the law is supported on
`ℕ`.
-/
noncomputable def poissonLaw (rate : ℝ≥0) : Measure ℕ :=
  ProbabilityTheory.poissonMeasure rate

/-- A random variable has the Chapter 1 Poisson law with rate `λ`. -/
def HasPoissonLaw {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℕ) (rate : ℝ≥0) : Prop :=
  ProbabilityTheory.HasLaw X (poissonLaw rate) μ

/-- The Poisson law is a probability measure. -/
instance poissonLaw.isProbabilityMeasure (rate : ℝ≥0) :
    IsProbabilityMeasure (poissonLaw rate) := by
  dsimp [poissonLaw]
  infer_instance

/-- The point mass of `poissonLaw` is the mass printed in (1.8). -/
theorem poissonLaw_mass (rate : ℝ≥0) (k : ℕ) :
    poissonLaw rate {k} =
      ENNReal.ofReal (Real.exp (-(rate : ℝ)) * (rate : ℝ) ^ k / Nat.factorial k) := by
  rw [poissonLaw, ProbabilityTheory.poissonMeasure,
    PMF.toMeasure_apply_singleton _ k (measurableSet_singleton k)]
  rfl

/-! ## Canonical laws -/

/-- The `{0,1}`-valued Bernoulli PMF on `ℕ`. -/
def bernoulliNatPMF (p : ℝ≥0) (hp : p ≤ 1) : PMF ℕ :=
  (PMF.bernoulli p hp).map fun b => if b then 1 else 0

/-- The binomial PMF on `ℕ`, obtained from Mathlib's finite-support law. -/
def binomialNatPMF (p : ℝ≥0) (hp : p ≤ 1) (N : ℕ) : PMF ℕ :=
  (PMF.binomial p hp N).map fun i : Fin (N + 1) => (i : ℕ)

/-- The real-valued Bernoulli PMF, used for expectation and variance. -/
def bernoulliRealPMF (p : ℝ≥0) (hp : p ≤ 1) : PMF ℝ :=
  (PMF.bernoulli p hp).map (cond · 1 0)

@[simp]
theorem bernoulliNatPMF_apply_one {p : ℝ≥0} {hp : p ≤ 1} :
    bernoulliNatPMF p hp 1 = p := by
  simp [bernoulliNatPMF, PMF.map_apply, PMF.bernoulli_apply]

@[simp]
theorem bernoulliNatPMF_apply_zero {p : ℝ≥0} {hp : p ≤ 1} :
    bernoulliNatPMF p hp 0 = 1 - p := by
  simp [bernoulliNatPMF, PMF.map_apply, PMF.bernoulli_apply]

@[simp]
theorem bernoulliNatPMF_apply_of_ne_zero_one
    {p : ℝ≥0} {hp : p ≤ 1} {k : ℕ}
    (hk0 : k ≠ 0) (hk1 : k ≠ 1) :
    bernoulliNatPMF p hp k = 0 := by
  simp [bernoulliNatPMF, PMF.map_apply, PMF.bernoulli_apply, hk0, hk1]

@[simp]
theorem bernoulliRealPMF_apply_zero {p : ℝ≥0} {hp : p ≤ 1} :
    bernoulliRealPMF p hp 0 = 1 - p := by
  simp [bernoulliRealPMF, PMF.map_apply, PMF.bernoulli_apply]

@[simp]
theorem bernoulliRealPMF_apply_one {p : ℝ≥0} {hp : p ≤ 1} :
    bernoulliRealPMF p hp 1 = p := by
  simp [bernoulliRealPMF, PMF.map_apply, PMF.bernoulli_apply]

/-! ## Mean and variance -/

/-- The mean of the real Bernoulli law is its parameter. -/
theorem bernoulliRealPMF_mean (p : ℝ≥0) (hp : p ≤ 1) :
    ∫ x, x ∂(bernoulliRealPMF p hp).toMeasure = p.toReal := by
  unfold bernoulliRealPMF
  rw [← PMF.toMeasure_map]
  · rw [MeasureTheory.integral_map]
    · exact PMF.bernoulli_expectation hp
    · exact (measurable_of_countable _).aemeasurable
    · exact continuous_id.aestronglyMeasurable
  · exact measurable_of_countable _

/-- The second moment of the real Bernoulli law is its parameter. -/
theorem bernoulliRealPMF_second_moment (p : ℝ≥0) (hp : p ≤ 1) :
    ∫ x, x ^ 2 ∂(bernoulliRealPMF p hp).toMeasure = p.toReal := by
  unfold bernoulliRealPMF
  rw [← PMF.toMeasure_map]
  · rw [MeasureTheory.integral_map]
    · rw [PMF.integral_eq_sum]
      simp [PMF.bernoulli_apply]
    · exact (measurable_of_countable _).aemeasurable
    · exact (continuous_id.pow 2).aestronglyMeasurable
  · exact measurable_of_countable _

/-- The variance of the real Bernoulli law is `p (1-p)`. -/
theorem bernoulliRealPMF_variance (p : ℝ≥0) (hp : p ≤ 1) :
    ∫ x, (x - p.toReal) ^ 2 ∂(bernoulliRealPMF p hp).toMeasure =
      p.toReal * (1 - p.toReal) := by
  unfold bernoulliRealPMF
  rw [← PMF.toMeasure_map]
  · rw [MeasureTheory.integral_map]
    · rw [PMF.integral_eq_sum]
      simp [PMF.bernoulli_apply]
      rw [NNReal.coe_sub hp]
      norm_num
      ring_nf
    · exact (measurable_of_countable _).aemeasurable
    · exact ((continuous_id.sub continuous_const).pow 2).aestronglyMeasurable
  · exact measurable_of_countable _

/-! ## The binomial law as a Bernoulli-sum law -/

private def bernoulliTrialWeight (p : ℝ≥0) (N : ℕ) (f : Fin N → Bool) :
    ℝ≥0∞ :=
  ∏ i : Fin N, if f i then (p : ℝ≥0∞) else (1 - p : ℝ≥0∞)

theorem bernoulliTrialWeight_sum_eq_one
    (p : ℝ≥0) (hp : p ≤ 1) (N : ℕ) :
    (∑ f : Fin N → Bool, bernoulliTrialWeight p N f) = 1 := by
  classical
  calc
    (∑ f : Fin N → Bool, bernoulliTrialWeight p N f) =
        ∏ _i : Fin N, ∑ b : Bool,
          (if b then (p : ℝ≥0∞) else (1 - p : ℝ≥0∞)) := by
      exact (Fintype.prod_sum fun (_i : Fin N) (b : Bool) =>
        if b then (p : ℝ≥0∞) else (1 - p : ℝ≥0∞)).symm
    _ = 1 := by
      have hsub : (p : ℝ≥0∞) + (1 - p : ℝ≥0∞) = 1 := by
        norm_cast
        exact add_tsub_cancel_of_le hp
      simp [hsub]

def bernoulliTrialVectorPMF
    (p : ℝ≥0) (hp : p ≤ 1) (N : ℕ) : PMF (Fin N → Bool) :=
  PMF.ofFintype (bernoulliTrialWeight p N)
    (bernoulliTrialWeight_sum_eq_one p hp N)

def bernoulliSuccessCount (N : ℕ) (f : Fin N → Bool) : ℕ :=
  (Finset.univ.filter fun i => f i).card

private def bernoulliSuccessCountFin (N : ℕ) (f : Fin N → Bool) :
    Fin (N + 1) :=
  ⟨bernoulliSuccessCount N f, by
    unfold bernoulliSuccessCount
    exact Nat.lt_succ_of_le (by simpa [Fintype.card_fin] using
      (Finset.card_le_univ (Finset.univ.filter fun i : Fin N => f i)))⟩

private theorem bernoulliTrialWeight_eq_successCount
    (p : ℝ≥0) (N : ℕ) (f : Fin N → Bool) :
    bernoulliTrialWeight p N f =
      (p : ℝ≥0∞) ^ bernoulliSuccessCount N f *
        (1 - p : ℝ≥0∞) ^ (N - bernoulliSuccessCount N f) := by
  classical
  unfold bernoulliTrialWeight bernoulliSuccessCount
  rw [Finset.prod_ite]
  have hcard :
      (Finset.univ.filter fun i : Fin N => f i = false).card =
        N - (Finset.univ.filter fun i : Fin N => f i).card := by
    have h := Finset.card_filter_add_card_filter_not
      (s := (Finset.univ : Finset (Fin N))) (p := fun i => f i = true)
    have hsum :
        (Finset.univ.filter fun i : Fin N => f i = true).card +
            (Finset.univ.filter fun i : Fin N => f i = false).card = N := by
      simpa using h
    omega
  simp [hcard]

theorem bernoulliSuccessCount_fiber_card (N k : ℕ) :
    Fintype.card {f : Fin N → Bool // bernoulliSuccessCount N f = k} =
      N.choose k := by
  classical
  unfold bernoulliSuccessCount
  let e :
      {f : Fin N → Bool // (Finset.univ.filter fun i => f i).card = k} ≃
        {s : Finset (Fin N) // s.card = k} :=
    { toFun := fun f => ⟨Finset.univ.filter fun i => f.1 i, f.2⟩
      invFun := fun s => ⟨fun i => i ∈ s.1, by
        have hfilter :
            (Finset.univ.filter fun i : Fin N => i ∈ s.1) = s.1 := by
          ext i
          simp
        simpa [hfilter] using s.2⟩
      left_inv := by
        intro f
        apply Subtype.ext
        funext i
        simp
      right_inv := by
        intro s
        apply Subtype.ext
        ext i
        simp }
  calc
    Fintype.card {f : Fin N → Bool //
        (Finset.univ.filter fun i => f i).card = k} =
        Fintype.card {s : Finset (Fin N) // s.card = k} :=
      Fintype.card_congr e
    _ = N.choose k := by
      rw [Fintype.card_finset_len]
      simp

theorem bernoulliTrialVectorPMF_map_successCountFin_eq_binomial
    (p : ℝ≥0) (hp : p ≤ 1) (N : ℕ) :
    (bernoulliTrialVectorPMF p hp N).map (bernoulliSuccessCountFin N) =
      PMF.binomial p hp N := by
  classical
  ext i
  rw [bernoulliTrialVectorPMF, PMF.map_ofFintype]
  simp only [PMF.ofFintype_apply]
  rw [PMF.binomial_apply]
  have hfiber_const :
      ∀ f : Fin N → Bool,
        bernoulliSuccessCountFin N f = i →
          bernoulliTrialWeight p N f =
            (p : ℝ≥0∞) ^ (i : ℕ) *
              (1 - p : ℝ≥0∞) ^ (N - (i : ℕ)) := by
    intro f hf
    have hcount : bernoulliSuccessCount N f = (i : ℕ) :=
      congrArg Fin.val hf
    rw [bernoulliTrialWeight_eq_successCount, hcount]
  have hsum :
      (∑ f with bernoulliSuccessCountFin N f = i,
          bernoulliTrialWeight p N f) =
        ((Finset.univ.filter fun f : Fin N → Bool =>
          bernoulliSuccessCountFin N f = i).card : ℕ) •
          ((p : ℝ≥0∞) ^ (i : ℕ) *
            (1 - p : ℝ≥0∞) ^ (N - (i : ℕ))) := by
    calc
      (∑ f with bernoulliSuccessCountFin N f = i,
          bernoulliTrialWeight p N f) =
        ∑ f with bernoulliSuccessCountFin N f = i,
          ((p : ℝ≥0∞) ^ (i : ℕ) *
            (1 - p : ℝ≥0∞) ^ (N - (i : ℕ))) := by
              refine Finset.sum_congr rfl ?_
              intro f hf
              exact hfiber_const f (by simpa using hf)
      _ = ((Finset.univ.filter fun f : Fin N → Bool =>
          bernoulliSuccessCountFin N f = i).card : ℕ) •
          ((p : ℝ≥0∞) ^ (i : ℕ) *
            (1 - p : ℝ≥0∞) ^ (N - (i : ℕ))) := by
              rw [Finset.sum_const]
  have hcard :
      (Finset.univ.filter fun f : Fin N → Bool =>
          bernoulliSuccessCountFin N f = i).card = N.choose (i : ℕ) := by
    have hfilter :
        (Finset.univ.filter fun f : Fin N → Bool =>
            bernoulliSuccessCountFin N f = i) =
          (Finset.univ.filter fun f : Fin N → Bool =>
            bernoulliSuccessCount N f = (i : ℕ)) := by
      ext f
      simp only [Finset.mem_filter, Finset.mem_univ, true_and]
      constructor
      · intro h
        exact congrArg Fin.val h
      · intro h
        apply Fin.ext
        exact h
    rw [hfilter]
    have hcardSubtype := bernoulliSuccessCount_fiber_card N (i : ℕ)
    rwa [Fintype.card_subtype] at hcardSubtype
  have htarget :
      ((Finset.univ.filter fun f : Fin N → Bool =>
          bernoulliSuccessCountFin N f = i).card : ℕ) •
          ((p : ℝ≥0∞) ^ (i : ℕ) *
            (1 - p : ℝ≥0∞) ^ (N - (i : ℕ))) =
        (p : ℝ≥0∞) ^ (i : ℕ) *
          (1 - p : ℝ≥0∞) ^ (N - (i : ℕ)) *
            (N.choose (i : ℕ) : ℝ≥0∞) := by
    rw [hcard]
    simp [nsmul_eq_mul, mul_comm, mul_left_comm]
  convert hsum.trans htarget using 1
  refine Finset.sum_congr ?_ fun _ _ => rfl
  ext x
  simp

/-- The natural-valued sum of `N` iid Bernoulli trials has the binomial law.

The `iIndepFun` and marginal-law theorem below is the source-facing bridge
used by later CLT and Poisson-limit targets. -/
theorem bernoulliSumPMF_eq_binomialNatPMF
    (p : ℝ≥0) (hp : p ≤ 1) (N : ℕ) :
    (bernoulliTrialVectorPMF p hp N).map (bernoulliSuccessCount N) =
      binomialNatPMF p hp N := by
  unfold binomialNatPMF
  have hcomp :
      ((fun i : Fin (N + 1) => (i : ℕ)) ∘ bernoulliSuccessCountFin N) =
        bernoulliSuccessCount N := by
    funext f
    rfl
  rw [← hcomp]
  rw [← PMF.map_comp]
  rw [bernoulliTrialVectorPMF_map_successCountFin_eq_binomial]

/-- The source-facing Bernoulli/binomial package, including its defining facts. -/
structure BernoulliBinomialModelData (p : ℝ≥0) (hp : p ≤ 1) (N : ℕ) where
  bernoulli : PMF ℕ
  binomial : PMF ℕ
  mean : ∫ x : ℝ, x ∂(bernoulliRealPMF p hp).toMeasure = p.toReal
  variance :
    ∫ x : ℝ, (x - p.toReal) ^ 2 ∂(bernoulliRealPMF p hp).toMeasure =
      p.toReal * (1 - p.toReal)
  sum_law :
    (bernoulliTrialVectorPMF p hp N).map (bernoulliSuccessCount N) =
      binomialNatPMF p hp N

/-- A Bernoulli-sum model packages the two canonical source laws and their facts. -/
def bernoulliBinomialModel (p : ℝ≥0) (hp : p ≤ 1) (N : ℕ) :
    BernoulliBinomialModelData p hp N :=
  { bernoulli := bernoulliNatPMF p hp
    binomial := binomialNatPMF p hp N
    mean := bernoulliRealPMF_mean p hp
    variance := bernoulliRealPMF_variance p hp
    sum_law := bernoulliSumPMF_eq_binomialNatPMF p hp N }

end NumStability.HDP.Scalar.LimitTheorems
```

### `NumStability.HDP.Scalar.IndependentSums.FairCoinMoments`

Path: `lean-numerical-stability/NumStability/HDP/Scalar/IndependentSums/FairCoinMoments.lean`
SHA-256: `e082f24a551da4cd3176b3031f72726edfa662bc29d6e7b57f828916b7d86414`

```lean
import NumStability.HDP.Scalar.IndependentSums.Hoeffding
import NumStability.HDP.Scalar.LimitTheorems

/-!
# Moments of a fair-coin count

Reusable moment identities for a finite family of independent fair Bernoulli
indicators.  This isolates the elementary foundation used in the motivating
example at the start of Chapter 2 from the later concentration bounds.
-/

noncomputable section

open MeasureTheory ProbabilityTheory
open scoped BigOperators ENNReal NNReal

namespace NumStability.HDP.Scalar.IndependentSums.FairCoinMoments

open NumStability.HDP.Scalar.IndependentSums.Hoeffding

/-- The expectation of the canonical fair Bernoulli indicator is `1 / 2`. -/
theorem fairBernoulliPMF_indicator_mean :
    ∫ b, bernoulliIndicator b ∂fairBernoulliPMF.toMeasure = (1 / 2 : ℝ) := by
  rw [PMF.integral_eq_sum]
  simp [fairBernoulliPMF, bernoulliIndicator, PMF.bernoulli_apply]

/-- The variance of the canonical fair Bernoulli indicator is `1 / 4`. -/
theorem fairBernoulliPMF_indicator_variance :
    Var[bernoulliIndicator; fairBernoulliPMF.toMeasure] = (1 / 4 : ℝ) := by
  rw [variance_eq_integral (measurable_of_countable _).aemeasurable]
  rw [fairBernoulliPMF_indicator_mean, PMF.integral_eq_sum]
  simp [fairBernoulliPMF, bernoulliIndicator, PMF.bernoulli_apply]
  norm_num

/-- A finite sum of independent fair Bernoulli indicators has mean `N / 2`
and variance `N / 4`, where `N` is the cardinality of the index type. -/
theorem fairBernoulliSum_mean_variance
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool}
    (hB : ∀ i, Measurable (B i))
    (hIndep : iIndepFun B μ)
    (hLaw : ∀ i, Measure.map (B i) μ = fairBernoulliPMF.toMeasure) :
    (∫ ω, ∑ i, bernoulliIndicator (B i ω) ∂μ) =
        (Fintype.card ι : ℝ) / 2 ∧
      Var[fun ω ↦ ∑ i, bernoulliIndicator (B i ω); μ] =
        (Fintype.card ι : ℝ) / 4 := by
  let X : ι → Ω → ℝ := fun i ω ↦ bernoulliIndicator (B i ω)
  have hXmeas : ∀ i, Measurable (X i) := by
    intro i
    exact (measurable_of_countable bernoulliIndicator).comp (hB i)
  have hXmem : ∀ i, MemLp (X i) 2 μ := by
    intro i
    refine MemLp.of_bound (hXmeas i).aestronglyMeasurable 1 ?_
    filter_upwards [] with ω
    cases h : B i ω <;> simp [X, bernoulliIndicator, h]
  have hXmean : ∀ i, ∫ ω, X i ω ∂μ = (1 / 2 : ℝ) := by
    intro i
    rw [← integral_map (hB i).aemeasurable
      (measurable_of_countable bernoulliIndicator).aestronglyMeasurable]
    rw [hLaw i]
    exact fairBernoulliPMF_indicator_mean
  have hXvar : ∀ i, Var[X i; μ] = (1 / 4 : ℝ) := by
    intro i
    change Var[bernoulliIndicator ∘ B i; μ] = (1 / 4 : ℝ)
    rw [← variance_map (measurable_of_countable bernoulliIndicator).aemeasurable
      (hB i).aemeasurable]
    rw [hLaw i]
    exact fairBernoulliPMF_indicator_variance
  have hXindep : iIndepFun X μ := by
    have h := hIndep.comp (fun _ b ↦ bernoulliIndicator b)
      (fun _ ↦ measurable_of_countable bernoulliIndicator)
    simpa [X, Function.comp_def] using h
  have hXpair : Pairwise (fun i j ↦ X i ⟂ᵢ[μ] X j) := by
    intro i j hij
    exact hXindep.indepFun hij
  constructor
  · change (∫ ω, ∑ i, X i ω ∂μ) = _
    rw [integral_finset_sum]
    · simp_rw [hXmean]
      simp [div_eq_mul_inv]
    · intro i _
      exact (hXmem i).integrable (by norm_num)
  · change Var[fun ω ↦ ∑ i, X i ω; μ] = _
    have hfun : (fun ω ↦ ∑ i, X i ω) = ∑ i, X i := by
      funext ω
      simp
    rw [hfun, NumStability.HDP.Scalar.LimitTheorems.independentVarianceSum hXmem hXpair]
    simp_rw [hXvar]
    simp [div_eq_mul_inv]

end NumStability.HDP.Scalar.IndependentSums.FairCoinMoments
```

### `NumStability.HDP.Scalar.IndependentSums.FairCoinChebyshev`

Path: `lean-numerical-stability/NumStability/HDP/Scalar/IndependentSums/FairCoinChebyshev.lean`
SHA-256: `99b6232dcefb24272e5c95593f50dc631d9188479696d74e3ba64f449b6964a7`

```lean
import NumStability.HDP.Scalar.IndependentSums.FairCoinMoments
import NumStability.HDP.Scalar.Preliminaries

/-!
# Chebyshev's bound for a fair-coin count

The motivating finite-sample estimate at the start of Chapter 2, derived from
the reusable fair-coin moment identities and Chebyshev's inequality.
-/

noncomputable section

open MeasureTheory ProbabilityTheory
open scoped BigOperators ENNReal NNReal

namespace NumStability.HDP.Scalar.IndependentSums.FairCoinChebyshev

open NumStability.HDP.Scalar.IndependentSums.Hoeffding
open NumStability.HDP.Scalar.IndependentSums.FairCoinMoments

/-- Chebyshev's inequality gives the printed `4 / N` upper bound for at least
`3N/4` heads in `N` independent fair tosses. -/
theorem fairBernoulliSum_chebyshev
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool}
    (hN : 0 < Fintype.card ι)
    (hB : ∀ i, Measurable (B i))
    (hIndep : iIndepFun B μ)
    (hLaw : ∀ i, Measure.map (B i) μ = fairBernoulliPMF.toMeasure) :
    μ.real {ω | ∑ i, bernoulliIndicator (B i ω) ≥
        (3 / 4 : ℝ) * (Fintype.card ι : ℝ)} ≤
      μ.real {ω | |∑ i, bernoulliIndicator (B i ω) -
        (Fintype.card ι : ℝ) / 2| ≥
          (Fintype.card ι : ℝ) / 4} ∧
    μ.real {ω | |∑ i, bernoulliIndicator (B i ω) -
        (Fintype.card ι : ℝ) / 2| ≥
          (Fintype.card ι : ℝ) / 4} ≤
      4 / (Fintype.card ι : ℝ) := by
  let X : ι → Ω → ℝ := fun i ω ↦ bernoulliIndicator (B i ω)
  let S : Ω → ℝ := fun ω ↦ ∑ i, X i ω
  let n : ℝ := Fintype.card ι
  have hn : 0 < n := by
    have hn' : (0 : ℝ) < (Fintype.card ι : ℝ) := by
      exact_mod_cast hN
    simpa [n] using hn'
  have hXmeas : ∀ i, Measurable (X i) := by
    intro i
    exact (measurable_of_countable bernoulliIndicator).comp (hB i)
  have hXmem : ∀ i, MemLp (X i) 2 μ := by
    intro i
    refine MemLp.of_bound (hXmeas i).aestronglyMeasurable 1 ?_
    filter_upwards [] with ω
    cases h : B i ω <;> simp [X, bernoulliIndicator, h]
  have hSmeas : Measurable S := by
    dsimp [S]
    exact Finset.measurable_sum Finset.univ (fun i _ ↦ hXmeas i)
  have hSmem : MemLp S 2 μ := by
    dsimp [S]
    exact memLp_finset_sum Finset.univ (fun i _ ↦ hXmem i)
  have hMom := fairBernoulliSum_mean_variance hB hIndep hLaw
  have hMean : NumStability.HDP.Scalar.Preliminaries.expectation μ S = n / 2 := by
    simpa [NumStability.HDP.Scalar.Preliminaries.expectation, S, X, n] using hMom.1
  have hVar : NumStability.HDP.Scalar.Preliminaries.variance μ S = n / 4 := by
    calc
      NumStability.HDP.Scalar.Preliminaries.variance μ S = Var[S; μ] := by
        exact (variance_eq_integral hSmeas.aemeasurable).symm
      _ = n / 4 := by simpa [S, X, n] using hMom.2
  have hCenteredSq : Integrable
      (fun ω ↦ (S ω - NumStability.HDP.Scalar.Preliminaries.expectation μ S) ^ 2)
      μ :=
    (hSmem.sub (memLp_const _)).integrable_sq
  have hCheb := NumStability.HDP.Scalar.Preliminaries.chebyshevEventBound
    hSmeas (hSmem.integrable (by norm_num)) hCenteredSq
      (t := n / 4) (by positivity)
  constructor
  · rw [show {ω | ∑ i, bernoulliIndicator (B i ω) ≥
        (3 / 4 : ℝ) * (Fintype.card ι : ℝ)} =
      {ω | S ω ≥ (3 / 4 : ℝ) * n} by rfl]
    rw [show {ω | |∑ i, bernoulliIndicator (B i ω) -
        (Fintype.card ι : ℝ) / 2| ≥
          (Fintype.card ι : ℝ) / 4} =
      {ω | |S ω - n / 2| ≥ n / 4} by rfl]
    rw [Measure.real_def, Measure.real_def]
    apply ENNReal.toReal_mono (measure_ne_top μ _)
    apply measure_mono
    intro ω hω
    change (3 / 4 : ℝ) * n ≤ S ω at hω
    change n / 4 ≤ |S ω - n / 2|
    calc
      n / 4 ≤ S ω - n / 2 := by linarith
      _ ≤ |S ω - n / 2| := le_abs_self _
  · rw [hMean, hVar] at hCheb
    have hratio : (n / 4) / (n / 4) ^ 2 = 4 / n := by
      field_simp [ne_of_gt hn]
      <;> ring
    rw [hratio] at hCheb
    simpa [S, X, n] using hCheb

end NumStability.HDP.Scalar.IndependentSums.FairCoinChebyshev
```
