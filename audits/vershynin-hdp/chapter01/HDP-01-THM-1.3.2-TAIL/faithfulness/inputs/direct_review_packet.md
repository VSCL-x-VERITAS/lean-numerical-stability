# Declaration dossier for HDP-01-THM-1.3.2-TAIL

This dossier describes the theorem statement only. Its proof is excluded.
Interpret every dependency from its supplied declaration; names are not definitions.

## Proof-free source declaration

```lean
theorem hdp_01_hthm_h1_d3_d2_tail
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ]
    (X : ℕ → Ω → ℝ) (m σ : ℝ) (hσ : 0 < σ)
    (hX : ∀ i, MemLp (X i) 2 μ)
    (hIndep : iIndepFun X μ)
    (hIdent : ∀ i, IdentDistrib (X i) (X 0) μ μ)
    (hMean : ∫ ω, X 0 ω ∂μ = m)
    (hVariance : Var[X 0; μ] = σ ^ 2) (t : ℝ) :
    Tendsto (fun N : ℕ =>
      ((NumStability.HDP.Scalar.LimitTheorems.probabilityLaw
        (hdp_01_hdef_hzn X m σ (N + 1))
        (hdp_01_hdef_hzn_aemeasurable μ X m σ (N + 1)
          (fun i => (hX i).aemeasurable)) : ProbabilityMeasure ℝ) : Measure ℝ)
          (Set.Ici t))
      atTop (𝓝 (ENNReal.ofReal (∫ x in Set.Ici t,
        (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-(x ^ 2) / 2))))
```

