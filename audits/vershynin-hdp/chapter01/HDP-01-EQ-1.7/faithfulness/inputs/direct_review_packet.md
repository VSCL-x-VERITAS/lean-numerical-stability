# Declaration dossier for HDP-01-EQ-1.7

This dossier describes the theorem statement only. Its proof is excluded.
Interpret every dependency from its supplied declaration; names are not definitions.

## Proof-free source declaration

```lean
theorem hdp_01_heq_h1_d7
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ]
    (X : ℕ → Ω → ℝ) (p : ℝ≥0) (hp0 : 0 < p) (hp1 : p < 1)
    (hX : ∀ i, MemLp (X i) 2 μ)
    (hIndep : iIndepFun X μ)
    (hIdent : ∀ i, IdentDistrib (X i) (X 0) μ μ)
    (hMean : ∫ ω, X 0 ω ∂μ = p.toReal)
    (hVariance : Var[X 0; μ] = p.toReal * (1 - p.toReal)) :
    Tendsto (fun N : ℕ =>
      NumStability.HDP.Scalar.LimitTheorems.probabilityLaw
        (hdp_01_heq_h1_d7_normalizedSum X p N)
        (hdp_01_heq_h1_d7_normalizedSum_aemeasurable
          μ X p N (fun i => (hX i).aemeasurable)))
      atTop (𝓝 hdp_01_hdef_hstandard_hnormal_probability)
```

## Elaborated target type

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω)
  [inst_1 : MeasureTheory.IsProbabilityMeasure μ] (X : Nat → Ω → Real) (p : NNReal),
  instPartialOrderNNReal.lt 0 p →
    instPartialOrderNNReal.lt p 1 →
      ∀ (hX : ∀ (i : Nat), MeasureTheory.MemLp (X i) 2 μ),
        ProbabilityTheory.iIndepFun X μ →
          (∀ (i : Nat), ProbabilityTheory.IdentDistrib (X i) (X 0) μ μ) →
            Eq (MeasureTheory.integral μ fun ω => X 0 ω) p.toReal →
              Eq (ProbabilityTheory.variance (X 0) μ) (instHMul.hMul p.toReal (instHSub.hSub 1 p.toReal)) →
                Filter.Tendsto
                  (fun N =>
                    NumStability.HDP.Scalar.LimitTheorems.probabilityLaw
                      (NumStability.HDP.Contract.hdp_01_heq_h1_d7_normalizedSum X p N) ⋯)
                  Filter.atTop (nhds NumStability.HDP.Contract.hdp_01_hdef_hstandard_hnormal_probability)
```

## Fully explicit elaborated target type

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace.{u_1} Ω] (μ : @MeasureTheory.Measure.{u_1} Ω inst)
  [inst_1 : @MeasureTheory.IsProbabilityMeasure.{u_1} Ω inst μ] (X : Nat → Ω → Real) (p : NNReal)
  (hp0 :
    @LT.lt.{0} NNReal (@Preorder.toLT.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
      (@OfNat.ofNat.{0} NNReal (nat_lit 0) (@Zero.toOfNat0.{0} NNReal instZeroNNReal)) p)
  (hp1 :
    @LT.lt.{0} NNReal (@Preorder.toLT.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal)) p
      (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)))
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
      (NNReal.toReal p))
  (hVariance :
    @Eq.{1} Real
      (@ProbabilityTheory.variance.{u_1} Ω inst (X (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))) μ)
      (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul) (NNReal.toReal p)
        (@HSub.hSub.{0, 0, 0} Real Real Real (@instHSub.{0} Real Real.instSub)
          (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)) (NNReal.toReal p)))),
  @Filter.Tendsto.{0, 0} Nat (@MeasureTheory.ProbabilityMeasure.{0} Real Real.measurableSpace)
    (fun (N : Nat) =>
      @NumStability.HDP.Scalar.LimitTheorems.probabilityLaw.{u_1} Ω inst μ inst_1
        (@NumStability.HDP.Contract.hdp_01_heq_h1_d7_normalizedSum.{u_1} Ω X p N)
        (@NumStability.HDP.Contract.hdp_01_heq_h1_d7_normalizedSum_aemeasurable.{u_1} Ω inst μ X p N fun (i : Nat) =>
          @MeasureTheory.MemLp.aemeasurable.{u_1, 0} Ω Real inst
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
            μ Real.measurableSpace
            (@UniformSpace.toTopologicalSpace.{0} Real
              (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace))
            (@PseudoEMetricSpace.pseudoMetrizableSpace.{0} Real
              (@EMetricSpace.toPseudoEMetricSpace.{0} Real (@MetricSpace.toEMetricSpace.{0} Real Real.metricSpace)))
            Real.borelSpace (X i)
            (@OfNat.ofNat.{0} ENNReal (nat_lit 2)
              (@instOfNatAtLeastTwo.{0} ENNReal (nat_lit 2)
                (@AddMonoidWithOne.toNatCast.{0} ENNReal
                  (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))
                (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                  (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))
            (hX i)))
    (@Filter.atTop.{0} Nat Nat.instPreorder)
    (@nhds.{0} (@MeasureTheory.ProbabilityMeasure.{0} Real Real.measurableSpace)
      (@MeasureTheory.ProbabilityMeasure.instTopologicalSpace.{0} Real Real.measurableSpace
        (@UniformSpace.toTopologicalSpace.{0} Real (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace))
        (@BorelSpace.opensMeasurable.{0} Real
          (@UniformSpace.toTopologicalSpace.{0} Real
            (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace))
          Real.measurableSpace Real.borelSpace))
      NumStability.HDP.Contract.hdp_01_hdef_hstandard_hnormal_probability)
```

## Local import graph

