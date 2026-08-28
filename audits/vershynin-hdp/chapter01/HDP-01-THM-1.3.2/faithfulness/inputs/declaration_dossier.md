# Declaration dossier for HDP-01-THM-1.3.2

This dossier describes the theorem statement only. Its proof is excluded.
Interpret every dependency from its supplied declaration; names are not definitions.

## Proof-free source declaration

```lean
theorem hdp_01_hthm_h1_d3_d2
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ]
    (X : ℕ → Ω → ℝ) (m σ : ℝ) (hσ : 0 < σ)
    (hX : ∀ i, MemLp (X i) 2 μ)
    (hIndep : iIndepFun X μ)
    (hIdent : ∀ i, IdentDistrib (X i) (X 0) μ μ)
    (hMean : ∫ ω, X 0 ω ∂μ = m)
    (hVariance : Var[X 0; μ] = σ ^ 2) :
    hdp_01_hdef_hconvergence_hin_hdistribution_normalized_sum_pointwise_cdf
      μ X m σ hσ hX hIndep hIdent hMean hVariance
```

## Elaborated target type

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω)
  [inst_1 : MeasureTheory.IsProbabilityMeasure μ] (X : Nat → Ω → Real) (m σ : Real) (hσ : Real.instLT.lt 0 σ)
  (hX : ∀ (i : Nat), MeasureTheory.MemLp (X i) 2 μ) (hIndep : ProbabilityTheory.iIndepFun X μ)
  (hIdent : ∀ (i : Nat), ProbabilityTheory.IdentDistrib (X i) (X 0) μ μ)
  (hMean : Eq (MeasureTheory.integral μ fun ω => X 0 ω) m)
  (hVariance : Eq (ProbabilityTheory.variance (X 0) μ) (instHPow.hPow σ 2)),
  NumStability.HDP.Contract.hdp_01_hdef_hconvergence_hin_hdistribution_normalized_sum_pointwise_cdf μ X m σ hσ hX hIndep
    hIdent hMean hVariance
```

## Fully explicit elaborated target type

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace.{u_1} Ω] (μ : @MeasureTheory.Measure.{u_1} Ω inst)
  [inst_1 : @MeasureTheory.IsProbabilityMeasure.{u_1} Ω inst μ] (X : Nat → Ω → Real) (m σ : Real)
  (hσ : @LT.lt.{0} Real Real.instLT (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero)) σ)
  (hX :
    ∀ (i : Nat),
      @MeasureTheory.MemLp.{u_1, 0} Ω Real inst
        (@ContinuousENorm.toENorm.{0} Real
          (@UniformSpace.toTopologicalSpace.{0} Real
            (@PseudoMetricSpace.toUniformSpace.{0} Real
              (@SeminormedAddGroup.toPseudoMetricSpace.{0} Real
                (@SeminormedAddCommGroup.toSeminormedAddGroup.{0} Real
                  (@NonUnitalSeminormedRing.toSeminormedAddCommGroup.{0} Real
                    (@NonUnitalSeminormedCommRing.toNonUnitalSeminormedRing.{0} Real
                      (@SeminormedCommRing.toNonUnitalSeminormedCommRing.{0} Real
                        (@NormedCommRing.toSeminormedCommRing.{0} Real Real.normedCommRing))))))))
          (@SeminormedAddGroup.toContinuousENorm.{0} Real
            (@SeminormedAddCommGroup.toSeminormedAddGroup.{0} Real
              (@NonUnitalSeminormedRing.toSeminormedAddCommGroup.{0} Real
                (@NonUnitalSeminormedCommRing.toNonUnitalSeminormedRing.{0} Real
                  (@SeminormedCommRing.toNonUnitalSeminormedCommRing.{0} Real
                    (@NormedCommRing.toSeminormedCommRing.{0} Real Real.normedCommRing)))))))
        (@UniformSpace.toTopologicalSpace.{0} Real (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace))
        (X i)
        (@OfNat.ofNat.{0} ENNReal (nat_lit 2)
          (@instOfNatAtLeastTwo.{0} ENNReal (nat_lit 2)
            (@AddMonoidWithOne.toNatCast.{0} ENNReal
              (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))
            (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
              (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))
        μ)
  (hIndep :
    @ProbabilityTheory.iIndepFun.{u_1, 0, 0} Ω Nat inst (fun (x : Nat) => Real) (fun (x : Nat) => Real.measurableSpace)
      X μ)
  (hIdent :
    ∀ (i : Nat),
      @ProbabilityTheory.IdentDistrib.{u_1, u_1, 0} Ω Ω Real inst inst Real.measurableSpace (X i)
        (X (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))) μ μ)
  (hMean :
    @Eq.{1} Real
      (@MeasureTheory.integral.{u_1, 0} Ω Real Real.normedAddCommGroup
        (@InnerProductSpace.toNormedSpace.{0, 0} Real Real Real.instRCLike
          (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup)
          (@RCLike.toInnerProductSpaceReal.{0} Real Real.instRCLike))
        inst μ fun (ω : Ω) => X (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))) ω)
      m)
  (hVariance :
    @Eq.{1} Real
      (@ProbabilityTheory.variance.{u_1} Ω inst (X (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))) μ)
      (@HPow.hPow.{0, 0, 0} Real Nat Real (@instHPow.{0, 0} Real Nat (@Monoid.toNatPow.{0} Real Real.instMonoid)) σ
        (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))))),
  @NumStability.HDP.Contract.hdp_01_hdef_hconvergence_hin_hdistribution_normalized_sum_pointwise_cdf.{u_1} Ω inst μ
    inst_1 X m σ hσ hX hIndep hIdent hMean hVariance
```

## Local import graph

- `AuditTarget` imports: `NumStability.HDP.Scalar.CentralLimit`, `NumStability.HDP.Contracts.C_01_hdef_hconvergence_hin_hdistribution`
- `NumStability.HDP.Scalar.LimitTheorems` imports: `Mathlib.Probability.ProbabilityMassFunction.Binomial`, `Mathlib.Probability.ProbabilityMassFunction.Integrals`, `Mathlib.Probability.Distributions.Gaussian.Real`, `Mathlib.Probability.Distributions.Poisson`, `Mathlib.MeasureTheory.Function.ConvergenceInDistribution`, `Mathlib.Probability.StrongLaw`, `Mathlib.Tactic`
- `NumStability.HDP.Scalar.CentralLimit` imports: `NumStability.HDP.Scalar.LimitTheorems`, `Mathlib.Analysis.Calculus.Taylor`, `Mathlib.MeasureTheory.Measure.CharacteristicFunction`, `Mathlib.MeasureTheory.Measure.Prokhorov`, `Mathlib.MeasureTheory.Measure.TightNormed`, `Mathlib.Probability.Independence.CharacteristicFunction`
- `NumStability.HDP.Contracts.C_01_hdef_hstandard_hnormal` imports: `NumStability.HDP.Scalar.LimitTheorems`
- `NumStability.HDP.Scalar.Preliminaries` imports: `Mathlib.Probability.Moments.Variance`, `Mathlib.Probability.CDF`, `Mathlib.MeasureTheory.Function.LpSpace.Basic`, `Mathlib.MeasureTheory.Function.LpSpace.Complete`, `Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm`, `Mathlib.MeasureTheory.Function.LpSeminorm.Indicator`, `Mathlib.Probability.UniformOn`, `Mathlib.Analysis.Convex.Integral`, `Mathlib.Analysis.Convex.Continuous`, `Mathlib.MeasureTheory.Integral.Bochner.Set`, `Mathlib.MeasureTheory.Integral.Lebesgue.Markov`, `Mathlib.MeasureTheory.Integral.Layercake`, `Mathlib.MeasureTheory.Measure.Lebesgue.Integral`, `Mathlib.Probability.Distributions.Cauchy`, `Mathlib.Analysis.SpecialFunctions.NonIntegrable`, `Mathlib.Analysis.SpecialFunctions.Pow.Integral`, `Mathlib.Tactic`
- `NumStability.HDP.Contracts.C_01_hdef_hzn` imports: `NumStability.HDP.Scalar.LimitTheorems`, `NumStability.HDP.Scalar.Preliminaries`
- `NumStability.HDP.Contracts.C_01_hdef_hconvergence_hin_hdistribution` imports: `NumStability.HDP.Scalar.LimitTheorems`, `NumStability.HDP.Contracts.C_01_hdef_hstandard_hnormal`, `NumStability.HDP.Contracts.C_01_hdef_hzn`

