# Declaration dossier for HDP-01-DEF-LP-SPACE

This dossier describes the theorem statement only. Its proof is excluded.
Interpret every dependency from its supplied declaration; names are not definitions.

## Proof-free source declaration

```lean
theorem hdp_01_hdef_hlp_hspace_spec
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ]
    (p : ENNReal) (_hp : p ≠ 0)
    (X : Ω → ℝ) (hX : AEStronglyMeasurable X μ) :
    (NumStability.HDP.Scalar.Preliminaries.lpNormSpaceModel μ p).representativeMember X ↔
      eLpNorm X p μ < ⊤
```

## Elaborated target type

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
  (p : ENNReal),
  Ne p 0 →
    ∀ (X : Ω → Real),
      MeasureTheory.AEStronglyMeasurable X μ →
        Iff ((NumStability.HDP.Scalar.Preliminaries.lpNormSpaceModel μ p).representativeMember X)
          (ENNReal.instPartialOrder.lt (MeasureTheory.eLpNorm X p μ) instTopENNReal.top)
```

## Fully explicit elaborated target type

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace.{u_1} Ω] (μ : @MeasureTheory.Measure.{u_1} Ω inst)
  [@MeasureTheory.IsProbabilityMeasure.{u_1} Ω inst μ] (p : ENNReal)
  (_hp : @Ne.{1} ENNReal p (@OfNat.ofNat.{0} ENNReal (nat_lit 0) (@Zero.toOfNat0.{0} ENNReal instZeroENNReal)))
  (X : Ω → Real)
  (hX :
    @MeasureTheory.AEStronglyMeasurable.{u_1, 0} Ω Real
      (@UniformSpace.toTopologicalSpace.{0} Real (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace))
      inst inst X μ),
  Iff
    (@NumStability.HDP.Scalar.Preliminaries.LpNormSpaceModelData.representativeMember.{u_1} Ω inst μ p
      (@NumStability.HDP.Scalar.Preliminaries.lpNormSpaceModel.{u_1} Ω inst μ p) X)
    (@LT.lt.{0} ENNReal (@Preorder.toLT.{0} ENNReal (@PartialOrder.toPreorder.{0} ENNReal ENNReal.instPartialOrder))
      (@MeasureTheory.eLpNorm.{u_1, 0} Ω Real
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
        inst X p μ)
      (@Top.top.{0} ENNReal instTopENNReal))
```

## Local import graph

- `AuditTarget` imports: `NumStability.HDP.Scalar.Preliminaries`
- `NumStability.HDP.Scalar.Preliminaries` imports: `Mathlib.Probability.Moments.Variance`, `Mathlib.Probability.CDF`, `Mathlib.MeasureTheory.Function.LpSpace.Basic`, `Mathlib.MeasureTheory.Function.LpSpace.Complete`, `Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm`, `Mathlib.MeasureTheory.Function.LpSeminorm.Indicator`, `Mathlib.Probability.UniformOn`, `Mathlib.Analysis.Convex.Integral`, `Mathlib.Analysis.Convex.Continuous`, `Mathlib.MeasureTheory.Integral.Bochner.Set`, `Mathlib.MeasureTheory.Integral.Lebesgue.Markov`, `Mathlib.MeasureTheory.Integral.Layercake`, `Mathlib.MeasureTheory.Measure.Lebesgue.Integral`, `Mathlib.Probability.Distributions.Cauchy`, `Mathlib.Analysis.SpecialFunctions.NonIntegrable`, `Mathlib.Analysis.SpecialFunctions.Pow.Integral`, `Mathlib.Tactic`

## Semantic dependency inventory

`local` declarations are followed recursively through types and bodies. `external-frontier` declarations mark the one-level library trust boundary.

### D001: `NumStability.HDP.Scalar.Preliminaries.LpNormSpaceModelData.representativeMember`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.Preliminaries`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `2f8a0de44f7061ebae8eb134147b561deab7819e90e38f7ea37233a92b4cbdbb`

Type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace Ω] →
    {μ : MeasureTheory.Measure Ω} →
      {p : ENNReal} → NumStability.HDP.Scalar.Preliminaries.LpNormSpaceModelData μ p → (Ω → Real) → Prop
