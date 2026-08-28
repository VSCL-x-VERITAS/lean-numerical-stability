# Declaration dossier for HDP-01-THM-1.3.4

This dossier describes the theorem statement only. Its proof is excluded.
Interpret every dependency from its supplied declaration; names are not definitions.

## Proof-free source declaration

```lean
theorem hdp_01_hthm_h1_d3_d4
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0)
    (hp : ∀ N i, p N i ≤ 1) (rate : ℝ≥0)
    (hmax : Tendsto
      (fun N =>
        (NumStability.HDP.Scalar.LimitTheorems.poissonRowMax p N : ℝ))
      atTop (𝓝 0))
    (hsum : Tendsto
      (NumStability.HDP.Scalar.LimitTheorems.poissonRowSum p)
      atTop (𝓝 (rate : ℝ))) :
    Tendsto
      (NumStability.HDP.Scalar.LimitTheorems.poissonBernoulliRowProbabilityMeasure
        p hp)
      atTop
      (𝓝 (NumStability.HDP.Scalar.LimitTheorems.poissonRealProbabilityMeasure
        rate))
```

## Elaborated target type

```lean
∀ (p : (N : Nat) → Fin (instHAdd.hAdd N 1) → NNReal)
  (hp : ∀ (N : Nat) (i : Fin (instHAdd.hAdd N 1)), instPartialOrderNNReal.le (p N i) 1) (rate : NNReal),
  Filter.Tendsto (fun N => (NumStability.HDP.Scalar.LimitTheorems.poissonRowMax p N).toReal) Filter.atTop (nhds 0) →
    Filter.Tendsto (NumStability.HDP.Scalar.LimitTheorems.poissonRowSum p) Filter.atTop (nhds rate.toReal) →
      Filter.Tendsto (NumStability.HDP.Scalar.LimitTheorems.poissonBernoulliRowProbabilityMeasure p hp) Filter.atTop
        (nhds (NumStability.HDP.Scalar.LimitTheorems.poissonRealProbabilityMeasure rate))
```

## Fully explicit elaborated target type

```lean
∀
  (p :
    (N : Nat) →
      Fin
          (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
            (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))) →
        NNReal)
  (hp :
    ∀ (N : Nat)
      (i :
        Fin
          (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
            (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))),
      @LE.le.{0} NNReal (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal)) (p N i)
        (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)))
  (rate : NNReal)
  (hmax :
    @Filter.Tendsto.{0, 0} Nat Real
      (fun (N : Nat) => NNReal.toReal (NumStability.HDP.Scalar.LimitTheorems.poissonRowMax p N))
      (@Filter.atTop.{0} Nat Nat.instPreorder)
      (@nhds.{0} Real
        (@UniformSpace.toTopologicalSpace.{0} Real (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace))
        (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))))
  (hsum :
    @Filter.Tendsto.{0, 0} Nat Real (NumStability.HDP.Scalar.LimitTheorems.poissonRowSum p)
      (@Filter.atTop.{0} Nat Nat.instPreorder)
      (@nhds.{0} Real
        (@UniformSpace.toTopologicalSpace.{0} Real (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace))
        (NNReal.toReal rate))),
  @Filter.Tendsto.{0, 0} Nat (@MeasureTheory.ProbabilityMeasure.{0} Real Real.measurableSpace)
    (NumStability.HDP.Scalar.LimitTheorems.poissonBernoulliRowProbabilityMeasure p hp)
    (@Filter.atTop.{0} Nat Nat.instPreorder)
    (@nhds.{0} (@MeasureTheory.ProbabilityMeasure.{0} Real Real.measurableSpace)
      (@MeasureTheory.ProbabilityMeasure.instTopologicalSpace.{0} Real Real.measurableSpace
        (@UniformSpace.toTopologicalSpace.{0} Real (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace))
        (@BorelSpace.opensMeasurable.{0} Real
          (@UniformSpace.toTopologicalSpace.{0} Real
            (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace))
          Real.measurableSpace Real.borelSpace))
      (NumStability.HDP.Scalar.LimitTheorems.poissonRealProbabilityMeasure rate))
```

## Local import graph

- `AuditTarget` imports: `NumStability.HDP.Scalar.PoissonLimit`
- `NumStability.HDP.Scalar.LimitTheorems` imports: `Mathlib.Probability.ProbabilityMassFunction.Binomial`, `Mathlib.Probability.ProbabilityMassFunction.Integrals`, `Mathlib.Probability.Distributions.Gaussian.Real`, `Mathlib.Probability.Distributions.Poisson`, `Mathlib.MeasureTheory.Function.ConvergenceInDistribution`, `Mathlib.Probability.StrongLaw`, `Mathlib.Tactic`
- `NumStability.HDP.Scalar.CentralLimit` imports: `NumStability.HDP.Scalar.LimitTheorems`, `Mathlib.Analysis.Calculus.Taylor`, `Mathlib.MeasureTheory.Measure.CharacteristicFunction`, `Mathlib.MeasureTheory.Measure.Prokhorov`, `Mathlib.MeasureTheory.Measure.TightNormed`, `Mathlib.Probability.Independence.CharacteristicFunction`
- `NumStability.HDP.Scalar.Preliminaries` imports: `Mathlib.Probability.Moments.Variance`, `Mathlib.Probability.CDF`, `Mathlib.MeasureTheory.Function.LpSpace.Basic`, `Mathlib.MeasureTheory.Function.LpSpace.Complete`, `Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm`, `Mathlib.MeasureTheory.Function.LpSeminorm.Indicator`, `Mathlib.Probability.UniformOn`, `Mathlib.Analysis.Convex.Integral`, `Mathlib.Analysis.Convex.Continuous`, `Mathlib.MeasureTheory.Integral.Bochner.Set`, `Mathlib.MeasureTheory.Integral.Lebesgue.Markov`, `Mathlib.MeasureTheory.Integral.Layercake`, `Mathlib.MeasureTheory.Measure.Lebesgue.Integral`, `Mathlib.Probability.Distributions.Cauchy`, `Mathlib.Analysis.SpecialFunctions.NonIntegrable`, `Mathlib.Analysis.SpecialFunctions.Pow.Integral`, `Mathlib.Tactic`
- `NumStability.HDP.Scalar.PoissonLimit` imports: `NumStability.HDP.Scalar.CentralLimit`, `NumStability.HDP.Scalar.Preliminaries`, `Mathlib.Analysis.SpecialFunctions.Complex.LogBounds`

## Semantic dependency inventory

`local` declarations are followed recursively through types and bodies. `external-frontier` declarations mark the one-level library trust boundary.

### D001: `NumStability.HDP.Scalar.LimitTheorems.poissonBernoulliRowProbabilityMeasure`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.PoissonLimit`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `4ac8009aabc453150b5ee25c791cf86d12da17e24b76b974145d6b36e325b23f`

Type:

```lean
(p : (N : Nat) → Fin (instHAdd.hAdd N 1) → NNReal) →
  (∀ (N : Nat) (i : Fin (instHAdd.hAdd N 1)), instPartialOrderNNReal.le (p N i) 1) →
    Nat → MeasureTheory.ProbabilityMeasure Real
```

Fully explicit type:

```lean
(p :
    (N : Nat) →
      Fin
          (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
            (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))) →
        NNReal) →
  (hp :
      ∀ (N : Nat)
        (i :
          Fin
            (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
              (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))),
        @LE.le.{0} NNReal (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
          (p N i) (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))) →
    (N : Nat) → @MeasureTheory.ProbabilityMeasure.{0} Real Real.measurableSpace
```

Definition body (one-level semantic boundary):

```lean
fun p hp N => ⟨(NumStability.HDP.Scalar.LimitTheorems.poissonBernoulliRowPMF p hp N).toMeasure, ⋯⟩
```

### D002: `NumStability.HDP.Scalar.LimitTheorems.poissonRealProbabilityMeasure`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.PoissonLimit`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `33d99d2667e0b9de2fd7fd3c22d8db55c474207aa9e1d29371a71cc14282db96`

Type:

```lean
NNReal → MeasureTheory.ProbabilityMeasure Real
```

Fully explicit type:

```lean
(rate : NNReal) → @MeasureTheory.ProbabilityMeasure.{0} Real Real.measurableSpace
```

Definition body (one-level semantic boundary):

```lean
fun rate => ⟨NumStability.HDP.Scalar.LimitTheorems.poissonRealLaw rate, ⋯⟩
```

### D003: `NumStability.HDP.Scalar.LimitTheorems.poissonRowMax`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.PoissonLimit`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `77388de93d40e38550e1712703d44d270c3821737fb48bfcc64f5b298672a2e0`

Type:

```lean
((N : Nat) → Fin (instHAdd.hAdd N 1) → NNReal) → Nat → NNReal
```

Fully explicit type:

```lean
(p :
    (N : Nat) →
      Fin
          (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
            (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))) →
        NNReal) →
  (N : Nat) → NNReal
```

Definition body (one-level semantic boundary):

```lean
fun p N => Finset.univ.sup (p N)
```

### D004: `NumStability.HDP.Scalar.LimitTheorems.poissonRowSum`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.PoissonLimit`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `571995772a7b7ce755c3c8f80e7637ab052adf314abc7874697268c45235c1b6`

Type:

```lean
((N : Nat) → Fin (instHAdd.hAdd N 1) → NNReal) → Nat → Real
```

Fully explicit type:

```lean
(p :
    (N : Nat) →
      Fin
          (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
            (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))) →
        NNReal) →
  (N : Nat) → Real
```

Definition body (one-level semantic boundary):

```lean
fun p N => Finset.univ.sum fun i => (p N i).toReal
```

### D005: `NumStability.HDP.Scalar.LimitTheorems.poissonBernoulliRowPMF`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.PoissonLimit`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `aa567ca0d344f8120fbb5ed2046d6f546d6607cc603ffe6fde8810a913700135`

Type:

```lean
(p : (N : Nat) → Fin (instHAdd.hAdd N 1) → NNReal) →
  (∀ (N : Nat) (i : Fin (instHAdd.hAdd N 1)), instPartialOrderNNReal.le (p N i) 1) → Nat → PMF Real
```

Fully explicit type:

```lean
(p :
    (N : Nat) →
      Fin
          (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
            (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))) →
        NNReal) →
  (hp :
      ∀ (N : Nat)
        (i :
          Fin
            (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
              (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))),
        @LE.le.{0} NNReal (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
          (p N i) (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))) →
    (N : Nat) → PMF.{0} Real
```

Definition body (one-level semantic boundary):

```lean
fun p hp N =>
  PMF.map (NumStability.HDP.Scalar.LimitTheorems.poissonBernoulliRowCount N)
    (NumStability.HDP.Scalar.LimitTheorems.poissonBernoulliRowVectorPMF p hp N)
```

### D006: `NumStability.HDP.Scalar.LimitTheorems.poissonBernoulliRowProbabilityMeasure._proof_1`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.PoissonLimit`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `2521ed45d7249e7264d80e729259643ff011976bd6d9a1df35b201df6306d18c`

Type:

```lean
∀ (p : (N : Nat) → Fin (instHAdd.hAdd N 1) → NNReal)
  (hp : ∀ (N : Nat) (i : Fin (instHAdd.hAdd N 1)), instPartialOrderNNReal.le (p N i) 1) (N : Nat),
  MeasureTheory.IsProbabilityMeasure (NumStability.HDP.Scalar.LimitTheorems.poissonBernoulliRowPMF p hp N).toMeasure
```

Fully explicit type:

```lean
∀
  (p :
    (N : Nat) →
      Fin
          (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
            (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))) →
        NNReal)
  (hp :
    ∀ (N : Nat)
      (i :
        Fin
          (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
            (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))),
      @LE.le.{0} NNReal (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal)) (p N i)
        (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)))
  (N : Nat),
  @MeasureTheory.IsProbabilityMeasure.{0} Real Real.measurableSpace
    (@PMF.toMeasure.{0} Real Real.measurableSpace (NumStability.HDP.Scalar.LimitTheorems.poissonBernoulliRowPMF p hp N))
```

### D007: `NumStability.HDP.Scalar.LimitTheorems.poissonRealLaw`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.PoissonLimit`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `bac52b903b6c347335b0bf4c3d874f10a78ff3e17ff4998334d2f8d8ad07ac80`

Type:

```lean
NNReal → MeasureTheory.Measure Real
```

Fully explicit type:

```lean
(rate : NNReal) → @MeasureTheory.Measure.{0} Real Real.measurableSpace
```

Definition body (one-level semantic boundary):

```lean
fun rate => MeasureTheory.Measure.map (fun k => k.cast) (NumStability.HDP.Scalar.LimitTheorems.poissonLaw rate)
```

### D008: `NumStability.HDP.Scalar.LimitTheorems.poissonRealProbabilityMeasure._proof_1`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.PoissonLimit`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `4af3cd4580dda25ea780306ecad91d99b3f969126a27a2b5727e1c262d4edcda`

Type:

```lean
∀ (rate : NNReal), MeasureTheory.IsProbabilityMeasure (NumStability.HDP.Scalar.LimitTheorems.poissonRealLaw rate)
```

Fully explicit type:

```lean
∀ (rate : NNReal),
  @MeasureTheory.IsProbabilityMeasure.{0} Real Real.measurableSpace
    (NumStability.HDP.Scalar.LimitTheorems.poissonRealLaw rate)
```

### D009: `NumStability.HDP.Scalar.LimitTheorems.poissonBernoulliRowCount`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.PoissonLimit`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `1bbf086e9941c3a9a8ef276f556e57bddf0c9e120aefa8af59d7e49516b2a01a`

Type:

```lean
(N : Nat) → (Fin (instHAdd.hAdd N 1) → Bool) → Real
```

Fully explicit type:

```lean
(N : Nat) →
  (f :
      Fin
          (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
            (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))) →
        Bool) →
    Real
```

Definition body (one-level semantic boundary):

```lean
fun N f => Finset.univ.sum fun i => ite (Eq (f i) Bool.true) 1 0
```

### D010: `NumStability.HDP.Scalar.LimitTheorems.poissonBernoulliRowVectorPMF`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.PoissonLimit`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `5d0048b620dd62d905e8ee724d9509561d59f2a4eac1953f6abb5f11e7295afe`

Type:

```lean
(p : (N : Nat) → Fin (instHAdd.hAdd N 1) → NNReal) →
  (∀ (N : Nat) (i : Fin (instHAdd.hAdd N 1)), instPartialOrderNNReal.le (p N i) 1) →
    (N : Nat) → PMF (Fin (instHAdd.hAdd N 1) → Bool)
```

Fully explicit type:

```lean
(p :
    (N : Nat) →
      Fin
          (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
            (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))) →
        NNReal) →
  (hp :
      ∀ (N : Nat)
        (i :
          Fin
            (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
              (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))),
        @LE.le.{0} NNReal (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
          (p N i) (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))) →
    (N : Nat) →
      PMF.{0}
        (Fin
            (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
              (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))) →
          Bool)
```

Definition body (one-level semantic boundary):

```lean
fun p hp N => PMF.ofFintype (NumStability.HDP.Scalar.LimitTheorems.poissonBernoulliRowWeight✝ p N) ⋯
```

### D011: `NumStability.HDP.Scalar.LimitTheorems.poissonLaw`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.LimitTheorems`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `22cf76eef4182639ac0d72c46bc29968936ebfd94b8635b38c3560022b3a8451`

Type:

```lean
NNReal → MeasureTheory.Measure Nat
```

Fully explicit type:

```lean
(rate : NNReal) → @MeasureTheory.Measure.{0} Nat Nat.instMeasurableSpace
```

Definition body (one-level semantic boundary):

```lean
fun rate => ProbabilityTheory.poissonMeasure rate
```

### D012: `NumStability.HDP.Scalar.LimitTheorems.poissonBernoulliRowWeight_sum_eq_one`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.PoissonLimit`
- Declaration kind: `theorem`
- Distance from target type: `4`
- Semantic SHA-256: `7a5176825cf16fc120d0ea816a4c068bd9ae745526ce7434af84c6f94afd2527`

Type:

```lean
∀ (p : (N : Nat) → Fin (instHAdd.hAdd N 1) → NNReal),
  (∀ (N : Nat) (i : Fin (instHAdd.hAdd N 1)), instPartialOrderNNReal.le (p N i) 1) →
    ∀ (N : Nat), Eq (Finset.univ.sum fun f => NumStability.HDP.Scalar.LimitTheorems.poissonBernoulliRowWeight✝ p N f) 1
```

Fully explicit type:

```lean
∀
  (p :
    (N : Nat) →
      Fin
          (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
            (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))) →
        NNReal)
  (hp :
    ∀ (N : Nat)
      (i :
        Fin
          (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
            (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))),
      @LE.le.{0} NNReal (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal)) (p N i)
        (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)))
  (N : Nat),
  @Eq.{1} ENNReal
    (@Finset.sum.{0, 0}
      (Fin
          (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
            (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))) →
        Bool)
      ENNReal ENNReal.instAddCommMonoid
      (@Finset.univ.{0}
        (Fin
            (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
              (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))) →
          Bool)
        (@Pi.instFintype.{0, 0}
          (Fin
            (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
              (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))))
          (fun
              (a :
                Fin
                  (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
                    (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))) =>
            Bool)
          (instDecidableEqFin
            (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
              (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))))
          (Fin.fintype
            (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
              (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))))
          fun
            (a :
              Fin
                (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
                  (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))) =>
          Bool.fintype))
      fun
        (f :
          Fin
              (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
                (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))) →
            Bool) =>
      _private.NumStability.HDP.Scalar.PoissonLimit.0.NumStability.HDP.Scalar.LimitTheorems.poissonBernoulliRowWeight p
        N f)
    (@OfNat.ofNat.{0} ENNReal (nat_lit 1)
      (@One.toOfNat1.{0} ENNReal
        (@AddMonoidWithOne.toOne.{0} ENNReal
          (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))))
```

### D013: `_private.NumStability.HDP.Scalar.PoissonLimit.0.NumStability.HDP.Scalar.LimitTheorems.poissonBernoulliRowWeight`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.PoissonLimit`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `dc58dca294cf44a0969d8a225af7392cf2ace21150c1fa45658c9c61fa1283a1`

Type:

```lean
((N : Nat) → Fin (instHAdd.hAdd N 1) → NNReal) → (N : Nat) → (Fin (instHAdd.hAdd N 1) → Bool) → ENNReal
```

Fully explicit type:

```lean
(p :
    (N : Nat) →
      Fin
          (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
            (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))) →
        NNReal) →
  (N : Nat) →
    (f :
        Fin
            (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
              (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))) →
          Bool) →
      ENNReal
```

Definition body (one-level semantic boundary):

```lean
fun p N f =>
  Finset.univ.prod fun i =>
    ite (Eq (f i) Bool.true) (ENNReal.ofNNReal (p N i)) (instHSub.hSub 1 (ENNReal.ofNNReal (p N i)))
```

### D014: `BorelSpace.opensMeasurable`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Constructions.BorelSpace.Basic`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `6acf938e6357ef89d1bc3f75010c362bb331dde9c914e666f35c8e03dfc213ae`

Type:

```lean
∀ {α : Type u_6} [inst : TopologicalSpace α] [inst_1 : MeasurableSpace α] [BorelSpace α], OpensMeasurableSpace α
```

Fully explicit type:

```lean
∀ {α : Type u_6} [inst : TopologicalSpace.{u_6} α] [inst_1 : MeasurableSpace.{u_6} α] [@BorelSpace.{u_6} α inst inst_1],
  @OpensMeasurableSpace.{u_6} α inst inst_1
```

### D015: `Filter.Tendsto`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Filter.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7e5f54349644c32198960083c0e0eb6c033c80a8656d02a78b3eae9a4f5131f2`

Type:

```lean
{α : Type u_1} → {β : Type u_2} → (α → β) → Filter α → Filter β → Prop
```

Fully explicit type:

```lean
{α : Type u_1} → {β : Type u_2} → (f : α → β) → (l₁ : Filter.{u_1} α) → (l₂ : Filter.{u_2} β) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun {α} {β} f l₁ l₂ => Filter.instPartialOrder.le (Filter.map f l₁) l₂
```

### D016: `Filter.atTop`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Filter.AtTopBot.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f743a11da6fe9e156755f41ec35f4d61b87ca4af4575ede456b477a74caa45f3`

Type:

```lean
{α : Type u_3} → [Preorder α] → Filter α
```

Fully explicit type:

```lean
{α : Type u_3} → [Preorder.{u_3} α] → Filter.{u_3} α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [Preorder α] => iInf fun a => Filter.principal (Set.Ici a)
```

### D017: `Fin`

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

### D018: `HAdd.hAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
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

### D019: `LE.le`

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

### D020: `MeasureTheory.ProbabilityMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.ProbabilityMeasure`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `251bef2162749e0bcb67a1413765bc7556e9854c7a23036b986ada6a2e2958be`

Type:

```lean
(Ω : Type u_1) → [MeasurableSpace Ω] → Type u_1
```

Fully explicit type:

```lean
(Ω : Type u_1) → [MeasurableSpace.{u_1} Ω] → Type u_1
```

Definition body (one-level semantic boundary):

```lean
fun Ω [MeasurableSpace Ω] => Subtype fun μ => MeasureTheory.IsProbabilityMeasure μ
```

### D021: `MeasureTheory.ProbabilityMeasure.instTopologicalSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.ProbabilityMeasure`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `1aa8a4788dac1eb1c7c37593eda0879e084867fd50c0929b411566ea03e51bfa`

Type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace Ω] →
    [inst_1 : TopologicalSpace Ω] → [OpensMeasurableSpace Ω] → TopologicalSpace (MeasureTheory.ProbabilityMeasure Ω)
```

Fully explicit type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace.{u_1} Ω] →
    [inst_1 : TopologicalSpace.{u_1} Ω] →
      [@OpensMeasurableSpace.{u_1} Ω inst_1 inst] →
        TopologicalSpace.{u_1} (@MeasureTheory.ProbabilityMeasure.{u_1} Ω inst)
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} [MeasurableSpace Ω] [TopologicalSpace Ω] [OpensMeasurableSpace Ω] =>
  TopologicalSpace.induced MeasureTheory.ProbabilityMeasure.toFiniteMeasure inferInstance
```

### D022: `NNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D023: `NNReal.toReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `b78a80825150cf81a49e8914dd12c5dfb7e284ed0e70b3449011ac3d3f49dc66`

Type:

```lean
NNReal → Real
```

Fully explicit type:

```lean
NNReal → Real
```

Definition body (one-level semantic boundary):

```lean
Subtype.val
```

### D024: `Nat`

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

### D025: `Nat.instPreorder`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5ea89e9915200c8782bc933f9184e28eb38f4c9610b00cf1310cc6e6435642d8`

Type:

```lean
Preorder Nat
```

Fully explicit type:

```lean
Preorder.{0} Nat
```

Definition body (one-level semantic boundary):

```lean
inferInstance
```

### D026: `OfNat.ofNat`

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

### D027: `One.toOfNat1`

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

### D028: `PartialOrder.toPreorder`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Defs.PartialOrder`
- Declaration kind: `abbrev`
- Distance from target type: `1`
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

### D029: `Preorder.toLE`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Defs.PartialOrder`
- Declaration kind: `abbrev`
- Distance from target type: `1`
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

### D030: `PseudoMetricSpace.toUniformSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.MetricSpace.Pseudo.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `a6831039b3ad5e37bd0e7692fd995a699d8bef791976e20262da929990521799`

Type:

```lean
{α : Type u} → [self : PseudoMetricSpace α] → UniformSpace α
```

Fully explicit type:

```lean
{α : Type u} → [self : PseudoMetricSpace.{u} α] → UniformSpace.{u} α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : PseudoMetricSpace α] => self.7
```

### D031: `Real`

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

### D032: `Real.borelSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Constructions.BorelSpace.Basic`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `c91eb70c9d98cdf73caa24b59211b7c41a3e77da5268598192e93a3c27346f6b`

Type:

```lean
BorelSpace Real
```

Fully explicit type:

```lean
@BorelSpace.{0} Real
  (@UniformSpace.toTopologicalSpace.{0} Real (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace))
  Real.measurableSpace
```

### D033: `Real.instZero`

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

### D034: `Real.measurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Constructions.BorelSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `51b107725c4edbe40e50ff5651a2c7ee5a10037e341c2764964a6d6cc26d82a1`

Type:

```lean
MeasurableSpace Real
```

Fully explicit type:

```lean
MeasurableSpace.{0} Real
```

Definition body (one-level semantic boundary):

```lean
borel Real
```

### D035: `Real.pseudoMetricSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.MetricSpace.Pseudo.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `9c0d1d56a04dd3ae3fce36b5fb3c2f4fe632c2bdaed84b5667c1a60a03491a3e`

Type:

```lean
PseudoMetricSpace Real
```

Fully explicit type:

```lean
PseudoMetricSpace.{0} Real
```

Definition body (one-level semantic boundary):

```lean
{ dist := fun x y => abs (instHSub.hSub x y), dist_self := Real.pseudoMetricSpace._proof_1, dist_comm := ⋯,
  dist_triangle := ⋯, edist_dist := Real.pseudoMetricSpace._proof_2, uniformity_dist := Real.pseudoMetricSpace._proof_3,
  cobounded_sets := Real.pseudoMetricSpace._proof_4 }
```

### D036: `UniformSpace.toTopologicalSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.UniformSpace.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `4d18df801a98905221e0935ec2ddacda684a1430b8d198ebc23fad0643bce2a8`

Type:

```lean
{α : Type u} → [self : UniformSpace α] → TopologicalSpace α
```

Fully explicit type:

```lean
{α : Type u} → [self : UniformSpace.{u} α] → TopologicalSpace.{u} α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : UniformSpace α] => self.1
```

### D037: `Zero.toOfNat0`

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

### D038: `instAddNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D039: `instHAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D040: `instOfNatNat`

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

### D041: `instOneNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D042: `instPartialOrderNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D043: `nhds`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.Defs.Filter`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8eb445823f4b15a765f7e0cd634f73196d36b4f09054d2aef43a69d3138c6ce8`

Type:

```lean
{X : Type u_3} → [TopologicalSpace X] → X → Filter X
```

Fully explicit type:

```lean
{X : Type u_3} → [TopologicalSpace.{u_3} X] → (x : X) → Filter.{u_3} X
```

Definition body (one-level semantic boundary):

```lean
wrapped✝.1
```

### D044: `ConditionallyCompleteLinearOrderBot.toOrderBot`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.ConditionallyCompleteLattice.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `8d4bfb1cedb616878ecbd86e2180bc7ca93b21716425a9954eeab125e930003f`

Type:

```lean
{α : Type u_5} → [self : ConditionallyCompleteLinearOrderBot α] → OrderBot α
```

Fully explicit type:

```lean
{α : Type u_5} →
  [self : ConditionallyCompleteLinearOrderBot.{u_5} α] →
    @OrderBot.{u_5} α
      (@Preorder.toLE.{u_5} α
        (@PartialOrder.toPreorder.{u_5} α
          (@SemilatticeSup.toPartialOrder.{u_5} α
            (@Lattice.toSemilatticeSup.{u_5} α
              (@ConditionallyCompleteLattice.toLattice.{u_5} α
                (@ConditionallyCompleteLinearOrder.toConditionallyCompleteLattice.{u_5} α
                  (@ConditionallyCompleteLinearOrderBot.toConditionallyCompleteLinearOrder.{u_5} α self)))))))
```

Definition body (one-level semantic boundary):

```lean
fun α [self : ConditionallyCompleteLinearOrderBot α] => self.2
```

### D045: `Fin.fintype`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Fintype.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `e7038d0981813ab904ddadd5c858e1d87d6d42413a72872c71b6e0413db6bb44`

Type:

```lean
(n : Nat) → Fintype (Fin n)
```

Fully explicit type:

```lean
(n : Nat) → Fintype.{0} (Fin n)
```

Definition body (one-level semantic boundary):

```lean
fun n => { elems := { val := Multiset.ofList (List.finRange n), nodup := ⋯ }, complete := ⋯ }
```

### D046: `Finset.sum`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.BigOperators.Group.Finset.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D047: `Finset.sup`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Finset.Lattice.Fold`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `dd4c14458f3cc53851b18c831b354790927e7783eeceddbd2bc8e0e17c3e5d98`

Type:

```lean
{α : Type u_2} → {β : Type u_3} → [inst : SemilatticeSup α] → [OrderBot α] → Finset β → (β → α) → α
```

Fully explicit type:

```lean
{α : Type u_2} →
  {β : Type u_3} →
    [inst : SemilatticeSup.{u_2} α] →
      [@OrderBot.{u_2} α
            (@Preorder.toLE.{u_2} α (@PartialOrder.toPreorder.{u_2} α (@SemilatticeSup.toPartialOrder.{u_2} α inst)))] →
        (s : Finset.{u_3} β) → (f : β → α) → α
```

Definition body (one-level semantic boundary):

```lean
fun {α} {β} [SemilatticeSup α] [inst_1 : OrderBot α] s f =>
  Finset.fold (fun x1 x2 => SemilatticeSup.toMax.max x1 x2) inst_1.bot f s
```

### D048: `Finset.univ`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Fintype.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D049: `MeasureTheory.IsProbabilityMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Typeclasses.Probability`
- Declaration kind: `inductive`
- Distance from target type: `2`
- Semantic SHA-256: `f88b269cb95d165125e7553fd22f97d6e5f9b1b9bcdec7f6738a781dc674bf89`

Type:

```lean
{α : Type u_1} → {m0 : MeasurableSpace α} → MeasureTheory.Measure α → Prop
```

Fully explicit type:

```lean
{α : Type u_1} → {m0 : MeasurableSpace.{u_1} α} → (μ : @MeasureTheory.Measure.{u_1} α m0) → Prop
```

### D050: `MeasureTheory.Measure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `inductive`
- Distance from target type: `2`
- Semantic SHA-256: `ba8c23c70f3135407096406cee0b4d7d9f02d088e8b1d1a1e105071821a3a51b`

Type:

```lean
(α : Type u_6) → [MeasurableSpace α] → Type u_6
```

Fully explicit type:

```lean
(α : Type u_6) → [MeasurableSpace.{u_6} α] → Type u_6
```

### D051: `NNReal.instConditionallyCompleteLinearOrderBot`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `a6df35137b7f52b464ab762b2393c5d6b5cba77a839712e58984b3a00414c3af`

Type:

```lean
ConditionallyCompleteLinearOrderBot NNReal
```

Fully explicit type:

```lean
ConditionallyCompleteLinearOrderBot.{0} NNReal
```

Definition body (one-level semantic boundary):

```lean
Nonneg.conditionallyCompleteLinearOrderBot 0
```

### D052: `PMF.toMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D053: `Real.instAddCommMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D054: `Subtype.mk`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `constructor`
- Distance from target type: `2`
- Semantic SHA-256: `488ac61b6d3c07fb9a2f54a03a39e6001a4c7cedfd07515f0f9865e7fef9ef51`

Type:

```lean
{α : Sort u} → {p : α → Prop} → (val : α) → p val → Subtype p
```

Fully explicit type:

```lean
{α : Sort u} → {p : α → Prop} → (val : α) → (property : p val) → @Subtype.{u} α p
```

### D055: `instSemilatticeSupNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `2a6440af851e8806e3c58934c33bb1185e865186dfb38346ffc479f2e156fbfa`

Type:

```lean
SemilatticeSup NNReal
```

Fully explicit type:

```lean
SemilatticeSup.{0} NNReal
```

Definition body (one-level semantic boundary):

```lean
Nonneg.semilatticeSup
```

### D056: `Bool`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `3`
- Semantic SHA-256: `e95da6be35714acbe5505fa5c6ba913c979305a6d87f38e35096664b551ce829`

Type:

```lean
Type
```

Fully explicit type:

```lean
Type
```

### D057: `MeasureTheory.Measure.map`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Map`
- Declaration kind: `def`
- Distance from target type: `3`
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

### D058: `Nat.cast`

- Role: `external-frontier`
- Owner module: `Init.Data.Cast`
- Declaration kind: `def`
- Distance from target type: `3`
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

### D059: `Nat.instMeasurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.MeasurableSpace.Instances`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `623443610c6e8558202d9a1a4c82df42c1b84ebc018228c1d827c7015bec880c`

Type:

```lean
MeasurableSpace Nat
```

Fully explicit type:

```lean
MeasurableSpace.{0} Nat
```

Definition body (one-level semantic boundary):

```lean
MeasurableSpace.instCompleteLattice.top
```

### D060: `PMF`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Basic`
- Declaration kind: `def`
- Distance from target type: `3`
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

### D061: `PMF.map`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Constructions`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `bf06e1738c76887901adc4a0d90d5a668ae2745ad47d1faeee70fb3db7bbf391`

Type:

```lean
{α : Type u_1} → {β : Type u_2} → (α → β) → PMF α → PMF β
```

Fully explicit type:

```lean
{α : Type u_1} → {β : Type u_2} → (f : α → β) → (p : PMF.{u_1} α) → PMF.{u_2} β
```