## Semantic dependency inventory

`local` declarations are followed recursively through types and bodies. `external-frontier` declarations mark the one-level library trust boundary.

### D001: `NumStability.HDP.Contract.hdp_01_hdef_hconvergence_hin_hdistribution_normalized_sum_pointwise_cdf`

- Role: `local`
- Owner module: `NumStability.HDP.Contracts.C_01_hdef_hconvergence_hin_hdistribution`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `c76d5f98cc6293122586d3319bc3b4b04f71b7bc6efb2d863c7b7d21b32eb563`

Type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace Ω] →
    (μ : MeasureTheory.Measure Ω) →
      [MeasureTheory.IsProbabilityMeasure μ] →
        (X : Nat → Ω → Real) →
          (m σ : Real) →
            Real.instLT.lt 0 σ →
              (∀ (i : Nat), MeasureTheory.MemLp (X i) 2 μ) →
                ProbabilityTheory.iIndepFun X μ →
                  (∀ (i : Nat), ProbabilityTheory.IdentDistrib (X i) (X 0) μ μ) →
                    Eq (MeasureTheory.integral μ fun ω => X 0 ω) m →
                      Eq (ProbabilityTheory.variance (X 0) μ) (instHPow.hPow σ 2) → Prop
```

Fully explicit type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace.{u_1} Ω] →
    (μ : @MeasureTheory.Measure.{u_1} Ω inst) →
      [@MeasureTheory.IsProbabilityMeasure.{u_1} Ω inst μ] →
        (X : Nat → Ω → Real) →
          (m σ : Real) →
            (_hσ :
                @LT.lt.{0} Real Real.instLT (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
                  σ) →
              (hX :
                  ∀ (i : Nat),
                    @MeasureTheory.MemLp.{u_1, 0} Ω Real inst
                      (@ContinuousENorm.toENorm.{0} Real
                        (@UniformSpace.toTopologicalSpace.{0} Real
                          (@PseudoMetricSpace.toUniformSpace.{0} Real
                            (@SeminormedAddGroup.toPseudoMetricSpace.{0} Real
                              (@SeminormedAddCommGroup.toSeminormedAddGroup.{0} Real
                                (@NonUnitalSeminormedRing.toSeminormedAddCommGroup.{0} Real
                                  (@NonUnitalSeminormedCommRing.toNonUnitalSeminormedRing.{0} Real
                                    (@SeminormedCommRing.toNonUnitalSeminormedCommRing.{0} Real
                                      (@NormedCommRing.toSeminormedCommRing.{0} Real Real.normedCommRing))))))))
                        (@SeminormedAddGroup.toContinuousENorm.{0} Real
                          (@SeminormedAddCommGroup.toSeminormedAddGroup.{0} Real
                            (@NonUnitalSeminormedRing.toSeminormedAddCommGroup.{0} Real
                              (@NonUnitalSeminormedCommRing.toNonUnitalSeminormedRing.{0} Real
                                (@SeminormedCommRing.toNonUnitalSeminormedCommRing.{0} Real
                                  (@NormedCommRing.toSeminormedCommRing.{0} Real Real.normedCommRing)))))))
                      (@UniformSpace.toTopologicalSpace.{0} Real
                        (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace))
                      (X i)
                      (@OfNat.ofNat.{0} ENNReal (nat_lit 2)
                        (@instOfNatAtLeastTwo.{0} ENNReal (nat_lit 2)
                          (@AddMonoidWithOne.toNatCast.{0} ENNReal
                            (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))
                          (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                            (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))
                      μ) →
                (_hIndep :
                    @ProbabilityTheory.iIndepFun.{u_1, 0, 0} Ω Nat inst (fun (x : Nat) => Real)
                      (fun (x : Nat) => Real.measurableSpace) X μ) →
                  (_hIdent :
                      ∀ (i : Nat),
                        @ProbabilityTheory.IdentDistrib.{u_1, u_1, 0} Ω Ω Real inst inst Real.measurableSpace (X i)
                          (X (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))) μ μ) →
                    (_hMean :
                        @Eq.{1} Real
                          (@MeasureTheory.integral.{u_1, 0} Ω Real Real.normedAddCommGroup
                            (@InnerProductSpace.toNormedSpace.{0, 0} Real Real Real.instRCLike
                              (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup)
                              (@RCLike.toInnerProductSpaceReal.{0} Real Real.instRCLike))
                            inst μ fun (ω : Ω) => X (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))) ω)
                          m) →
                      (_hVariance :
                          @Eq.{1} Real
                            (@ProbabilityTheory.variance.{u_1} Ω inst
                              (X (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))) μ)
                            (@HPow.hPow.{0, 0, 0} Real Nat Real
                              (@instHPow.{0, 0} Real Nat (@Monoid.toNatPow.{0} Real Real.instMonoid)) σ
                              (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))))) →
                        Prop
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} [MeasurableSpace Ω] μ [MeasureTheory.IsProbabilityMeasure μ] X m σ _hσ hX _hIndep _hIdent _hMean _hVariance =>
  ∀ (t : Real),
    Filter.Tendsto
      (fun N =>
        MeasureTheory.ProbabilityMeasure.instFunLike.coe
          (NumStability.HDP.Scalar.LimitTheorems.probabilityLaw
            (NumStability.HDP.Contract.hdp_01_hdef_hzn X m σ (instHAdd.hAdd N 1)) ⋯)
          (Set.Iic t))
      Filter.atTop
      (nhds
        (MeasureTheory.ProbabilityMeasure.instFunLike.coe
          NumStability.HDP.Contract.hdp_01_hdef_hstandard_hnormal_probability (Set.Iic t)))
```

### D002: `NumStability.HDP.Contract.hdp_01_hdef_hconvergence_hin_hdistribution_normalized_sum_pointwise_cdf._proof_1`

- Role: `local`
- Owner module: `NumStability.HDP.Contracts.C_01_hdef_hconvergence_hin_hdistribution`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `e2b33842394ee62d59346d79da9afb0ef85af842dae15533b31f233024151295`

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

### D003: `NumStability.HDP.Contract.hdp_01_hdef_hconvergence_hin_hdistribution_normalized_sum_pointwise_cdf._proof_2`

- Role: `local`
- Owner module: `NumStability.HDP.Contracts.C_01_hdef_hconvergence_hin_hdistribution`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `48220ec4386674490708fa07623490734f135d4fc381ea7274f54c119c672fea`

Type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω) (X : Nat → Ω → Real) (m σ : Real),
  (∀ (i : Nat), MeasureTheory.MemLp (X i) 2 μ) →
    ∀ (N : Nat), AEMeasurable (NumStability.HDP.Contract.hdp_01_hdef_hzn X m σ (instHAdd.hAdd N 1)) μ