```

Fully explicit type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace.{u_1} Ω] →
    {μ : @MeasureTheory.Measure.{u_1} Ω inst} →
      {p : ENNReal} →
        (self : @NumStability.HDP.Scalar.Preliminaries.LpNormSpaceModelData.{u_1} Ω inst μ p) → (Ω → Real) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun Ω [MeasurableSpace Ω] μ p self => self.3
```

### D002: `NumStability.HDP.Scalar.Preliminaries.lpNormSpaceModel`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.Preliminaries`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `0c51b5476fbc2195436f297b4197d81d9855e5ce1961d65540cb8cc642f87e49`

Type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace Ω] →
    (μ : MeasureTheory.Measure Ω) → (p : ENNReal) → NumStability.HDP.Scalar.Preliminaries.LpNormSpaceModelData μ p
```

Fully explicit type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace.{u_1} Ω] →
    (μ : @MeasureTheory.Measure.{u_1} Ω inst) →
      (p : ENNReal) → @NumStability.HDP.Scalar.Preliminaries.LpNormSpaceModelData.{u_1} Ω inst μ p
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} [MeasurableSpace Ω] μ p =>
  { representativeNorm := fun X => MeasureTheory.eLpNorm X p μ, representativeNorm_eq := ⋯,
    representativeMember := fun X => MeasureTheory.MemLp X p μ, representativeMember_iff := ⋯,
    quotient := MeasureTheory.Lp Real p μ, quotient_eq := ⋯ }
```

### D003: `NumStability.HDP.Scalar.Preliminaries.LpNormSpaceModelData`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.Preliminaries`
- Declaration kind: `inductive`
- Distance from target type: `2`
- Semantic SHA-256: `082463bc2d7900aa29373a2fce248fe957ad9c16a4567b845a5aec21c4bea7c6`

Type:

```lean
{Ω : Type u_1} → [inst : MeasurableSpace Ω] → MeasureTheory.Measure Ω → ENNReal → Type u_1
```

Fully explicit type:

```lean
{Ω : Type u_1} → [inst : MeasurableSpace.{u_1} Ω] → (μ : @MeasureTheory.Measure.{u_1} Ω inst) → (p : ENNReal) → Type u_1
```

### D004: `NumStability.HDP.Scalar.Preliminaries.LpNormSpaceModelData.mk`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.Preliminaries`
- Declaration kind: `constructor`
- Distance from target type: `2`
- Semantic SHA-256: `d411c980bfd794a085a6dbd16d951d0494ba93970d1d0e0497bf62f7186f1d50`

Type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace Ω] →
    {μ : MeasureTheory.Measure Ω} →
      {p : ENNReal} →
        (representativeNorm : (Ω → Real) → ENNReal) →
          (∀ (X : Ω → Real), Eq (representativeNorm X) (MeasureTheory.eLpNorm X p μ)) →
            (representativeMember : (Ω → Real) → Prop) →
              (∀ (X : Ω → Real), Iff (representativeMember X) (MeasureTheory.MemLp X p μ)) →
                (quotient : AddSubgroup (MeasureTheory.AEEqFun Ω Real μ)) →
                  Eq quotient (MeasureTheory.Lp Real p μ) →
                    NumStability.HDP.Scalar.Preliminaries.LpNormSpaceModelData μ p