Definition body (one-level semantic boundary):

```lean
fun {α} {β} f p => p.bind (Function.comp PMF.pure f)
```

### D062: `Real.instNatCast`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `3`
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

### D063: `Bool.fintype`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Fintype.Defs`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `a9c679c1e183f14495adf710deea6c35a4173bbf8152186440f4167fe646ea80`

Type:

```lean
Fintype Bool
```

Fully explicit type:

```lean
Fintype.{0} Bool
```

Definition body (one-level semantic boundary):

```lean
{
  elems :=
    { val := Multiset.instInsert.insert Bool.true (Multiset.instSingleton.singleton Bool.false),
      nodup := Bool.fintype._proof_1 },
  complete := ⋯ }
```

### D064: `Bool.true`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `constructor`
- Distance from target type: `4`
- Semantic SHA-256: `97e763ea95d8452117cf5762fd67acddd549677f08ccfa348c4bf23db7eaa9d8`

Type:

```lean
Bool
```

Fully explicit type:

```lean
Bool
```

### D065: `Eq`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `4`
- Semantic SHA-256: `63e9afa87e04d13393a2fe09e8e76489d96be3982734b4b40a52fc6ebea863d7`

Type:

```lean
{α : Sort u_1} → α → α → Prop
```

Fully explicit type:

```lean
{α : Sort u_1} → α → α → Prop
```

### D066: `PMF.ofFintype`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Constructions`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `8f2b5d575ffd7926f7ad8654bc3923c691cda311b9416d0557d8e14570ec6168`

Type:

```lean
{α : Type u_1} → [inst : Fintype α] → (f : α → ENNReal) → Eq (Finset.univ.sum fun a => f a) 1 → PMF α
```

Fully explicit type:

```lean
{α : Type u_1} →
  [inst : Fintype.{u_1} α] →
    (f : α → ENNReal) →
      (h :
          @Eq.{1} ENNReal
            (@Finset.sum.{u_1, 0} α ENNReal ENNReal.instAddCommMonoid (@Finset.univ.{u_1} α inst) fun (a : α) => f a)
            (@OfNat.ofNat.{0} ENNReal (nat_lit 1)
              (@One.toOfNat1.{0} ENNReal
                (@AddMonoidWithOne.toOne.{0} ENNReal
                  (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))))) →
        PMF.{u_1} α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [Fintype α] f h => PMF.ofFinset f Finset.univ h ⋯
```

### D067: `Pi.instFintype`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Fintype.Pi`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `38af89fa29e8604e3102e2493be25045731e11c8f462c08498d78926b091d1fa`

Type:

```lean
{α : Type u_3} →
  {β : α → Type u_4} → [DecidableEq α] → [Fintype α] → [(a : α) → Fintype (β a)] → Fintype ((a : α) → β a)
```

Fully explicit type:

```lean
{α : Type u_3} →
  {β : α → Type u_4} →
    [DecidableEq.{u_3 + 1} α] →
      [Fintype.{u_3} α] → [(a : α) → Fintype.{u_4} (β a)] → Fintype.{max u_3 u_4} ((a : α) → β a)
```

Definition body (one-level semantic boundary):

```lean
fun {α} {β} [DecidableEq α] [Fintype α] [(a : α) → Fintype (β a)] =>
  { elems := Fintype.piFinset fun x => Finset.univ, complete := ⋯ }
```

### D068: `ProbabilityTheory.poissonMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.Distributions.Poisson`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `7150e5d0f3083cbdf0dd761158b0755c70c54e0d064f6e442d38caee1ce640e7`

Type:

```lean
NNReal → MeasureTheory.Measure Nat
```

Fully explicit type:

```lean
(r : NNReal) → @MeasureTheory.Measure.{0} Nat Nat.instMeasurableSpace
```

Definition body (one-level semantic boundary):

```lean
fun r => (ProbabilityTheory.poissonPMF r).toMeasure
```

### D069: `Real.instOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `4`
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

### D070: `instDecidableEqBool`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `4`
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

### D071: `instDecidableEqFin`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `7f6d785554f797d18d5ae0b7475c25e8deca421e6ee688f036987ac99c66e1cd`

Type:

```lean
(n : Nat) → DecidableEq (Fin n)
```

Fully explicit type:

```lean
(n : Nat) → DecidableEq.{1} (Fin n)
```

Definition body (one-level semantic boundary):

```lean
fun n i j =>
  instDecidableEqFin.match_1 n i j (fun x => Decidable (Eq i j)) (decEq i.val j.val) (fun h => Decidable.isTrue ⋯)
    fun h => Decidable.isFalse ⋯
```

### D072: `ite`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `4`
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

### D073: `AddCommMonoidWithOne.toAddMonoidWithOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `5`
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

### D074: `AddMonoidWithOne.toOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `5`
- Semantic SHA-256: `2ee638fd7292dbcf1e4adb85b14bbd0f304e8a260316e61621bf8eac03f03f6d`

Type:

```lean
{R : Type u_2} → [self : AddMonoidWithOne R] → One R
```

Fully explicit type:

```lean
{R : Type u_2} → [self : AddMonoidWithOne.{u_2} R] → One.{u_2} R
```

Definition body (one-level semantic boundary):

```lean
fun R [self : AddMonoidWithOne R] => self.3
```

### D075: `CommSemiring.toCommMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `5`
- Semantic SHA-256: `7c3695cad7d389c9461bb7db3449bf843fd6dec99bc600ff300ec7f323608806`

Type:

```lean
{R : Type u} → [self : CommSemiring R] → CommMonoid R
```

Fully explicit type:

```lean
{R : Type u} → [self : CommSemiring.{u} R] → CommMonoid.{u} R
```

Definition body (one-level semantic boundary):

```lean
fun R self =>
  { toMul := self.toMul, mul_assoc := ⋯, toOne := self.toOne, one_mul := ⋯, mul_one := ⋯, npow := self.npow,
    npow_zero := ⋯, npow_succ := ⋯, mul_comm := ⋯ }
```

### D076: `ENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `5`
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

### D077: `ENNReal.instAddCommMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `c856b17f6facb7a8852697a9fa35807b881aa5557bb4b679ab12ef4abdb6aa11`

Type:

```lean
AddCommMonoid ENNReal
```

Fully explicit type:

```lean
AddCommMonoid.{0} ENNReal
```

Definition body (one-level semantic boundary):

```lean
inferInstanceAs (AddCommMonoid (WithTop NNReal))
```

### D078: `ENNReal.instCommSemiring`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `5`
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

### D079: `ENNReal.instSub`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `9599a025438104bc6acfdbe59fefac770943f1a9798b19b78f83484cb4040bc0`

Type:

```lean
Sub ENNReal
```

Fully explicit type:

```lean
Sub.{0} ENNReal
```

Definition body (one-level semantic boundary):

```lean
inferInstanceAs (Sub (WithTop NNReal))
```

### D080: `ENNReal.ofNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `5`
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

### D081: `Finset.prod`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.BigOperators.Group.Finset.Defs`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `e364cffe1f2457eedceca9fe0617d7a66084963ffb6e6ed760d1f3fe74eee841`

Type:

```lean
{ι : Type u_1} → {M : Type u_3} → [CommMonoid M] → Finset ι → (ι → M) → M
```

Fully explicit type:

```lean
{ι : Type u_1} → {M : Type u_3} → [CommMonoid.{u_3} M] → (s : Finset.{u_1} ι) → (f : ι → M) → M
```

Definition body (one-level semantic boundary):

```lean
fun {ι} {M} [CommMonoid M] s f => (Multiset.map f s.val).prod
```

### D082: `HSub.hSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `5`
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

### D083: `instAddCommMonoidWithOneENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `31d9551885e3007e5d1368365622cfd7638ea41cc6d885234041621de873f55c`

Type:

```lean
AddCommMonoidWithOne ENNReal
```

Fully explicit type:

```lean
AddCommMonoidWithOne.{0} ENNReal
```

Definition body (one-level semantic boundary):

```lean
WithTop.addCommMonoidWithOne
```

### D084: `instHSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `5`
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

## Complete local imported sources

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

### `NumStability.HDP.Scalar.CentralLimit`

Path: `lean-numerical-stability/NumStability/HDP/Scalar/CentralLimit.lean`
SHA-256: `a65f6144d9a380403068d3c537a916e8a44a5b26f4d7a3aae03c83043b041e99`