```

Fully explicit type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace.{u_1} Ω] (μ : @MeasureTheory.Measure.{u_1} Ω inst) (X : Nat → Ω → Real)
  (m σ : Real)
  (hX :
    ∀ (i : Nat),
      @MeasureTheory.MemLp.{u_1, 0} Ω Real inst
        (@ContinuousENorm.toENorm.{0} Real
          (@UniformSpace.toTopologicalSpace.{0} Real
            (@PseudoMetricSpace.toUniformSpace.{0} Real
              (@SeminormedAddGroup.toPseudoMetricSpace.{0} Real
                (@SeminormedAddCommGroup.toSeminormedAddGroup.{0} Real
                  (@NonUnitalSeminormedRing.toSeminormedAddCommGroup.{0} Real
                    (@NonUnitalSeminormedCommRing.toNonUnitalSeminormedRing.{0} Real
                      (@SeminormedCommRing.toNonUnitalSeminormedCommRing.{0} Real
                        (@NormedCommRing.toSeminormedCommRing.{0} Real Real.normedCommRing))))))))
          (@SeminormedAddGroup.toContinuousENorm.{0} Real
            (@SeminormedAddCommGroup.toSeminormedAddGroup.{0} Real
              (@NonUnitalSeminormedRing.toSeminormedAddCommGroup.{0} Real
                (@NonUnitalSeminormedCommRing.toNonUnitalSeminormedRing.{0} Real
                  (@SeminormedCommRing.toNonUnitalSeminormedCommRing.{0} Real
                    (@NormedCommRing.toSeminormedCommRing.{0} Real Real.normedCommRing)))))))
        (@UniformSpace.toTopologicalSpace.{0} Real (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace))
        (X i)
        (@OfNat.ofNat.{0} ENNReal (nat_lit 2)
          (@instOfNatAtLeastTwo.{0} ENNReal (nat_lit 2)
            (@AddMonoidWithOne.toNatCast.{0} ENNReal
              (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))
            NumStability.HDP.Contract.hdp_01_hdef_hconvergence_hin_hdistribution_normalized_sum_pointwise_cdf._proof_1))
        μ)
  (N : Nat),
  @AEMeasurable.{u_1, 0} Ω Real Real.measurableSpace inst
    (@NumStability.HDP.Contract.hdp_01_hdef_hzn.{u_1} Ω X m σ
      (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
        (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))))
    μ
```

### D004: `NumStability.HDP.Contract.hdp_01_hdef_hstandard_hnormal_probability`

- Role: `local`
- Owner module: `NumStability.HDP.Contracts.C_01_hdef_hstandard_hnormal`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `aa1da11015e45f2b13db37c49c99b58ae5e8430a013b00cc5f07dba27f404aab`

Type:

```lean
MeasureTheory.ProbabilityMeasure Real
```

Fully explicit type:

```lean
@MeasureTheory.ProbabilityMeasure.{0} Real Real.measurableSpace
```

Definition body (one-level semantic boundary):

```lean
⟨NumStability.HDP.Contract.hdp_01_hdef_hstandard_hnormal,
  NumStability.HDP.Contract.hdp_01_hdef_hstandard_hnormal_probability._proof_1⟩
```

### D005: `NumStability.HDP.Contract.hdp_01_hdef_hzn`

- Role: `local`
- Owner module: `NumStability.HDP.Contracts.C_01_hdef_hzn`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `f943669945c9a56ad7767e68c581b1afd29de5a9684965b46e8ea0ec1d6f510c`

Type:

```lean
{Ω : Type u_1} → (Nat → Ω → Real) → Real → Real → Nat → Ω → Real
```

Fully explicit type:

```lean
{Ω : Type u_1} → (X : Nat → Ω → Real) → (m σ : Real) → (N : Nat) → Ω → Real
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} X m σ N ω =>
  instHMul.hMul (Real.instInv.inv (instHMul.hMul σ N.cast.sqrt)) ((Finset.range N).sum fun i => instHSub.hSub (X i ω) m)
```

### D006: `NumStability.HDP.Scalar.LimitTheorems.probabilityLaw`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.LimitTheorems`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `9eb73233139c77e2ba4b054c7c5db48f89b1ed5c9e6cf501dec07d1ad6a32d63`

Type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace Ω] →
    {μ : MeasureTheory.Measure Ω} →
      [MeasureTheory.IsProbabilityMeasure μ] → (X : Ω → Real) → AEMeasurable X μ → MeasureTheory.ProbabilityMeasure Real
```

Fully explicit type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace.{u_1} Ω] →
    {μ : @MeasureTheory.Measure.{u_1} Ω inst} →
      [@MeasureTheory.IsProbabilityMeasure.{u_1} Ω inst μ] →
        (X : Ω → Real) →
          (hX : @AEMeasurable.{u_1, 0} Ω Real Real.measurableSpace inst X μ) →
            @MeasureTheory.ProbabilityMeasure.{0} Real Real.measurableSpace
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} [MeasurableSpace Ω] {μ} [MeasureTheory.IsProbabilityMeasure μ] X hX => ⟨MeasureTheory.Measure.map X μ, ⋯⟩
```

### D007: `NumStability.HDP.Contract.hdp_01_hdef_hstandard_hnormal`

- Role: `local`
- Owner module: `NumStability.HDP.Contracts.C_01_hdef_hstandard_hnormal`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `382878b1bd0a9d6cebdea15c2dd2437c40145d9d7ab53f99b4aae6b52bc725eb`

Type:

```lean
MeasureTheory.Measure Real
```

Fully explicit type:

```lean
@MeasureTheory.Measure.{0} Real Real.measurableSpace
```

Definition body (one-level semantic boundary):

```lean
NumStability.HDP.Scalar.LimitTheorems.standardNormalLaw
```

### D008: `NumStability.HDP.Contract.hdp_01_hdef_hstandard_hnormal_probability._proof_1`

- Role: `local`
- Owner module: `NumStability.HDP.Contracts.C_01_hdef_hstandard_hnormal`
- Declaration kind: `theorem`
- Distance from target type: `3`
- Semantic SHA-256: `8c3066a33771ff7325f98fe5ba4bc0c45687dea2887ceaca5d166ff6aa5179a7`

Type:

```lean
MeasureTheory.IsProbabilityMeasure NumStability.HDP.Contract.hdp_01_hdef_hstandard_hnormal
```

Fully explicit type:

```lean
@MeasureTheory.IsProbabilityMeasure.{0} Real Real.measurableSpace
  NumStability.HDP.Contract.hdp_01_hdef_hstandard_hnormal
```

### D009: `NumStability.HDP.Scalar.LimitTheorems.standardNormalLaw`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.LimitTheorems`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `9412a1f926c86022e6b7cb277033a1601cac842fa5ef3f2c6bc35f23d7cb4784`

Type:

```lean
MeasureTheory.Measure Real
```

Fully explicit type:

```lean
@MeasureTheory.Measure.{0} Real Real.measurableSpace
```

Definition body (one-level semantic boundary):

```lean
ProbabilityTheory.gaussianReal 0 1
```

### D010: `AddCommMonoidWithOne.toAddMonoidWithOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
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

### D011: `AddMonoidWithOne.toNatCast`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
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

### D012: `ContinuousENorm.toENorm`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `31fb1ad5ceaae342dc2fe1c1f2eba1b18e67d9d01a5451201d210b585bde97c0`

Type:

```lean
{E : Type u_8} → {inst : TopologicalSpace E} → [self : ContinuousENorm E] → ENorm E
```

Fully explicit type:

```lean
{E : Type u_8} → {inst : TopologicalSpace.{u_8} E} → [self : @ContinuousENorm.{u_8} E inst] → ENorm.{u_8} E
```

Definition body (one-level semantic boundary):

```lean
fun E {inst} [self : ContinuousENorm E] => self.1
```

### D013: `ENNReal`

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

### D014: `Eq`

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

### D015: `HPow.hPow`

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

### D016: `InnerProductSpace.toNormedSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.InnerProductSpace.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `683435a8d27d50ec1482d74d23f541d52d05ff0411c60f88d16c32132aca9f3e`

Type:

```lean
{𝕜 : Type u_4} →
  {E : Type u_5} →
    {inst : RCLike 𝕜} → {inst_1 : SeminormedAddCommGroup E} → [self : InnerProductSpace 𝕜 E] → NormedSpace 𝕜 E
```

Fully explicit type:

```lean
{𝕜 : Type u_4} →
  {E : Type u_5} →
    {inst : RCLike.{u_4} 𝕜} →
      {inst_1 : SeminormedAddCommGroup.{u_5} E} →
        [self : @InnerProductSpace.{u_4, u_5} 𝕜 E inst inst_1] →
          @NormedSpace.{u_4, u_5} 𝕜 E
            (@DenselyNormedField.toNormedField.{u_4} 𝕜 (@RCLike.toDenselyNormedField.{u_4} 𝕜 inst)) inst_1
```