```

Fully explicit type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace.{u_1} Ω] →
    {μ : @MeasureTheory.Measure.{u_1} Ω inst} →
      {p : ENNReal} →
        (representativeNorm : (Ω → Real) → ENNReal) →
          (representativeNorm_eq :
              ∀ (X : Ω → Real),
                @Eq.{1} ENNReal (representativeNorm X)
                  (@MeasureTheory.eLpNorm.{u_1, 0} Ω Real
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
                    inst X p μ)) →
            (representativeMember : (Ω → Real) → Prop) →
              (representativeMember_iff :
                  ∀ (X : Ω → Real),
                    Iff (representativeMember X)
                      (@MeasureTheory.MemLp.{u_1, 0} Ω Real inst
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
                        X p μ)) →
                (quotient :
                    @AddSubgroup.{u_1}
                      (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                        (@UniformSpace.toTopologicalSpace.{0} Real
                          (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace))
                        μ)
                      (@MeasureTheory.AEEqFun.instAddGroup.{u_1, 0} Ω Real inst μ
                        (@UniformSpace.toTopologicalSpace.{0} Real
                          (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace))
                        Real.instAddGroup instIsTopologicalAddGroupReal)) →
                  (quotient_eq :
                      @Eq.{u_1 + 1}
                        (@AddSubgroup.{u_1}
                          (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                            (@UniformSpace.toTopologicalSpace.{0} Real
                              (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace))
                            μ)
                          (@MeasureTheory.AEEqFun.instAddGroup.{u_1, 0} Ω Real inst μ
                            (@UniformSpace.toTopologicalSpace.{0} Real
                              (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace))
                            Real.instAddGroup instIsTopologicalAddGroupReal))
                        quotient (@MeasureTheory.Lp.{0, u_1} Ω Real inst Real.normedAddCommGroup p μ)) →
                    @NumStability.HDP.Scalar.Preliminaries.LpNormSpaceModelData.{u_1} Ω inst μ p
```

### D005: `NumStability.HDP.Scalar.Preliminaries.lpNormSpaceModel._proof_1`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.Preliminaries`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `31d2dc17d694200d275bf115a093493b155a54ea1ba3ce643e9a9594a5998338`

Type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω) (p : ENNReal) (x : Ω → Real),
  Eq (MeasureTheory.eLpNorm x p μ) (MeasureTheory.eLpNorm x p μ)
```

Fully explicit type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace.{u_1} Ω] (μ : @MeasureTheory.Measure.{u_1} Ω inst) (p : ENNReal)
  (x : Ω → Real),
  @Eq.{1} ENNReal
    (@MeasureTheory.eLpNorm.{u_1, 0} Ω Real
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
      inst x p μ)
    (@MeasureTheory.eLpNorm.{u_1, 0} Ω Real
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
      inst x p μ)
```

### D006: `NumStability.HDP.Scalar.Preliminaries.lpNormSpaceModel._proof_2`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.Preliminaries`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `3f03bb9aeae746aacb88275007420c03c5620e4f33e6718d83cb95690ee57229`

Type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω) (p : ENNReal) (x : Ω → Real),
  Iff (MeasureTheory.MemLp x p μ) (MeasureTheory.MemLp x p μ)
```

Fully explicit type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace.{u_1} Ω] (μ : @MeasureTheory.Measure.{u_1} Ω inst) (p : ENNReal)
  (x : Ω → Real),
  Iff
    (@MeasureTheory.MemLp.{u_1, 0} Ω Real inst
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
      (@UniformSpace.toTopologicalSpace.{0} Real (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace)) x
      p μ)
    (@MeasureTheory.MemLp.{u_1, 0} Ω Real inst
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
      (@UniformSpace.toTopologicalSpace.{0} Real (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace)) x
      p μ)
```

### D007: `NumStability.HDP.Scalar.Preliminaries.lpNormSpaceModel._proof_3`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.Preliminaries`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `c2ec35d29e6b08fad32e234a126d15d977394e08963d26a6b601512fa4c47911`

Type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω) (p : ENNReal),
  Eq (MeasureTheory.Lp Real p μ) (MeasureTheory.Lp Real p μ)
```

Fully explicit type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace.{u_1} Ω] (μ : @MeasureTheory.Measure.{u_1} Ω inst) (p : ENNReal),
  @Eq.{u_1 + 1}
    (@AddSubgroup.{u_1}
      (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
        (@UniformSpace.toTopologicalSpace.{0} Real (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace))
        μ)
      (@MeasureTheory.AEEqFun.instAddGroup.{u_1, 0} Ω Real inst μ
        (@UniformSpace.toTopologicalSpace.{0} Real (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace))
        Real.instAddGroup instIsTopologicalAddGroupReal))
    (@MeasureTheory.Lp.{0, u_1} Ω Real inst Real.normedAddCommGroup p μ)
    (@MeasureTheory.Lp.{0, u_1} Ω Real inst Real.normedAddCommGroup p μ)
```