```lean
import NumStability.HDP.Scalar.LimitTheorems
import Mathlib.Analysis.Calculus.Taylor
import Mathlib.MeasureTheory.Measure.CharacteristicFunction
import Mathlib.MeasureTheory.Measure.Prokhorov
import Mathlib.MeasureTheory.Measure.TightNormed
import Mathlib.Probability.Independence.CharacteristicFunction

/-!
# Characteristic-function foundations for scalar limit theorems

Reusable bridge lemmas for the Chapter 1 central-limit and Poisson-limit
targets. This module is deliberately separate from `LimitTheorems` so later
CLT work does not invalidate completed audits of the earlier source contracts.
-/

noncomputable section

open MeasureTheory Filter Set Function

open scoped Topology

namespace NumStability.HDP.Scalar.LimitTheorems

/-- The characteristic function of a pushforward probability law is the
expectation of the usual complex exponential of the original random variable. -/
theorem charFun_probabilityLaw
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : Ω → ℝ) (hX : AEMeasurable X μ) (t : ℝ) :
    MeasureTheory.charFun (probabilityLaw X hX : Measure ℝ) t =
      ∫ ω, Complex.exp (t * X ω * Complex.I) ∂μ := by
  rw [MeasureTheory.charFun_apply_real]
  change (∫ x : ℝ, Complex.exp (t * x * Complex.I) ∂Measure.map X μ) = _
  rw [MeasureTheory.integral_map hX (by fun_prop)]

/-- The characteristic function of the standard normal law is
`t ↦ exp (-t² / 2)`. -/
theorem standardNormalLaw_charFun (t : ℝ) :
    MeasureTheory.charFun standardNormalLaw t =
      Complex.exp (-(t : ℂ) ^ 2 / 2) := by
  rw [standardNormalLaw, ProbabilityTheory.charFun_gaussianReal]
  congr 1
  push_cast
  ring

/-- A global quadratic domination for the second-order remainder of the
imaginary-axis complex exponential. This is the integrable bound needed for
the finite-variance dominated-convergence step in the CLT proof. -/
theorem norm_cexp_mul_I_sub_one_sub_linear_le (y : ℝ) :
    ‖Complex.exp ((y : ℂ) * Complex.I) - 1 - (y : ℂ) * Complex.I‖ ≤
      3 * y ^ 2 := by
  by_cases hy : |y| ≤ 1
  · have hz : ‖(y : ℂ) * Complex.I‖ ≤ 1 := by
      simpa [Complex.norm_mul, Real.norm_eq_abs] using hy
    calc
      ‖Complex.exp ((y : ℂ) * Complex.I) - 1 - (y : ℂ) * Complex.I‖ ≤
          ‖(y : ℂ) * Complex.I‖ ^ 2 :=
        Complex.norm_exp_sub_one_sub_id_le hz
      _ = y ^ 2 := by simp [Real.norm_eq_abs, sq_abs]
      _ ≤ 3 * y ^ 2 := by nlinarith [sq_nonneg y]
  · have hy1 : 1 < |y| := lt_of_not_ge hy
    calc
      ‖Complex.exp ((y : ℂ) * Complex.I) - 1 - (y : ℂ) * Complex.I‖ ≤
          ‖Complex.exp ((y : ℂ) * Complex.I) - 1‖ +
            ‖(y : ℂ) * Complex.I‖ := norm_sub_le _ _
      _ ≤ (‖Complex.exp ((y : ℂ) * Complex.I)‖ + ‖(1 : ℂ)‖) +
            ‖(y : ℂ) * Complex.I‖ := by
        gcongr
        exact norm_sub_le _ _
      _ = 2 + |y| := by
        norm_num [Complex.norm_exp_ofReal_mul_I, Complex.norm_mul,
          Real.norm_eq_abs]
      _ ≤ 3 * y ^ 2 := by
        rw [← sq_abs]
        nlinarith [abs_nonneg y]

/-- After division by the square of a nonzero scale, the exponential
remainder is dominated by the square of the underlying value, independently
of the scale. This is the pointwise majorant used in the CLT Taylor step. -/
theorem norm_cexp_scaled_remainder_div_sq_le
    (u x : ℝ) (hu : u ≠ 0) :
    ‖(Complex.exp (((u * x : ℝ) : ℂ) * Complex.I) - 1 -
          ((u * x : ℝ) : ℂ) * Complex.I) / (u : ℂ) ^ 2‖ ≤
      3 * x ^ 2 := by
  have h := norm_cexp_mul_I_sub_one_sub_linear_le (u * x)
  calc
    ‖(Complex.exp (((u * x : ℝ) : ℂ) * Complex.I) - 1 -
          ((u * x : ℝ) : ℂ) * Complex.I) / (u : ℂ) ^ 2‖ =
        ‖Complex.exp (((u * x : ℝ) : ℂ) * Complex.I) - 1 -
          ((u * x : ℝ) : ℂ) * Complex.I‖ / |u| ^ 2 := by
      rw [norm_div, norm_pow]
      simp [Real.norm_eq_abs]
    _ ≤ (3 * (u * x) ^ 2) / |u| ^ 2 :=
      div_le_div_of_nonneg_right h (sq_nonneg |u|)
    _ = 3 * x ^ 2 := by
      rw [mul_pow, sq_abs]
      field_simp

/-- The order-two Taylor polynomial, along the real scale parameter, of the
imaginary-axis exponential used by characteristic functions. -/
theorem taylorWithinEval_cexp_mul_I_order_two (x u : ℝ) :
    taylorWithinEval
        (fun v : ℝ => Complex.exp (((v * x : ℝ) : ℂ) * Complex.I))
        2 Set.univ 0 u =
      1 + ((u * x : ℝ) : ℂ) * Complex.I -
        (((u * x) ^ 2 : ℝ) : ℂ) / 2 := by
  let c : ℂ := (x : ℂ) * Complex.I
  let f : ℝ → ℂ := fun v => Complex.exp ((v : ℂ) * c)
  have hf1 : ∀ v : ℝ,
      HasDerivAt f (Complex.exp ((v : ℂ) * c) * c) v := by
    intro v
    have hc : HasDerivAt (fun z : ℂ => z * c) c (v : ℂ) := by
      simpa only [id_eq, one_mul] using
        (hasDerivAt_id (v : ℂ)).mul_const c
    exact ((Complex.hasDerivAt_exp _).comp (v : ℂ) hc).comp_ofReal
  have hdf : deriv f = fun v : ℝ => Complex.exp ((v : ℂ) * c) * c := by
    funext v
    exact (hf1 v).deriv
  have h0 : iteratedDerivWithin 0 f Set.univ 0 = 1 := by
    simp [f]
  have h1 : iteratedDerivWithin 1 f Set.univ 0 = c := by
    rw [show 1 = 0 + 1 by norm_num, iteratedDerivWithin_succ']
    simp [derivWithin_univ, hdf]
  have h2 : iteratedDerivWithin 2 f Set.univ 0 = c * c := by
    rw [show 2 = 1 + 1 by norm_num, iteratedDerivWithin_succ']
    rw [show iteratedDerivWithin 1 (derivWithin f Set.univ) Set.univ 0 =
      derivWithin (derivWithin f Set.univ) Set.univ 0 by
        rw [show 1 = 0 + 1 by norm_num, iteratedDerivWithin_succ']
        simp]
    rw [derivWithin_univ, derivWithin_univ, hdf]
    simpa [f] using ((hf1 0).mul_const c).deriv
  have h0' : iteratedDeriv 0 f 0 = 1 := by
    rw [← iteratedDerivWithin_univ]
    exact h0
  have h1' : iteratedDeriv 1 f 0 = c := by
    rw [← iteratedDerivWithin_univ]
    exact h1
  have h2' : iteratedDeriv 2 f 0 = c * c := by
    rw [← iteratedDerivWithin_univ]
    exact h2
  have ht : taylorWithinEval f 2 Set.univ 0 u =
      1 + (u : ℂ) * c + ((u : ℂ) ^ 2 / 2) * (c * c) := by
    rw [taylor_within_apply]
    simp [Finset.sum_range_succ, h0', h1', h2']
    change 1 + algebraMap ℝ ℂ u * c +
      algebraMap ℝ ℂ (2⁻¹ * u ^ 2) * (c * c) = _
    rw [Complex.coe_algebraMap]
    push_cast
    ring
  have hfun :
      (fun v : ℝ => Complex.exp (((v * x : ℝ) : ℂ) * Complex.I)) = f := by
    funext v
    dsimp [f, c]
    congr 1
    push_cast
    ring
  rw [hfun]
  calc
    taylorWithinEval f 2 Set.univ 0 u =
        1 + (u : ℂ) * c + ((u : ℂ) ^ 2 / 2) * (c * c) := ht
    _ = 1 + ((u * x : ℝ) : ℂ) * Complex.I -
        (((u * x) ^ 2 : ℝ) : ℂ) / 2 := by
      dsimp [c]
      push_cast
      ring_nf
      rw [Complex.I_sq]
      ring

/-- The scaled characteristic-function integrand has its expected
second-order pointwise limit. The punctured neighborhood matches the quotient
appearing in dominated convergence; the value at zero is immaterial. -/
theorem tendsto_cexp_scaled_remainder_div_sq (x : ℝ) :
    Filter.Tendsto
      (fun u : ℝ =>
        (Complex.exp (((u * x : ℝ) : ℂ) * Complex.I) - 1 -
          ((u * x : ℝ) : ℂ) * Complex.I) / (u : ℂ) ^ 2)
      (𝓝[≠] 0) (𝓝 (-((x : ℂ) ^ 2) / 2)) := by
  let f : ℝ → ℂ := fun u =>
    Complex.exp (((u * x : ℝ) : ℂ) * Complex.I)
  have hf : ContDiff ℝ 2 f := by
    have hg : ContDiff ℝ 2
        (fun u : ℝ => Complex.ofRealCLM (u * x) * Complex.I) := by
      fun_prop
    simpa only [f, Function.comp_apply, Complex.ofRealCLM_apply] using
      (Complex.contDiff_exp (𝕜 := ℝ)).comp hg
  have ht := taylor_tendsto (f := f) (n := 2) (s := Set.univ)
    (x₀ := 0) convex_univ (Set.mem_univ 0) hf.contDiffOn
  rw [nhdsWithin_univ] at ht
  have hlim : Filter.Tendsto
      (fun u : ℝ => ((u - 0) ^ 2)⁻¹ •
        (f u - taylorWithinEval f 2 Set.univ 0 u) -
          ((x : ℂ) ^ 2) / 2)
      (𝓝 0) (𝓝 (-((x : ℂ) ^ 2) / 2)) := by
    simpa only [zero_sub, neg_div] using
      ht.sub_const (((x : ℂ) ^ 2) / 2)
  refine (tendsto_nhdsWithin_of_tendsto_nhds hlim).congr' ?_
  filter_upwards [self_mem_nhdsWithin] with u hu
  have hu0 : u ≠ 0 := by simpa using hu
  have huc : (u : ℂ) ≠ 0 := by exact_mod_cast hu0
  rw [taylorWithinEval_cexp_mul_I_order_two]
  dsimp [f]
  change algebraMap ℝ ℂ (((u - 0) ^ 2)⁻¹) *
      (Complex.exp (((u * x : ℝ) : ℂ) * Complex.I) -
        (1 + ((u * x : ℝ) : ℂ) * Complex.I -
          (((u * x) ^ 2 : ℝ) : ℂ) / 2)) -
        ((x : ℂ) ^ 2) / 2 = _
  rw [Complex.coe_algebraMap]
  push_cast
  field_simp [huc]
  ring

/-- Dominated convergence passes the pointwise second-order exponential
remainder limit through expectation under a finite second moment. -/
theorem tendsto_integral_cexp_scaled_remainder_div_sq
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    (X : Ω → ℝ) (hX : AEMeasurable X μ)
    (hX2 : Integrable (fun ω => (X ω) ^ 2) μ) :
    Filter.Tendsto
      (fun u : ℝ => ∫ ω,
        (Complex.exp (((u * X ω : ℝ) : ℂ) * Complex.I) - 1 -
          ((u * X ω : ℝ) : ℂ) * Complex.I) / (u : ℂ) ^ 2 ∂μ)
      (𝓝[≠] 0)
      (𝓝 (∫ ω, -((X ω : ℂ) ^ 2) / 2 ∂μ)) := by
  let F : ℝ → Ω → ℂ := fun u ω =>
    (Complex.exp (((u * X ω : ℝ) : ℂ) * Complex.I) - 1 -
      ((u * X ω : ℝ) : ℂ) * Complex.I) / (u : ℂ) ^ 2
  refine tendsto_integral_filter_of_dominated_convergence
    (F := F) (f := fun ω => -((X ω : ℂ) ^ 2) / 2)
    (fun ω => 3 * (X ω) ^ 2) ?_ ?_ ?_ ?_
  · filter_upwards [self_mem_nhdsWithin] with u hu
    have hu0 : u ≠ 0 := by simpa using hu
    have hmeas : AEMeasurable (F u) μ := by
      dsimp [F]
      fun_prop
    exact hmeas.aestronglyMeasurable
  · filter_upwards [self_mem_nhdsWithin] with u hu
    have hu0 : u ≠ 0 := by simpa using hu
    exact ae_of_all μ fun ω =>
      norm_cexp_scaled_remainder_div_sq_le u (X ω) hu0
  · exact hX2.const_mul 3
  · exact ae_of_all μ fun ω =>
      tendsto_cexp_scaled_remainder_div_sq (X ω)

/-- For a centered, unit-second-moment real random variable, the
characteristic-function integral has the classical quadratic expansion at
zero. -/
theorem tendsto_centered_unitSecondMoment_charFun_remainder_div_sq
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : Ω → ℝ) (hX : MemLp X 2 μ)
    (hMean : ∫ ω, X ω ∂μ = 0)
    (hSecond : ∫ ω, (X ω) ^ 2 ∂μ = 1) :
    Filter.Tendsto
      (fun u : ℝ =>
        ((∫ ω, Complex.exp (((u * X ω : ℝ) : ℂ) * Complex.I) ∂μ) - 1) /
          (u : ℂ) ^ 2)
      (𝓝[≠] 0) (𝓝 (-(1 : ℂ) / 2)) := by
  have hDCT := tendsto_integral_cexp_scaled_remainder_div_sq
    X hX.aemeasurable hX.integrable_sq
  have hlimit :
      (∫ ω, -((X ω : ℂ) ^ 2) / 2 ∂μ) = -(1 : ℂ) / 2 := by
    calc
      (∫ ω, -((X ω : ℂ) ^ 2) / 2 ∂μ) =
          (∫ ω, -((X ω : ℂ) ^ 2) ∂μ) / (2 : ℂ) := integral_div _ _
      _ = -(∫ ω, (X ω : ℂ) ^ 2 ∂μ) / 2 := by
        rw [integral_neg]
      _ = -(1 : ℂ) / 2 := by
        have hpow : (fun ω => (X ω : ℂ) ^ 2) =
            (fun ω => (((X ω) ^ 2 : ℝ) : ℂ)) := by
          funext ω
          push_cast
          rfl
        rw [hpow]
        have hc : (∫ ω, (((X ω) ^ 2 : ℝ) : ℂ) ∂μ) =
            ((∫ ω, (X ω) ^ 2 ∂μ : ℝ) : ℂ) := integral_complex_ofReal
        rw [hc, hSecond]
        norm_num
  rw [hlimit] at hDCT
  refine hDCT.congr' ?_
  filter_upwards [self_mem_nhdsWithin] with u hu
  have hu0 : u ≠ 0 := by simpa using hu
  have hXint : Integrable X μ := hX.integrable (by norm_num)
  have hAmeas : AEMeasurable
      (fun ω => Complex.exp (((u * X ω : ℝ) : ℂ) * Complex.I)) μ := by
    fun_prop
  have hAint : Integrable
      (fun ω => Complex.exp (((u * X ω : ℝ) : ℂ) * Complex.I)) μ := by
    refine Integrable.of_bound hAmeas.aestronglyMeasurable 1 ?_
    exact ae_of_all μ fun ω => by
      simp only [Complex.norm_exp_ofReal_mul_I]
      norm_num
  have hOne : Integrable (fun _ : Ω => (1 : ℂ)) μ := integrable_const 1
  have hLin : Integrable
      (fun ω => ((u * X ω : ℝ) : ℂ) * Complex.I) μ :=
    ((hXint.const_mul u).ofReal).mul_const Complex.I
  have hLinZero :
      (∫ ω, ((u * X ω : ℝ) : ℂ) * Complex.I ∂μ) = 0 := by
    calc
      (∫ ω, ((u * X ω : ℝ) : ℂ) * Complex.I ∂μ) =
          (∫ ω, ((u * X ω : ℝ) : ℂ) ∂μ) * Complex.I :=
        integral_mul_const _ _
      _ = ((∫ ω, u * X ω ∂μ : ℝ) : ℂ) * Complex.I := by
        have hcu : (∫ ω, ((u * X ω : ℝ) : ℂ) ∂μ) =
            ((∫ ω, u * X ω ∂μ : ℝ) : ℂ) := integral_complex_ofReal
        rw [hcu]
      _ = ((u * ∫ ω, X ω ∂μ : ℝ) : ℂ) * Complex.I := by
        rw [integral_const_mul]
      _ = 0 := by rw [hMean]; simp
  have hsubA :
      (∫ ω, Complex.exp (((u * X ω : ℝ) : ℂ) * Complex.I) - 1 ∂μ) =
        (∫ ω, Complex.exp (((u * X ω : ℝ) : ℂ) * Complex.I) ∂μ) -
          (∫ _ : Ω, (1 : ℂ) ∂μ) := integral_sub hAint hOne
  have hsubLin :
      (∫ ω, (Complex.exp (((u * X ω : ℝ) : ℂ) * Complex.I) - 1) -
        ((u * X ω : ℝ) : ℂ) * Complex.I ∂μ) =
        (∫ ω, Complex.exp (((u * X ω : ℝ) : ℂ) * Complex.I) - 1 ∂μ) -
          (∫ ω, ((u * X ω : ℝ) : ℂ) * Complex.I ∂μ) :=
    integral_sub (hAint.sub hOne) hLin
  calc
    (∫ ω, (Complex.exp (((u * X ω : ℝ) : ℂ) * Complex.I) - 1 -
        ((u * X ω : ℝ) : ℂ) * Complex.I) / (u : ℂ) ^ 2 ∂μ) =
      (∫ ω, Complex.exp (((u * X ω : ℝ) : ℂ) * Complex.I) - 1 -
        ((u * X ω : ℝ) : ℂ) * Complex.I ∂μ) / (u : ℂ) ^ 2 :=
      integral_div _ _
    _ = ((∫ ω, Complex.exp (((u * X ω : ℝ) : ℂ) * Complex.I) ∂μ) - 1) /
        (u : ℂ) ^ 2 := by
      rw [hsubLin, hsubA, hLinZero]
      simp [integral_const]

/-- Pointwise convergence of the characteristic-function powers for iid
normalized sums, expressed first at the level of a single centered,
unit-second-moment law. -/
theorem tendsto_centered_unitSecondMoment_charFun_pow_sqrt
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : Ω → ℝ) (hX : MemLp X 2 μ)
    (hMean : ∫ ω, X ω ∂μ = 0)
    (hSecond : ∫ ω, (X ω) ^ 2 ∂μ = 1) (t : ℝ) :
    Filter.Tendsto
      (fun n : ℕ =>
        (∫ ω, Complex.exp
          ((((t / Real.sqrt n) * X ω : ℝ) : ℂ) * Complex.I) ∂μ) ^ n)
      atTop (𝓝 (Complex.exp (-(t : ℂ) ^ 2 / 2))) := by
  by_cases ht : t = 0
  · subst t
    simpa [integral_const] using
      (tendsto_const_nhds :
        Filter.Tendsto (fun _ : ℕ => (1 : ℂ)) atTop (𝓝 1))
  · let φ : ℝ → ℂ := fun u =>
      ∫ ω, Complex.exp (((u * X ω : ℝ) : ℂ) * Complex.I) ∂μ
    let u : ℕ → ℝ := fun n => t / Real.sqrt n
    let g : ℕ → ℂ := fun n => φ (u n) - 1
    have hsqrt : Filter.Tendsto
        (fun n : ℕ => Real.sqrt (n : ℝ)) atTop atTop :=
      Real.tendsto_sqrt_atTop.comp tendsto_natCast_atTop_atTop
    have hu : Filter.Tendsto u atTop (𝓝 0) := by
      exact tendsto_const_nhds.div_atTop hsqrt
    have hune : ∀ᶠ n : ℕ in atTop, u n ≠ 0 := by
      filter_upwards [eventually_gt_atTop 0] with n hn
      exact div_ne_zero ht
        (Real.sqrt_ne_zero'.mpr (Nat.cast_pos.mpr hn))
    have huWithin : Filter.Tendsto u atTop (𝓝[≠] 0) :=
      tendsto_nhdsWithin_iff.mpr ⟨hu, by simpa using hune⟩
    have hquot : Filter.Tendsto
        (fun n => (φ (u n) - 1) / (u n : ℂ) ^ 2)
        atTop (𝓝 (-(1 : ℂ) / 2)) := by
      exact (tendsto_centered_unitSecondMoment_charFun_remainder_div_sq
        X hX hMean hSecond).comp huWithin
    have hscale : Filter.Tendsto
        (fun n : ℕ => (n : ℂ) * (u n : ℂ) ^ 2)
        atTop (𝓝 ((t : ℂ) ^ 2)) := by
      refine tendsto_const_nhds.congr' ?_
      filter_upwards [eventually_gt_atTop 0] with n hn
      have hsqrt_sq : (Real.sqrt (n : ℝ)) ^ 2 = (n : ℝ) :=
        Real.sq_sqrt (Nat.cast_nonneg n)
      have hsqrt_sq_c :
          (Real.sqrt (n : ℝ) : ℂ) ^ 2 = (n : ℂ) := by
        exact_mod_cast hsqrt_sq
      have hnc : (n : ℂ) ≠ 0 := by
        exact_mod_cast (Nat.ne_of_gt hn)
      dsimp [u]
      push_cast
      rw [div_pow, hsqrt_sq_c]
      field_simp [hnc]
    have hng : Filter.Tendsto (fun n : ℕ => (n : ℂ) * g n)
        atTop (𝓝 (-((t : ℂ) ^ 2) / 2)) := by
      have hprod := hquot.mul hscale
      have hprod' : Filter.Tendsto
          (fun n : ℕ => ((φ (u n) - 1) / (u n : ℂ) ^ 2) *
            ((n : ℂ) * (u n : ℂ) ^ 2))
          atTop (𝓝 (-((t : ℂ) ^ 2) / 2)) := by
        convert hprod using 1 <;> ring
      refine hprod'.congr' ?_
      filter_upwards [hune] with n hun
      dsimp [g]
      have hunc : (u n : ℂ) ≠ 0 := by exact_mod_cast hun
      field_simp [hunc]
    have hpow := Complex.tendsto_one_add_pow_exp_of_tendsto hng
    simpa [g, φ, u] using hpow

/-- Joint independence factors the characteristic function of a finite sum
into the product of the summands' characteristic functions. -/
theorem charFun_probabilityLaw_sum_eq_prod
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : ι → Ω → ℝ) (hX : ∀ i, AEMeasurable (X i) μ)
    (hIndep : ProbabilityTheory.iIndepFun X μ) (t : ℝ) :
    MeasureTheory.charFun
        (probabilityLaw (∑ i, X i) (by fun_prop) : Measure ℝ) t =
      ∏ i, MeasureTheory.charFun
        (probabilityLaw (X i) (hX i) : Measure ℝ) t := by
  change MeasureTheory.charFun (μ.map (∑ i, X i)) t =
    ∏ i, MeasureTheory.charFun (μ.map (X i)) t
  simpa only [Finset.prod_apply] using
    congrFun (hIndep.charFun_map_sum_eq_prod hX) t

/-- Scaling a real random variable scales the argument of its characteristic
function. -/
theorem charFun_probabilityLaw_const_mul
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : Ω → ℝ) (hX : AEMeasurable X μ) (a t : ℝ) :
    MeasureTheory.charFun
        (probabilityLaw (fun ω => a * X ω) (hX.const_mul a) : Measure ℝ) t =
      MeasureTheory.charFun (probabilityLaw X hX : Measure ℝ) (a * t) := by
  rw [charFun_probabilityLaw, charFun_probabilityLaw]
  congr with ω
  congr 1
  push_cast
  ring

/-- Centering a real random variable multiplies its characteristic function by
the deterministic phase corresponding to the subtracted center. -/
theorem charFun_probabilityLaw_sub_const
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : Ω → ℝ) (hX : AEMeasurable X μ) (m t : ℝ) :
    MeasureTheory.charFun
        (probabilityLaw (fun ω => X ω - m) (by fun_prop) : Measure ℝ) t =
      MeasureTheory.charFun (probabilityLaw X hX : Measure ℝ) t *
        Complex.exp (-((t : ℂ) * (m : ℂ)) * Complex.I) := by
  rw [charFun_probabilityLaw, charFun_probabilityLaw]
  calc
    (∫ ω, Complex.exp ((t : ℂ) * ((X ω - m : ℝ) : ℂ) * Complex.I) ∂μ) =
        ∫ ω, Complex.exp (t * X ω * Complex.I) *
          Complex.exp (-((t : ℂ) * (m : ℂ)) * Complex.I) ∂μ := by
      apply integral_congr_ae
      filter_upwards with ω
      rw [← Complex.exp_add]
      congr 1
      push_cast
      ring
    _ = (∫ ω, Complex.exp (t * X ω * Complex.I) ∂μ) *
        Complex.exp (-((t : ℂ) * (m : ℂ)) * Complex.I) := by
      exact integral_mul_const _ _

/-- For a finite identically distributed independent family, the
characteristic function of the sum is the corresponding characteristic
function raised to the family cardinality. -/
theorem charFun_map_iid_sum_eq_pow
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : ι → Ω → ℝ) (i₀ : ι)
    (hX : ∀ i, AEMeasurable (X i) μ)
    (hIndep : ProbabilityTheory.iIndepFun X μ)
    (hIdent : ∀ i, ProbabilityTheory.IdentDistrib (X i) (X i₀) μ μ)
    (t : ℝ) :
    MeasureTheory.charFun (μ.map (∑ i, X i)) t =
      MeasureTheory.charFun (μ.map (X i₀)) t ^ Fintype.card ι := by
  calc
    MeasureTheory.charFun (μ.map (∑ i, X i)) t =
        ∏ i, MeasureTheory.charFun (μ.map (X i)) t := by
      simpa only [Finset.prod_apply] using
        congrFun (hIndep.charFun_map_sum_eq_prod hX) t
    _ = MeasureTheory.charFun (μ.map (X i₀)) t ^ Fintype.card ι := by
      simp_rw [fun i => (hIdent i).map_eq]
      simp

/-- Exact characteristic-function formula for a finite centered and uniformly
scaled iid sum. This is the algebraic reduction used before the Taylor-limit
step in the classical characteristic-function proof of the CLT. -/
theorem charFun_map_centered_scaled_iid_sum_eq_pow
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : ι → Ω → ℝ) (i₀ : ι)
    (hX : ∀ i, AEMeasurable (X i) μ)
    (hIndep : ProbabilityTheory.iIndepFun X μ)
    (hIdent : ∀ i, ProbabilityTheory.IdentDistrib (X i) (X i₀) μ μ)
    (m a t : ℝ) :
    MeasureTheory.charFun
        (μ.map (∑ i, fun ω => a * (X i ω - m))) t =
      (MeasureTheory.charFun (μ.map (X i₀)) (a * t) *
        Complex.exp (-(((a * t : ℝ) : ℂ) * (m : ℂ)) * Complex.I)) ^
          Fintype.card ι := by
  let Y : ι → Ω → ℝ := fun i ω => a * (X i ω - m)
  have hY : ∀ i, AEMeasurable (Y i) μ := by
    intro i
    dsimp [Y]
    fun_prop
  have hIndepY : ProbabilityTheory.iIndepFun Y μ := by
    have h := hIndep.comp (fun (_ : ι) (x : ℝ) => a * (x - m))
      (fun _ => by fun_prop)
    simpa [Y, Function.comp_def] using h
  have hIdentY : ∀ i, ProbabilityTheory.IdentDistrib (Y i) (Y i₀) μ μ := by
    intro i
    have h := (hIdent i).comp (by fun_prop : Measurable fun x : ℝ => a * (x - m))
    simpa [Y, Function.comp_def] using h
  have hsum := charFun_map_iid_sum_eq_pow Y i₀ hY hIndepY hIdentY t
  change MeasureTheory.charFun (μ.map (∑ i, Y i)) t = _ at hsum
  rw [hsum]
  congr 1
  have hCentered : AEMeasurable (fun ω => X i₀ ω - m) μ := by fun_prop
  have hscale := charFun_probabilityLaw_const_mul
    (fun ω => X i₀ ω - m) hCentered a t
  change MeasureTheory.charFun (μ.map (Y i₀)) t =
    MeasureTheory.charFun (μ.map (fun ω => X i₀ ω - m)) (a * t) at hscale
  rw [hscale]
  exact charFun_probabilityLaw_sub_const (X i₀) (hX i₀) m (a * t)

/-- The centered, unit-variance iid normalization, indexed by `N + 1` so the
denominator is never zero. -/
noncomputable def normalizedCenteredIidSum
    {Ω : Type*} (X : ℕ → Ω → ℝ) (N : ℕ) : Ω → ℝ :=
  fun ω => (Real.sqrt (N + 1 : ℝ))⁻¹ *
    ∑ i : Fin (N + 1), X i.1 ω

/-- The iid normalization with common mean `m` and positive standard
deviation `σ`, again indexed by the first `N + 1` variables. -/
noncomputable def normalizedIidSum
    {Ω : Type*} (X : ℕ → Ω → ℝ) (m σ : ℝ) (N : ℕ) : Ω → ℝ :=
  fun ω => (σ * Real.sqrt (N + 1 : ℝ))⁻¹ *
    ∑ i : Fin (N + 1), (X i.1 ω - m)

theorem normalizedCenteredIidSum_memLp
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : ℕ → Ω → ℝ) (hX : ∀ i, MemLp (X i) 2 μ) (N : ℕ) :
    MemLp (normalizedCenteredIidSum X N) 2 μ := by
  have hs : MemLp (fun ω => ∑ i : Fin (N + 1), X i.1 ω) 2 μ :=
    memLp_finset_sum Finset.univ (fun i _ => hX i.1)
  exact hs.const_mul (Real.sqrt (N + 1 : ℝ))⁻¹

theorem normalizedIidSum_memLp
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : ℕ → Ω → ℝ) (m σ : ℝ)
    (hX : ∀ i, MemLp (X i) 2 μ) (N : ℕ) :
    MemLp (normalizedIidSum X m σ N) 2 μ := by
  have hs : MemLp
      (fun ω => ∑ i : Fin (N + 1), (X i.1 ω - m)) 2 μ :=
    memLp_finset_sum Finset.univ
      (fun i _ => (hX i.1).sub (memLp_const m))
  exact hs.const_mul (σ * Real.sqrt (N + 1 : ℝ))⁻¹

theorem integral_normalizedCenteredIidSum_eq_zero
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : ℕ → Ω → ℝ) (hX : ∀ i, MemLp (X i) 2 μ)
    (hIdent : ∀ i, ProbabilityTheory.IdentDistrib (X i) (X 0) μ μ)
    (hMean : ∫ ω, X 0 ω ∂μ = 0) (N : ℕ) :
    ∫ ω, normalizedCenteredIidSum X N ω ∂μ = 0 := by
  unfold normalizedCenteredIidSum
  rw [integral_const_mul, integral_finset_sum]
  · simp_rw [fun i : Fin (N + 1) => (hIdent i.1).integral_eq, hMean]
    simp
  · intro i _
    exact (hX i.1).integrable (by norm_num)

theorem variance_normalizedCenteredIidSum_eq_one
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : ℕ → Ω → ℝ) (hX : ∀ i, MemLp (X i) 2 μ)
    (hIndep : ProbabilityTheory.iIndepFun X μ)
    (hIdent : ∀ i, ProbabilityTheory.IdentDistrib (X i) (X 0) μ μ)
    (hMean : ∫ ω, X 0 ω ∂μ = 0)
    (hSecond : ∫ ω, (X 0 ω) ^ 2 ∂μ = 1) (N : ℕ) :
    ProbabilityTheory.variance (normalizedCenteredIidSum X N) μ = 1 := by
  have hvar0 : ProbabilityTheory.variance (X 0) μ = 1 := by
    rw [ProbabilityTheory.variance_eq_integral (hX 0).aemeasurable, hMean]
    simpa using hSecond
  have hpair : Pairwise
      ((fun f g => ProbabilityTheory.IndepFun f g μ) on
        fun i : Fin (N + 1) => X i.1) := by
    intro i j hij
    exact hIndep.indepFun (Fin.val_injective.ne hij)
  have hsum := independentVarianceSum
    (fun i : Fin (N + 1) => hX i.1) hpair
  unfold normalizedCenteredIidSum
  rw [ProbabilityTheory.variance_const_mul]
  have hfun : (fun ω => ∑ i : Fin (N + 1), X i.1 ω) =
      ∑ i : Fin (N + 1), X i.1 := by
    funext ω
    simp
  rw [hfun, hsum]
  simp_rw [fun i : Fin (N + 1) => (hIdent i.1).variance_eq, hvar0]
  rw [Finset.sum_const, Finset.card_fin]
  simp only [nsmul_eq_mul, mul_one]
  have hsqrt : Real.sqrt (N + 1 : ℝ) ^ 2 = (N + 1 : ℝ) :=
    Real.sq_sqrt (by positivity)
  have hsqrt0 : Real.sqrt (N + 1 : ℝ) ≠ 0 := by positivity
  field_simp [hsqrt0]
  simpa [Nat.cast_add, Nat.cast_one] using hsqrt.symm

/-- Characteristic function of the normalized centered iid sum, expressed as
the `(N + 1)`-st power of the common one-variable characteristic function. -/
theorem charFun_probabilityLaw_normalizedCenteredIidSum
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : ℕ → Ω → ℝ) (hX : ∀ i, MemLp (X i) 2 μ)
    (hIndep : ProbabilityTheory.iIndepFun X μ)
    (hIdent : ∀ i, ProbabilityTheory.IdentDistrib (X i) (X 0) μ μ)
    (N : ℕ) (t : ℝ) :
    MeasureTheory.charFun
        (probabilityLaw (normalizedCenteredIidSum X N)
          (normalizedCenteredIidSum_memLp X hX N).aemeasurable : Measure ℝ) t =
      (∫ ω, Complex.exp
        (((t / Real.sqrt (N + 1 : ℝ) * X 0 ω : ℝ) : ℂ) * Complex.I) ∂μ) ^
          (N + 1) := by
  let i₀ : Fin (N + 1) := ⟨0, Nat.succ_pos N⟩
  have hIndepFin : ProbabilityTheory.iIndepFun
      (fun i : Fin (N + 1) => X i.1) μ :=
    hIndep.precomp Fin.val_injective
  have hIdentFin : ∀ i : Fin (N + 1),
      ProbabilityTheory.IdentDistrib (X i.1) (X i₀.1) μ μ := by
    intro i
    simpa [i₀] using hIdent i.1
  have hf := charFun_map_centered_scaled_iid_sum_eq_pow
    (fun i : Fin (N + 1) => X i.1) i₀
    (fun i => (hX i.1).aemeasurable) hIndepFin hIdentFin
    0 (Real.sqrt (N + 1 : ℝ))⁻¹ t
  change MeasureTheory.charFun (μ.map (normalizedCenteredIidSum X N)) t = _
  rw [show normalizedCenteredIidSum X N =
      ∑ i : Fin (N + 1),
        fun ω => (Real.sqrt (N + 1 : ℝ))⁻¹ * (X i.1 ω - 0) by
    funext ω
    simp [normalizedCenteredIidSum, Finset.mul_sum]]
  rw [hf]
  have hcf := charFun_probabilityLaw (X 0) (hX 0).aemeasurable
    ((Real.sqrt (N + 1 : ℝ))⁻¹ * t)
  change MeasureTheory.charFun (μ.map (X 0)) _ = _ at hcf
  rw [hcf]
  simp only [mul_zero, Complex.ofReal_zero, zero_mul, neg_zero,
    Complex.exp_zero, mul_one, Fintype.card_fin]
  congr 2
  funext ω
  congr 1
  push_cast
  ring

/-- Probability laws whose identity random variables are centered and have
variance uniformly bounded by one form a tight family. -/
theorem isTight_probabilityMeasure_range_of_variance_le_one
    (P : ℕ → ProbabilityMeasure ℝ)
    (hLp : ∀ n, MemLp (fun x : ℝ => x) 2 (P n : Measure ℝ))
    (hMean : ∀ n, ∫ x : ℝ, x ∂(P n : Measure ℝ) = 0)
    (hVar : ∀ n,
      ProbabilityTheory.variance (fun x : ℝ => x) (P n : Measure ℝ) ≤ 1) :
    IsTightMeasureSet
      {((p : ProbabilityMeasure ℝ) : Measure ℝ) | p ∈ Set.range P} := by
  rw [isTightMeasureSet_iff_exists_isCompact_measure_compl_le]
  intro ε hε
  obtain ⟨n, hn⟩ := ENNReal.exists_inv_nat_lt hε.ne'
  have hn0 : n ≠ 0 := by
    intro hnz
    subst n
    simp at hn
  have hnNat : 1 ≤ n := Nat.one_le_iff_ne_zero.mpr hn0
  have hnR : (0 : ℝ) < n := by exact_mod_cast Nat.pos_of_ne_zero hn0
  have hnOneR : (1 : ℝ) ≤ n := by exact_mod_cast hnNat
  refine ⟨Set.Icc (-(n : ℝ)) n, isCompact_Icc, ?_⟩
  intro ν hν
  rcases hν with ⟨p, ⟨k, rfl⟩, rfl⟩
  have hcheb := ProbabilityTheory.meas_ge_le_variance_div_sq
    (hLp k) hnR
  calc
    (P k : Measure ℝ) (Set.Icc (-(n : ℝ)) n)ᶜ ≤
        (P k : Measure ℝ)
          {x | (n : ℝ) ≤ |x - ∫ y : ℝ, y ∂(P k : Measure ℝ)|} := by
      apply measure_mono
      intro x hx
      simp only [Set.mem_compl_iff, Set.mem_Icc, Set.mem_setOf_eq,
        hMean, sub_zero] at hx ⊢
      rw [not_and_or, not_le, not_le] at hx
      rcases hx with hx | hx
      · nlinarith [neg_le_abs x]
      · nlinarith [le_abs_self x]
    _ ≤ ENNReal.ofReal
        (ProbabilityTheory.variance (fun x : ℝ => x) (P k : Measure ℝ) /
          (n : ℝ) ^ 2) := hcheb
    _ ≤ ENNReal.ofReal (1 / (n : ℝ) ^ 2) := by
      apply ENNReal.ofReal_le_ofReal
      exact div_le_div_of_nonneg_right (hVar k) (sq_nonneg (n : ℝ))
    _ ≤ ENNReal.ofReal (1 / (n : ℝ)) := by
      apply ENNReal.ofReal_le_ofReal
      have hnSq : (n : ℝ) ≤ (n : ℝ) ^ 2 := by nlinarith
      exact one_div_le_one_div_of_le hnR hnSq
    _ = (n : ENNReal)⁻¹ := by
      rw [one_div, ENNReal.ofReal_inv_of_pos hnR]
      simp
    _ ≤ ε := hn.le

/-- The probability laws of the normalized centered iid sums form a tight
family. -/
theorem isTight_probabilityLaw_normalizedCenteredIidSum
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : ℕ → Ω → ℝ) (hX : ∀ i, MemLp (X i) 2 μ)
    (hIndep : ProbabilityTheory.iIndepFun X μ)
    (hIdent : ∀ i, ProbabilityTheory.IdentDistrib (X i) (X 0) μ μ)
    (hMean : ∫ ω, X 0 ω ∂μ = 0)
    (hSecond : ∫ ω, (X 0 ω) ^ 2 ∂μ = 1) :
    IsTightMeasureSet {((p : ProbabilityMeasure ℝ) : Measure ℝ) |
      p ∈ Set.range (fun n => probabilityLaw (normalizedCenteredIidSum X n)
        (normalizedCenteredIidSum_memLp X hX n).aemeasurable)} := by
  let P : ℕ → ProbabilityMeasure ℝ := fun n =>
    probabilityLaw (normalizedCenteredIidSum X n)
      (normalizedCenteredIidSum_memLp X hX n).aemeasurable
  apply isTight_probabilityMeasure_range_of_variance_le_one P
  · intro n
    change MemLp (fun x : ℝ => x) 2
      (Measure.map (normalizedCenteredIidSum X n) μ)
    rw [memLp_map_measure_iff (g := fun x : ℝ => x)
      continuous_id.aestronglyMeasurable
      (normalizedCenteredIidSum_memLp X hX n).aemeasurable]
    simpa [Function.comp_def] using normalizedCenteredIidSum_memLp X hX n
  · intro n
    change (∫ x : ℝ, x ∂Measure.map (normalizedCenteredIidSum X n) μ) = 0
    have hiMap := integral_map
      (μ := μ) (φ := normalizedCenteredIidSum X n) (f := fun x : ℝ => x)
      (normalizedCenteredIidSum_memLp X hX n).aemeasurable
      continuous_id.aestronglyMeasurable
    rw [hiMap]
    exact integral_normalizedCenteredIidSum_eq_zero X hX hIdent hMean n
  · intro n
    change ProbabilityTheory.variance (fun x : ℝ => x)
      (Measure.map (normalizedCenteredIidSum X n) μ) ≤ 1
    rw [ProbabilityTheory.variance_map (X := fun x : ℝ => x)
      measurable_id.aemeasurable
      (normalizedCenteredIidSum_memLp X hX n).aemeasurable]
    simpa [Function.comp_def] using
      (variance_normalizedCenteredIidSum_eq_one
        X hX hIndep hIdent hMean hSecond n).le

/-- A tight sequence of real probability laws converges weakly when all of its
characteristic functions converge pointwise to the characteristic function of
the proposed limit law. This is the tightness-assisted form of Lévy's
continuity theorem needed by the finite-variance CLT. -/
theorem tendsto_probabilityMeasure_of_charFun_tendsto_of_tight
    (P : ℕ → ProbabilityMeasure ℝ) (Q : ProbabilityMeasure ℝ)
    (hTight : IsTightMeasureSet
      {((p : ProbabilityMeasure ℝ) : Measure ℝ) | p ∈ Set.range P})
    (hchar : ∀ t : ℝ, Tendsto
      (fun n => MeasureTheory.charFun (P n : Measure ℝ) t)
      atTop (𝓝 (MeasureTheory.charFun (Q : Measure ℝ) t))) :
    Tendsto P atTop (𝓝 Q) := by
  let S : Set (ProbabilityMeasure ℝ) := Set.range P
  have hcompact : IsCompact (closure S) :=
    isCompact_closure_of_isTightMeasureSet hTight
  refine hcompact.tendsto_nhds_of_unique_mapClusterPt ?_ ?_
  · exact Eventually.of_forall fun n => subset_closure ⟨n, rfl⟩
  · intro p hp hcluster
    apply ProbabilityMeasure.toMeasure_injective
    apply Measure.ext_of_charFun
    funext t
    have hc : Continuous
        (fun q : ProbabilityMeasure ℝ =>
          MeasureTheory.charFun (q : Measure ℝ) t) := by
      have hi : Continuous
          (fun q : ProbabilityMeasure ℝ =>
            ∫ x, BoundedContinuousFunction.innerProbChar t x ∂(q : Measure ℝ)) := by
        rw [continuous_iff_continuousAt]
        intro q
        exact (ProbabilityMeasure.tendsto_iff_forall_integral_rclike_tendsto ℂ).1
          continuousAt_id (BoundedContinuousFunction.innerProbChar t)
      simpa only [MeasureTheory.charFun_eq_integral_innerProbChar] using hi
    have hcluster_char : MapClusterPt
        (MeasureTheory.charFun (p : Measure ℝ) t) atTop
        (fun n => MeasureTheory.charFun (P n : Measure ℝ) t) :=
      hcluster.continuousAt_comp hc.continuousAt
    rw [mapClusterPt_iff_ultrafilter] at hcluster_char
    obtain ⟨U, hU, hUt⟩ := hcluster_char
    exact tendsto_nhds_unique hUt ((hchar t).mono_left hU)

/-- Lindeberg–Lévy for a centered unit-variance iid real sequence. The
normalization uses the first `N + 1` variables. -/
theorem tendsto_probabilityLaw_normalizedCenteredIidSum
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : ℕ → Ω → ℝ) (hX : ∀ i, MemLp (X i) 2 μ)
    (hIndep : ProbabilityTheory.iIndepFun X μ)
    (hIdent : ∀ i, ProbabilityTheory.IdentDistrib (X i) (X 0) μ μ)
    (hMean : ∫ ω, X 0 ω ∂μ = 0)
    (hSecond : ∫ ω, (X 0 ω) ^ 2 ∂μ = 1) :
    Tendsto (fun n => probabilityLaw (normalizedCenteredIidSum X n)
        (normalizedCenteredIidSum_memLp X hX n).aemeasurable)
      atTop (𝓝 (⟨standardNormalLaw, inferInstance⟩ : ProbabilityMeasure ℝ)) := by
  let P : ℕ → ProbabilityMeasure ℝ := fun n =>
    probabilityLaw (normalizedCenteredIidSum X n)
      (normalizedCenteredIidSum_memLp X hX n).aemeasurable
  let Q : ProbabilityMeasure ℝ := ⟨standardNormalLaw, inferInstance⟩
  change Tendsto P atTop (𝓝 Q)
  apply tendsto_probabilityMeasure_of_charFun_tendsto_of_tight P Q
  · exact isTight_probabilityLaw_normalizedCenteredIidSum
      X hX hIndep hIdent hMean hSecond
  · intro t
    have hbase := tendsto_centered_unitSecondMoment_charFun_pow_sqrt
      (X 0) (hX 0) hMean hSecond t
    have hsucc : Tendsto (fun n : ℕ => n + 1) atTop atTop :=
      Filter.tendsto_atTop_mono (fun n => Nat.le_succ n) tendsto_id
    have hlim := hbase.comp hsucc
    have hformula : ∀ n,
        MeasureTheory.charFun (P n : Measure ℝ) t =
          (∫ ω, Complex.exp
            (((t / Real.sqrt (n + 1 : ℝ) * X 0 ω : ℝ) : ℂ) * Complex.I) ∂μ) ^
              (n + 1) := by
      intro n
      exact charFun_probabilityLaw_normalizedCenteredIidSum
        X hX hIndep hIdent n t
    have hlimP : Tendsto
        (fun n => MeasureTheory.charFun (P n : Measure ℝ) t) atTop
        (𝓝 (Complex.exp (-(t : ℂ) ^ 2 / 2))) := by
      apply hlim.congr'
      filter_upwards with n
      symm
      simpa [P, Nat.cast_add, Nat.cast_one] using hformula n
    simpa [Q, standardNormalLaw_charFun] using hlimP

/-- Lindeberg–Lévy for iid real variables with common mean `m` and
variance `σ²`, with `σ > 0`. -/
theorem tendsto_probabilityLaw_normalizedIidSum
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : ℕ → Ω → ℝ) (m σ : ℝ) (hσ : 0 < σ)
    (hX : ∀ i, MemLp (X i) 2 μ)
    (hIndep : ProbabilityTheory.iIndepFun X μ)
    (hIdent : ∀ i, ProbabilityTheory.IdentDistrib (X i) (X 0) μ μ)
    (hMean : ∫ ω, X 0 ω ∂μ = m)
    (hVariance : ProbabilityTheory.variance (X 0) μ = σ ^ 2) :
    Tendsto (fun n => probabilityLaw (normalizedIidSum X m σ n)
        (normalizedIidSum_memLp X m σ hX n).aemeasurable)
      atTop (𝓝 (⟨standardNormalLaw, inferInstance⟩ : ProbabilityMeasure ℝ)) := by
  let Y : ℕ → Ω → ℝ := fun i ω => σ⁻¹ * (X i ω - m)
  have hY : ∀ i, MemLp (Y i) 2 μ := by
    intro i
    exact ((hX i).sub (memLp_const m)).const_mul σ⁻¹
  have hIndepY : ProbabilityTheory.iIndepFun Y μ := by
    have h := hIndep.comp
      (fun _ (x : ℝ) => σ⁻¹ * (x - m)) (fun _ => by fun_prop)
    simpa [Y, Function.comp_def] using h
  have hIdentY : ∀ i, ProbabilityTheory.IdentDistrib (Y i) (Y 0) μ μ := by
    intro i
    have h := (hIdent i).comp
      (by fun_prop : Measurable fun x : ℝ => σ⁻¹ * (x - m))
    simpa [Y, Function.comp_def] using h
  have hMeanY : ∫ ω, Y 0 ω ∂μ = 0 := by
    dsimp [Y]
    rw [integral_const_mul,
      integral_sub ((hX 0).integrable (by norm_num)) (integrable_const m), hMean]
    simp
  have hSecondY : ∫ ω, (Y 0 ω) ^ 2 ∂μ = 1 := by
    have hc : (∫ ω, (X 0 ω - m) ^ 2 ∂μ) = σ ^ 2 := by
      calc
        (∫ ω, (X 0 ω - m) ^ 2 ∂μ) =
            ProbabilityTheory.variance (X 0) μ := by
          rw [ProbabilityTheory.variance_eq_integral (hX 0).aemeasurable, hMean]
        _ = σ ^ 2 := hVariance
    dsimp [Y]
    calc
      (∫ ω, (σ⁻¹ * (X 0 ω - m)) ^ 2 ∂μ) =
          ∫ ω, σ⁻¹ ^ 2 * (X 0 ω - m) ^ 2 ∂μ := by
        congr 1
        funext ω
        ring
      _ = σ⁻¹ ^ 2 * ∫ ω, (X 0 ω - m) ^ 2 ∂μ :=
        integral_const_mul _ _
      _ = 1 := by
        rw [hc]
        field_simp [hσ.ne']
  have hEq (N : ℕ) :
      normalizedCenteredIidSum Y N = normalizedIidSum X m σ N := by
    funext ω
    simp only [normalizedCenteredIidSum, normalizedIidSum, Y]
    rw [← Finset.mul_sum Finset.univ
      (fun i : Fin (N + 1) => X i.1 ω - m) σ⁻¹]
    rw [← mul_assoc]
    apply congrArg
      (fun c : ℝ => c * ∑ i : Fin (N + 1), (X i.1 ω - m))
    rw [mul_inv_rev]
  have hclt := tendsto_probabilityLaw_normalizedCenteredIidSum
    Y hY hIndepY hIdentY hMeanY hSecondY
  apply hclt.congr'
  filter_upwards with n
  simp only [hEq n]

end NumStability.HDP.Scalar.LimitTheorems
```