Definition body (one-level semantic boundary):

```lean
fun 𝕜 E {inst} {inst_1} [self : InnerProductSpace 𝕜 E] => self.1
```

### D017: `LT.lt`

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

### D018: `MeasurableSpace`

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

### D019: `MeasureTheory.IsProbabilityMeasure`

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

### D020: `MeasureTheory.Measure`

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

### D021: `MeasureTheory.MemLp`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.LpSeminorm.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `3d38a386250cbaad2a5c216f9bf80b5f748106d4406c769283ef0114b4f42398`

Type:

```lean
{α : Type u_1} →
  {ε : Type u_2} →
    {m0 : MeasurableSpace α} →
      [ENorm ε] →
        [TopologicalSpace ε] →
          (α → ε) → ENNReal → autoParam (MeasureTheory.Measure α) MeasureTheory.MemLp._auto_1 → Prop
```

Fully explicit type:

```lean
{α : Type u_1} →
  {ε : Type u_2} →
    {m0 : MeasurableSpace.{u_1} α} →
      [ENorm.{u_2} ε] →
        [TopologicalSpace.{u_2} ε] →
          (f : α → ε) →
            (p : ENNReal) →
              (μ : autoParam.{u_1 + 1} (@MeasureTheory.Measure.{u_1} α m0) MeasureTheory.MemLp._auto_1) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun {α} {ε} {m0} [ENorm ε] [TopologicalSpace ε] f p μ =>
  And (MeasureTheory.AEStronglyMeasurable f μ)
    (ENNReal.instPartialOrder.lt (MeasureTheory.eLpNorm f p μ) instTopENNReal.top)
```

### D022: `MeasureTheory.integral`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Integral.Bochner.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `428563f3d6b771605a3267457bf33b62ec2efa91a42b57b96121b85c0269a9ab`

Type:

```lean
{α : Type u_6} →
  {G : Type u_7} →
    [inst : NormedAddCommGroup G] →
      [NormedSpace Real G] → {x : MeasurableSpace α} → MeasureTheory.Measure α → (α → G) → G
```

Fully explicit type:

```lean
{α : Type u_6} →
  {G : Type u_7} →
    [inst : NormedAddCommGroup.{u_7} G] →
      [@NormedSpace.{0, u_7} Real G Real.normedField (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_7} G inst)] →
        {x : MeasurableSpace.{u_6} α} → (μ : @MeasureTheory.Measure.{u_6} α x) → (f : α → G) → G
```

Definition body (one-level semantic boundary):

```lean
MeasureTheory.wrapped✝.1
```

### D023: `Monoid.toNatPow`

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

### D025: `Nat.instAtLeastTwoHAddOfNat`

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

### D026: `Nat.instNeZeroSucc`

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

### D027: `NonUnitalSeminormedCommRing.toNonUnitalSeminormedRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `c697ff5e735ebe18733e51950717037e73ba73e94ac2e99953bfb521708cabd2`

Type:

```lean
{α : Type u_5} → [self : NonUnitalSeminormedCommRing α] → NonUnitalSeminormedRing α
```

Fully explicit type:

```lean
{α : Type u_5} → [self : NonUnitalSeminormedCommRing.{u_5} α] → NonUnitalSeminormedRing.{u_5} α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : NonUnitalSeminormedCommRing α] => self.1
```

### D028: `NonUnitalSeminormedRing.toSeminormedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `db7996fa414ad67340b9d6991cd145ac2a5d251a870097d20f2f63e371fb101d`

Type:

```lean
{α : Type u_2} → [NonUnitalSeminormedRing α] → SeminormedAddCommGroup α
```

Fully explicit type:

```lean
{α : Type u_2} → [NonUnitalSeminormedRing.{u_2} α] → SeminormedAddCommGroup.{u_2} α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : NonUnitalSeminormedRing α] =>
  have __src := inst;
  { toNorm := __src.toNorm, toAddCommGroup := __src.toAddCommGroup, toPseudoMetricSpace := __src.toPseudoMetricSpace,
    dist_eq := ⋯ }
```

### D029: `NormedAddCommGroup.toSeminormedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7327759e5e9417c54393e7566584cd72d79c77b4ca018ea408c5d024667587be`

Type:

```lean
{E : Type u_5} → [NormedAddCommGroup E] → SeminormedAddCommGroup E
```

Fully explicit type:

```lean
{E : Type u_5} → [NormedAddCommGroup.{u_5} E] → SeminormedAddCommGroup.{u_5} E
```

Definition body (one-level semantic boundary):

```lean
fun {E} [inst : NormedAddCommGroup E] =>
  have __src := inst;
  { toNorm := __src.toNorm, toAddCommGroup := __src.toAddCommGroup, toPseudoMetricSpace := __src.toPseudoMetricSpace,
    dist_eq := ⋯ }
```

### D030: `NormedCommRing.toSeminormedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `ad504b2606febc5a066d58ac540c9826bd1b7fce734d59a7fef63c7c27112fe3`

Type:

```lean
{α : Type u_2} → [β : NormedCommRing α] → SeminormedCommRing α
```

Fully explicit type:

```lean
{α : Type u_2} → [β : NormedCommRing.{u_2} α] → SeminormedCommRing.{u_2} α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [β : NormedCommRing α] =>
  { toNorm := β.toNorm, toRing := β.toRing, toPseudoMetricSpace := β.toPseudoMetricSpace, dist_eq := ⋯,
    norm_mul_le := ⋯, mul_comm := ⋯ }
```

### D031: `OfNat.ofNat`

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

### D032: `ProbabilityTheory.IdentDistrib`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.IdentDistrib`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `bfa67f6784b6c21a24b3b314a4519e3b86d23bd01bd4ecacbf50d4c9faa0d03e`

Type:

```lean
{α : Type u_1} →
  {β : Type u_2} →
    {γ : Type u_3} →
      [inst : MeasurableSpace α] →
        [inst_1 : MeasurableSpace β] →
          [MeasurableSpace γ] →
            (α → γ) →
              (β → γ) →
                autoParam (MeasureTheory.Measure α) ProbabilityTheory.IdentDistrib._auto_1 →
                  autoParam (MeasureTheory.Measure β) ProbabilityTheory.IdentDistrib._auto_3 → Prop
```

Fully explicit type:

```lean
{α : Type u_1} →
  {β : Type u_2} →
    {γ : Type u_3} →
      [inst : MeasurableSpace.{u_1} α] →
        [inst_1 : MeasurableSpace.{u_2} β] →
          [MeasurableSpace.{u_3} γ] →
            (f : α → γ) →
              (g : β → γ) →
                (μ : autoParam.{u_1 + 1} (@MeasureTheory.Measure.{u_1} α inst) ProbabilityTheory.IdentDistrib._auto_1) →
                  (ν :
                      autoParam.{u_2 + 1} (@MeasureTheory.Measure.{u_2} β inst_1)
                        ProbabilityTheory.IdentDistrib._auto_3) →
                    Prop
```

### D033: `ProbabilityTheory.iIndepFun`

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

### D034: `ProbabilityTheory.variance`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.Moments.Variance`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `2eb32ed492bfdd1df3ad84f7e963b9d4f0347489111c9ee4dddf93da3947d3a2`

Type:

```lean
{Ω : Type u_1} → {mΩ : MeasurableSpace Ω} → (Ω → Real) → MeasureTheory.Measure Ω → Real
```

Fully explicit type:

```lean
{Ω : Type u_1} → {mΩ : MeasurableSpace.{u_1} Ω} → (X : Ω → Real) → (μ : @MeasureTheory.Measure.{u_1} Ω mΩ) → Real
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} {mΩ} X μ => (ProbabilityTheory.evariance X μ).toReal
```

### D035: `PseudoMetricSpace.toUniformSpace`

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

### D036: `RCLike.toInnerProductSpaceReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.InnerProductSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f602276baee30d3dbe02bd6b756a9097f750d59a7f91ca7635dcfc935fd22981`

Type:

```lean
{𝕜 : Type u_1} → [inst : RCLike 𝕜] → InnerProductSpace Real 𝕜
```

Fully explicit type:

```lean
{𝕜 : Type u_1} →
  [inst : RCLike.{u_1} 𝕜] →
    @InnerProductSpace.{0, u_1} Real 𝕜 Real.instRCLike
      (@NonUnitalSeminormedRing.toSeminormedAddCommGroup.{u_1} 𝕜
        (@NonUnitalSeminormedCommRing.toNonUnitalSeminormedRing.{u_1} 𝕜
          (@SeminormedCommRing.toNonUnitalSeminormedCommRing.{u_1} 𝕜
            (@NormedCommRing.toSeminormedCommRing.{u_1} 𝕜
              (@NormedField.toNormedCommRing.{u_1} 𝕜
                (@DenselyNormedField.toNormedField.{u_1} 𝕜 (@RCLike.toDenselyNormedField.{u_1} 𝕜 inst)))))))
```

Definition body (one-level semantic boundary):

```lean
fun {𝕜} [RCLike 𝕜] =>
  let __spread.0 := Inner.rclikeToReal 𝕜 𝕜;
  { toNormedSpace := NormedAlgebra.toNormedSpace 𝕜, toInner := __spread.0, norm_sq_eq_re_inner := ⋯,
    conj_inner_symm := ⋯, add_left := ⋯, smul_left := ⋯ }
```

### D037: `Real`

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

### D038: `Real.instLT`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `573bcfac2b62a55b90ee93bf35473d500cc64581698a699b2152c52f40d0e14a`

Type:

```lean
LT Real
```

Fully explicit type:

```lean
LT.{0} Real
```

Definition body (one-level semantic boundary):

```lean
{ lt := Real.lt✝ }
```

### D039: `Real.instMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `37978679365b30167654c1ef9ecb0fa938325c2047191daa7208aee389c0b4b8`

Type:

```lean
Monoid Real
```

Fully explicit type:

```lean
Monoid.{0} Real
```

Definition body (one-level semantic boundary):

```lean
inferInstance
```

### D040: `Real.instRCLike`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.RCLike.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `d2fdb97b9d861fcf61e6dbea9993dfa0ca6aa16609742f215c35b3f7ddd16b8e`

Type:

```lean
RCLike Real
```

Fully explicit type:

```lean
RCLike.{0} Real
```

Definition body (one-level semantic boundary):

```lean
{ toDenselyNormedField := Real.denselyNormedField, toStarRing := instStarRingReal,
  toNormedAlgebra := NormedAlgebra.id Real, toCompleteSpace := Real.instCompleteSpace, re := AddMonoidHom.id Real,
  im := 0, I := 0, I_re_ax := Real.instRCLike._proof_1, I_mul_I_ax := Real.instRCLike._proof_8, re_add_im_ax := ⋯,
  ofReal_re_ax := Real.instRCLike._proof_11, ofReal_im_ax := Real.instRCLike._proof_12, mul_re_ax := ⋯, mul_im_ax := ⋯,
  conj_re_ax := ⋯, conj_im_ax := ⋯, conj_I_ax := Real.instRCLike._proof_7, norm_sq_eq_def_ax := ⋯, mul_im_I_ax := ⋯,
  toPartialOrder := Real.partialOrder, le_iff_re_im := @Real.instRCLike._proof_13, toDecidableEq := Real.decidableEq }
```

### D041: `Real.instZero`

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

### D042: `Real.measurableSpace`

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

### D043: `Real.normedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Real`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `9ff0d896c635e2a38531d689d24ee70cfffa41565354ce15f6ff59b51650bd93`

Type:

```lean
NormedAddCommGroup Real
```

Fully explicit type:

```lean
NormedAddCommGroup.{0} Real
```

Definition body (one-level semantic boundary):

```lean
{ toNorm := Real.norm, toAddCommGroup := Real.instAddCommGroup, toMetricSpace := Real.metricSpace, dist_eq := ⋯ }
```

### D044: `Real.normedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `69cccc1e864661e103785f4a2712b9ad164d845c03b7737801c37e5ac852bad7`

Type:

```lean
NormedCommRing Real
```

Fully explicit type:

```lean
NormedCommRing.{0} Real
```

Definition body (one-level semantic boundary):

```lean
let __src := Real.normedAddCommGroup;
let __src_1 := Real.commRing;
{ toNorm := __src.toNorm, toAddMonoid := __src.toAddMonoid, add_comm := Real.normedCommRing._proof_1,
  toMul := __src_1.toMul, left_distrib := Real.normedCommRing._proof_2, right_distrib := Real.normedCommRing._proof_3,
  zero_mul := Real.normedCommRing._proof_4, mul_zero := Real.normedCommRing._proof_5,
  mul_assoc := Real.normedCommRing._proof_6, toOne := __src_1.toOne, one_mul := Real.normedCommRing._proof_7,
  mul_one := Real.normedCommRing._proof_8, toNatCast := __src_1.toNatCast, natCast_zero := Real.normedCommRing._proof_9,
  natCast_succ := Real.normedCommRing._proof_10, npow := __src_1.npow, npow_zero := Real.normedCommRing._proof_11,
  npow_succ := Real.normedCommRing._proof_12, toNeg := __src.toNeg, toSub := __src.toSub,
  sub_eq_add_neg := Real.normedCommRing._proof_13, zsmul := __src.zsmul, zsmul_zero' := Real.normedCommRing._proof_14,
  zsmul_succ' := Real.normedCommRing._proof_15, zsmul_neg' := Real.normedCommRing._proof_16,
  neg_add_cancel := Real.normedCommRing._proof_17, toIntCast := __src_1.toIntCast,
  intCast_ofNat := Real.normedCommRing._proof_18, intCast_negSucc := Real.normedCommRing._proof_19,
  toMetricSpace := __src.toMetricSpace, dist_eq := ⋯, norm_mul_le := Real.normedCommRing._proof_20, mul_comm := ⋯ }
```

### D045: `Real.pseudoMetricSpace`

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

### D046: `SeminormedAddCommGroup.toSeminormedAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8cf35215f509cdee10a3a95158cbaadd3c5fb584bc0d1f4fad6ecfc69b1bd205`

Type:

```lean
{E : Type u_5} → [SeminormedAddCommGroup E] → SeminormedAddGroup E
```

Fully explicit type:

```lean
{E : Type u_5} → [SeminormedAddCommGroup.{u_5} E] → SeminormedAddGroup.{u_5} E
```

Definition body (one-level semantic boundary):

```lean
fun {E} [inst : SeminormedAddCommGroup E] =>
  have __src := inst;
  { toNorm := __src.toNorm, toAddGroup := __src.toAddGroup, toPseudoMetricSpace := __src.toPseudoMetricSpace,
    dist_eq := ⋯ }
```

### D047: `SeminormedAddGroup.toContinuousENorm`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Continuity`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `17a83cbf3059dd0bbaefd43c93ce329f1d6b760d440889322b3582a18b23a141`

Type:

```lean
{E : Type u_4} → [inst : SeminormedAddGroup E] → ContinuousENorm E
```

Fully explicit type:

```lean
{E : Type u_4} →
  [inst : SeminormedAddGroup.{u_4} E] →
    @ContinuousENorm.{u_4} E
      (@UniformSpace.toTopologicalSpace.{u_4} E
        (@PseudoMetricSpace.toUniformSpace.{u_4} E (@SeminormedAddGroup.toPseudoMetricSpace.{u_4} E inst)))
```

Definition body (one-level semantic boundary):

```lean
fun {E} [SeminormedAddGroup E] => { toENorm := NNNorm.toENorm, continuous_enorm := ⋯ }
```

### D048: `SeminormedAddGroup.toPseudoMetricSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `d4043bb9912319b688406ba77c3a5b0fdd8f53ab605cf1962721b51314c66d3f`

Type:

```lean
{E : Type u_8} → [self : SeminormedAddGroup E] → PseudoMetricSpace E
```

Fully explicit type:

```lean
{E : Type u_8} → [self : SeminormedAddGroup.{u_8} E] → PseudoMetricSpace.{u_8} E
```