- `AuditTarget` imports: `NumStability.HDP.Contracts.C_01_hthm_h1_d3_d2`, `NumStability.HDP.Contracts.C_01_hdef_hbernoulli_hbinomial`
- `NumStability.HDP.Scalar.LimitTheorems` imports: `Mathlib.Probability.ProbabilityMassFunction.Binomial`, `Mathlib.Probability.ProbabilityMassFunction.Integrals`, `Mathlib.Probability.Distributions.Gaussian.Real`, `Mathlib.Probability.Distributions.Poisson`, `Mathlib.MeasureTheory.Function.ConvergenceInDistribution`, `Mathlib.Probability.StrongLaw`, `Mathlib.Tactic`
- `NumStability.HDP.Scalar.CentralLimit` imports: `NumStability.HDP.Scalar.LimitTheorems`, `Mathlib.Analysis.Calculus.Taylor`, `Mathlib.MeasureTheory.Measure.CharacteristicFunction`, `Mathlib.MeasureTheory.Measure.Prokhorov`, `Mathlib.MeasureTheory.Measure.TightNormed`, `Mathlib.Probability.Independence.CharacteristicFunction`
- `NumStability.HDP.Contracts.C_01_hdef_hstandard_hnormal` imports: `NumStability.HDP.Scalar.LimitTheorems`
- `NumStability.HDP.Scalar.Preliminaries` imports: `Mathlib.Probability.Moments.Variance`, `Mathlib.Probability.CDF`, `Mathlib.MeasureTheory.Function.LpSpace.Basic`, `Mathlib.MeasureTheory.Function.LpSpace.Complete`, `Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm`, `Mathlib.MeasureTheory.Function.LpSeminorm.Indicator`, `Mathlib.Probability.UniformOn`, `Mathlib.Analysis.Convex.Integral`, `Mathlib.Analysis.Convex.Continuous`, `Mathlib.MeasureTheory.Integral.Bochner.Set`, `Mathlib.MeasureTheory.Integral.Lebesgue.Markov`, `Mathlib.MeasureTheory.Integral.Layercake`, `Mathlib.MeasureTheory.Measure.Lebesgue.Integral`, `Mathlib.Probability.Distributions.Cauchy`, `Mathlib.Analysis.SpecialFunctions.NonIntegrable`, `Mathlib.Analysis.SpecialFunctions.Pow.Integral`, `Mathlib.Tactic`
- `NumStability.HDP.Contracts.C_01_hdef_hzn` imports: `NumStability.HDP.Scalar.LimitTheorems`, `NumStability.HDP.Scalar.Preliminaries`
- `NumStability.HDP.Contracts.C_01_hdef_hconvergence_hin_hdistribution` imports: `NumStability.HDP.Scalar.LimitTheorems`, `NumStability.HDP.Contracts.C_01_hdef_hstandard_hnormal`, `NumStability.HDP.Contracts.C_01_hdef_hzn`
- `NumStability.HDP.Contracts.C_01_hthm_h1_d3_d2` imports: `NumStability.HDP.Scalar.CentralLimit`, `NumStability.HDP.Contracts.C_01_hdef_hconvergence_hin_hdistribution`
- `NumStability.HDP.Contracts.C_01_hdef_hbernoulli_hbinomial` imports: `NumStability.HDP.Scalar.LimitTheorems`

## Semantic dependency inventory

`local` declarations are followed recursively through types and bodies. `external-frontier` declarations mark the one-level library trust boundary.

### D001: `NumStability.HDP.Contract.hdp_01_hdef_hstandard_hnormal_probability`

- Role: `local`
- Owner module: `NumStability.HDP.Contracts.C_01_hdef_hstandard_hnormal`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `aa1da11015e45f2b13db37c49c99b58ae5e8430a013b00cc5f07dba27f404aab`

Hash-verified prior declaration review:

- Reuse SHA-256: `11c7df87e6173de4c2d1c6eebf8362408a3de0cbcf2c406acd2fe801bdcdfbd9`
- Reviewed interpretation: Defines the limiting probability measure on the real line.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D002: `NumStability.HDP.Contract.hdp_01_heq_h1_d7_normalizedSum`

- Role: `local`
- Owner module: `AuditTarget`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `37b96abdac1b06f51bcfc8c36b3fb33cffb6d456d7c89406d61b54b0809e7358`

Type:

```lean
{Ω : Type u_1} → (Nat → Ω → Real) → NNReal → Nat → Ω → Real
```

Fully explicit type:

```lean
{Ω : Type u_1} → (X : Nat → Ω → Real) → (p : NNReal) → (N : Nat) → Ω → Real
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} X p N ω =>
  instHMul.hMul
    (Real.instInv.inv (instHMul.hMul (instHMul.hMul (instHAdd.hAdd N.cast 1) p.toReal) (instHSub.hSub 1 p.toReal)).sqrt)
    ((Finset.range (instHAdd.hAdd N 1)).sum fun i => instHSub.hSub (X i ω) p.toReal)
```

### D003: `NumStability.HDP.Contract.hdp_01_heq_h1_d7_normalizedSum_aemeasurable`

- Role: `local`
- Owner module: `AuditTarget`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `d8afa3c5b90f8369d897d6140c0878df539f6048f0a38cf4f4d6315812542b2c`

Type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω) (X : Nat → Ω → Real) (p : NNReal) (N : Nat),
  (∀ (i : Nat), AEMeasurable (X i) μ) → AEMeasurable (NumStability.HDP.Contract.hdp_01_heq_h1_d7_normalizedSum X p N) μ
```

Fully explicit type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace.{u_1} Ω] (μ : @MeasureTheory.Measure.{u_1} Ω inst) (X : Nat → Ω → Real)
  (p : NNReal) (N : Nat) (hX : ∀ (i : Nat), @AEMeasurable.{u_1, 0} Ω Real Real.measurableSpace inst (X i) μ),
  @AEMeasurable.{u_1, 0} Ω Real Real.measurableSpace inst
    (@NumStability.HDP.Contract.hdp_01_heq_h1_d7_normalizedSum.{u_1} Ω X p N) μ
```

### D004: `NumStability.HDP.Scalar.LimitTheorems.probabilityLaw`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.LimitTheorems`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `9eb73233139c77e2ba4b054c7c5db48f89b1ed5c9e6cf501dec07d1ad6a32d63`

Hash-verified prior declaration review:

- Reuse SHA-256: `1bc96aab56cbd7740f456146e7901ea2971e947a242b83c66f1382f9f5a21d62`
- Reviewed interpretation: Forms the probability distribution of an almost-everywhere measurable real function.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D005: `NumStability.HDP.Contract.hdp_01_hdef_hstandard_hnormal`

- Role: `local`
- Owner module: `NumStability.HDP.Contracts.C_01_hdef_hstandard_hnormal`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `382878b1bd0a9d6cebdea15c2dd2437c40145d9d7ab53f99b4aae6b52bc725eb`

Hash-verified prior declaration review:

- Reuse SHA-256: `57d569797de249462ce624434d3e1a0d176ca0030e4eed08484b872d522f5a71`
- Reviewed interpretation: Provides the underlying real measure of the limiting probability measure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D006: `NumStability.HDP.Contract.hdp_01_hdef_hstandard_hnormal_probability._proof_1`

- Role: `local`
- Owner module: `NumStability.HDP.Contracts.C_01_hdef_hstandard_hnormal`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `8c3066a33771ff7325f98fe5ba4bc0c45687dea2887ceaca5d166ff6aa5179a7`

Hash-verified prior declaration review:

- Reuse SHA-256: `08dd4d5889ef2bcfa14455f82f1e7a191c7cbfbcfd66b865a06d3f2088313cf2`
- Reviewed interpretation: Certifies that the limiting measure has total mass one.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D007: `NumStability.HDP.Scalar.LimitTheorems.standardNormalLaw`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.LimitTheorems`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `9412a1f926c86022e6b7cb277033a1601cac842fa5ef3f2c6bc35f23d7cb4784`

Hash-verified prior declaration review:

- Reuse SHA-256: `8fe1cc501a9e1ca8e8e734370686afafef697c514514c64bcfa61f8b5b15db0f`
- Reviewed interpretation: Identifies the limit as the real Gaussian distribution with mean zero and variance one.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D008: `AddCommMonoidWithOne.toAddMonoidWithOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `07f48d3cfc3c7c30b6298df8531409d9844ab8c7e0ba94dea2a3fd29879320af`

Hash-verified prior declaration review:

- Reuse SHA-256: `66942c0b556667aaac9896d020d7f6c07cde91ef3a6534d7b1118bfb2c48ebbd`
- Reviewed interpretation: Provides numeral-cast algebra infrastructure without proposition-level content.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D009: `AddMonoidWithOne.toNatCast`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6b956e88ee642e7533983b76ff8087f4537eea04f025165ce1fa45dc80e795a2`

Hash-verified prior declaration review:

- Reuse SHA-256: `7c858725ff4b5ba33fbcddd617c265c627859c55b152a49d631b2e8c78a857b0`
- Reviewed interpretation: Interprets the numeral two in the L² exponent.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D010: `BorelSpace.opensMeasurable`

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

### D011: `ContinuousENorm.toENorm`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `31fb1ad5ceaae342dc2fe1c1f2eba1b18e67d9d01a5451201d210b585bde97c0`

Hash-verified prior declaration review:

- Reuse SHA-256: `7f3d5e9041746a83f81888b98245471041e0fca9bcbd6e0583e3e6c23842789c`
- Reviewed interpretation: Provides the extended-norm structure required by square-integrability.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D012: `EMetricSpace.toPseudoEMetricSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.EMetricSpace.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `4aefb670bfbc5df01eb5fda5dd77825063374311005c7f96e5c13d514c7c3927`

Type:

```lean
{α : Type u} → [self : EMetricSpace α] → PseudoEMetricSpace α
```

Fully explicit type:

```lean
{α : Type u} → [self : EMetricSpace.{u} α] → PseudoEMetricSpace.{u} α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : EMetricSpace α] => self.1
```

### D013: `ENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5b8f4d61311ebccecf6a54ceca44191d394e0108c8596129a77f03c15a7e457f`

Hash-verified prior declaration review:

- Reuse SHA-256: `93275317fe0a4107f9ad2e986ad6cea33dc9fd4327acc367a381cdced64b746b`
- Reviewed interpretation: Provides the extended nonnegative real type used for the L² exponent.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D014: `Eq`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `63e9afa87e04d13393a2fe09e8e76489d96be3982734b4b40a52fc6ebea863d7`

Hash-verified prior declaration review:

- Reuse SHA-256: `2fbdcb5d8cd93616cc2c73628ee6730f451dc9e98babca41a09e1379e5efaebd`
- Reviewed interpretation: Interprets the stated mean and variance equations as equality.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D015: `Filter.Tendsto`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Filter.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7e5f54349644c32198960083c0e0eb6c033c80a8656d02a78b3eae9a4f5131f2`

Hash-verified prior declaration review:

- Reuse SHA-256: `f88dda70d6159b31f63535db2faff7f61af3ff095b8fd56b991ef1470c17efd3`
- Reviewed interpretation: Expresses filter convergence of cumulative probabilities.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D016: `Filter.atTop`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Filter.AtTopBot.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f743a11da6fe9e156755f41ec35f4d61b87ca4af4575ede456b477a74caa45f3`

Hash-verified prior declaration review:

- Reuse SHA-256: `5c7e510d5e46dda407d76eafd64c962fa0cef34f29be3462c774a134fc4fd2c1`
- Reviewed interpretation: Specifies that the natural-number parameter tends to infinity.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D017: `HMul.hMul`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `4e00447a4a8ef4c2ce13e307c56a1fbcd7fa8c732fe039a452b42477a50df2c6`

Hash-verified prior declaration review:

- Reuse SHA-256: `46de4360c87dd03a502edff1a10496b1e199a83ba84d36430512adb6fe03a047`
- Reviewed interpretation: Supplies multiplication used in normalization and scaling.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D018: `HSub.hSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `98025b38d523c0eadea77ba4961a20b2a913b23c079c4bfeba24a7bfaa24a4bc`

Hash-verified prior declaration review:

- Reuse SHA-256: `be3bb99427523e539bd73160ba97562833058663a46aedaffee51a40051f9a96`
- Reviewed interpretation: Supplies subtraction used to center each variable.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D019: `InnerProductSpace.toNormedSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.InnerProductSpace.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `683435a8d27d50ec1482d74d23f541d52d05ff0411c60f88d16c32132aca9f3e`