### D008: `ContinuousENorm.toENorm`

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

### D009: `ENNReal`

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

### D010: `ENNReal.instPartialOrder`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f07a664eb470c37e8c5abcad62d27fe4145f686c6a6a132fa775fdf14e92b68e`

Type:

```lean
PartialOrder ENNReal
```

Fully explicit type:

```lean
PartialOrder.{0} ENNReal
```

Definition body (one-level semantic boundary):

```lean
inferInstanceAs (PartialOrder (WithTop NNReal))
```

### D011: `Iff`

- Role: `external-frontier`
- Owner module: `Init.Core`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `b9f48489cd9ca513eeae7e3e4fb154f354b93867eda8b67d1630275c4cb4f30b`

Type:

```lean
Prop → Prop → Prop
```

Fully explicit type:

```lean
(a b : Prop) → Prop
```

### D012: `LT.lt`

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

### D013: `MeasurableSpace`

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

### D014: `MeasureTheory.AEStronglyMeasurable`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.StronglyMeasurable.AEStronglyMeasurable`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `e866a219d07f22d134f29e98a4b1d1972686b0a1962b89551fe85b4282173376`

Type:

```lean
{α : Type u_1} →
  {β : Type u_2} →
    [TopologicalSpace β] →
      [m : MeasurableSpace α] →
        {m₀ : MeasurableSpace α} →
          (α → β) → autoParam (MeasureTheory.Measure α) MeasureTheory.AEStronglyMeasurable._auto_1 → Prop
```

Fully explicit type:

```lean
{α : Type u_1} →
  {β : Type u_2} →
    [TopologicalSpace.{u_2} β] →
      [m : MeasurableSpace.{u_1} α] →
        {m₀ : MeasurableSpace.{u_1} α} →
          (f : α → β) →
            (μ : autoParam.{u_1 + 1} (@MeasureTheory.Measure.{u_1} α m₀) MeasureTheory.AEStronglyMeasurable._auto_1) →
              Prop
```

Definition body (one-level semantic boundary):

```lean
fun {α} {β} [TopologicalSpace β] [MeasurableSpace α] {m₀} f μ =>
  Exists fun g => And (MeasureTheory.StronglyMeasurable g) ((MeasureTheory.ae μ).EventuallyEq f g)
```

### D015: `MeasureTheory.IsProbabilityMeasure`

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

### D016: `MeasureTheory.Measure`

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

### D017: `MeasureTheory.eLpNorm`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.LpSeminorm.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `cd89c551c2b7ab3c3a7ffb47ae58cc4ac9c477fb18ba256b1b0639c96fa7fce0`

Type:

```lean
{α : Type u_1} →
  {ε : Type u_2} →
    [ENorm ε] →
      {x : MeasurableSpace α} →
        (α → ε) → ENNReal → autoParam (MeasureTheory.Measure α) MeasureTheory.eLpNorm._auto_1 → ENNReal
```

Fully explicit type:

```lean
{α : Type u_1} →
  {ε : Type u_2} →
    [ENorm.{u_2} ε] →
      {x : MeasurableSpace.{u_1} α} →
        (f : α → ε) →
          (p : ENNReal) →
            (μ : autoParam.{u_1 + 1} (@MeasureTheory.Measure.{u_1} α x) MeasureTheory.eLpNorm._auto_1) → ENNReal
```

Definition body (one-level semantic boundary):

```lean
fun {α} {ε} [ENorm ε] {x} f p μ =>
  ite (Eq p 0) 0 (ite (Eq p instTopENNReal.top) (MeasureTheory.eLpNormEssSup f μ) (MeasureTheory.eLpNorm' f p.toReal μ))
```

### D018: `Ne`

- Role: `external-frontier`
- Owner module: `Init.Core`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `635adc1f9e4a981a5c01b21338fdf89e637bd4ef0aa6911bda4dc03acfe9fba6`

Type:

```lean
{α : Sort u} → α → α → Prop
```

Fully explicit type:

```lean
{α : Sort u} → (a b : α) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun {α} a b => Not (Eq a b)
```