Definition body (one-level semantic boundary):

```lean
fun E [self : SeminormedAddGroup E] => self.3
```

### D049: `SeminormedCommRing.toNonUnitalSeminormedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `a29f0377c9baf2265c34aaf85b852e7c4260b34d2dc04574484c335ebc09a6e9`

Type:

```lean
{α : Type u_2} → [β : SeminormedCommRing α] → NonUnitalSeminormedCommRing α
```

Fully explicit type:

```lean
{α : Type u_2} → [β : SeminormedCommRing.{u_2} α] → NonUnitalSeminormedCommRing.{u_2} α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [β : SeminormedCommRing α] =>
  { toNorm := β.toNorm, toAddMonoid := β.toAddMonoid, toNeg := β.toNeg, toSub := β.toSub, sub_eq_add_neg := ⋯,
    zsmul := β.zsmul, zsmul_zero' := ⋯, zsmul_succ' := ⋯, zsmul_neg' := ⋯, neg_add_cancel := ⋯, add_comm := ⋯,
    toMul := β.toMul, left_distrib := ⋯, right_distrib := ⋯, zero_mul := ⋯, mul_zero := ⋯, mul_assoc := ⋯,
    toPseudoMetricSpace := β.toPseudoMetricSpace, dist_eq := ⋯, norm_mul_le := ⋯, mul_comm := ⋯ }
```

### D050: `UniformSpace.toTopologicalSpace`

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

### D051: `Zero.toOfNat0`

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

### D052: `instAddCommMonoidWithOneENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D053: `instHPow`

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

### D054: `instOfNatAtLeastTwo`

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

### D055: `instOfNatNat`

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

### D056: `DFunLike.coe`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.FunLike.Basic`
- Declaration kind: `abbrev`
- Distance from target type: `2`
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

### D057: `Filter.Tendsto`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Filter.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D058: `Filter.atTop`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Filter.AtTopBot.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D059: `HAdd.hAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `2`
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

### D060: `MeasureTheory.ProbabilityMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.ProbabilityMeasure`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D061: `MeasureTheory.ProbabilityMeasure.instFunLike`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.ProbabilityMeasure`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `e3c023c4632839b8cb7357e8c84c2320288b243a539fb31ed2e68e92146e1326`

Type:

```lean
{Ω : Type u_1} → [inst : MeasurableSpace Ω] → FunLike (MeasureTheory.ProbabilityMeasure Ω) (Set Ω) NNReal
```

Fully explicit type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace.{u_1} Ω] →
    FunLike.{u_1 + 1, u_1 + 1, 1} (@MeasureTheory.ProbabilityMeasure.{u_1} Ω inst) (Set.{u_1} Ω) NNReal
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} [MeasurableSpace Ω] =>
  { coe := fun μ s => (MeasureTheory.Measure.instFunLike.coe μ.toMeasure s).toNNReal, coe_injective' := ⋯ }
```

### D062: `NNReal`

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

### D063: `NNReal.instTopologicalSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.UniformSpace.Real`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `d4fef6a9e5f927939185ec88b080f2981a128e2a2652f6e43a72d1615957da50`

Type:

```lean
TopologicalSpace NNReal
```

Fully explicit type:

```lean
TopologicalSpace.{0} NNReal
```

Definition body (one-level semantic boundary):

```lean
inferInstance
```

### D064: `Nat.instPreorder`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D065: `Real.instPreorder`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D066: `Set`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D067: `Set.Iic`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Interval.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `7539b2b70d6d537c0d28ab0d613f239acb7c3d9e2ce26f2006b0681ce965d8a7`

Type:

```lean
{α : Type u_1} → [Preorder α] → α → Set α
```

Fully explicit type:

```lean
{α : Type u_1} → [Preorder.{u_1} α] → (b : α) → Set.{u_1} α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Preorder α] b => setOf fun x => inst.le x b
```

### D068: `instAddNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D069: `instHAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D070: `nhds`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.Defs.Filter`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D071: `AEMeasurable`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `6dc48478b911cadddc9129039bc8859282262cccd65bca8d46f3cdc5415a69cd`

Type:

```lean
{α : Type u_1} →
  {β : Type u_2} →
    [MeasurableSpace β] →
      {_m : MeasurableSpace α} → (α → β) → autoParam (MeasureTheory.Measure α) AEMeasurable._auto_1 → Prop
```

Fully explicit type:

```lean
{α : Type u_1} →
  {β : Type u_2} →
    [MeasurableSpace.{u_2} β] →
      {_m : MeasurableSpace.{u_1} α} →
        (f : α → β) → (μ : autoParam.{u_1 + 1} (@MeasureTheory.Measure.{u_1} α _m) AEMeasurable._auto_1) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun {α} {β} [MeasurableSpace β] {_m} f μ => Exists fun g => And (Measurable g) ((MeasureTheory.ae μ).EventuallyEq f g)
```

### D072: `Finset.range`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Finset.Range`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `0d8947d3b91a57604f7b7be615f2ff236f2058a47281af31ea2498635666e9e7`

Type:

```lean
Nat → Finset Nat
```

Fully explicit type:

```lean
(n : Nat) → Finset.{0} Nat
```

Definition body (one-level semantic boundary):

```lean
fun n => { val := Multiset.range n, nodup := ⋯ }
```

### D073: `Finset.sum`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.BigOperators.Group.Finset.Defs`
- Declaration kind: `def`
- Distance from target type: `3`
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

### D074: `HMul.hMul`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `3`
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

### D075: `HSub.hSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `3`
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

### D076: `Inv.inv`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `3`
- Semantic SHA-256: `c3aea3c6e2edd31a7b2cf071814315808ef7d84fd01d8c9b719313846ebca438`

Type:

```lean
{α : Type u} → [self : Inv α] → α → α
```

Fully explicit type:

```lean
{α : Type u} → [self : Inv.{u} α] → α → α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : Inv α] => self.1
```

### D077: `MeasureTheory.Measure.isProbabilityMeasure_map`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Typeclasses.Probability`
- Declaration kind: `theorem`
- Distance from target type: `3`
- Semantic SHA-256: `5624854207c8bee28341ec39de7199a37aa6780067b481804214a292b0055dc0`

Type:

```lean
∀ {α : Type u_1} {β : Type u_2} {m0 : MeasurableSpace α} [inst : MeasurableSpace β] {μ : MeasureTheory.Measure α}
  [MeasureTheory.IsProbabilityMeasure μ] {f : α → β},
  AEMeasurable f μ → MeasureTheory.IsProbabilityMeasure (MeasureTheory.Measure.map f μ)
```

Fully explicit type:

```lean
∀ {α : Type u_1} {β : Type u_2} {m0 : MeasurableSpace.{u_1} α} [inst : MeasurableSpace.{u_2} β]
  {μ : @MeasureTheory.Measure.{u_1} α m0} [@MeasureTheory.IsProbabilityMeasure.{u_1} α m0 μ] {f : α → β}
  (hf : @AEMeasurable.{u_1, u_2} α β inst m0 f μ),
  @MeasureTheory.IsProbabilityMeasure.{u_2} β inst (@MeasureTheory.Measure.map.{u_1, u_2} α β m0 inst f μ)
```

### D078: `MeasureTheory.Measure.map`

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

### D079: `Nat.AtLeastTwo`

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

### D080: `Nat.cast`

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

### D081: `Real.instAddCommMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `3`
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

### D082: `Real.instInv`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `8996fd673a1e2289aaf761085a60a161bdafebda8cdd48d1efb3c89da1382980`

Type:

```lean
Inv Real
```

Fully explicit type:

```lean
Inv.{0} Real
```

Definition body (one-level semantic boundary):

```lean
{ inv := Real.inv'✝ }
```

### D083: `Real.instMul`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `3`
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

### D084: `Real.instNatCast`

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

### D085: `Real.instSub`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `3`
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

### D086: `Real.sqrt`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Sqrt`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `67f9248ae1acb851b5392be301057ebb8b8ef2fb20f76d2d53a2d07ec8f30553`