Hash-verified prior declaration review:

- Reuse SHA-256: `04a128dc8b1981209fcc692470f563ceeb507a6a0c976f2416dfe7a1540bf6db`
- Reviewed interpretation: Supplies real normed-space structure required by integration.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D020: `LT.lt`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `fd5699899f1a49c91982cb363d3a71557ab1b53ee772cd777c9ee7717abc2009`

Hash-verified prior declaration review:

- Reuse SHA-256: `86806c84aab782cf98f4f17bdabc7f3270efef16903bc70729389ec920b5dbf2`
- Reviewed interpretation: Interprets the strict positivity assumption on sigma.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D021: `MeasurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.MeasurableSpace.Defs`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `6825e55082259c6be2028d5ee0624c796293eccdd78af118da4583180067d196`

Hash-verified prior declaration review:

- Reuse SHA-256: `c4fc365ea876db389b56302f62c6dec2f4899e09c3b2adc2121f76cf7ac883db`
- Reviewed interpretation: Provides the measurable-space structure on the sample space.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D022: `MeasureTheory.IsProbabilityMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Typeclasses.Probability`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `f88b269cb95d165125e7553fd22f97d6e5f9b1b9bcdec7f6738a781dc674bf89`

Hash-verified prior declaration review:

- Reuse SHA-256: `62a62fd1e3e9d039fc8163dafcd2196ca86f629ffacce689a4eca7542b809f79`
- Reviewed interpretation: Expresses that the underlying measure is a probability measure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D023: `MeasureTheory.Measure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `ba8c23c70f3135407096406cee0b4d7d9f02d088e8b1d1a1e105071821a3a51b`

Hash-verified prior declaration review:

- Reuse SHA-256: `1d8774af3d5c4143f74bea4c40208efa16ab3a06eab22c713cb5e3d752bf3e57`
- Reviewed interpretation: Provides the measure type of the underlying probability measure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D024: `MeasureTheory.MemLp`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.LpSeminorm.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `3d38a386250cbaad2a5c216f9bf80b5f748106d4406c769283ef0114b4f42398`

Hash-verified prior declaration review:

- Reuse SHA-256: `b849b60ec2fef2c886665f1ff759507ce254b508e4bea3e7cd0dc00405b8e6b0`
- Reviewed interpretation: Expresses square-integrability of every summand.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D025: `MeasureTheory.MemLp.aemeasurable`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.LpSeminorm.Defs`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `c933033b2554c108a3de28c868fa2af33dab41599a7a06fdbcaa9fd8e0c96994`

Type:

```lean
∀ {α : Type u_1} {ε : Type u_2} {m0 : MeasurableSpace α} [inst : ENorm ε] {μ : MeasureTheory.Measure α}
  [inst_1 : MeasurableSpace ε] [inst_2 : TopologicalSpace ε] [TopologicalSpace.PseudoMetrizableSpace ε] [BorelSpace ε]
  {f : α → ε} {p : ENNReal}, MeasureTheory.MemLp f p μ → AEMeasurable f μ
```

Fully explicit type:

```lean
∀ {α : Type u_1} {ε : Type u_2} {m0 : MeasurableSpace.{u_1} α} [inst : ENorm.{u_2} ε]
  {μ : @MeasureTheory.Measure.{u_1} α m0} [inst_1 : MeasurableSpace.{u_2} ε] [inst_2 : TopologicalSpace.{u_2} ε]
  [@TopologicalSpace.PseudoMetrizableSpace.{u_2} ε inst_2] [@BorelSpace.{u_2} ε inst_2 inst_1] {f : α → ε} {p : ENNReal}
  (hf : @MeasureTheory.MemLp.{u_1, u_2} α ε m0 inst inst_2 f p μ), @AEMeasurable.{u_1, u_2} α ε inst_1 m0 f μ
```

### D026: `MeasureTheory.ProbabilityMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.ProbabilityMeasure`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `251bef2162749e0bcb67a1413765bc7556e9854c7a23036b986ada6a2e2958be`

Hash-verified prior declaration review:

- Reuse SHA-256: `48a06fe8ff058e64d7fb3744f04bcd08a7f3273e05f6029cbcdd237bc20e718b`
- Reviewed interpretation: Provides the type of probability measures used for laws and the Gaussian limit.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D027: `MeasureTheory.ProbabilityMeasure.instTopologicalSpace`

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

### D028: `MeasureTheory.integral`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Integral.Bochner.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `428563f3d6b771605a3267457bf33b62ec2efa91a42b57b96121b85c0269a9ab`

Hash-verified prior declaration review:

- Reuse SHA-256: `d65db63fd6f2c73e1de18d47b163be90f96f2ffb36f3795569ebe12a48972f83`
- Reviewed interpretation: Defines the integral used to state the common mean.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D029: `MetricSpace.toEMetricSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.MetricSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `cd621fc067b2485b3c7e73f6ef91e8a0b080e6e54e99ff2ac1e9edd76e6e64e3`

Type:

```lean
{γ : Type w} → [MetricSpace γ] → EMetricSpace γ
```

Fully explicit type:

```lean
{γ : Type w} → [MetricSpace.{w} γ] → EMetricSpace.{w} γ
```

Definition body (one-level semantic boundary):

```lean
fun {γ} [MetricSpace γ] => EMetricSpace.ofT0PseudoEMetricSpace γ
```

### D030: `NNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `490ebc1f72b3ced8506e1bcbd0016d4c351adf097644509fd1dd17a93c4e950f`

Hash-verified prior declaration review:

- Reuse SHA-256: `a270fe07de4faa9ab8fd78fbfe1bdf2b54ff36d9ea58fe5e53d8ad9c6a57dda9`
- Reviewed interpretation: Provides the nonnegative-real type used by probability-measure infrastructure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D031: `NNReal.toReal`

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