## Elaborated target type

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω)
  [inst_1 : MeasureTheory.IsProbabilityMeasure μ] (X : Nat → Ω → Real) (m σ : Real),
  Real.instLT.lt 0 σ →
    ∀ (hX : ∀ (i : Nat), MeasureTheory.MemLp (X i) 2 μ),
      ProbabilityTheory.iIndepFun X μ →
        (∀ (i : Nat), ProbabilityTheory.IdentDistrib (X i) (X 0) μ μ) →
          Eq (MeasureTheory.integral μ fun ω => X 0 ω) m →
            Eq (ProbabilityTheory.variance (X 0) μ) (instHPow.hPow σ 2) →
              ∀ (t : Real),
                Filter.Tendsto
                  (fun N =>
                    MeasureTheory.Measure.instFunLike.coe
                      (NumStability.HDP.Scalar.LimitTheorems.probabilityLaw
                          (NumStability.HDP.Contract.hdp_01_hdef_hzn X m σ (instHAdd.hAdd N 1)) ⋯).toMeasure
                      (Set.Ici t))
                  Filter.atTop
                  (nhds
                    (ENNReal.ofReal
                      (MeasureTheory.integral (Real.measureSpace.volume.restrict (Set.Ici t)) fun x =>
                        instHMul.hMul (Real.instInv.inv (instHMul.hMul 2 Real.pi).sqrt)
                          (Real.exp (instHDiv.hDiv (Real.instNeg.neg (instHPow.hPow x 2)) 2)))))
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
        (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2)))))
  (t : Real),
  @Filter.Tendsto.{0, 0} Nat ENNReal
    (fun (N : Nat) =>
      @DFunLike.coe.{1, 1, 1} (@MeasureTheory.Measure.{0} Real Real.measurableSpace) (Set.{0} Real)
        (fun (x : Set.{0} Real) => ENNReal) (@MeasureTheory.Measure.instFunLike.{0} Real Real.measurableSpace)
        (@MeasureTheory.ProbabilityMeasure.toMeasure.{0} Real Real.measurableSpace
          (@NumStability.HDP.Scalar.LimitTheorems.probabilityLaw.{u_1} Ω inst μ inst_1
            (@NumStability.HDP.Contract.hdp_01_hdef_hzn.{u_1} Ω X m σ
              (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
                (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))))
            (@NumStability.HDP.Contract.hdp_01_hdef_hzn_aemeasurable.{u_1} Ω inst μ X m σ
              (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
                (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))
              fun (i : Nat) =>
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
                (hX i))))
        (@Set.Ici.{0} Real Real.instPreorder t))
    (@Filter.atTop.{0} Nat Nat.instPreorder)
    (@nhds.{0} ENNReal ENNReal.instTopologicalSpace
      (ENNReal.ofReal
        (@MeasureTheory.integral.{0, 0} Real Real Real.normedAddCommGroup
          (@InnerProductSpace.toNormedSpace.{0, 0} Real Real Real.instRCLike
            (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup)
            (@RCLike.toInnerProductSpaceReal.{0} Real Real.instRCLike))
          (@MeasureTheory.MeasureSpace.toMeasurableSpace.{0} Real Real.measureSpace)
          (@MeasureTheory.Measure.restrict.{0} Real
            (@MeasureTheory.MeasureSpace.toMeasurableSpace.{0} Real Real.measureSpace)
            (@MeasureTheory.MeasureSpace.volume.{0} Real Real.measureSpace) (@Set.Ici.{0} Real Real.instPreorder t))
          fun (x : Real) =>
          @HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
            (@Inv.inv.{0} Real Real.instInv
              (Real.sqrt
                (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
                  (@OfNat.ofNat.{0} Real (nat_lit 2)
                    (@instOfNatAtLeastTwo.{0} Real (nat_lit 2) Real.instNatCast
                      (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                        (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))
                  Real.pi)))
            (Real.exp
              (@HDiv.hDiv.{0, 0, 0} Real Real Real
                (@instHDiv.{0} Real (@DivInvMonoid.toDiv.{0} Real Real.instDivInvMonoid))
                (@Neg.neg.{0} Real Real.instNeg
                  (@HPow.hPow.{0, 0, 0} Real Nat Real
                    (@instHPow.{0, 0} Real Nat (@Monoid.toNatPow.{0} Real Real.instMonoid)) x
                    (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2)))))
                (@OfNat.ofNat.{0} Real (nat_lit 2)
                  (@instOfNatAtLeastTwo.{0} Real (nat_lit 2) Real.instNatCast
                    (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                      (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))))))
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

### D001: `NumStability.HDP.Contract.hdp_01_hdef_hzn`

- Role: `local`
- Owner module: `NumStability.HDP.Contracts.C_01_hdef_hzn`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f943669945c9a56ad7767e68c581b1afd29de5a9684965b46e8ea0ec1d6f510c`

Hash-verified prior declaration review:

- Reuse SHA-256: `3a713cbc224f946909cd72b2d55146414df3459b168bafc19cd216c8f8df610c`
- Reviewed interpretation: Defines the normalized centered N-term sum, used at N+1 in the conclusion.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D002: `NumStability.HDP.Contract.hdp_01_hdef_hzn_aemeasurable`

- Role: `local`
- Owner module: `NumStability.HDP.Contracts.C_01_hdef_hzn`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `a78ce8a1b73968a022da54db198c4291beb55c832d13ded7b0f25f699a856798`

Type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω) (X : Nat → Ω → Real) (m σ : Real) (N : Nat),
  (∀ (i : Nat), AEMeasurable (X i) μ) → AEMeasurable (NumStability.HDP.Contract.hdp_01_hdef_hzn X m σ N) μ
```

Fully explicit type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace.{u_1} Ω] (μ : @MeasureTheory.Measure.{u_1} Ω inst) (X : Nat → Ω → Real)
  (m σ : Real) (N : Nat) (hX : ∀ (i : Nat), @AEMeasurable.{u_1, 0} Ω Real Real.measurableSpace inst (X i) μ),
  @AEMeasurable.{u_1, 0} Ω Real Real.measurableSpace inst (@NumStability.HDP.Contract.hdp_01_hdef_hzn.{u_1} Ω X m σ N) μ
```

### D003: `NumStability.HDP.Scalar.LimitTheorems.probabilityLaw`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.LimitTheorems`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `9eb73233139c77e2ba4b054c7c5db48f89b1ed5c9e6cf501dec07d1ad6a32d63`

Hash-verified prior declaration review:

- Reuse SHA-256: `b82e56b85f2157cffe39938bd89d657c1d6863aa45d42b326f68b89d01a7ef88`
- Reviewed interpretation: Forms the probability distribution of an almost-everywhere measurable real function.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D004: `AddCommMonoidWithOne.toAddMonoidWithOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `07f48d3cfc3c7c30b6298df8531409d9844ab8c7e0ba94dea2a3fd29879320af`

Hash-verified prior declaration review:

- Reuse SHA-256: `0adf30cfdec39c8de82467c637c449e863c677881a95bf6ecd6049f4282d1929`
- Reviewed interpretation: Provides numeral-cast algebra infrastructure without proposition-level content.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D005: `AddMonoidWithOne.toNatCast`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6b956e88ee642e7533983b76ff8087f4537eea04f025165ce1fa45dc80e795a2`

Hash-verified prior declaration review:

- Reuse SHA-256: `60d62631723cc3f325e4b41f8c07a80c61f80a8be16ef9c98669ac4373e3c402`
- Reviewed interpretation: Interprets the numeral two in the L² exponent.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D006: `ContinuousENorm.toENorm`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `31fb1ad5ceaae342dc2fe1c1f2eba1b18e67d9d01a5451201d210b585bde97c0`

Hash-verified prior declaration review:

- Reuse SHA-256: `fa4623dca436efeb7e2561a2217a774a7f88453ecc3d67934bf3e766bb3cf714`
- Reviewed interpretation: Provides the extended-norm structure required by square-integrability.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D007: `DFunLike.coe`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.FunLike.Basic`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `9db5c150b3c86d10b50e19602d0c0af9e5012dfe5f13b0d7b57925729f2478f0`

Hash-verified prior declaration review:

- Reuse SHA-256: `cc3ec171ed216ea02f89082690f84c08913ecd08e6b46656bcc992675f651d32`
- Reviewed interpretation: Coerces function-like probability measures to functions.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

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

### D009: `EMetricSpace.toPseudoEMetricSpace`

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

### D010: `ENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5b8f4d61311ebccecf6a54ceca44191d394e0108c8596129a77f03c15a7e457f`

Hash-verified prior declaration review:

- Reuse SHA-256: `e71f1fcb5db33d3febd2eaa81b39ab6ed537eee6ed3f5d898ce10ca6fec06429`
- Reviewed interpretation: Provides the extended nonnegative real type used for the L² exponent.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D011: `ENNReal.instTopologicalSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.Order.Real`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `ebc6006fd0353f495964bbbb90891d2c029fde494e4dad0d0de09c878e7a7b22`

Type:

```lean
TopologicalSpace ENNReal
```

Fully explicit type:

```lean
TopologicalSpace.{0} ENNReal
```

Definition body (one-level semantic boundary):

```lean
Preorder.topology ENNReal
```

### D012: `ENNReal.ofReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `ed3ef7ee60e47d07da43d414f4f32aa69df50f614988267eebc1025b2bef657d`

Type:

```lean
Real → ENNReal
```

Fully explicit type:

```lean
(r : Real) → ENNReal
```

Definition body (one-level semantic boundary):

```lean
fun r => ENNReal.ofNNReal r.toNNReal
```

### D013: `Eq`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `63e9afa87e04d13393a2fe09e8e76489d96be3982734b4b40a52fc6ebea863d7`

Hash-verified prior declaration review:

- Reuse SHA-256: `89b4aef00b286bee4d5484f81dd44854c91162a71e262f13d47dc9a1ceca0255`
- Reviewed interpretation: Interprets the stated mean and variance equations as equality.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D014: `Filter.Tendsto`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Filter.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7e5f54349644c32198960083c0e0eb6c033c80a8656d02a78b3eae9a4f5131f2`

Hash-verified prior declaration review:

- Reuse SHA-256: `bbcb0b48060ea1825d8d47cf31c8590970640627aa75653114e2e975f58f8aa2`
- Reviewed interpretation: Expresses filter convergence of cumulative probabilities.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D015: `Filter.atTop`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Filter.AtTopBot.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f743a11da6fe9e156755f41ec35f4d61b87ca4af4575ede456b477a74caa45f3`

Hash-verified prior declaration review:

- Reuse SHA-256: `2fcd7324d24f1eaabeb2604d52ba0ac78debaee67bf346b67daf0e9fb36ebee3`
- Reviewed interpretation: Specifies that the natural-number parameter tends to infinity.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D016: `HAdd.hAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `e0bf2a92addd6ea713343e4ef69f67e4e1155781d08f46957b9f71412d865f59`

Hash-verified prior declaration review:

- Reuse SHA-256: `ef641e70c785754f83eb635a52e255d5d5821d3ac13c792f0eba231165c1b0c7`
- Reviewed interpretation: Forms N plus one, producing the first N+1 variables.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D017: `HDiv.hDiv`

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

### D018: `HMul.hMul`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `4e00447a4a8ef4c2ce13e307c56a1fbcd7fa8c732fe039a452b42477a50df2c6`

Hash-verified prior declaration review:

- Reuse SHA-256: `7a4a146e7f460f61abf5c9b03f384871e13ba50030fa37b61fa0069adcc1d668`
- Reviewed interpretation: Supplies multiplication used in normalization and scaling.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D019: `HPow.hPow`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6196b8cbb884c4f39841ba74b23d75f3c753fe0d044cc402bd6e4e3bd59d5cb8`

Hash-verified prior declaration review:

- Reuse SHA-256: `167c854e614fb1f0c1c21ffd0de012b756b895fc6f635c2798d45249d6d3e35a`
- Reviewed interpretation: Interprets sigma raised to the second power in the variance assumption.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D020: `InnerProductSpace.toNormedSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.InnerProductSpace.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `683435a8d27d50ec1482d74d23f541d52d05ff0411c60f88d16c32132aca9f3e`

Hash-verified prior declaration review:

- Reuse SHA-256: `d74353d21abde4bdb505d95768e2ee10f1d260c89b5765578c9fc21f79650af2`
- Reviewed interpretation: Supplies real normed-space structure required by integration.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D021: `Inv.inv`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `c3aea3c6e2edd31a7b2cf071814315808ef7d84fd01d8c9b719313846ebca438`

Hash-verified prior declaration review:

- Reuse SHA-256: `091d810424bae85addc9779c5e8d347eb3c36a491e1db3ad9322eecdbe82bbad`
- Reviewed interpretation: Supplies inversion used to divide by sigma times square root N.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D022: `LT.lt`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `fd5699899f1a49c91982cb363d3a71557ab1b53ee772cd777c9ee7717abc2009`

Hash-verified prior declaration review:

- Reuse SHA-256: `547132a2754e1adaa76a98dea0cb09b8f1be9dd1feacfc71be488b1c0dafdbd6`
- Reviewed interpretation: Interprets the strict positivity assumption on sigma.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D023: `MeasurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.MeasurableSpace.Defs`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `6825e55082259c6be2028d5ee0624c796293eccdd78af118da4583180067d196`

Hash-verified prior declaration review:

- Reuse SHA-256: `16b975d8f7e8a1d027a3a725f23ec90667c2cf38d3ee1463e474a0abcd68b493`
- Reviewed interpretation: Provides the measurable-space structure on the sample space.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D024: `MeasureTheory.IsProbabilityMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Typeclasses.Probability`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `f88b269cb95d165125e7553fd22f97d6e5f9b1b9bcdec7f6738a781dc674bf89`

Hash-verified prior declaration review:

- Reuse SHA-256: `79eebecf3cec564594711bcf6899a8a74c8a9dab7307ebdf497b84f5a5529279`
- Reviewed interpretation: Expresses that the underlying measure is a probability measure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D025: `MeasureTheory.Measure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `ba8c23c70f3135407096406cee0b4d7d9f02d088e8b1d1a1e105071821a3a51b`

Hash-verified prior declaration review:

- Reuse SHA-256: `685a86e75f3d220e8017362da344e44b56761fa21ae27e38991d743c0700aaea`
- Reviewed interpretation: Provides the measure type of the underlying probability measure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

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

### D027: `MeasureTheory.Measure.restrict`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Restrict`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `63c4446a3ae02833cbb1104dcc4f2ea534c0eae36f5642bfa8858a6593aa11e8`

Type:

```lean
{α : Type u_2} → {_m0 : MeasurableSpace α} → MeasureTheory.Measure α → Set α → MeasureTheory.Measure α
```

Fully explicit type:

```lean
{α : Type u_2} →
  {_m0 : MeasurableSpace.{u_2} α} →
    (μ : @MeasureTheory.Measure.{u_2} α _m0) → (s : Set.{u_2} α) → @MeasureTheory.Measure.{u_2} α _m0
```

Definition body (one-level semantic boundary):

```lean
fun {α} {_m0} μ s => LinearMap.instFunLike.coe (MeasureTheory.Measure.restrictₗ s) μ
```

### D028: `MeasureTheory.MeasureSpace.toMeasurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `9fcb81af41d67aceded7670716064bc53819a6094bbccd3cb85d7a18952295d3`

Type:

```lean
{α : Type u_6} → [self : MeasureTheory.MeasureSpace α] → MeasurableSpace α
```

Fully explicit type:

```lean
{α : Type u_6} → [self : MeasureTheory.MeasureSpace.{u_6} α] → MeasurableSpace.{u_6} α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : MeasureTheory.MeasureSpace α] => self.1
```

### D029: `MeasureTheory.MeasureSpace.volume`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `8aa44f6be6ed612f15d809220aa22d43c0715b7383456cd968b96336c71bcb65`

Type:

```lean
{α : Type u_6} → [self : MeasureTheory.MeasureSpace α] → MeasureTheory.Measure α
```

Fully explicit type:

```lean
{α : Type u_6} →
  [self : MeasureTheory.MeasureSpace.{u_6} α] →
    @MeasureTheory.Measure.{u_6} α (@MeasureTheory.MeasureSpace.toMeasurableSpace.{u_6} α self)
```

Definition body (one-level semantic boundary):

```lean
fun α [self : MeasureTheory.MeasureSpace α] => self.2
```

### D030: `MeasureTheory.MemLp`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.LpSeminorm.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `3d38a386250cbaad2a5c216f9bf80b5f748106d4406c769283ef0114b4f42398`

Hash-verified prior declaration review:

- Reuse SHA-256: `3240c4be4c42c48ab84b777320ca0c898bf0300aaab589aee3f172582ed98e8c`
- Reviewed interpretation: Expresses square-integrability of every summand.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D031: `MeasureTheory.MemLp.aemeasurable`

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

### D032: `MeasureTheory.ProbabilityMeasure.toMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.ProbabilityMeasure`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `29600ce2f9aae5acb4c5d23aa33240a6baacf5edef09da09435cd96638802a1a`

Type:

```lean
{Ω : Type u_1} → [inst : MeasurableSpace Ω] → MeasureTheory.ProbabilityMeasure Ω → MeasureTheory.Measure Ω
```

Fully explicit type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace.{u_1} Ω] →
    @MeasureTheory.ProbabilityMeasure.{u_1} Ω inst → @MeasureTheory.Measure.{u_1} Ω inst
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} [MeasurableSpace Ω] => Subtype.val
```

### D033: `MeasureTheory.integral`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Integral.Bochner.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `428563f3d6b771605a3267457bf33b62ec2efa91a42b57b96121b85c0269a9ab`

Hash-verified prior declaration review:

- Reuse SHA-256: `39f81d8f8ca5bfa7466ce6a2a6b5b76336527b9700e628ce3c39b1b6a0721f7b`
- Reviewed interpretation: Defines the integral used to state the common mean.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D034: `MetricSpace.toEMetricSpace`

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

### D035: `Monoid.toNatPow`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5b7373fe2de26535c1cdbf1b953ce34faf30f68aac8abd83ade2e78e6ec65b8a`