Type:

```lean
Real → Real
```

Fully explicit type:

```lean
(x : Real) → Real
```

Definition body (one-level semantic boundary):

```lean
fun x => ((instFunLikeOrderIso NNReal NNReal).coe NNReal.sqrt x.toNNReal).toReal
```

### D087: `Subtype.mk`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `constructor`
- Distance from target type: `3`
- Semantic SHA-256: `488ac61b6d3c07fb9a2f54a03a39e6001a4c7cedfd07515f0f9865e7fef9ef51`

Type:

```lean
{α : Sort u} → {p : α → Prop} → (val : α) → p val → Subtype p
```

Fully explicit type:

```lean
{α : Sort u} → {p : α → Prop} → (val : α) → (property : p val) → @Subtype.{u} α p
```

### D088: `instHMul`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `3`
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

### D089: `instHSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `3`
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

### D090: `One.toOfNat1`

- Role: `external-frontier`
- Owner module: `Init.Data.Zero`
- Declaration kind: `def`
- Distance from target type: `5`
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

### D091: `ProbabilityTheory.gaussianReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.Distributions.Gaussian.Real`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `640e905d8e9530cec4dfeaf3d53f9e2b0e193d42ec6b75a24f451a6c1e866b28`

Type:

```lean
Real → NNReal → MeasureTheory.Measure Real
```

Fully explicit type:

```lean
(μ : Real) → (v : NNReal) → @MeasureTheory.Measure.{0} Real Real.measurableSpace
```

Definition body (one-level semantic boundary):

```lean
fun μ v =>
  ite (Eq v 0) (MeasureTheory.Measure.dirac μ)
    (Real.measureSpace.volume.withDensity (ProbabilityTheory.gaussianPDF μ v))
```

### D092: `instOneNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `5`
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

### `NumStability.HDP.Contracts.C_01_hdef_hstandard_hnormal`

Path: `lean-numerical-stability/NumStability/HDP/Contracts/C_01_hdef_hstandard_hnormal.lean`
SHA-256: `41edd4acae7f35c0fc318315597792aa3ba95bdf3b3d0c49ce89eebf0f4413b3`

```lean
import NumStability.HDP.Scalar.LimitTheorems

/-!
Cross-split stable API for `HDP-01-DEF-STANDARD-NORMAL`.

The semantic producer owns the canonical Gaussian law and the random-variable
predicate; this leaf owns only the stable source-facing law name.
-/

namespace NumStability.HDP.Contract

open MeasureTheory

/-- The standard normal probability law from Chapter 1, equation (1.6). -/
noncomputable def hdp_01_hdef_hstandard_hnormal : Measure ℝ :=
  NumStability.HDP.Scalar.LimitTheorems.standardNormalLaw

/-- The standard normal law bundled as a probability measure for weak/CDF limits. -/
noncomputable def hdp_01_hdef_hstandard_hnormal_probability :
    ProbabilityMeasure ℝ :=
  ⟨hdp_01_hdef_hstandard_hnormal, by
    dsimp [hdp_01_hdef_hstandard_hnormal]
    infer_instance⟩

/-- Equation (1.6): the density of the standard normal law. -/
theorem hdp_01_heq_h1_d6 :
    hdp_01_hdef_hstandard_hnormal =
        volume.withDensity (ProbabilityTheory.gaussianPDF 0 1) ∧
      ProbabilityTheory.gaussianPDFReal 0 1 =
        fun x : ℝ => (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-(x ^ 2) / 2) := by
  constructor
  · simpa [hdp_01_hdef_hstandard_hnormal,
      NumStability.HDP.Scalar.LimitTheorems.standardNormalLaw] using
      (ProbabilityTheory.gaussianReal_of_var_ne_zero 0
        (v := (1 : NNReal)) one_ne_zero)
  · exact NumStability.HDP.Scalar.LimitTheorems.standardNormalLaw_pdf

end NumStability.HDP.Contract
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

### `NumStability.HDP.Contracts.C_01_hdef_hzn`

Path: `lean-numerical-stability/NumStability/HDP/Contracts/C_01_hdef_hzn.lean`
SHA-256: `b1be75fb64babe96c9a09ba0409cd80703aa2a5cd6437db418c239a4b64c2abf`

```lean
import NumStability.HDP.Scalar.LimitTheorems
import NumStability.HDP.Scalar.Preliminaries

/-!
# Contract: HDP Chapter 1 normalized CLT sum

This source-facing leaf records the normalized sum displayed in Theorem 1.3.2
and the algebraic equivalence of its two forms under explicit positive-variance
and moment identities.
-/

namespace NumStability.HDP.Contract

open MeasureTheory
open scoped BigOperators

/--
The second displayed formula for the normalized sum in Theorem 1.3.2:
`Z_N = (σ * √N)⁻¹ ∑_{i < N} (X_i - m)`.
-/
noncomputable def hdp_01_hdef_hzn
    {Ω : Type*} (X : ℕ → Ω → ℝ) (m σ : ℝ) (N : ℕ) : Ω → ℝ :=
  fun ω => (σ * Real.sqrt (N : ℝ))⁻¹ *
    ∑ i ∈ Finset.range N, (X i ω - m)