### D032: `Nat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `2e1c25ca42e1e377a41827f0d2f09ae02cfb28ab155c30e277f1000f5e79b32c`

Hash-verified prior declaration review:

- Reuse SHA-256: `cd23ab6c30a96e06896654dc0ea23359eadd2dc843007ce69bb4243ea2a84ebd`
- Reviewed interpretation: Provides the natural-number index and partial-sum parameter type.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D033: `Nat.instAtLeastTwoHAddOfNat`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Init`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `309ef94c4b7cfbe2e668952e6915279353921d5d48b6123a30f90dd932dac3e6`

Hash-verified prior declaration review:

- Reuse SHA-256: `a4707113158f33e7e4bc25332d1805d3617551ed41175f98743dbde134c9c7b0`
- Reviewed interpretation: Provides technical arithmetic evidence for the L² exponent.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D034: `Nat.instNeZeroSucc`

- Role: `external-frontier`
- Owner module: `Init.Data.Nat.Basic`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `a0735a528184c05594c4c79312c1225bb4dcffcdf0df7eb1a50c5733047c85ad`

Hash-verified prior declaration review:

- Reuse SHA-256: `7effb9cdd863b9e70764c30e967b6ee963539d35f352350d2c27875acbf365cc`
- Reviewed interpretation: Provides nonzero-successor numeral infrastructure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D035: `Nat.instPreorder`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5ea89e9915200c8782bc933f9184e28eb38f4c9610b00cf1310cc6e6435642d8`

Hash-verified prior declaration review:

- Reuse SHA-256: `dfc0a258a8c71c63f6145edbe01182143a2016aa623a49affac3305ef9971509`
- Reviewed interpretation: Supplies the natural-number preorder underlying the limit at infinity.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D036: `NonUnitalSeminormedCommRing.toNonUnitalSeminormedRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `c697ff5e735ebe18733e51950717037e73ba73e94ac2e99953bfb521708cabd2`

Hash-verified prior declaration review:

- Reuse SHA-256: `05d2c577ca1feafcd74dbd7796ca570ecff78b7932658fb04a551b0b130a20f5`
- Reviewed interpretation: Projects standard real normed-ring structure; it adds no proposition-level content.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D037: `NonUnitalSeminormedRing.toSeminormedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `db7996fa414ad67340b9d6991cd145ac2a5d251a870097d20f2f63e371fb101d`

Hash-verified prior declaration review:

- Reuse SHA-256: `b84e02bc59b5c97edb09291877055c1b3c61ba502dc4cfbb2f182fad6a4cd6b3`
- Reviewed interpretation: Projects standard real normed-ring structure; it adds no proposition-level content.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D038: `NormedAddCommGroup.toSeminormedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7327759e5e9417c54393e7566584cd72d79c77b4ca018ea408c5d024667587be`

Hash-verified prior declaration review:

- Reuse SHA-256: `a94a022cada067b0ff0fd636d8da2fc8edf90c435e37d158ae5b3720b8e5dbe6`
- Reviewed interpretation: Projects standard real normed-ring structure; it adds no proposition-level content.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D039: `NormedCommRing.toSeminormedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `ad504b2606febc5a066d58ac540c9826bd1b7fce734d59a7fef63c7c27112fe3`

Hash-verified prior declaration review:

- Reuse SHA-256: `d459dde011db1d02bc0164381f789fd2d29b8062cb2907ff44e3931a43db73a3`
- Reviewed interpretation: Projects standard real normed-ring structure; it adds no proposition-level content.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D040: `OfNat.ofNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6a6a0720d091cfeb582747fe67b977e948f09706c0beae1f2f21830aa5821ead`

Hash-verified prior declaration review:

- Reuse SHA-256: `1c77d8393e1df82f75e0ea6c72092e4692522a66185a7b4e718f2f827b8cb8ac`
- Reviewed interpretation: Interprets numeric literals in their ambient types.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D041: `One.toOfNat1`

- Role: `external-frontier`
- Owner module: `Init.Data.Zero`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `cc544b5b2a2aabc84389a9fe2f052127dc6dae9964782b117b9b19b773e542d5`

Hash-verified prior declaration review:

- Reuse SHA-256: `8653071bb4cc153810cae94c24dfb04ff86a5e5626571818d3d2031deb85e196`
- Reviewed interpretation: Interprets one as a numeric literal.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D042: `PartialOrder.toPreorder`

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

### D043: `Preorder.toLT`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Defs.PartialOrder`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `8fcf5a8f5a8899408a8cdc310bc44f6f7b84a21905a114103fbc65083f779a43`

Type:

```lean
{α : Type u_2} → [self : Preorder α] → LT α
```

Fully explicit type:

```lean
{α : Type u_2} → [self : Preorder.{u_2} α] → LT.{u_2} α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : Preorder α] => self.2
```

### D044: `ProbabilityTheory.IdentDistrib`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.IdentDistrib`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `bfa67f6784b6c21a24b3b314a4519e3b86d23bd01bd4ecacbf50d4c9faa0d03e`

Hash-verified prior declaration review:

- Reuse SHA-256: `f48a1a505b6ca3bf9a37234fe58c7158fb409049a67451e49e73d4691c9590a2`
- Reviewed interpretation: Expresses that every summand has the same distribution as the first.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D045: `ProbabilityTheory.iIndepFun`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.Independence.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `fc42c9fb6cb6d72ada8e7605b71644561e188fc9c555246dd3ef51d84fa13130`

Hash-verified prior declaration review:

- Reuse SHA-256: `0301b20410237110042b617f4e8cd223a0248a13144ce3093640fd273ae81cb3`
- Reviewed interpretation: Expresses mutual independence of the indexed family.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D046: `ProbabilityTheory.variance`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.Moments.Variance`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `2eb32ed492bfdd1df3ad84f7e963b9d4f0347489111c9ee4dddf93da3947d3a2`

Hash-verified prior declaration review:

- Reuse SHA-256: `d95a38de8692b290a88eaae2dd9c191f23d2572112b77dcd13edfad853ea2326`
- Reviewed interpretation: Defines the variance used in the common-variance hypothesis.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D047: `PseudoEMetricSpace.pseudoMetrizableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.Metrizable.Uniformity`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `a8bd2aa25ad6c5513ba32cf8906fa9ffb4b28848a86906b70a2ffcec8c38a975`

Type:

```lean
∀ {α : Type u_2} [inst : PseudoEMetricSpace α], TopologicalSpace.PseudoMetrizableSpace α
```

Fully explicit type:

```lean
∀ {α : Type u_2} [inst : PseudoEMetricSpace.{u_2} α],
  @TopologicalSpace.PseudoMetrizableSpace.{u_2} α
    (@UniformSpace.toTopologicalSpace.{u_2} α (@PseudoEMetricSpace.toUniformSpace.{u_2} α inst))
```

### D048: `PseudoMetricSpace.toUniformSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.MetricSpace.Pseudo.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `a6831039b3ad5e37bd0e7692fd995a699d8bef791976e20262da929990521799`

Hash-verified prior declaration review:

- Reuse SHA-256: `0178626f5c1ca236f1c40973a3170008f554ea7c395619c33b98dda64b8c9d7b`
- Reviewed interpretation: Supplies standard metric structure on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D049: `RCLike.toInnerProductSpaceReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.InnerProductSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f602276baee30d3dbe02bd6b756a9097f750d59a7f91ca7635dcfc935fd22981`

Hash-verified prior declaration review:

- Reuse SHA-256: `aea6a60c061ce0b537fe9bac983524174ddda6951a0ceec6242816f243daa794`
- Reviewed interpretation: Supplies standard inner-product structure on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D050: `Real`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `38529f0578472feffc4c79d5d0755fa10fc3edafb232ab5e442336d13630ee90`

Hash-verified prior declaration review:

- Reuse SHA-256: `7a8d77363b659c3f2997a91e70fa188de1f010b358ea65757364f84b111272c8`
- Reviewed interpretation: Provides the real-number type for summands, parameters, thresholds, sums, and limits.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D051: `Real.borelSpace`

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

### D052: `Real.instMul`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `459ccbe28a1d29ccd2b329ea29e1a84b329b8064b8a8ecc52764b69b23e229ed`

Hash-verified prior declaration review:

- Reuse SHA-256: `b30b313444c3003b9f758af4830e1b4f467ff900242439b067ebabf01be6f7f0`
- Reviewed interpretation: Supplies the standard multiplication on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D053: `Real.instOne`

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

### D054: `Real.instRCLike`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.RCLike.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `d2fdb97b9d861fcf61e6dbea9993dfa0ca6aa16609742f215c35b3f7ddd16b8e`

Hash-verified prior declaration review:

- Reuse SHA-256: `43b7e820bb1ec4ba0a22be8d1454f8ae8aa4d0e735edf9279bb816df746a0c67`
- Reviewed interpretation: Supplies standard real-like analytic structure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D055: `Real.instSub`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `926d9e8fcca2819a885d446e168b20c7c8aac2e542d59ed2b48e32c9a4659a36`

Hash-verified prior declaration review:

- Reuse SHA-256: `1176e160a013321a9beeb741c3e49498e348afa194524525684e7c7c9bf3a320`
- Reviewed interpretation: Supplies the standard subtraction on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D056: `Real.measurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Constructions.BorelSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `51b107725c4edbe40e50ff5651a2c7ee5a10037e341c2764964a6d6cc26d82a1`

Hash-verified prior declaration review:

- Reuse SHA-256: `568b0c5dfea96113defffc3a0b1bdd3a95beedf8438d93e3c04003ff1b2e603f`
- Reviewed interpretation: Supplies the standard measurable structure on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D057: `Real.metricSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.MetricSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `0614925d77ef3779cbbc10d01b88785252b973fe99c4daf54fccc2e5fc256483`

Type:

```lean
MetricSpace Real
```

Fully explicit type:

```lean
MetricSpace.{0} Real
```

Definition body (one-level semantic boundary):

```lean
MetricSpace.ofT0PseudoMetricSpace Real
```

### D058: `Real.normedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Real`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `9ff0d896c635e2a38531d689d24ee70cfffa41565354ce15f6ff59b51650bd93`

Hash-verified prior declaration review:

- Reuse SHA-256: `3bb6288c00e4755bb2792e269b0bb37bc1b4130bed291c99cb9c66d9eb0ad526`
- Reviewed interpretation: Supplies the standard normed additive structure on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D059: `Real.normedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `69cccc1e864661e103785f4a2712b9ad164d845c03b7737801c37e5ac852bad7`

Hash-verified prior declaration review:

- Reuse SHA-256: `e969be1df6e925a8b4ecc13f4ae341a750139f06153468363e02efafe30db75a`
- Reviewed interpretation: Supplies the standard normed commutative ring structure on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D060: `Real.pseudoMetricSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.MetricSpace.Pseudo.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `9c0d1d56a04dd3ae3fce36b5fb3c2f4fe632c2bdaed84b5667c1a60a03491a3e`

Hash-verified prior declaration review:

- Reuse SHA-256: `01a2a2e62f5075a57a317e272166cc018a40fd8ceeaa7f41c5fc96ef590f0dbf`
- Reviewed interpretation: Supplies the standard metric structure on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D061: `SeminormedAddCommGroup.toSeminormedAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8cf35215f509cdee10a3a95158cbaadd3c5fb584bc0d1f4fad6ecfc69b1bd205`

Hash-verified prior declaration review:

- Reuse SHA-256: `dd8692a1ff92f5b346b60c083fac1a6afd150439f419e91bef7ec153098b68e9`
- Reviewed interpretation: Projects standard seminormed additive structure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D062: `SeminormedAddGroup.toContinuousENorm`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Continuity`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `17a83cbf3059dd0bbaefd43c93ce329f1d6b760d440889322b3582a18b23a141`

Hash-verified prior declaration review:

- Reuse SHA-256: `68331466a3787aab05ed681a7013cf7078bb365e87be494779b5b91d5e43cb01`
- Reviewed interpretation: Projects standard continuous extended-norm structure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D063: `SeminormedAddGroup.toPseudoMetricSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `d4043bb9912319b688406ba77c3a5b0fdd8f53ab605cf1962721b51314c66d3f`