Hash-verified prior declaration review:

- Reuse SHA-256: `5161db62b88d3ad30d8e803dfa135fe5e0841298a59a8dc82f61c71568216ac4`
- Reviewed interpretation: Supplies natural-number exponentiation used to form sigma squared.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D036: `Nat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `2e1c25ca42e1e377a41827f0d2f09ae02cfb28ab155c30e277f1000f5e79b32c`

Hash-verified prior declaration review:

- Reuse SHA-256: `8eebc966dfc79c7ffdd6bb16c4b52de4c5f821cf5c77b0d4cef30fb0fb267652`
- Reviewed interpretation: Provides the natural-number index and partial-sum parameter type.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D037: `Nat.instAtLeastTwoHAddOfNat`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Init`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `309ef94c4b7cfbe2e668952e6915279353921d5d48b6123a30f90dd932dac3e6`

Hash-verified prior declaration review:

- Reuse SHA-256: `e690b5895a6a596d24134a5be66805f967db5de2bc589951c9bdc89311847dcd`
- Reviewed interpretation: Provides technical arithmetic evidence for the L² exponent.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D038: `Nat.instNeZeroSucc`

- Role: `external-frontier`
- Owner module: `Init.Data.Nat.Basic`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `a0735a528184c05594c4c79312c1225bb4dcffcdf0df7eb1a50c5733047c85ad`