/-- Measurability of the normalized sum, used by its distributional wrapper. -/
theorem hdp_01_hdef_hzn_aemeasurable
    {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (X : ℕ → Ω → ℝ) (m σ : ℝ) (N : ℕ)
    (hX : ∀ i, AEMeasurable (X i) μ) :
    AEMeasurable (hdp_01_hdef_hzn X m σ N) μ := by
  unfold hdp_01_hdef_hzn
  apply AEMeasurable.const_mul
  exact (Finset.range N).aemeasurable_fun_sum fun i _ ↦
    (hX i).sub aemeasurable_const

/--
The two displayed formulas for `Z_N` agree when the partial sum has mean
`N m`, variance `N σ²`, and `N, σ` are positive.
-/
theorem hdp_01_hdef_hzn_eq_source_normalization
    {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (X : ℕ → Ω → ℝ) (m σ : ℝ) (N : ℕ)
    (hN : 0 < N) (hσ : 0 < σ)
    (hMean :
      NumStability.HDP.Scalar.Preliminaries.expectation μ
          (fun ω => ∑ i ∈ Finset.range N, X i ω) =
        (N : ℝ) * m)
    (hVar :
      NumStability.HDP.Scalar.Preliminaries.variance μ
          (fun ω => ∑ i ∈ Finset.range N, X i ω) =
        (N : ℝ) * σ ^ 2) :
    (fun ω =>
      ((∑ i ∈ Finset.range N, X i ω) -
          NumStability.HDP.Scalar.Preliminaries.expectation μ
            (fun ω => ∑ i ∈ Finset.range N, X i ω)) /
        Real.sqrt
          (NumStability.HDP.Scalar.Preliminaries.variance μ
            (fun ω => ∑ i ∈ Finset.range N, X i ω))) =
      hdp_01_hdef_hzn X m σ N := by
  have hNreal : (0 : ℝ) < (N : ℝ) := by exact_mod_cast hN
  have hsqrt :
      Real.sqrt ((N : ℝ) * σ ^ 2) =
        σ * Real.sqrt (N : ℝ) := by
    rw [Real.sqrt_mul hNreal.le, Real.sqrt_sq_eq_abs, abs_of_pos hσ, mul_comm]
  funext ω
  rw [hMean, hVar, hsqrt, div_eq_inv_mul]
  congr 1
  rw [Finset.sum_sub_distrib]
  simp [nsmul_eq_mul]

end NumStability.HDP.Contract
```

### `NumStability.HDP.Contracts.C_01_hdef_hconvergence_hin_hdistribution`

Path: `lean-numerical-stability/NumStability/HDP/Contracts/C_01_hdef_hconvergence_hin_hdistribution.lean`
SHA-256: `6735eb22badc853a504a85ab161f5565a40dda6653e1bcbf2cda1e3946933d11`

```lean
import NumStability.HDP.Scalar.LimitTheorems
import NumStability.HDP.Contracts.C_01_hdef_hstandard_hnormal
import NumStability.HDP.Contracts.C_01_hdef_hzn

/-!
# Contract: HDP Chapter 1 convergence in distribution

Source-facing wrapper for the weak-convergence notion for real random
variables used in Vershynin, *High-Dimensional Probability* (first edition,
2018), Chapter 1.  The mathematics lives in
`NumStability.HDP.Scalar.LimitTheorems`; this module only exposes the stable
source-facing name.
-/

namespace NumStability.HDP.Contract

open MeasureTheory
open ProbabilityTheory

/-- Chapter 1's weak-convergence definition for real random variables. -/
noncomputable def hdp_01_hdef_hconvergence_hin_hdistribution
    {Ω ι : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ]
    (X : ι → Ω → ℝ) (l : Filter ι) (Z : Ω → ℝ)
    (hX : ∀ i, AEMeasurable (X i) μ) (hZ : AEMeasurable Z μ) : Prop :=
  NumStability.HDP.Scalar.LimitTheorems.convergenceInDistribution μ X l Z hX hZ

/--
The literal pointwise-CDF criterion printed after Theorem 1.3.2.  This is kept
separate from weak convergence because the two notions agree in this form only
at continuity points of the limiting CDF.
-/
noncomputable def hdp_01_hdef_hconvergence_hin_hdistribution_pointwise_cdf
    {Ω ι : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ]
    (X : ι → Ω → ℝ) (l : Filter ι) (Z : Ω → ℝ)
    (hX : ∀ i, AEMeasurable (X i) μ) (hZ : AEMeasurable Z μ) : Prop :=
  ∀ t : ℝ, Filter.Tendsto
    (fun i ↦
      NumStability.HDP.Scalar.LimitTheorems.probabilityLaw (X i) (hX i) (Set.Iic t))
    l
    (nhds
      (NumStability.HDP.Scalar.LimitTheorems.probabilityLaw Z hZ (Set.Iic t)))

/-- The literal printed CDF criterion, exposed as a theorem-level audit surface. -/
theorem hdp_01_hdef_hconvergence_hin_hdistribution_pointwise_cdf_spec
    {Ω ι : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ]
    (X : ι → Ω → ℝ) (l : Filter ι) (Z : Ω → ℝ)
    (hX : ∀ i, AEMeasurable (X i) μ) (hZ : AEMeasurable Z μ) :
    hdp_01_hdef_hconvergence_hin_hdistribution_pointwise_cdf μ X l Z hX hZ ↔
      ∀ t : ℝ, Filter.Tendsto
        (fun i ↦
          NumStability.HDP.Scalar.LimitTheorems.probabilityLaw (X i) (hX i) (Set.Iic t))
        l
        (nhds
          (NumStability.HDP.Scalar.LimitTheorems.probabilityLaw Z hZ (Set.Iic t))) :=
  Iff.rfl

/--
Weak convergence gives CDF convergence at a threshold where the limiting law
has no atom.  The missing singleton hypothesis is the standard
continuity-point qualification omitted by the printed prose.
-/
theorem hdp_01_hdef_hconvergence_hin_hdistribution_cdf_at_continuity_point
    {Ω ι : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ]
    (X : ι → Ω → ℝ) (l : Filter ι) (Z : Ω → ℝ)
    (hX : ∀ i, AEMeasurable (X i) μ) (hZ : AEMeasurable Z μ)
    (hweak : hdp_01_hdef_hconvergence_hin_hdistribution μ X l Z hX hZ)
    (t : ℝ)
    (ht : NumStability.HDP.Scalar.LimitTheorems.probabilityLaw Z hZ {t} = 0) :
    Filter.Tendsto
      (fun i ↦
        NumStability.HDP.Scalar.LimitTheorems.probabilityLaw (X i) (hX i) (Set.Iic t))
      l
      (nhds
        (NumStability.HDP.Scalar.LimitTheorems.probabilityLaw Z hZ (Set.Iic t))) := by
  apply MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto hweak
  simpa only [frontier_Iic] using ht

/-- Weak convergence to an atomless law satisfies the book's all-threshold CDF criterion. -/
theorem hdp_01_hdef_hconvergence_hin_hdistribution_pointwise_cdf_of_no_atoms
    {Ω ι : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ]
    (X : ι → Ω → ℝ) (l : Filter ι) (Z : Ω → ℝ)
    (hX : ∀ i, AEMeasurable (X i) μ) (hZ : AEMeasurable Z μ)
    (hweak : hdp_01_hdef_hconvergence_hin_hdistribution μ X l Z hX hZ)
    (hnoAtoms : ∀ t : ℝ,
      NumStability.HDP.Scalar.LimitTheorems.probabilityLaw Z hZ {t} = 0) :
    hdp_01_hdef_hconvergence_hin_hdistribution_pointwise_cdf
      μ X l Z hX hZ := by
  intro t
  exact hdp_01_hdef_hconvergence_hin_hdistribution_cdf_at_continuity_point
    μ X l Z hX hZ hweak t (hnoAtoms t)

/-!
The source-specific boundary below retains the generic reusable definitions
above, but restores the exact context inherited from Theorem 1.3.2: iid
finite-variance variables, the positive standard deviation, the normalized
sums, natural-number convergence to infinity, and the standard-normal limit.
-/

/--
The literal pointwise-CDF meaning of convergence in distribution for the
normalized sums in Theorem 1.3.2.  The source omits the usual continuity-point
qualification; this declaration intentionally preserves that printed wording.
-/
noncomputable def
    hdp_01_hdef_hconvergence_hin_hdistribution_normalized_sum_pointwise_cdf
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ]
    (X : ℕ → Ω → ℝ) (m σ : ℝ)
    (_hσ : 0 < σ)
    (hX : ∀ i, MemLp (X i) 2 μ)
    (_hIndep : ProbabilityTheory.iIndepFun X μ)
    (_hIdent : ∀ i, IdentDistrib (X i) (X 0) μ μ)
    (_hMean : ∫ ω, X 0 ω ∂μ = m)
    (_hVariance : Var[X 0; μ] = σ ^ 2) : Prop :=
  ∀ t : ℝ, Filter.Tendsto
    (fun N : ℕ ↦
      NumStability.HDP.Scalar.LimitTheorems.probabilityLaw
        (hdp_01_hdef_hzn X m σ (N + 1))
        (hdp_01_hdef_hzn_aemeasurable μ X m σ (N + 1)
          (fun i ↦ (hX i).aemeasurable))
        (Set.Iic t))
    Filter.atTop
    (nhds (hdp_01_hdef_hstandard_hnormal_probability (Set.Iic t)))

/-- The exact source-specific pointwise-CDF criterion as a theorem audit surface. -/
theorem
    hdp_01_hdef_hconvergence_hin_hdistribution_normalized_sum_pointwise_cdf_spec
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ]
    (X : ℕ → Ω → ℝ) (m σ : ℝ)
    (hσ : 0 < σ)
    (hX : ∀ i, MemLp (X i) 2 μ)
    (hIndep : ProbabilityTheory.iIndepFun X μ)
    (hIdent : ∀ i, IdentDistrib (X i) (X 0) μ μ)
    (hMean : ∫ ω, X 0 ω ∂μ = m)
    (hVariance : Var[X 0; μ] = σ ^ 2) :
    hdp_01_hdef_hconvergence_hin_hdistribution_normalized_sum_pointwise_cdf
        μ X m σ hσ hX hIndep hIdent hMean hVariance ↔
      ∀ t : ℝ, Filter.Tendsto
        (fun N : ℕ ↦
          NumStability.HDP.Scalar.LimitTheorems.probabilityLaw
            (hdp_01_hdef_hzn X m σ (N + 1))
            (hdp_01_hdef_hzn_aemeasurable μ X m σ (N + 1)
              (fun i ↦ (hX i).aemeasurable))
            (Set.Iic t))
        Filter.atTop
        (nhds (hdp_01_hdef_hstandard_hnormal_probability (Set.Iic t))) :=
  Iff.rfl

end NumStability.HDP.Contract
```