Hash-verified prior declaration review:

- Reuse SHA-256: `9dfd60464221d92a5a1924531013711dfd132b5aeb5d8eebf7fd83d3fe34e9c9`
- Reviewed interpretation: Projects standard pseudometric structure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D064: `SeminormedCommRing.toNonUnitalSeminormedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `a29f0377c9baf2265c34aaf85b852e7c4260b34d2dc04574484c335ebc09a6e9`

Hash-verified prior declaration review:

- Reuse SHA-256: `e433cc3516f2dc163344c79a1735234997b1ab9f613d4a8c0f5214a198b50a9c`
- Reviewed interpretation: Projects standard seminormed commutative-ring structure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D065: `UniformSpace.toTopologicalSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.UniformSpace.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `4d18df801a98905221e0935ec2ddacda684a1430b8d198ebc23fad0643bce2a8`

Hash-verified prior declaration review:

- Reuse SHA-256: `f027d1ad22572dfa5a7872b7682e5118d9d785ec930a75ff90718cf9a01a79d1`
- Reviewed interpretation: Projects the topology from the standard uniform structure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D066: `Zero.toOfNat0`

- Role: `external-frontier`
- Owner module: `Init.Data.Zero`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f7ebe8a983de002c1ee751fd3c144a7c1933b3bb95c87c5001a3cabf5709031a`

Hash-verified prior declaration review:

- Reuse SHA-256: `e02f3cb59917161e065d397ff6028903cb249068e68076f0653f0988d19a4b27`
- Reviewed interpretation: Interprets zero as a numeric literal.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D067: `instAddCommMonoidWithOneENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `31d9551885e3007e5d1368365622cfd7638ea41cc6d885234041621de873f55c`

Hash-verified prior declaration review:

- Reuse SHA-256: `512ea524995607aebc75e198dfdc30001a0d0be94f2af08490129566067dc7fb`
- Reviewed interpretation: Supplies additive and numeral structure on extended nonnegative reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D068: `instHMul`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `1fd375514ac68e29e7941c94ba308ea936395db23d0fee63a5c69dcccd3b2bdc`

Hash-verified prior declaration review:

- Reuse SHA-256: `a288b24ad5be377862569bc0e8cf5d704393d5b3b3bcb1d0832437a4a4ecac7b`
- Reviewed interpretation: Supplies heterogeneous multiplication infrastructure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D069: `instHSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `aa782f2b5af3d068f4c5340de4b32b193fece2c659a45582cc3024a19b550c87`

Hash-verified prior declaration review:

- Reuse SHA-256: `0971f5c3d9345f4c2b5b017d588fc2d8a62cbd8674a767fd090c2e4948bf34c0`
- Reviewed interpretation: Supplies heterogeneous subtraction infrastructure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D070: `instOfNatAtLeastTwo`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `37355febc51d6fa8ff12fc8e7b429771db340390d46411d7608c566bdffd358d`

Hash-verified prior declaration review:

- Reuse SHA-256: `868e99685e149ef288d70e82aa1ac3c410a0d19a4abdfc690eb4eb02abe50550`
- Reviewed interpretation: Supplies the at-least-two numeral instance.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D071: `instOfNatNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7018dea92aae8c272f3a065f25e2bedb9732a0b602c3d54b166fa0cf2ce1ea92`

Hash-verified prior declaration review:

- Reuse SHA-256: `e1f7cbf9bcaab56c56a265dd99b1192070b6aee07547b2cb316ae31ea702e977`
- Reviewed interpretation: Supplies numeral infrastructure on natural numbers.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D072: `instOneNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `be1ba7c9e9b4395e59c17c7a89b726801d594c6c78763ffff9bb49c61ecf93a2`

Hash-verified prior declaration review:

- Reuse SHA-256: `e7776302864b39c5b832767b96c5372022cf997f300f8220106c99e5a3abfda4`
- Reviewed interpretation: Supplies the value one in the nonnegative-real structure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D073: `instPartialOrderNNReal`

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

### D074: `instZeroNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7e5325f2345acdef49f085110522dadb25b9bd4fce1907052d4feda3e95afe3b`

Type:

```lean
Zero NNReal
```

Fully explicit type:

```lean
Zero.{0} NNReal
```

Definition body (one-level semantic boundary):

```lean
Nonneg.zero
```

### D075: `nhds`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.Defs.Filter`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8eb445823f4b15a765f7e0cd634f73196d36b4f09054d2aef43a69d3138c6ce8`

Hash-verified prior declaration review:

- Reuse SHA-256: `af8e14dbfba64c6ab13836ca6e8f1a8277fff5eb6ab0bd427ab1ae549cb288a1`
- Reviewed interpretation: Supplies the neighborhood filter used for convergence.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D076: `AEMeasurable`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `6dc48478b911cadddc9129039bc8859282262cccd65bca8d46f3cdc5415a69cd`

Hash-verified prior declaration review:

- Reuse SHA-256: `6fb93e246d111256e2aba1ae97514006283fd30ce225d755c7b7fe8fdf174220`
- Reviewed interpretation: Expresses almost-everywhere measurability of normalized finite sums.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D077: `Finset.range`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Finset.Range`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `0d8947d3b91a57604f7b7be615f2ff236f2058a47281af31ea2498635666e9e7`

Hash-verified prior declaration review:

- Reuse SHA-256: `55fece3506fd999763636cb4fd179d3a55274ce69d8a335b707710dd036b18fe`
- Reviewed interpretation: Defines the finite range of indices for each partial sum.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D078: `Finset.sum`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.BigOperators.Group.Finset.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `931ceac4e9efb5833f58970d10ced4621362e020ea1119492a8d379b7e692372`

Hash-verified prior declaration review:

- Reuse SHA-256: `5d8e72998273361861d5237b9b3cff0a8f3bb4caf1a7320ff1589feb1b3633c3`
- Reviewed interpretation: Forms the finite sum of centered random variables.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D079: `HAdd.hAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `e0bf2a92addd6ea713343e4ef69f67e4e1155781d08f46957b9f71412d865f59`