### `NumStability.HDP.Scalar.Preliminaries`

Path: `lean-numerical-stability/NumStability/HDP/Scalar/Preliminaries.lean`
SHA-256: `c605609d5ad25240806484c73a9b7ed84030dbcd08d1feac1df55e10e804f248`

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

### `NumStability.HDP.Scalar.PoissonLimit`

Path: `lean-numerical-stability/NumStability/HDP/Scalar/PoissonLimit.lean`
SHA-256: `86003f8272bfa542955a54855b667ca2f11f6958da34280e4f17bcc1ec797dfa`

```lean
import NumStability.HDP.Scalar.CentralLimit
import NumStability.HDP.Scalar.Preliminaries
import Mathlib.Analysis.SpecialFunctions.Complex.LogBounds

/-!
# Poisson-limit foundations

Reusable deterministic estimates for triangular arrays of rare-event
parameters.  These isolate the first analytic reduction in the Poisson limit
theorem: the maximum-probability and total-mean hypotheses force the sum of
squared probabilities to vanish.
-/

noncomputable section

open Filter
open scoped Topology BigOperators NNReal

namespace NumStability.HDP.Scalar.LimitTheorems

/-- The characteristic function of the canonical real Bernoulli law. -/
theorem bernoulliRealPMF_charFun
    (p : ℝ≥0) (hp : p ≤ 1) (t : ℝ) :
    MeasureTheory.charFun (bernoulliRealPMF p hp).toMeasure t =
      1 + (p : ℂ) * (Complex.exp ((t : ℂ) * Complex.I) - 1) := by
  rw [MeasureTheory.charFun_apply_real, bernoulliRealPMF,
    ← PMF.toMeasure_map (cond · (1 : ℝ) 0) (PMF.bernoulli p hp) (by fun_prop)]
  rw [MeasureTheory.integral_map (measurable_of_countable _).aemeasurable (by fun_prop)]
  rw [PMF.integral_eq_sum]
  simp [PMF.bernoulli_apply, NNReal.coe_sub hp]
  have hmod :
      (instInnerProductSpaceRealComplex.toNormedSpace.toModule : Module ℝ ℂ) =
        Module.complexToReal ℂ := by
    apply Module.ext
    funext r z
    apply Complex.ext <;> rfl
  rw [hmod]
  rw [← Complex.coe_smul, ← Complex.coe_smul]
  simp [smul_eq_mul]
  ring

/-- The Poisson law, transported from the natural numbers to the real line. -/
noncomputable def poissonRealLaw (rate : ℝ≥0) : MeasureTheory.Measure ℝ :=
  (poissonLaw rate).map (fun k : ℕ => (k : ℝ))

instance poissonRealLaw.isProbabilityMeasure (rate : ℝ≥0) :
    MeasureTheory.IsProbabilityMeasure (poissonRealLaw rate) := by
  unfold poissonRealLaw
  exact MeasureTheory.Measure.isProbabilityMeasure_map
    (measurable_of_countable _).aemeasurable

/-- The real Poisson law bundled as a probability measure. -/
noncomputable def poissonRealProbabilityMeasure
    (rate : ℝ≥0) : MeasureTheory.ProbabilityMeasure ℝ :=
  ⟨poissonRealLaw rate, inferInstance⟩

/-- The characteristic function of the real Poisson law is
`exp (rate * (exp (t * I) - 1))`. -/
theorem poissonRealLaw_charFun (rate : ℝ≥0) (t : ℝ) :
    MeasureTheory.charFun (poissonRealLaw rate) t =
      Complex.exp ((rate : ℂ) * (Complex.exp ((t : ℂ) * Complex.I) - 1)) := by
  rw [MeasureTheory.charFun_apply_real, poissonRealLaw,
    MeasureTheory.integral_map (measurable_of_countable _).aemeasurable (by fun_prop)]
  rw [poissonLaw, ProbabilityTheory.poissonMeasure]
  have hInt :
      MeasureTheory.Integrable
        (fun k : ℕ => Complex.exp ((t : ℂ) * (k : ℝ) * Complex.I))
        (ProbabilityTheory.poissonPMF rate).toMeasure := by
    apply
      (MeasureTheory.integrable_const
        (μ := (ProbabilityTheory.poissonPMF rate).toMeasure) (1 : ℂ)).mono
    · fun_prop
    · filter_upwards
      intro k
      rw [Complex.norm_exp]
      simp [Complex.mul_re]
  rw [PMF.integral_eq_tsum _ _ hInt]
  have hmod :
      (instInnerProductSpaceRealComplex.toNormedSpace.toModule : Module ℝ ℂ) =
        Module.complexToReal ℂ := by
    apply Module.ext
    funext r z
    apply Complex.ext <;> rfl
  rw [hmod]
  simp_rw [← Complex.coe_smul, smul_eq_mul]
  have hpmf (a : ℕ) :
      ((ProbabilityTheory.poissonPMF rate) a).toReal =
        ProbabilityTheory.poissonPMFReal rate a := by
    rw [ProbabilityTheory.poissonPMF]
    exact ENNReal.toReal_ofReal ProbabilityTheory.poissonPMFReal_nonneg
  simp_rw [hpmf]
  have hterm (a : ℕ) :
      (ProbabilityTheory.poissonPMFReal rate a : ℂ) *
          Complex.exp ((t : ℂ) * (a : ℝ) * Complex.I) =
        Complex.exp (-(rate : ℂ)) *
          (((rate : ℂ) * Complex.exp ((t : ℂ) * Complex.I)) ^ a /
            (Nat.factorial a : ℂ)) := by
    rw [ProbabilityTheory.poissonPMFReal]
    push_cast
    have hexp :
        Complex.exp ((t : ℂ) * (a : ℂ) * Complex.I) =
          Complex.exp ((t : ℂ) * Complex.I) ^ a := by
      rw [← Complex.exp_nat_mul]
      congr 1
      ring

    rw [hexp, mul_pow]
    ring
  calc
    (∑' a : ℕ, (ProbabilityTheory.poissonPMFReal rate a : ℂ) *
        Complex.exp ((t : ℂ) * (a : ℝ) * Complex.I)) =
      ∑' a : ℕ, Complex.exp (-(rate : ℂ)) *
        (((rate : ℂ) * Complex.exp ((t : ℂ) * Complex.I)) ^ a /
          (Nat.factorial a : ℂ)) := tsum_congr hterm
    _ = Complex.exp (-(rate : ℂ)) *
        ∑' a : ℕ, (((rate : ℂ) * Complex.exp ((t : ℂ) * Complex.I)) ^ a /
          (Nat.factorial a : ℂ)) := tsum_mul_left
    _ = Complex.exp (-(rate : ℂ)) *
        Complex.exp ((rate : ℂ) * Complex.exp ((t : ℂ) * Complex.I)) := by
      congr 1
      exact
        (NormedSpace.expSeries_div_hasSum_exp
          ((rate : ℂ) * Complex.exp ((t : ℂ) * Complex.I))).tsum_eq.trans
          (congr_fun Complex.exp_eq_exp_ℂ
            ((rate : ℂ) * Complex.exp ((t : ℂ) * Complex.I))).symm
    _ = Complex.exp ((rate : ℂ) * (Complex.exp ((t : ℂ) * Complex.I) - 1)) := by
      rw [← Complex.exp_add]
      congr 1
      ring

/-! ## Heterogeneous Bernoulli rows -/

/-- The product weight of a Boolean realization of one heterogeneous
Bernoulli row. -/
private def poissonBernoulliRowWeight
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0) (N : ℕ)
    (f : Fin (N + 1) → Bool) : ENNReal :=
  ∏ i, if f i then (p N i : ENNReal)
    else ((1 : ENNReal) - (p N i : ENNReal))

theorem poissonBernoulliRowWeight_sum_eq_one
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0)
    (hp : ∀ N i, p N i ≤ 1) (N : ℕ) :
    (∑ f : Fin (N + 1) → Bool, poissonBernoulliRowWeight p N f) = 1 := by
  classical
  calc
    (∑ f : Fin (N + 1) → Bool, poissonBernoulliRowWeight p N f) =
        ∏ i : Fin (N + 1), ∑ b : Bool,
          (if b then (p N i : ENNReal)
            else ((1 : ENNReal) - (p N i : ENNReal))) := by
      exact (Fintype.prod_sum fun i (b : Bool) =>
        if b then (p N i : ENNReal)
        else ((1 : ENNReal) - (p N i : ENNReal))).symm
    _ = 1 := by
      apply Finset.prod_eq_one
      intro i hi
      have hsub : (p N i : ENNReal) +
          ((1 : ENNReal) - (p N i : ENNReal)) = 1 := by
        norm_cast
        exact add_tsub_cancel_of_le (hp N i)
      simp [hsub]

/-- The product probability mass function of one heterogeneous Bernoulli
row. -/
def poissonBernoulliRowVectorPMF
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0)
    (hp : ∀ N i, p N i ≤ 1) (N : ℕ) : PMF (Fin (N + 1) → Bool) :=
  PMF.ofFintype (poissonBernoulliRowWeight p N)
    (poissonBernoulliRowWeight_sum_eq_one p hp N)

/-- The real-valued number of successes in a Boolean Bernoulli row. -/
def poissonBernoulliRowCount
    (N : ℕ) (f : Fin (N + 1) → Bool) : ℝ :=
  ∑ i, if f i then 1 else 0

/-- The law of the sum of a heterogeneous row of independent Bernoulli
variables. -/
def poissonBernoulliRowPMF
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0)
    (hp : ∀ N i, p N i ≤ 1) (N : ℕ) : PMF ℝ :=
  (poissonBernoulliRowVectorPMF p hp N).map
    (poissonBernoulliRowCount N)

/-- A canonical heterogeneous Bernoulli row-sum law bundled as a probability
measure. -/
noncomputable def poissonBernoulliRowProbabilityMeasure
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0)
    (hp : ∀ N i, p N i ≤ 1) (N : ℕ) :
    MeasureTheory.ProbabilityMeasure ℝ :=
  ⟨(poissonBernoulliRowPMF p hp N).toMeasure, inferInstance⟩

/-- The mean of one coordinate of the canonical heterogeneous Bernoulli row
is its success parameter. -/
theorem poissonBernoulliRow_coordinate_mean
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0)
    (hp : ∀ N i, p N i ≤ 1) (N : ℕ) (i : Fin (N + 1)) :
    ∫ f, (if f i then 1 else 0 : ℝ)
      ∂(poissonBernoulliRowVectorPMF p hp N).toMeasure = (p N i : ℝ) := by
  classical
  let q : Fin (N + 1) → Bool → ℝ := fun j b =>
    if b then (p N j : ℝ) else 1 - (p N j : ℝ)
  have hw (f : Fin (N + 1) → Bool) :
      ((poissonBernoulliRowVectorPMF p hp N) f).toReal =
        ∏ j, q j (f j) := by
    rw [poissonBernoulliRowVectorPMF, PMF.ofFintype_apply,
      poissonBernoulliRowWeight, ENNReal.toReal_prod]
    apply Finset.prod_congr rfl
    intro j hj
    by_cases hfj : f j
    · simp [q, hfj]
    · simp [q, hfj]
      rw [ENNReal.toReal_sub_of_le]
      · simp
      · exact_mod_cast hp N j
      · simp
  rw [PMF.integral_eq_sum]
  simp_rw [hw]
  simp only [smul_eq_mul]
  let r : Fin (N + 1) → Bool → ℝ := fun j b =>
    if j = i then q j b * (if b then 1 else 0) else q j b
  have hterm (f : Fin (N + 1) → Bool) :
      (∏ j, q j (f j)) * (if f i then 1 else 0) =
        ∏ j, r j (f j) := by
    by_cases hfi : f i
    · rw [if_pos hfi, mul_one]
      apply Finset.prod_congr rfl
      intro j hj
      by_cases hji : j = i
      · subst j
        simp [r, hfi]
      · simp [r, hji]
    · rw [if_neg hfi, mul_zero]
      symm
      apply Finset.prod_eq_zero (Finset.mem_univ i)
      simp [r, hfi]
  calc
    (∑ f : Fin (N + 1) → Bool,
        (∏ j, q j (f j)) * (if f i then 1 else 0)) =
        ∑ f : Fin (N + 1) → Bool, ∏ j, r j (f j) := by
          exact Finset.sum_congr rfl fun f _ => hterm f
    _ = ∏ j : Fin (N + 1), ∑ b : Bool, r j b :=
      (Fintype.prod_sum r).symm
    _ = p N i := by
      have hq (j : Fin (N + 1)) : q j true + q j false = 1 := by
        simp [q]
      calc
        (∏ j : Fin (N + 1), ∑ b : Bool, r j b) =
            ∑ b : Bool, r i b := by
          exact Finset.prod_eq_single i
            (fun j _ hji => by
              rw [Fintype.sum_bool]
              simp [r, hji, hq]) (by simp)
        _ = p N i := by
          rw [Fintype.sum_bool]
          simp [r, q]

/-- The characteristic function of the heterogeneous Bernoulli row sum is
the product of its Bernoulli characteristic-function factors. -/
theorem poissonBernoulliRowPMF_charFun
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0)
    (hp : ∀ N i, p N i ≤ 1) (N : ℕ) (t : ℝ) :
    MeasureTheory.charFun (poissonBernoulliRowPMF p hp N).toMeasure t =
      ∏ i : Fin (N + 1), (1 + (p N i : ℂ) *
        (Complex.exp ((t : ℂ) * Complex.I) - 1)) := by
  classical
  rw [MeasureTheory.charFun_apply_real, poissonBernoulliRowPMF,
    ← PMF.toMeasure_map (poissonBernoulliRowCount N)
      (poissonBernoulliRowVectorPMF p hp N) (measurable_of_countable _)]
  rw [MeasureTheory.integral_map (measurable_of_countable _).aemeasurable
    (by fun_prop)]
  rw [PMF.integral_eq_sum]
  have hterm (f : Fin (N + 1) → Bool) :
      ((poissonBernoulliRowVectorPMF p hp N) f).toReal •
          Complex.exp ((t : ℂ) * (poissonBernoulliRowCount N f : ℂ) *
            Complex.I) =
        ∏ i : Fin (N + 1),
          ((((if f i then (p N i : ENNReal)
              else ((1 : ENNReal) - (p N i : ENNReal))).toReal : ℂ) *
            Complex.exp ((t : ℂ) *
              ((if f i then 1 else 0 : ℝ) : ℂ) * Complex.I))) := by
    rw [poissonBernoulliRowVectorPMF, PMF.ofFintype_apply]
    have hw : (poissonBernoulliRowWeight p N f).toReal =
        ∏ i : Fin (N + 1),
          ((if f i then (p N i : ENNReal)
            else ((1 : ENNReal) - (p N i : ENNReal))).toReal) :=
      ENNReal.toReal_prod
    rw [hw]
    have hexp :
        Complex.exp ((t : ℂ) * (poissonBernoulliRowCount N f : ℂ) *
          Complex.I) =
          ∏ i : Fin (N + 1),
            (Complex.exp ((t : ℂ) *
              ((if f i then 1 else 0 : ℝ) : ℂ) * Complex.I)) := by
      rw [show (t : ℂ) * (poissonBernoulliRowCount N f : ℂ) * Complex.I =
          ∑ i : Fin (N + 1),
            ((t : ℂ) * ((if f i then 1 else 0 : ℝ) : ℂ) * Complex.I) by
        unfold poissonBernoulliRowCount
        push_cast
        rw [Finset.mul_sum, Finset.sum_mul]]
      exact Complex.exp_sum _ _
    rw [hexp]
    simp only [Complex.real_smul]
    push_cast
    rw [Finset.prod_mul_distrib]
  calc
    (∑ a : Fin (N + 1) → Bool,
        ((poissonBernoulliRowVectorPMF p hp N) a).toReal •
          Complex.exp ((t : ℂ) *
            (poissonBernoulliRowCount N a : ℂ) * Complex.I)) =
        ∑ f : Fin (N + 1) → Bool, ∏ i : Fin (N + 1),
          ((((if f i then (p N i : ENNReal)
              else ((1 : ENNReal) - (p N i : ENNReal))).toReal : ℂ) *
            Complex.exp ((t : ℂ) *
              ((if f i then 1 else 0 : ℝ) : ℂ) * Complex.I))) := by
          exact Finset.sum_congr rfl fun f _ => hterm f
    _ = ∏ i : Fin (N + 1), ∑ b : Bool,
          ((((if b then (p N i : ENNReal)
              else ((1 : ENNReal) - (p N i : ENNReal))).toReal : ℂ) *
            Complex.exp ((t : ℂ) *
              ((if b then 1 else 0 : ℝ) : ℂ) * Complex.I))) := by
      exact (Fintype.prod_sum fun i (b : Bool) =>
        (((if b then (p N i : ENNReal)
          else ((1 : ENNReal) - (p N i : ENNReal))).toReal : ℂ) *
        Complex.exp ((t : ℂ) *
          ((if b then 1 else 0 : ℝ) : ℂ) * Complex.I))).symm
    _ = ∏ i : Fin (N + 1), (1 + (p N i : ℂ) *
          (Complex.exp ((t : ℂ) * Complex.I) - 1)) := by
      apply Finset.prod_congr rfl
      intro i hi
      have hsub : ((1 : ENNReal) - (p N i : ENNReal)).toReal =
          1 - (p N i : ℝ) := by
        rw [ENNReal.toReal_sub_of_le]
        · simp
        · exact_mod_cast hp N i
        · simp
      rw [Fintype.sum_bool]
      simp [hsub]
      ring

/-- Uniformly integrable nonnegative laws with bounded first moments form a
tight sequence. -/
theorem isTight_probabilityMeasure_range_of_nonneg_expectation_le
    (P : ℕ → MeasureTheory.ProbabilityMeasure ℝ)
    (hInt : ∀ n, MeasureTheory.Integrable (fun x : ℝ => x)
      (P n : MeasureTheory.Measure ℝ))
    (hNonneg : ∀ n,
      0 ≤ᵐ[(P n : MeasureTheory.Measure ℝ)] (fun x : ℝ => x))
    (C : ℝ) (hC : 0 ≤ C)
    (hMean : ∀ n, ∫ x : ℝ, x ∂(P n : MeasureTheory.Measure ℝ) ≤ C) :
    MeasureTheory.IsTightMeasureSet
      {((q : MeasureTheory.ProbabilityMeasure ℝ) : MeasureTheory.Measure ℝ) |
        q ∈ Set.range P} := by
  rw [MeasureTheory.isTightMeasureSet_iff_exists_isCompact_measure_compl_le]
  intro ε hε
  obtain ⟨n, hn⟩ := ENNReal.exists_inv_nat_lt hε.ne'
  have hn0 : n ≠ 0 := by
    intro hnz
    subst n
    simp at hn
  have hnR : (0 : ℝ) < n := by
    exact_mod_cast Nat.pos_of_ne_zero hn0
  have hnE0 : (n : ENNReal) ≠ 0 := by
    exact_mod_cast hn0
  have hnET : (n : ENNReal) ≠ ⊤ := by simp
  have hCp : 0 < C + 1 := by linarith
  let R : ℝ := (n : ℝ) * (C + 1)
  have hR : 0 < R := mul_pos hnR hCp
  refine ⟨Set.Icc (-R) R, isCompact_Icc, ?_⟩
  intro ν hν
  rcases hν with ⟨q, ⟨k, rfl⟩, rfl⟩
  have hmono : (P k : MeasureTheory.Measure ℝ) (Set.Icc (-R) R)ᶜ ≤
      (P k : MeasureTheory.Measure ℝ)
        ((fun x : ℝ => x) ⁻¹' Set.Ici R) := by
    apply MeasureTheory.measure_mono_ae
    filter_upwards [hNonneg k] with x hx
    change (0 : ℝ) ≤ x at hx
    intro hxc
    change R ≤ x
    by_contra hnot
    apply hxc
    exact ⟨by linarith, by linarith⟩
  refine hmono.trans ?_
  have hmarkov :=
    NumStability.HDP.Scalar.Preliminaries.markovInequalityExtended
      (μ := (P k : MeasureTheory.Measure ℝ)) (X := fun x : ℝ => x)
      measurable_id (hNonneg k) hR
  refine hmarkov.trans ?_
  have hlin :
      (∫⁻ x : ℝ, ENNReal.ofReal x ∂(P k : MeasureTheory.Measure ℝ)) =
        ENNReal.ofReal
          (∫ x : ℝ, x ∂(P k : MeasureTheory.Measure ℝ)) := by
    exact (MeasureTheory.ofReal_integral_eq_lintegral_ofReal
      (hInt k) (hNonneg k)).symm
  rw [hlin]
  calc
    ENNReal.ofReal (∫ x : ℝ, x ∂(P k : MeasureTheory.Measure ℝ)) /
          ENNReal.ofReal R ≤ ENNReal.ofReal C / ENNReal.ofReal R := by
      gcongr
      exact hMean k
    _ ≤ (n : ENNReal)⁻¹ := by
      rw [show ENNReal.ofReal R =
          (n : ENNReal) * ENNReal.ofReal (C + 1) by
        simp [R, ENNReal.ofReal_mul hnR.le]]
      rw [ENNReal.div_eq_inv_mul,
        ENNReal.mul_inv (Or.inl hnE0) (Or.inl hnET)]
      calc
        (n : ENNReal)⁻¹ * (ENNReal.ofReal (C + 1))⁻¹ *
            ENNReal.ofReal C =
          (n : ENNReal)⁻¹ *
            ((ENNReal.ofReal (C + 1))⁻¹ * ENNReal.ofReal C) := by ac_rfl
        _ ≤ (n : ENNReal)⁻¹ * 1 := by
          gcongr
          exact (mul_le_mul_left'
            (ENNReal.ofReal_le_ofReal (by linarith : C ≤ C + 1))
            (ENNReal.ofReal (C + 1))⁻¹).trans
              (ENNReal.inv_mul_le_one (ENNReal.ofReal (C + 1)))
        _ = (n : ENNReal)⁻¹ := mul_one _
    _ ≤ ε := hn.le

/-- The largest rare-event probability in row `N`, using `N + 1` entries so
the row is nonempty at every natural index. -/
def poissonRowMax
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0) (N : ℕ) : ℝ≥0 :=
  Finset.univ.sup (p N)

/-- The total mean of a row of Bernoulli parameters. -/
def poissonRowSum
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0) (N : ℕ) : ℝ :=
  ∑ i, (p N i : ℝ)

/-- The identity is integrable under every canonical Bernoulli row-sum law. -/
theorem integrable_id_poissonBernoulliRowPMF
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0)
    (hp : ∀ N i, p N i ≤ 1) (N : ℕ) :
    MeasureTheory.Integrable (fun x : ℝ => x)
      (poissonBernoulliRowPMF p hp N).toMeasure := by
  rw [poissonBernoulliRowPMF,
    ← PMF.toMeasure_map (poissonBernoulliRowCount N)
      (poissonBernoulliRowVectorPMF p hp N) (measurable_of_countable _)]
  have hcount : AEMeasurable (poissonBernoulliRowCount N)
      (poissonBernoulliRowVectorPMF p hp N).toMeasure :=
    (show Measurable (poissonBernoulliRowCount N) from
      measurable_of_countable _).aemeasurable
  refine (MeasureTheory.integrable_map_measure
    (f := poissonBernoulliRowCount N) (g := fun x : ℝ => x)
    continuous_id.aestronglyMeasurable hcount).2 ?_
  change MeasureTheory.Integrable (poissonBernoulliRowCount N)
    (poissonBernoulliRowVectorPMF p hp N).toMeasure
  rw [← MeasureTheory.integrableOn_univ]
  exact MeasureTheory.IntegrableOn.of_finite Set.finite_univ

/-- Every canonical Bernoulli row-sum law is supported on the nonnegative
real line. -/
theorem ae_nonneg_poissonBernoulliRowPMF
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0)
    (hp : ∀ N i, p N i ≤ 1) (N : ℕ) :
    0 ≤ᵐ[(poissonBernoulliRowPMF p hp N).toMeasure]
      (fun x : ℝ => x) := by
  rw [poissonBernoulliRowPMF,
    ← PMF.toMeasure_map (poissonBernoulliRowCount N)
      (poissonBernoulliRowVectorPMF p hp N) (measurable_of_countable _)]
  have hcount : AEMeasurable (poissonBernoulliRowCount N)
      (poissonBernoulliRowVectorPMF p hp N).toMeasure :=
    (show Measurable (poissonBernoulliRowCount N) from
      measurable_of_countable _).aemeasurable
  apply (MeasureTheory.ae_map_iff hcount measurableSet_Ici).2
  filter_upwards with f
  change 0 ≤ poissonBernoulliRowCount N f
  exact Finset.sum_nonneg fun _ _ => by positivity

/-- The mean of a canonical heterogeneous Bernoulli row sum is the sum of
its success parameters. -/
theorem poissonBernoulliRowPMF_mean
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0)
    (hp : ∀ N i, p N i ≤ 1) (N : ℕ) :
    ∫ x : ℝ, x ∂(poissonBernoulliRowPMF p hp N).toMeasure =
      poissonRowSum p N := by
  rw [poissonBernoulliRowPMF,
    ← PMF.toMeasure_map (poissonBernoulliRowCount N)
      (poissonBernoulliRowVectorPMF p hp N) (measurable_of_countable _)]
  have hiMap := MeasureTheory.integral_map
    (μ := (poissonBernoulliRowVectorPMF p hp N).toMeasure)
    (φ := poissonBernoulliRowCount N) (f := fun x : ℝ => x)
    (measurable_of_countable _).aemeasurable
    continuous_id.aestronglyMeasurable
  rw [hiMap]
  unfold poissonBernoulliRowCount poissonRowSum
  rw [MeasureTheory.integral_finset_sum Finset.univ]
  · exact Finset.sum_congr rfl fun i _ =>
      poissonBernoulliRow_coordinate_mean p hp N i
  · intro i hi
    rw [← MeasureTheory.integrableOn_univ]
    exact MeasureTheory.IntegrableOn.of_finite Set.finite_univ

/-- The sum of squared probabilities in a row. -/
def poissonRowSqSum
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0) (N : ℕ) : ℝ :=
  ∑ i, (p N i : ℝ) ^ 2

/-- The elementary estimate `Σ pᵢ² ≤ (max pᵢ) Σ pᵢ`. -/
theorem poissonRowSqSum_le_max_mul_sum
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0) (N : ℕ) :
    poissonRowSqSum p N ≤ (poissonRowMax p N : ℝ) * poissonRowSum p N := by
  unfold poissonRowSqSum poissonRowMax poissonRowSum
  rw [Finset.mul_sum]
  apply Finset.sum_le_sum
  intro i hi
  rw [pow_two]
  apply mul_le_mul_of_nonneg_right _ (NNReal.coe_nonneg _)
  exact_mod_cast (Finset.le_sup (f := p N) (Finset.mem_univ i))

/-- If the maximum row probability tends to zero while the row sums converge
to a finite limit, then the sum of squared row probabilities tends to zero. -/
theorem tendsto_poissonRowSqSum_zero
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0) (rate : ℝ)
    (hmax : Tendsto (fun N => (poissonRowMax p N : ℝ)) atTop (𝓝 0))
    (hsum : Tendsto (poissonRowSum p) atTop (𝓝 rate)) :
    Tendsto (poissonRowSqSum p) atTop (𝓝 0) := by
  apply squeeze_zero
  · intro N
    exact Finset.sum_nonneg fun _ _ => sq_nonneg _
  · exact poissonRowSqSum_le_max_mul_sum p
  · simpa using hmax.mul hsum

/-- A convenient quadratic form of the complex logarithm remainder estimate on
the closed half ball. -/
theorem norm_log_one_add_sub_self_le_sq
    {z : ℂ} (hz : ‖z‖ ≤ (1 : ℝ) / 2) :
    ‖Complex.log (1 + z) - z‖ ≤ ‖z‖ ^ 2 := by
  have hzlt : ‖z‖ < (1 : ℝ) := lt_of_le_of_lt hz (by norm_num)
  refine (Complex.norm_log_one_add_sub_self_le hzlt).trans ?_
  have hden : (1 - ‖z‖)⁻¹ ≤ (2 : ℝ) := by
    rw [inv_le_comm₀ (sub_pos.mpr hzlt) (by norm_num)]
    linarith
  calc
    ‖z‖ ^ 2 * (1 - ‖z‖)⁻¹ / 2
        ≤ ‖z‖ ^ 2 * 2 / 2 := by gcongr
    _ = ‖z‖ ^ 2 := by ring

/-- The accumulated logarithm remainder for finitely many rare-event
probabilities is controlled by their squared sum. -/
theorem norm_sum_log_one_add_sub_le
    {ι : Type*} [Fintype ι] (q : ι → ℝ≥0) (z : ℂ)
    (hsmall : ∀ i, ‖(q i : ℂ) * z‖ ≤ (1 : ℝ) / 2) :
    ‖∑ i, (Complex.log (1 + (q i : ℂ) * z) - (q i : ℂ) * z)‖
      ≤ ‖z‖ ^ 2 * ∑ i, (q i : ℝ) ^ 2 := by
  calc
    ‖∑ i, (Complex.log (1 + (q i : ℂ) * z) - (q i : ℂ) * z)‖
        ≤ ∑ i, ‖Complex.log (1 + (q i : ℂ) * z) - (q i : ℂ) * z‖ :=
      norm_sum_le _ _
    _ ≤ ∑ i, ‖(q i : ℂ) * z‖ ^ 2 := by
      apply Finset.sum_le_sum
      intro i hi
      exact norm_log_one_add_sub_self_le_sq (hsmall i)
    _ = ‖z‖ ^ 2 * ∑ i, (q i : ℝ) ^ 2 := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro i hi
      have hqnorm : ‖(q i : ℂ)‖ = (q i : ℝ) := by
        exact Complex.norm_of_nonneg (NNReal.coe_nonneg _)
      rw [norm_mul, hqnorm, mul_pow]
      ring

/-- The logarithm remainder after subtracting the linearized rare-event
contribution in a triangular-array row. -/
def poissonLogRemainder
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0) (z : ℂ) (N : ℕ) : ℂ :=
  (∑ i, Complex.log (1 + (p N i : ℂ) * z)) -
    (poissonRowSum p N : ℂ) * z

theorem norm_poissonLogRemainder_le
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0) (z : ℂ) (N : ℕ)
    (hsmall : ∀ i, ‖(p N i : ℂ) * z‖ ≤ (1 : ℝ) / 2) :
    ‖poissonLogRemainder p z N‖ ≤ ‖z‖ ^ 2 * poissonRowSqSum p N := by
  unfold poissonLogRemainder poissonRowSum poissonRowSqSum
  have hlinear :
      ((∑ i, (p N i : ℝ) : ℝ) : ℂ) * z = ∑ i, (p N i : ℂ) * z := by
    push_cast
    rw [Finset.sum_mul]
  rw [hlinear, ← Finset.sum_sub_distrib]
  exact norm_sum_log_one_add_sub_le (p N) z hsmall

/-- Vanishing squared probabilities make the accumulated logarithm remainder
vanish, once every row factor is eventually in the logarithm's half ball. -/
theorem tendsto_poissonLogRemainder_zero
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0) (z : ℂ)
    (hsq : Tendsto (poissonRowSqSum p) atTop (𝓝 0))
    (hsmall : ∀ᶠ N in atTop, ∀ i, ‖(p N i : ℂ) * z‖ ≤ (1 : ℝ) / 2) :
    Tendsto (poissonLogRemainder p z) atTop (𝓝 0) := by
  apply squeeze_zero_norm'
  · filter_upwards [hsmall] with N hN
    exact norm_poissonLogRemainder_le p z N hN
  · simpa using (tendsto_const_nhds.mul hsq)

theorem eventually_norm_poissonFactor_le_half
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0) (z : ℂ)
    (hmax : Tendsto (fun N => (poissonRowMax p N : ℝ)) atTop (𝓝 0)) :
    ∀ᶠ N in atTop, ∀ i, ‖(p N i : ℂ) * z‖ ≤ (1 : ℝ) / 2 := by
  have hbound :
      ∀ᶠ N in atTop,
        (poissonRowMax p N : ℝ) * ‖z‖ ≤ (1 : ℝ) / 2 :=
    (hmax.mul_const ‖z‖).eventually_le_const (by norm_num)
  filter_upwards [hbound] with N hN
  intro i
  have hpmax : (p N i : ℝ) ≤ (poissonRowMax p N : ℝ) := by
    exact_mod_cast (Finset.le_sup (f := p N) (Finset.mem_univ i))
  have hqnorm : ‖(p N i : ℂ)‖ = (p N i : ℝ) :=
    Complex.norm_of_nonneg (NNReal.coe_nonneg _)
  rw [norm_mul, hqnorm]
  exact (mul_le_mul_of_nonneg_right hpmax (norm_nonneg z)).trans hN

theorem tendsto_poissonLogRemainder_zero_of_row_limits
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0) (z : ℂ) (rate : ℝ)
    (hmax : Tendsto (fun N => (poissonRowMax p N : ℝ)) atTop (𝓝 0))
    (hsum : Tendsto (poissonRowSum p) atTop (𝓝 rate)) :
    Tendsto (poissonLogRemainder p z) atTop (𝓝 0) := by
  exact tendsto_poissonLogRemainder_zero p z
    (tendsto_poissonRowSqSum_zero p rate hmax hsum)
    (eventually_norm_poissonFactor_le_half p z hmax)

/-- The sum of logarithms of the Bernoulli characteristic-function factors. -/
def poissonLogSum
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0) (z : ℂ) (N : ℕ) : ℂ :=
  ∑ i, Complex.log (1 + (p N i : ℂ) * z)

/-- The rowwise logarithms converge to the linear Poisson exponent. -/
theorem tendsto_poissonLogSum
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0) (z : ℂ) (rate : ℝ)
    (hmax : Tendsto (fun N => (poissonRowMax p N : ℝ)) atTop (𝓝 0))
    (hsum : Tendsto (poissonRowSum p) atTop (𝓝 rate)) :
    Tendsto (poissonLogSum p z) atTop (𝓝 ((rate : ℂ) * z)) := by
  have hrem := tendsto_poissonLogRemainder_zero_of_row_limits p z rate hmax hsum
  have hlin :
      Tendsto (fun N => (poissonRowSum p N : ℂ) * z) atTop
        (𝓝 ((rate : ℂ) * z)) :=
    hsum.ofReal.mul_const z
  convert hrem.add hlin using 1
  · funext N
    simp only [poissonLogRemainder, poissonLogSum]
    ring
  · ring

/-- The product of the rowwise Bernoulli characteristic-function factors. -/
def poissonFactorProduct
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0) (z : ℂ) (N : ℕ) : ℂ :=
  ∏ i, (1 + (p N i : ℂ) * z)

theorem poissonFactorProduct_eq_exp_logSum
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0) (z : ℂ) (N : ℕ)
    (hsmall : ∀ i, ‖(p N i : ℂ) * z‖ ≤ (1 : ℝ) / 2) :
    poissonFactorProduct p z N = Complex.exp (poissonLogSum p z N) := by
  unfold poissonFactorProduct poissonLogSum
  calc
    (∏ i, (1 + (p N i : ℂ) * z))
        = ∏ i, Complex.exp (Complex.log (1 + (p N i : ℂ) * z)) := by
      apply Finset.prod_congr rfl
      intro i hi
      symm
      apply Complex.exp_log
      intro hzero
      have ha : (p N i : ℂ) * z = -1 := by
        calc
          (p N i : ℂ) * z = (1 + (p N i : ℂ) * z) - 1 := by ring
          _ = -1 := by rw [hzero]; ring
      have hnorm : ‖(p N i : ℂ) * z‖ = (1 : ℝ) := by rw [ha]; simp
      linarith [hsmall i]
    _ = Complex.exp (∑ i, Complex.log (1 + (p N i : ℂ) * z)) := by
      simpa using
        (Complex.exp_sum (Finset.univ : Finset (Fin (N + 1)))
          (fun i => Complex.log (1 + (p N i : ℂ) * z))).symm

/-- The Bernoulli factor products converge to the exponential of the Poisson
linear exponent under the two source row-limit assumptions. -/
theorem tendsto_poissonFactorProduct
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0) (z : ℂ) (rate : ℝ)
    (hmax : Tendsto (fun N => (poissonRowMax p N : ℝ)) atTop (𝓝 0))
    (hsum : Tendsto (poissonRowSum p) atTop (𝓝 rate)) :
    Tendsto (poissonFactorProduct p z) atTop
      (𝓝 (Complex.exp ((rate : ℂ) * z))) := by
  have hlog := tendsto_poissonLogSum p z rate hmax hsum
  have hexp := (Complex.continuous_exp.tendsto ((rate : ℂ) * z)).comp hlog
  apply hexp.congr'
  filter_upwards [eventually_norm_poissonFactor_le_half p z hmax] with N hN
  exact (poissonFactorProduct_eq_exp_logSum p z N hN).symm

/-- **Poisson limit theorem.** If the largest success probability in each
heterogeneous Bernoulli row tends to zero and the total row mean tends to a
finite nonnegative rate, then the row-sum laws converge weakly to the Poisson
law with that rate. -/
theorem tendsto_poissonBernoulliRowProbabilityMeasure
    (p : (N : ℕ) → Fin (N + 1) → ℝ≥0)
    (hp : ∀ N i, p N i ≤ 1) (rate : ℝ≥0)
    (hmax : Tendsto (fun N => (poissonRowMax p N : ℝ)) atTop (𝓝 0))
    (hsum : Tendsto (poissonRowSum p) atTop (𝓝 (rate : ℝ))) :
    Tendsto (poissonBernoulliRowProbabilityMeasure p hp) atTop
      (𝓝 (poissonRealProbabilityMeasure rate)) := by
  let P : ℕ → MeasureTheory.ProbabilityMeasure ℝ :=
    poissonBernoulliRowProbabilityMeasure p hp
  let Q : MeasureTheory.ProbabilityMeasure ℝ :=
    poissonRealProbabilityMeasure rate
  change Tendsto P atTop (𝓝 Q)
  apply tendsto_probabilityMeasure_of_charFun_tendsto_of_tight P Q
  · rcases hsum.bddAbove_range with ⟨C, hC⟩
    have hbound : ∀ N, poissonRowSum p N ≤ C :=
      fun N => hC ⟨N, rfl⟩
    have hC0 : 0 ≤ C :=
      (Finset.sum_nonneg fun _ _ => NNReal.coe_nonneg (p 0 _)).trans
        (hbound 0)
    apply isTight_probabilityMeasure_range_of_nonneg_expectation_le P
      (fun N => integrable_id_poissonBernoulliRowPMF p hp N)
      (fun N => ae_nonneg_poissonBernoulliRowPMF p hp N) C hC0
    intro N
    rw [show (P N : MeasureTheory.Measure ℝ) =
        (poissonBernoulliRowPMF p hp N).toMeasure by rfl,
      poissonBernoulliRowPMF_mean]
    exact hbound N
  · intro t
    have hlim := tendsto_poissonFactorProduct p
      (Complex.exp ((t : ℂ) * Complex.I) - 1) (rate : ℝ) hmax hsum
    change Tendsto
      (fun N => MeasureTheory.charFun
        (poissonBernoulliRowPMF p hp N).toMeasure t)
      atTop (𝓝 (MeasureTheory.charFun (poissonRealLaw rate) t))
    rw [poissonRealLaw_charFun]
    apply hlim.congr'
    filter_upwards with N
    exact (poissonBernoulliRowPMF_charFun p hp N t).symm

end NumStability.HDP.Scalar.LimitTheorems
```