Hash-verified prior declaration review:

- Reuse SHA-256: `ae3f7e1a9ae88fd713ab4e48ac9fd31410b7fca9d02cea2e2bc9692335035319`
- Reviewed interpretation: Provides nonzero-successor numeral infrastructure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D039: `Nat.instPreorder`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5ea89e9915200c8782bc933f9184e28eb38f4c9610b00cf1310cc6e6435642d8`

Hash-verified prior declaration review:

- Reuse SHA-256: `9dea2b2bc94c5a46c4d2b7397581da3e7fd973d4041ffc86b9e2063b071ba177`
- Reviewed interpretation: Supplies the natural-number preorder underlying the limit at infinity.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D040: `Neg.neg`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `0c56662a5d917c211c3cb741ca747b4a6710082af615cf071342ef70dee3a2c7`

Type:

```lean
{α : Type u} → [self : Neg α] → α → α
```

Fully explicit type:

```lean
{α : Type u} → [self : Neg.{u} α] → α → α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : Neg α] => self.1
```

### D041: `NonUnitalSeminormedCommRing.toNonUnitalSeminormedRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `c697ff5e735ebe18733e51950717037e73ba73e94ac2e99953bfb521708cabd2`

Hash-verified prior declaration review:

- Reuse SHA-256: `bffe70a46fad94f6c7db0aed560155c5fe3a11ea63dc69c5aad5f22eb19408de`
- Reviewed interpretation: Projects standard real normed-ring structure; it adds no proposition-level content.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D042: `NonUnitalSeminormedRing.toSeminormedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `db7996fa414ad67340b9d6991cd145ac2a5d251a870097d20f2f63e371fb101d`

Hash-verified prior declaration review:

- Reuse SHA-256: `07c80996839514508f5165d9be3192d0d9600993db88e9bb1acfb73eb89ea4a4`
- Reviewed interpretation: Projects standard real normed-ring structure; it adds no proposition-level content.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D043: `NormedAddCommGroup.toSeminormedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7327759e5e9417c54393e7566584cd72d79c77b4ca018ea408c5d024667587be`

Hash-verified prior declaration review:

- Reuse SHA-256: `01d108798ec893d6ad297d47c57530cb414d8bed9be6faa2736d1fb0fbb31436`
- Reviewed interpretation: Projects standard real normed-ring structure; it adds no proposition-level content.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D044: `NormedCommRing.toSeminormedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `ad504b2606febc5a066d58ac540c9826bd1b7fce734d59a7fef63c7c27112fe3`