### D019: `NonUnitalSeminormedCommRing.toNonUnitalSeminormedRing`

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

### D020: `NonUnitalSeminormedRing.toSeminormedAddCommGroup`

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

### D021: `NormedCommRing.toSeminormedCommRing`

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

### D022: `OfNat.ofNat`

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

### D023: `PartialOrder.toPreorder`

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

### D024: `Preorder.toLT`

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

### D025: `PseudoMetricSpace.toUniformSpace`

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

### D026: `Real`

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

### D027: `Real.normedCommRing`

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

### D028: `Real.pseudoMetricSpace`

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

### D029: `SeminormedAddCommGroup.toSeminormedAddGroup`

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

### D030: `SeminormedAddGroup.toContinuousENorm`

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

### D031: `SeminormedAddGroup.toPseudoMetricSpace`

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

### D032: `SeminormedCommRing.toNonUnitalSeminormedCommRing`

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

### D033: `Top.top`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Notation`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `32c978930b5eb9164add86b32aeacdc99d2d10df09b4b1989d12a6e346774504`

Type:

```lean
{α : Type u_1} → [self : Top α] → α
```

Fully explicit type:

```lean
{α : Type u_1} → [self : Top.{u_1} α] → α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : Top α] => self.1
```

### D034: `UniformSpace.toTopologicalSpace`

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

### D035: `Zero.toOfNat0`

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

### D036: `instTopENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `fc363bb86fd9c29e754e22d842cff17acbad13559cb0e03d31f4863045cd3c07`

Type:

```lean
Top ENNReal
```

Fully explicit type:

```lean
Top.{0} ENNReal
```

Definition body (one-level semantic boundary):

```lean
WithTop.top
```

### D037: `instZeroENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `6e5878abb65d5809d3258e569c8ff0f08b39804b377a07fec18d700b4e3fea86`

Type:

```lean
Zero ENNReal
```

Fully explicit type:

```lean
Zero.{0} ENNReal
```

Definition body (one-level semantic boundary):

```lean
WithTop.zero
```

### D038: `MeasureTheory.Lp`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.LpSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `ebd6f92d8ed643d08a2bb3129053a166b2fcf4faeda5ac59171621ccd257723a`

Type:

```lean
{α : Type u_7} →
  (E : Type u_6) →
    {m : MeasurableSpace α} →
      [inst : NormedAddCommGroup E] →
        ENNReal →
          (μ : autoParam (MeasureTheory.Measure α) MeasureTheory.Lp._auto_1) → AddSubgroup (MeasureTheory.AEEqFun α E μ)
```

Fully explicit type:

```lean
{α : Type u_7} →
  (E : Type u_6) →
    {m : MeasurableSpace.{u_7} α} →
      [inst : NormedAddCommGroup.{u_6} E] →
        (p : ENNReal) →
          (μ : autoParam.{u_7 + 1} (@MeasureTheory.Measure.{u_7} α m) MeasureTheory.Lp._auto_1) →
            @AddSubgroup.{max u_6 u_7}
              (@MeasureTheory.AEEqFun.{u_7, u_6} α E m
                (@UniformSpace.toTopologicalSpace.{u_6} E
                  (@PseudoMetricSpace.toUniformSpace.{u_6} E
                    (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_6} E
                      (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_6} E inst))))
                μ)
              (@MeasureTheory.AEEqFun.instAddGroup.{u_7, u_6} α E m μ
                (@UniformSpace.toTopologicalSpace.{u_6} E
                  (@PseudoMetricSpace.toUniformSpace.{u_6} E
                    (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_6} E
                      (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_6} E inst))))
                (@NormedAddGroup.toAddGroup.{u_6} E (@NormedAddCommGroup.toNormedAddGroup.{u_6} E inst))
                (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{u_6} E
                  (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_6} E inst)))
```

Definition body (one-level semantic boundary):

```lean
fun {α} E {m} [NormedAddCommGroup E] p μ =>
  { carrier := setOf fun f => ENNReal.instPartialOrder.lt (MeasureTheory.eLpNorm f.cast p μ) instTopENNReal.top,
    add_mem' := ⋯, zero_mem' := ⋯, neg_mem' := ⋯ }
```