Hash-verified prior declaration review:

- Reuse SHA-256: `daf272f24d14812178268204820799042233940fb96c6a5a7b129d568799fe05`
- Reviewed interpretation: Forms N plus one, producing the first N+1 variables.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D080: `Inv.inv`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `c3aea3c6e2edd31a7b2cf071814315808ef7d84fd01d8c9b719313846ebca438`

Hash-verified prior declaration review:

- Reuse SHA-256: `f8813b6c8ab1815521ccfeffcfe021793450953286954f2183dad4eeb8cacc35`
- Reviewed interpretation: Supplies inversion used to divide by sigma times square root N.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D081: `MeasureTheory.Measure.isProbabilityMeasure_map`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Typeclasses.Probability`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `5624854207c8bee28341ec39de7199a37aa6780067b481804214a292b0055dc0`

Hash-verified prior declaration review:

- Reuse SHA-256: `4f129e7bff978912a7f9f2c080539d255bc81388479835a86f102ee8bb8f431f`
- Reviewed interpretation: Certifies that the pushforward of the probability measure remains a probability measure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D082: `MeasureTheory.Measure.map`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Map`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `35d0f192bfc92d083756f0df86ca1ad37f0c1f0bfa39120f6adf90414c4a3b75`

Hash-verified prior declaration review:

- Reuse SHA-256: `75e76854f3970b1ffcd601bb1316e75a0d74a234d95c663c5c3bc573815d183f`
- Reviewed interpretation: Defines pushforward measure and hence each normalized-sum law.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D083: `Nat.cast`

- Role: `external-frontier`
- Owner module: `Init.Data.Cast`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `6e24327ea908b1837083bb15aef27d593e950a2ff8ade81d8aa94bfe33b64450`

Hash-verified prior declaration review:

- Reuse SHA-256: `4867101fef65592b49c784f70211cd7adc2b693a388088605d6938a791d9cb8c`
- Reviewed interpretation: Casts the natural sample size to a real before taking its square root.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D084: `Real.instAdd`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `f99208c181266311bec9c890b688378f329076f9e6be38fe93d9cedf4d7f50ce`

Type:

```lean
Add Real
```

Fully explicit type:

```lean
Add.{0} Real
```

Definition body (one-level semantic boundary):

```lean
{ add := Real.add✝ }
```

### D085: `Real.instAddCommMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `11a549e6c9caa007a4627570dd86aea756ada755f141da0356b8766788f2eef7`

Hash-verified prior declaration review:

- Reuse SHA-256: `f0d20f63981817c7a72d741b4f8a17804ae07af0811e2d470640d84317fd0d7b`
- Reviewed interpretation: Supplies the standard additive commutative monoid on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D086: `Real.instInv`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `8996fd673a1e2289aaf761085a60a161bdafebda8cdd48d1efb3c89da1382980`

Hash-verified prior declaration review:

- Reuse SHA-256: `26ff15844a87756950382a416215b32d97b58ebe5af2ecc096926eded25d3cac`
- Reviewed interpretation: Supplies the standard inverse on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D087: `Real.instNatCast`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `5fc7a7becbc71d472fa1a28bd92d79b4c6ea4fdc643db7380031a2b890ca7e15`

Hash-verified prior declaration review:

- Reuse SHA-256: `eeff4195e173aef65480ea875909f1d41267f8287671a803cca7445c78b68a96`
- Reviewed interpretation: Supplies the standard natural-number cast into the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D088: `Real.sqrt`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Sqrt`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `67f9248ae1acb851b5392be301057ebb8b8ef2fb20f76d2d53a2d07ec8f30553`

Hash-verified prior declaration review:

- Reuse SHA-256: `49c66bc66b4cf9c4b953ad44cd2206d456daede20609ef30c21f89533a9725dd`
- Reviewed interpretation: Defines the nonnegative square root appearing in the normalization.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D089: `Subtype.mk`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `constructor`
- Distance from target type: `2`
- Semantic SHA-256: `488ac61b6d3c07fb9a2f54a03a39e6001a4c7cedfd07515f0f9865e7fef9ef51`

Hash-verified prior declaration review:

- Reuse SHA-256: `d9f599a505ad142d9de2064d229b136c5424daa9ba6c034326c5fa76e1a4f7ff`
- Reviewed interpretation: Constructs a bundled probability measure from a measure and its probability proof.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D090: `instAddNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `a1534bcd3e1888406ac787d30eeff8a284cb6688c23f5e8de09351dda91a280c`

Hash-verified prior declaration review:

- Reuse SHA-256: `8d7fcdf15a48d3cc169b05b3f720a11d17470e5d48b92cde112411412fa91932`
- Reviewed interpretation: Supplies natural-number addition infrastructure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D091: `instHAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `38066efd17aeeca52ec2890d9aafca2fa3cce8fda7f5843c1b8e5da130d93981`

Hash-verified prior declaration review:

- Reuse SHA-256: `2afc86e734eed3f50fc8591199d9d300c901bed8fb81e40a5b44318dc13a96f9`
- Reviewed interpretation: Supplies heterogeneous addition infrastructure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D092: `ProbabilityTheory.gaussianReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.Distributions.Gaussian.Real`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `640e905d8e9530cec4dfeaf3d53f9e2b0e193d42ec6b75a24f451a6c1e866b28`

Hash-verified prior declaration review:

- Reuse SHA-256: `996b393bc6e6f44c96dd94ea6e8a29c6c570be7eeeeb22b0b34553dfb17dde7d`
- Reviewed interpretation: Defines the Gaussian measure with mean zero and variance one.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D093: `Real.instZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `860eaaa75b06ac6fccbf4f27e9e162807e8851d04bb42d2411332c6368b14882`

Hash-verified prior declaration review:

- Reuse SHA-256: `6a483809fbdb1f4e3327a99bd790a006b524075d39b41062c7559c93dc374ba3`
- Reviewed interpretation: Supplies the standard zero of the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.