Hash-verified prior declaration review:

- Reuse SHA-256: `d404b0c2d1682eb20f7ee7649662517916341556615119cd60756485dc368496`
- Reviewed interpretation: Projects standard real normed-ring structure; it adds no proposition-level content.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D045: `OfNat.ofNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6a6a0720d091cfeb582747fe67b977e948f09706c0beae1f2f21830aa5821ead`

Hash-verified prior declaration review:

- Reuse SHA-256: `ab83b3d5fa7010f3251fbc762a8b4c11701a167f971986b300f6541a402c37ee`
- Reviewed interpretation: Interprets numeric literals in their ambient types.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D046: `ProbabilityTheory.IdentDistrib`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.IdentDistrib`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `bfa67f6784b6c21a24b3b314a4519e3b86d23bd01bd4ecacbf50d4c9faa0d03e`

Hash-verified prior declaration review:

- Reuse SHA-256: `8e9167de92edc3a08adae5d47e6e8dc0ebe502d0177d224663233135de55ddbc`
- Reviewed interpretation: Expresses that every summand has the same distribution as the first.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D047: `ProbabilityTheory.iIndepFun`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.Independence.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `fc42c9fb6cb6d72ada8e7605b71644561e188fc9c555246dd3ef51d84fa13130`

Hash-verified prior declaration review:

- Reuse SHA-256: `3b25abdc2611867579cdbce116d55c33de3cbae4e170befeedc561b15bed9f1e`
- Reviewed interpretation: Expresses mutual independence of the indexed family.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D048: `ProbabilityTheory.variance`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.Moments.Variance`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `2eb32ed492bfdd1df3ad84f7e963b9d4f0347489111c9ee4dddf93da3947d3a2`

Hash-verified prior declaration review:

- Reuse SHA-256: `24c0cd8a426a93aeda340b29c9d118753e0c554da3f798aa98fef1d0d439df41`
- Reviewed interpretation: Defines the variance used in the common-variance hypothesis.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D049: `PseudoEMetricSpace.pseudoMetrizableSpace`

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

### D050: `PseudoMetricSpace.toUniformSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.MetricSpace.Pseudo.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `a6831039b3ad5e37bd0e7692fd995a699d8bef791976e20262da929990521799`

Hash-verified prior declaration review:

- Reuse SHA-256: `68d0f811a7d001b189ad58f5fa32829b45ee667ffd2dbc699ff39c0142bc1b44`
- Reviewed interpretation: Supplies standard metric structure on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D051: `RCLike.toInnerProductSpaceReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.InnerProductSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f602276baee30d3dbe02bd6b756a9097f750d59a7f91ca7635dcfc935fd22981`

Hash-verified prior declaration review:

- Reuse SHA-256: `523fe24d8293fd82f2e321c8d3f5bfdc4ae908b2e85b73f1416cccb290e84be8`
- Reviewed interpretation: Supplies standard inner-product structure on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D052: `Real`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `38529f0578472feffc4c79d5d0755fa10fc3edafb232ab5e442336d13630ee90`

Hash-verified prior declaration review:

- Reuse SHA-256: `018c65202cf547edb86519bb9d69f2645af3784917466c7668edb4d7fc1c700e`
- Reviewed interpretation: Provides the real-number type for summands, parameters, thresholds, sums, and limits.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D053: `Real.borelSpace`

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

### D054: `Real.exp`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Complex.Exponential`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `69806b1af98b09fabed435ccc47a9f2f0840f9c5c140fb62cccc81a80761a984`

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
fun x => (Complex.exp (Complex.ofReal x)).re
```

### D055: `Real.instDivInvMonoid`

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

### D056: `Real.instInv`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8996fd673a1e2289aaf761085a60a161bdafebda8cdd48d1efb3c89da1382980`

Hash-verified prior declaration review:

- Reuse SHA-256: `d4e4c02fe72213f2b5b150a2ff7149c68f95152ac60649034fa9c0bf7785fa49`
- Reviewed interpretation: Supplies the standard inverse on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D057: `Real.instLT`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `573bcfac2b62a55b90ee93bf35473d500cc64581698a699b2152c52f40d0e14a`

Hash-verified prior declaration review:

- Reuse SHA-256: `eaa7d68244a8d072ab3e0661c3082a8d72a9f4d27c1c0ccdcbd878cb0b2b4179`
- Reviewed interpretation: Supplies the standard strict order on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D058: `Real.instMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `37978679365b30167654c1ef9ecb0fa938325c2047191daa7208aee389c0b4b8`

Hash-verified prior declaration review:

- Reuse SHA-256: `7ca4ba9ffb61160341ac26f5338089e2b08efb61efc03343757e6591ecf5ce2d`
- Reviewed interpretation: Supplies the standard multiplicative structure on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D059: `Real.instMul`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `459ccbe28a1d29ccd2b329ea29e1a84b329b8064b8a8ecc52764b69b23e229ed`

Hash-verified prior declaration review:

- Reuse SHA-256: `60e14e7fa6870f155189ef555546792c3da33d081a32bf1f0648db729b18177a`
- Reviewed interpretation: Supplies the standard multiplication on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D060: `Real.instNatCast`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5fc7a7becbc71d472fa1a28bd92d79b4c6ea4fdc643db7380031a2b890ca7e15`

Hash-verified prior declaration review:

- Reuse SHA-256: `383f6a0dcec6e0d13d363278cf47246e52596b99a855c4ffbdae9d604cc675e4`
- Reviewed interpretation: Supplies the standard natural-number cast into the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D061: `Real.instNeg`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `000951397468b3d1f8a2a1cca1de3812bc024916ff842cfd5454811130093b41`

Type:

```lean
Neg Real
```

Fully explicit type:

```lean
Neg.{0} Real
```

Definition body (one-level semantic boundary):

```lean
{ neg := Real.neg✝ }
```

### D062: `Real.instPreorder`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `896bb94fc15867c0df82ea0f639eb6116e90a24819a66a54db9442e47cba7274`

Hash-verified prior declaration review:

- Reuse SHA-256: `00626f83ad056844c46fc0070481fe163460dd33244f6376fcb7a6c5991bf612`
- Reviewed interpretation: Supplies the real preorder used for closed lower intervals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D063: `Real.instRCLike`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.RCLike.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `d2fdb97b9d861fcf61e6dbea9993dfa0ca6aa16609742f215c35b3f7ddd16b8e`

Hash-verified prior declaration review:

- Reuse SHA-256: `7f2e34b613a957d51c60dcf793d8ec9ec0373f4784d568a59371c0b867aa5117`
- Reviewed interpretation: Supplies standard real-like analytic structure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D064: `Real.instZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `860eaaa75b06ac6fccbf4f27e9e162807e8851d04bb42d2411332c6368b14882`

Hash-verified prior declaration review:

- Reuse SHA-256: `1a14106e23473ebad9728527e292c815724cc6839dcc0bd74dcc4fe619c61d60`
- Reviewed interpretation: Supplies the standard zero of the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D065: `Real.measurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Constructions.BorelSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `51b107725c4edbe40e50ff5651a2c7ee5a10037e341c2764964a6d6cc26d82a1`

Hash-verified prior declaration review:

- Reuse SHA-256: `d94a27adf77996ce0dabb1561baeaea9df8f9db6ab04ac54f498e1e49e33d985`
- Reviewed interpretation: Supplies the standard measurable structure on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D066: `Real.measureSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Haar.OfBasis`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `d9de6598dfa4dc9b2cc1dfbccf206b37d159db61f4b35cc745a68902fbc74b22`

Type:

```lean
MeasureTheory.MeasureSpace Real
```

Fully explicit type:

```lean
MeasureTheory.MeasureSpace.{0} Real
```

Definition body (one-level semantic boundary):

```lean
inferInstance
```

### D067: `Real.metricSpace`

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

### D068: `Real.normedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Real`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `9ff0d896c635e2a38531d689d24ee70cfffa41565354ce15f6ff59b51650bd93`

Hash-verified prior declaration review:

- Reuse SHA-256: `74f95e2af11c688a8a2fef14489674519906c4c1fdc9956d6859b7a680234115`
- Reviewed interpretation: Supplies the standard normed additive structure on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D069: `Real.normedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `69cccc1e864661e103785f4a2712b9ad164d845c03b7737801c37e5ac852bad7`

Hash-verified prior declaration review:

- Reuse SHA-256: `9aaa7e1203651241b79f6bd21ddabccb09bd06a39a52a4bd3b8042df90d3da1b`
- Reviewed interpretation: Supplies the standard normed commutative ring structure on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D070: `Real.pi`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `d75a7e5ab21b9e0fa41907d3afec6d87f8f264e448c96b4fd69b77195bdbebac`

Type:

```lean
Real
```

Fully explicit type:

```lean
Real
```

Definition body (one-level semantic boundary):

```lean
instHMul.hMul 2 (Classical.choose Real.exists_cos_eq_zero)
```

### D071: `Real.pseudoMetricSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.MetricSpace.Pseudo.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `9c0d1d56a04dd3ae3fce36b5fb3c2f4fe632c2bdaed84b5667c1a60a03491a3e`

Hash-verified prior declaration review:

- Reuse SHA-256: `290badf5ddfc731ae82243b5451092ba591236d9eb54770abcb3b32fb9f972cd`
- Reviewed interpretation: Supplies the standard metric structure on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D072: `Real.sqrt`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Sqrt`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `67f9248ae1acb851b5392be301057ebb8b8ef2fb20f76d2d53a2d07ec8f30553`

Hash-verified prior declaration review:

- Reuse SHA-256: `a69ad57f72bec999b30d8ee0adce58ac56689794dc503ae6d0bca4e0c0e410e6`
- Reviewed interpretation: Defines the nonnegative square root appearing in the normalization.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D073: `SeminormedAddCommGroup.toSeminormedAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8cf35215f509cdee10a3a95158cbaadd3c5fb584bc0d1f4fad6ecfc69b1bd205`

Hash-verified prior declaration review:

- Reuse SHA-256: `47058cc5eb35bfb8b12ab08b9d267a12b53b27f67db82cca85961aa2345fd969`
- Reviewed interpretation: Projects standard seminormed additive structure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D074: `SeminormedAddGroup.toContinuousENorm`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Continuity`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `17a83cbf3059dd0bbaefd43c93ce329f1d6b760d440889322b3582a18b23a141`