### D039: `MeasureTheory.MemLp`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.LpSeminorm.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D040: `Real.normedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Real`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D041: `AddSubgroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Subgroup.Defs`
- Declaration kind: `inductive`
- Distance from target type: `3`
- Semantic SHA-256: `880cc5aadae4d35dc6859a60072dc41e0ebd854b9698ee53307ec4a0b7d59ccf`

Type:

```lean
(G : Type u_3) → [AddGroup G] → Type u_3
```

Fully explicit type:

```lean
(G : Type u_3) → [AddGroup.{u_3} G] → Type u_3
```

### D042: `Eq`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `3`
- Semantic SHA-256: `63e9afa87e04d13393a2fe09e8e76489d96be3982734b4b40a52fc6ebea863d7`

Type:

```lean
{α : Sort u_1} → α → α → Prop
```

Fully explicit type:

```lean
{α : Sort u_1} → α → α → Prop
```

### D043: `MeasureTheory.AEEqFun`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.AEEqFun`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `6617e69bba6f9e44b27a7929a11353f104ce0c7b079a276babaa71beeb73cdac`

Type:

```lean
(α : Type u_1) →
  (β : Type u_2) → [inst : MeasurableSpace α] → [TopologicalSpace β] → MeasureTheory.Measure α → Type (max u_1 u_2)
```

Fully explicit type:

```lean
(α : Type u_1) →
  (β : Type u_2) →
    [inst : MeasurableSpace.{u_1} α] →
      [TopologicalSpace.{u_2} β] → (μ : @MeasureTheory.Measure.{u_1} α inst) → Type (max u_1 u_2)
```

Definition body (one-level semantic boundary):

```lean
fun α β [MeasurableSpace α] [TopologicalSpace β] μ => Quotient (MeasureTheory.Measure.aeEqSetoid β μ)
```

### D044: `MeasureTheory.AEEqFun.instAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.AEEqFun`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `8215aa068cde3e7db93e8268e18564d63eece2fd00f92d0d99b42f4005aecb8c`

Type:

```lean
{α : Type u_1} →
  {γ : Type u_3} →
    [inst : MeasurableSpace α] →
      {μ : MeasureTheory.Measure α} →
        [inst_1 : TopologicalSpace γ] →
          [inst_2 : AddGroup γ] → [IsTopologicalAddGroup γ] → AddGroup (MeasureTheory.AEEqFun α γ μ)
```

Fully explicit type:

```lean
{α : Type u_1} →
  {γ : Type u_3} →
    [inst : MeasurableSpace.{u_1} α] →
      {μ : @MeasureTheory.Measure.{u_1} α inst} →
        [inst_1 : TopologicalSpace.{u_3} γ] →
          [inst_2 : AddGroup.{u_3} γ] →
            [@IsTopologicalAddGroup.{u_3} γ inst_1 inst_2] →
              AddGroup.{max u_3 u_1} (@MeasureTheory.AEEqFun.{u_1, u_3} α γ inst inst_1 μ)
```

Definition body (one-level semantic boundary):

```lean
fun {α} {γ} [MeasurableSpace α] {μ} [TopologicalSpace γ] [AddGroup γ] [IsTopologicalAddGroup γ] =>
  Function.Injective.addGroup MeasureTheory.AEEqFun.toGerm ⋯ ⋯ ⋯ ⋯ ⋯ ⋯ ⋯
```

### D045: `Real.instAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `3`
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

### D046: `instIsTopologicalAddGroupReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.Algebra.Ring.Real`
- Declaration kind: `theorem`
- Distance from target type: `3`
- Semantic SHA-256: `4bf923f1ed3c48fb47196057bc5be8c0979ffd51942feea6412e4f04db492087`

Type:

```lean
IsTopologicalAddGroup Real
```

Fully explicit type:

```lean
@IsTopologicalAddGroup.{0} Real
  (@UniformSpace.toTopologicalSpace.{0} Real (@PseudoMetricSpace.toUniformSpace.{0} Real Real.pseudoMetricSpace))
  Real.instAddGroup
```