Hash-verified prior declaration review:

- Reuse SHA-256: `f2d04c89a31b78a7bc102ae7aaa5cbc5441eb21598aede692a385edb5961cc57`
- Reviewed interpretation: Projects standard continuous extended-norm structure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D075: `SeminormedAddGroup.toPseudoMetricSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `d4043bb9912319b688406ba77c3a5b0fdd8f53ab605cf1962721b51314c66d3f`

Hash-verified prior declaration review:

- Reuse SHA-256: `d98a5f07c0b6efd77274409e07b026c83b561f6abce175d5fb74ca50b92c8edf`
- Reviewed interpretation: Projects standard pseudometric structure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D076: `SeminormedCommRing.toNonUnitalSeminormedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `a29f0377c9baf2265c34aaf85b852e7c4260b34d2dc04574484c335ebc09a6e9`

Hash-verified prior declaration review:

- Reuse SHA-256: `0a783e0fcdc1a7486eb1b323f9c76a0d6a3e21f0a84719f4b1e45916a6dcfab3`
- Reviewed interpretation: Projects standard seminormed commutative-ring structure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D077: `Set`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `a6e551515032966c16e4f42e4548ff1854c2dce05ffe51e98b66943caecc78ec`

Hash-verified prior declaration review:

- Reuse SHA-256: `4532034ac0a276aa3cfd499f48dcc3d05d91715a0750e5c909094ddad1a1a225`
- Reviewed interpretation: Provides the type of measurable subsets evaluated by the laws.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D078: `Set.Ici`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Interval.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `32e9548f07a5e31843a500e07f11e2e04776466d0284c00e33d88066bc211711`

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
fun {α} [inst : Preorder α] b => setOf fun x => inst.le b x
```

### D079: `UniformSpace.toTopologicalSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.UniformSpace.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `4d18df801a98905221e0935ec2ddacda684a1430b8d198ebc23fad0643bce2a8`

Hash-verified prior declaration review:

- Reuse SHA-256: `ef3d972248a89806fdbfb060745e4ec27999ae63a0f7bbc147553d48d1aafa36`
- Reviewed interpretation: Projects the topology from the standard uniform structure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D080: `Zero.toOfNat0`

- Role: `external-frontier`
- Owner module: `Init.Data.Zero`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f7ebe8a983de002c1ee751fd3c144a7c1933b3bb95c87c5001a3cabf5709031a`

Hash-verified prior declaration review:

- Reuse SHA-256: `10d4d32eec2606576105690b93a7135ea27c50c6fd9b2ebe65e4d436816b3fca`
- Reviewed interpretation: Interprets zero as a numeric literal.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D081: `instAddCommMonoidWithOneENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `31d9551885e3007e5d1368365622cfd7638ea41cc6d885234041621de873f55c`

Hash-verified prior declaration review:

- Reuse SHA-256: `1967fdbcf50c1d6982dd410a33e95c35a253554e985ae21713356db062b01add`
- Reviewed interpretation: Supplies additive and numeral structure on extended nonnegative reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D082: `instAddNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `a1534bcd3e1888406ac787d30eeff8a284cb6688c23f5e8de09351dda91a280c`

Hash-verified prior declaration review:

- Reuse SHA-256: `843559859c105e9653337495c0b4e2b6c2daca7fbf29ec995cd4cc02f9211fe3`
- Reviewed interpretation: Supplies natural-number addition infrastructure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D083: `instHAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `38066efd17aeeca52ec2890d9aafca2fa3cce8fda7f5843c1b8e5da130d93981`

Hash-verified prior declaration review:

- Reuse SHA-256: `02033c3f5cf93c5ed512f2f96b57aade58b6d860fc764e8af822bd0f85f1b9ee`
- Reviewed interpretation: Supplies heterogeneous addition infrastructure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D084: `instHDiv`

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

### D085: `instHMul`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `1fd375514ac68e29e7941c94ba308ea936395db23d0fee63a5c69dcccd3b2bdc`

Hash-verified prior declaration review:

- Reuse SHA-256: `e6675ba88dd625030d3c0a9740eebcbfef329a2e788bf847cf2182bc0b076d5b`
- Reviewed interpretation: Supplies heterogeneous multiplication infrastructure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D086: `instHPow`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `eb300d353d84392c776cad5e356479f878030744a43f9a1584942a89d16350b4`

Hash-verified prior declaration review:

- Reuse SHA-256: `02703838c0b87736f2307508dae5ab32e1d1363bee5cb12b4d1f12fabc458398`
- Reviewed interpretation: Supplies homogeneous-power infrastructure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D087: `instOfNatAtLeastTwo`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `37355febc51d6fa8ff12fc8e7b429771db340390d46411d7608c566bdffd358d`

Hash-verified prior declaration review:

- Reuse SHA-256: `611f5dba04761646e6c26807c2f35d26de3fc74a6683b2a2133499f11d2c7fdb`
- Reviewed interpretation: Supplies the at-least-two numeral instance.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D088: `instOfNatNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7018dea92aae8c272f3a065f25e2bedb9732a0b602c3d54b166fa0cf2ce1ea92`

Hash-verified prior declaration review:

- Reuse SHA-256: `8cf91ea14046911aca73e0ce0ce5a143c773269f7845eea50701ba0d66b147d8`
- Reviewed interpretation: Supplies numeral infrastructure on natural numbers.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D089: `nhds`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.Defs.Filter`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8eb445823f4b15a765f7e0cd634f73196d36b4f09054d2aef43a69d3138c6ce8`

Hash-verified prior declaration review:

- Reuse SHA-256: `d27fd45dc3c50f1bfd692fbe4ee7eb857ba3c0275a7c4d7e5b97c00b01abec14`
- Reviewed interpretation: Supplies the neighborhood filter used for convergence.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D090: `AEMeasurable`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `6dc48478b911cadddc9129039bc8859282262cccd65bca8d46f3cdc5415a69cd`

Hash-verified prior declaration review:

- Reuse SHA-256: `6dc57efcdc4db5dd811e02dfac8179af920c6ab9267b7b02a25b66466ea85517`
- Reviewed interpretation: Expresses almost-everywhere measurability of normalized finite sums.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D091: `Finset.range`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Finset.Range`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `0d8947d3b91a57604f7b7be615f2ff236f2058a47281af31ea2498635666e9e7`

Hash-verified prior declaration review:

- Reuse SHA-256: `932f95a7a272ef82ddb300293b5815ad4d19690a1a5402fc13c0959d5607414a`
- Reviewed interpretation: Defines the finite range of indices for each partial sum.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D092: `Finset.sum`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.BigOperators.Group.Finset.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `931ceac4e9efb5833f58970d10ced4621362e020ea1119492a8d379b7e692372`

Hash-verified prior declaration review:

- Reuse SHA-256: `f56ee7a922d68c50a53226670919582270a6f0f438f6742184f4ac0fd6a28168`
- Reviewed interpretation: Forms the finite sum of centered random variables.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D093: `HSub.hSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `98025b38d523c0eadea77ba4961a20b2a913b23c079c4bfeba24a7bfaa24a4bc`

Hash-verified prior declaration review:

- Reuse SHA-256: `729de094d16d3dd37dc3d41b1d6c70a3f52ea05cd1ff9023de564f4583c96635`
- Reviewed interpretation: Supplies subtraction used to center each variable.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D094: `MeasureTheory.Measure.isProbabilityMeasure_map`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Typeclasses.Probability`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `5624854207c8bee28341ec39de7199a37aa6780067b481804214a292b0055dc0`

Hash-verified prior declaration review:

- Reuse SHA-256: `f8a0ce71fcdc7cca5b6179452e54e38aaf1906cd436e1af9a214478d2f8dd8de`
- Reviewed interpretation: Certifies that the pushforward of the probability measure remains a probability measure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D095: `MeasureTheory.Measure.map`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Map`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `35d0f192bfc92d083756f0df86ca1ad37f0c1f0bfa39120f6adf90414c4a3b75`

Hash-verified prior declaration review:

- Reuse SHA-256: `b7f639dcb5910a91a5230487b22be8ab497134042f96bb77d7a39ee65010389f`
- Reviewed interpretation: Defines pushforward measure and hence each normalized-sum law.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D096: `MeasureTheory.ProbabilityMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.ProbabilityMeasure`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `251bef2162749e0bcb67a1413765bc7556e9854c7a23036b986ada6a2e2958be`

Hash-verified prior declaration review:

- Reuse SHA-256: `7687911cf62493106750b02e0aba2c9e6fabc8b6fdf7be85c8264a11aecc2ef6`
- Reviewed interpretation: Provides the type of probability measures used for laws and the Gaussian limit.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D097: `Nat.cast`

- Role: `external-frontier`
- Owner module: `Init.Data.Cast`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `6e24327ea908b1837083bb15aef27d593e950a2ff8ade81d8aa94bfe33b64450`

Hash-verified prior declaration review:

- Reuse SHA-256: `95ff63127d32dd9b51821b97bab8fb6f9c04225d03e8ef3984258124d0da1578`
- Reviewed interpretation: Casts the natural sample size to a real before taking its square root.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D098: `Real.instAddCommMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `11a549e6c9caa007a4627570dd86aea756ada755f141da0356b8766788f2eef7`

Hash-verified prior declaration review:

- Reuse SHA-256: `9636c417ca9476326a4f467b101da758b7b86084909ef9e793af3c3fd715e006`
- Reviewed interpretation: Supplies the standard additive commutative monoid on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D099: `Real.instSub`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `926d9e8fcca2819a885d446e168b20c7c8aac2e542d59ed2b48e32c9a4659a36`

Hash-verified prior declaration review:

- Reuse SHA-256: `c003518537d586c26e623346989fa71de843844df7b8cd2c1a329d848caa6531`
- Reviewed interpretation: Supplies the standard subtraction on the reals.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D100: `Subtype.mk`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `constructor`
- Distance from target type: `2`
- Semantic SHA-256: `488ac61b6d3c07fb9a2f54a03a39e6001a4c7cedfd07515f0f9865e7fef9ef51`

Hash-verified prior declaration review:

- Reuse SHA-256: `c4aa44454ef4c133e3b5064abcc65494179a006f5028034ca43e252bcd09b992`
- Reviewed interpretation: Constructs a bundled probability measure from a measure and its probability proof.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.

### D101: `instHSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `aa782f2b5af3d068f4c5340de4b32b193fece2c659a45582cc3024a19b550c87`

Hash-verified prior declaration review:

- Reuse SHA-256: `143fe4bf7d0d489eb491acbe173da4bdac82decf65897781391721e1e7df97b9`
- Reviewed interpretation: Supplies heterogeneous subtraction infrastructure.

Independently determine this declaration's effect on the current target and whether that effect matches the selected source result.
