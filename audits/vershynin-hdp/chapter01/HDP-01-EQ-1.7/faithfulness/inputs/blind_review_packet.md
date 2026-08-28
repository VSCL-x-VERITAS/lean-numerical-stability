# Blind Lean declaration dossier

Translate only the mathematical proposition below. Source identity, task metadata,
theorem name, source declaration, proof, and repository commentary are excluded.
Do not use tools or inspect filesystem content.

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
                    LocalDef004
                      (LocalDef002 X p N) ⋯)
                  Filter.atTop (nhds LocalDef001)
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
      @LocalDef004.{u_1} Ω inst μ inst_1
        (@LocalDef002.{u_1} Ω X p N)
        (@LocalDef003.{u_1} Ω inst μ X p N fun (i : Nat) =>
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
      LocalDef001)
```

## Complete semantic dependency inventory

Return exactly one coverage record for every dependency ID, in order.

### D001: `LocalDef001`

- Role: `local`
- Owner module: `NumStability.HDP.Contracts.C_01_hdef_hstandard_hnormal`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `aa1da11015e45f2b13db37c49c99b58ae5e8430a013b00cc5f07dba27f404aab`

Hash-verified prior declaration review:

- Reuse SHA-256: `97745eae4024270112bf045c96430ffd3dbe77af0a98deeaa0211f4c0c70d4de`
- Reviewed meaning: Defines the limiting probability measure on the real line.

Independently determine this declaration's effect on the current proposition.

### D002: `LocalDef002`

- Role: `local`
- Owner module: `LocalImport001`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `37b96abdac1b06f51bcfc8c36b3fb33cffb6d456d7c89406d61b54b0809e7358`

Type:

```lean
{Ω : Type u_1} → (Nat → Ω → Real) → NNReal → Nat → Ω → Real
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} X p N ω =>
  instHMul.hMul
    (Real.instInv.inv (instHMul.hMul (instHMul.hMul (instHAdd.hAdd N.cast 1) p.toReal) (instHSub.hSub 1 p.toReal)).sqrt)
    ((Finset.range (instHAdd.hAdd N 1)).sum fun i => instHSub.hSub (X i ω) p.toReal)
```

### D003: `LocalDef003`

- Role: `local`
- Owner module: `LocalImport001`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `d8afa3c5b90f8369d897d6140c0878df539f6048f0a38cf4f4d6315812542b2c`

Type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω) (X : Nat → Ω → Real) (p : NNReal) (N : Nat),
  (∀ (i : Nat), AEMeasurable (X i) μ) → AEMeasurable (LocalDef002 X p N) μ
```

### D004: `LocalDef004`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.LimitTheorems`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `9eb73233139c77e2ba4b054c7c5db48f89b1ed5c9e6cf501dec07d1ad6a32d63`

Hash-verified prior declaration review:

- Reuse SHA-256: `55021146e4eb2eb9d1e4f3b4323f7270636e70876e0ddb1ae2944ff4e55dfd95`
- Reviewed meaning: Forms the probability distribution of an almost-everywhere measurable real function.

Independently determine this declaration's effect on the current proposition.

### D005: `LocalDef005`

- Role: `local`
- Owner module: `NumStability.HDP.Contracts.C_01_hdef_hstandard_hnormal`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `382878b1bd0a9d6cebdea15c2dd2437c40145d9d7ab53f99b4aae6b52bc725eb`

Hash-verified prior declaration review:

- Reuse SHA-256: `55d3c88bcd209b5bd085ebe512489d33b398e5a0b6b8e705d75e367171acdd3c`
- Reviewed meaning: Provides the underlying real measure of the limiting probability measure.

Independently determine this declaration's effect on the current proposition.

### D006: `LocalDef006`

- Role: `local`
- Owner module: `NumStability.HDP.Contracts.C_01_hdef_hstandard_hnormal`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `8c3066a33771ff7325f98fe5ba4bc0c45687dea2887ceaca5d166ff6aa5179a7`

Hash-verified prior declaration review:

- Reuse SHA-256: `d0a0c628843099136742463d4d6a0d4310b70dd972019708ee96940146573427`
- Reviewed meaning: Certifies that the limiting measure has total mass one.

Independently determine this declaration's effect on the current proposition.

### D007: `LocalDef007`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.LimitTheorems`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `9412a1f926c86022e6b7cb277033a1601cac842fa5ef3f2c6bc35f23d7cb4784`

Hash-verified prior declaration review:

- Reuse SHA-256: `2623c4f1f3de8712e9a3ddb81155ae925c3967e247c45d227deae204f8b2929a`
- Reviewed meaning: Identifies the limit as the real Gaussian distribution with mean zero and variance one.

Independently determine this declaration's effect on the current proposition.

### D008: `AddCommMonoidWithOne.toAddMonoidWithOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `07f48d3cfc3c7c30b6298df8531409d9844ab8c7e0ba94dea2a3fd29879320af`

Hash-verified prior declaration review:

- Reuse SHA-256: `9b07041e61fdb4cc26768436657522ac1250b04c06e3a3f56dbf8d3ce891474d`
- Reviewed meaning: Provides numeral-cast algebra infrastructure without proposition-level content.

Independently determine this declaration's effect on the current proposition.

### D009: `AddMonoidWithOne.toNatCast`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6b956e88ee642e7533983b76ff8087f4537eea04f025165ce1fa45dc80e795a2`

Hash-verified prior declaration review:

- Reuse SHA-256: `c7e14e8ad7d95f9b4047624aff41f0984cdd55d7bccbb943268832843a5878e0`
- Reviewed meaning: Interprets the numeral two in the L² exponent.

Independently determine this declaration's effect on the current proposition.

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

### D011: `ContinuousENorm.toENorm`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `31fb1ad5ceaae342dc2fe1c1f2eba1b18e67d9d01a5451201d210b585bde97c0`

Hash-verified prior declaration review:

- Reuse SHA-256: `74638b447cd1abd90d977ea67daf538d685768927c3d4a5c9fe554acadf9241f`
- Reviewed meaning: Provides the extended-norm structure required by square-integrability.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `f8f17b40d9dc8ac4c2f592c4402c318b85e097a026b21cd270783979e5278454`
- Reviewed meaning: Provides the extended nonnegative real type used for the L² exponent.

Independently determine this declaration's effect on the current proposition.

### D014: `Eq`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `63e9afa87e04d13393a2fe09e8e76489d96be3982734b4b40a52fc6ebea863d7`

Hash-verified prior declaration review:

- Reuse SHA-256: `04dde23a2e823476277e5a9f6703e6fbd3e70695354a133e7640afe760d7be49`
- Reviewed meaning: Interprets the stated mean and variance equations as equality.

Independently determine this declaration's effect on the current proposition.

### D015: `Filter.Tendsto`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Filter.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7e5f54349644c32198960083c0e0eb6c033c80a8656d02a78b3eae9a4f5131f2`

Hash-verified prior declaration review:

- Reuse SHA-256: `a04b2f2f4860c3177037657cf66eaff8afbc35d6f81b72b2d73f23756e2d4ec6`
- Reviewed meaning: Expresses filter convergence of cumulative probabilities.

Independently determine this declaration's effect on the current proposition.

### D016: `Filter.atTop`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Filter.AtTopBot.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f743a11da6fe9e156755f41ec35f4d61b87ca4af4575ede456b477a74caa45f3`

Hash-verified prior declaration review:

- Reuse SHA-256: `d544158b8e21b77d2df8ce9fd0a7ac4c47717fabae9cb46e68afc8494395cf47`
- Reviewed meaning: Specifies that the natural-number parameter tends to infinity.

Independently determine this declaration's effect on the current proposition.

### D017: `HMul.hMul`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `4e00447a4a8ef4c2ce13e307c56a1fbcd7fa8c732fe039a452b42477a50df2c6`

Hash-verified prior declaration review:

- Reuse SHA-256: `80e758ff172d662bfe95273f933fc6ff5ea1262978b5d7003d3a0a6c6f20cada`
- Reviewed meaning: Supplies multiplication used in normalization and scaling.

Independently determine this declaration's effect on the current proposition.

### D018: `HSub.hSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `98025b38d523c0eadea77ba4961a20b2a913b23c079c4bfeba24a7bfaa24a4bc`

Hash-verified prior declaration review:

- Reuse SHA-256: `d3209a18981f436782f45e7276017c9e3149dc314504ac7659fabf851b0647c1`
- Reviewed meaning: Supplies subtraction used to center each variable.

Independently determine this declaration's effect on the current proposition.

### D019: `InnerProductSpace.toNormedSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.InnerProductSpace.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `683435a8d27d50ec1482d74d23f541d52d05ff0411c60f88d16c32132aca9f3e`

Hash-verified prior declaration review:

- Reuse SHA-256: `923ea92218259e0f95a22eea4515f914d70cc868ee56548ca3f196ea78909c05`
- Reviewed meaning: Supplies real normed-space structure required by integration.

Independently determine this declaration's effect on the current proposition.

### D020: `LT.lt`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `fd5699899f1a49c91982cb363d3a71557ab1b53ee772cd777c9ee7717abc2009`

Hash-verified prior declaration review:

- Reuse SHA-256: `db093548e70fadf2979e2f5a93c37542ecffc56d3a0734db7b5b5c6cd3019dae`
- Reviewed meaning: Interprets the strict positivity assumption on sigma.

Independently determine this declaration's effect on the current proposition.

### D021: `MeasurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.MeasurableSpace.Defs`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `6825e55082259c6be2028d5ee0624c796293eccdd78af118da4583180067d196`

Hash-verified prior declaration review:

- Reuse SHA-256: `ac1b173c6a3501acf20f02b483b886d24f537360eb21035006c00298176d1a9d`
- Reviewed meaning: Provides the measurable-space structure on the sample space.

Independently determine this declaration's effect on the current proposition.

### D022: `MeasureTheory.IsProbabilityMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Typeclasses.Probability`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `f88b269cb95d165125e7553fd22f97d6e5f9b1b9bcdec7f6738a781dc674bf89`

Hash-verified prior declaration review:

- Reuse SHA-256: `5de27f6289c1ed57243ef66a5f0080e4233b33c7d4b97fa896fc330cd6b60494`
- Reviewed meaning: Expresses that the underlying measure is a probability measure.

Independently determine this declaration's effect on the current proposition.

### D023: `MeasureTheory.Measure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `ba8c23c70f3135407096406cee0b4d7d9f02d088e8b1d1a1e105071821a3a51b`

Hash-verified prior declaration review:

- Reuse SHA-256: `1cf84d56983143cd1d8ca4657def40551c33d34d8b72e4bfbd040486bfa22e37`
- Reviewed meaning: Provides the measure type of the underlying probability measure.

Independently determine this declaration's effect on the current proposition.

### D024: `MeasureTheory.MemLp`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.LpSeminorm.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `3d38a386250cbaad2a5c216f9bf80b5f748106d4406c769283ef0114b4f42398`

Hash-verified prior declaration review:

- Reuse SHA-256: `593dde277dc9a7a0c728462ad5551a9594deaf4ed6890c4cc2e0c2933d0d5022`
- Reviewed meaning: Expresses square-integrability of every summand.

Independently determine this declaration's effect on the current proposition.

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

### D026: `MeasureTheory.ProbabilityMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.ProbabilityMeasure`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `251bef2162749e0bcb67a1413765bc7556e9854c7a23036b986ada6a2e2958be`

Hash-verified prior declaration review:

- Reuse SHA-256: `2b8d304d1aebbb9f4456ed284b31f16c2fd4bef8306c5d9536f5bd4bdf41f318`
- Reviewed meaning: Provides the type of probability measures used for laws and the Gaussian limit.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `c81e5026a3ab45e08f29f183c15ccbf987cc682d9a330a3eb7897e00c1dc91e7`
- Reviewed meaning: Defines the integral used to state the common mean.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `d8f484ef0356a1a569a91b9b9cb41029ae7a347857fbb259452d22ae582ec43b`
- Reviewed meaning: Provides the nonnegative-real type used by probability-measure infrastructure.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `6ae1abc2217b2754b037020f2fa3af340132de7ff8d6cd57786eaeb65d3c1db2`
- Reviewed meaning: Provides the natural-number index and partial-sum parameter type.

Independently determine this declaration's effect on the current proposition.

### D033: `Nat.instAtLeastTwoHAddOfNat`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Init`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `309ef94c4b7cfbe2e668952e6915279353921d5d48b6123a30f90dd932dac3e6`

Hash-verified prior declaration review:

- Reuse SHA-256: `a8d7469cb242398174653889e55bed9331e61db96be1bf1df20ddd438a0ad770`
- Reviewed meaning: Provides technical arithmetic evidence for the L² exponent.

Independently determine this declaration's effect on the current proposition.

### D034: `Nat.instNeZeroSucc`

- Role: `external-frontier`
- Owner module: `Init.Data.Nat.Basic`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `a0735a528184c05594c4c79312c1225bb4dcffcdf0df7eb1a50c5733047c85ad`

Hash-verified prior declaration review:

- Reuse SHA-256: `9e4c167315abe94dfeb01e85d7cedf2607cc3ce2e154b3779ebcb806abe48752`
- Reviewed meaning: Provides nonzero-successor numeral infrastructure.

Independently determine this declaration's effect on the current proposition.

### D035: `Nat.instPreorder`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5ea89e9915200c8782bc933f9184e28eb38f4c9610b00cf1310cc6e6435642d8`

Hash-verified prior declaration review:

- Reuse SHA-256: `66fcacc619e9b0626056604382be923b01d3af050c9c24e7f3d79876d0321c60`
- Reviewed meaning: Supplies the natural-number preorder underlying the limit at infinity.

Independently determine this declaration's effect on the current proposition.

### D036: `NonUnitalSeminormedCommRing.toNonUnitalSeminormedRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `c697ff5e735ebe18733e51950717037e73ba73e94ac2e99953bfb521708cabd2`

Hash-verified prior declaration review:

- Reuse SHA-256: `4800163900f0696417a66b7459426fdb6606cf5a3deef20c07b6f401960ea246`
- Reviewed meaning: Projects standard real normed-ring structure; it adds no proposition-level content.

Independently determine this declaration's effect on the current proposition.

### D037: `NonUnitalSeminormedRing.toSeminormedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `db7996fa414ad67340b9d6991cd145ac2a5d251a870097d20f2f63e371fb101d`

Hash-verified prior declaration review:

- Reuse SHA-256: `a522298ef187fc926e2a1f4041376598af84a335f46f492fec81c243e5ef753e`
- Reviewed meaning: Projects standard real normed-ring structure; it adds no proposition-level content.

Independently determine this declaration's effect on the current proposition.

### D038: `NormedAddCommGroup.toSeminormedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7327759e5e9417c54393e7566584cd72d79c77b4ca018ea408c5d024667587be`

Hash-verified prior declaration review:

- Reuse SHA-256: `0b643449a2f6cfec744685559b1bc7efb813893d8a7f5a2c8457c9a18bf67147`
- Reviewed meaning: Projects standard real normed-ring structure; it adds no proposition-level content.

Independently determine this declaration's effect on the current proposition.

### D039: `NormedCommRing.toSeminormedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `ad504b2606febc5a066d58ac540c9826bd1b7fce734d59a7fef63c7c27112fe3`

Hash-verified prior declaration review:

- Reuse SHA-256: `da373472c0831f99ae36e2f55178deef12a4e6dd1a123ecb1ddbbf3ced24e40a`
- Reviewed meaning: Projects standard real normed-ring structure; it adds no proposition-level content.

Independently determine this declaration's effect on the current proposition.

### D040: `OfNat.ofNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6a6a0720d091cfeb582747fe67b977e948f09706c0beae1f2f21830aa5821ead`

Hash-verified prior declaration review:

- Reuse SHA-256: `1efc077e8615b3245d417533469ab770558380bb9152e17e370e22fa12e088e5`
- Reviewed meaning: Interprets numeric literals in their ambient types.

Independently determine this declaration's effect on the current proposition.

### D041: `One.toOfNat1`

- Role: `external-frontier`
- Owner module: `Init.Data.Zero`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `cc544b5b2a2aabc84389a9fe2f052127dc6dae9964782b117b9b19b773e542d5`

Hash-verified prior declaration review:

- Reuse SHA-256: `a6e46e6caacb86b9789377291ee63b95cf97540a256b07b2f20985b076b9af71`
- Reviewed meaning: Interprets one as a numeric literal.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `aea65c9bf136a84bc86bdef1df96c9ba853057d86f20a7c7da29d93f8d5ae67f`
- Reviewed meaning: Expresses that every summand has the same distribution as the first.

Independently determine this declaration's effect on the current proposition.

### D045: `ProbabilityTheory.iIndepFun`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.Independence.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `fc42c9fb6cb6d72ada8e7605b71644561e188fc9c555246dd3ef51d84fa13130`

Hash-verified prior declaration review:

- Reuse SHA-256: `2ff4c34c6e4855e64c2176130066d32ef2b58414d5d9530355503445c319a48f`
- Reviewed meaning: Expresses mutual independence of the indexed family.

Independently determine this declaration's effect on the current proposition.

### D046: `ProbabilityTheory.variance`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.Moments.Variance`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `2eb32ed492bfdd1df3ad84f7e963b9d4f0347489111c9ee4dddf93da3947d3a2`

Hash-verified prior declaration review:

- Reuse SHA-256: `da38ea33c2499b40feedd470a16fea47d0823ad686cfac397a2d28435ef6d48e`
- Reviewed meaning: Defines the variance used in the common-variance hypothesis.

Independently determine this declaration's effect on the current proposition.

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

### D048: `PseudoMetricSpace.toUniformSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.MetricSpace.Pseudo.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `a6831039b3ad5e37bd0e7692fd995a699d8bef791976e20262da929990521799`

Hash-verified prior declaration review:

- Reuse SHA-256: `13801df2355d16a8a25f3af2591bc1ce300a9533629da9903b63ac982e52f692`
- Reviewed meaning: Supplies standard metric structure on the reals.

Independently determine this declaration's effect on the current proposition.

### D049: `RCLike.toInnerProductSpaceReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.InnerProductSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f602276baee30d3dbe02bd6b756a9097f750d59a7f91ca7635dcfc935fd22981`

Hash-verified prior declaration review:

- Reuse SHA-256: `93293bc1f41025a9411628e7df7e6040a22d2ddacf285ab46753e9d803bedcf7`
- Reviewed meaning: Supplies standard inner-product structure on the reals.

Independently determine this declaration's effect on the current proposition.

### D050: `Real`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `38529f0578472feffc4c79d5d0755fa10fc3edafb232ab5e442336d13630ee90`

Hash-verified prior declaration review:

- Reuse SHA-256: `cdf2e577612327f6484d34dcf9ccac386a0301c1ecaebfb94460cc58616021fc`
- Reviewed meaning: Provides the real-number type for summands, parameters, thresholds, sums, and limits.

Independently determine this declaration's effect on the current proposition.

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

### D052: `Real.instMul`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `459ccbe28a1d29ccd2b329ea29e1a84b329b8064b8a8ecc52764b69b23e229ed`

Hash-verified prior declaration review:

- Reuse SHA-256: `dac88b1e3b778dee301f135fd7de760dacf5c2c19067d46372901ffee9d6a2c0`
- Reviewed meaning: Supplies the standard multiplication on the reals.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `a36aa659a0caa80da2b9508e23b0e6a1e8e44b6d31050ae736714c627f49892f`
- Reviewed meaning: Supplies standard real-like analytic structure.

Independently determine this declaration's effect on the current proposition.

### D055: `Real.instSub`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `926d9e8fcca2819a885d446e168b20c7c8aac2e542d59ed2b48e32c9a4659a36`

Hash-verified prior declaration review:

- Reuse SHA-256: `d9360bdc88211781d6abe53010543b8149bc1bbfa10203be0c65cc692779ee94`
- Reviewed meaning: Supplies the standard subtraction on the reals.

Independently determine this declaration's effect on the current proposition.

### D056: `Real.measurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Constructions.BorelSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `51b107725c4edbe40e50ff5651a2c7ee5a10037e341c2764964a6d6cc26d82a1`

Hash-verified prior declaration review:

- Reuse SHA-256: `700e834c509755be10ea88ad138db80bb84e4420cba6136603cfd0f4472c0a8b`
- Reviewed meaning: Supplies the standard measurable structure on the reals.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `935ada08b71a23cca4b89a3e602af5c3478c572e40ef07f4de91a9ed04dde653`
- Reviewed meaning: Supplies the standard normed additive structure on the reals.

Independently determine this declaration's effect on the current proposition.

### D059: `Real.normedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `69cccc1e864661e103785f4a2712b9ad164d845c03b7737801c37e5ac852bad7`

Hash-verified prior declaration review:

- Reuse SHA-256: `57f31930a02b5d8f7e9fbb8c81aa6947465b2153b828b95e3183f4d799311ded`
- Reviewed meaning: Supplies the standard normed commutative ring structure on the reals.

Independently determine this declaration's effect on the current proposition.

### D060: `Real.pseudoMetricSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.MetricSpace.Pseudo.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `9c0d1d56a04dd3ae3fce36b5fb3c2f4fe632c2bdaed84b5667c1a60a03491a3e`

Hash-verified prior declaration review:

- Reuse SHA-256: `a4455e36d22b823afad129cf3fb29bab9a0b77e49f52bfdd30977bdf4e0df933`
- Reviewed meaning: Supplies the standard metric structure on the reals.

Independently determine this declaration's effect on the current proposition.

### D061: `SeminormedAddCommGroup.toSeminormedAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8cf35215f509cdee10a3a95158cbaadd3c5fb584bc0d1f4fad6ecfc69b1bd205`

Hash-verified prior declaration review:

- Reuse SHA-256: `688b7a662db5de515d775e771051793144b1408f818b1c39e691bb6f8780e980`
- Reviewed meaning: Projects standard seminormed additive structure.

Independently determine this declaration's effect on the current proposition.

### D062: `SeminormedAddGroup.toContinuousENorm`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Continuity`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `17a83cbf3059dd0bbaefd43c93ce329f1d6b760d440889322b3582a18b23a141`

Hash-verified prior declaration review:

- Reuse SHA-256: `1f1b7d2f99ff83fc5e8a68e8bf08a1ce236761899df844a9f3c68f5d3eb70c86`
- Reviewed meaning: Projects standard continuous extended-norm structure.

Independently determine this declaration's effect on the current proposition.

### D063: `SeminormedAddGroup.toPseudoMetricSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `d4043bb9912319b688406ba77c3a5b0fdd8f53ab605cf1962721b51314c66d3f`

Hash-verified prior declaration review:

- Reuse SHA-256: `2620ad4cd9357353acf0b6234d2649137bd13ae889d231739ce614ba29707a86`
- Reviewed meaning: Projects standard pseudometric structure.

Independently determine this declaration's effect on the current proposition.

### D064: `SeminormedCommRing.toNonUnitalSeminormedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `a29f0377c9baf2265c34aaf85b852e7c4260b34d2dc04574484c335ebc09a6e9`

Hash-verified prior declaration review:

- Reuse SHA-256: `ecacf63488df7608dcbc884d9e8570d1c50286e120499aeedccf0d322915634a`
- Reviewed meaning: Projects standard seminormed commutative-ring structure.

Independently determine this declaration's effect on the current proposition.

### D065: `UniformSpace.toTopologicalSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.UniformSpace.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `4d18df801a98905221e0935ec2ddacda684a1430b8d198ebc23fad0643bce2a8`

Hash-verified prior declaration review:

- Reuse SHA-256: `27b8cffd08a107f43d407ec3c6523df3aaca725e4f3e2900e57089557c9efeb4`
- Reviewed meaning: Projects the topology from the standard uniform structure.

Independently determine this declaration's effect on the current proposition.

### D066: `Zero.toOfNat0`

- Role: `external-frontier`
- Owner module: `Init.Data.Zero`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f7ebe8a983de002c1ee751fd3c144a7c1933b3bb95c87c5001a3cabf5709031a`

Hash-verified prior declaration review:

- Reuse SHA-256: `d6baa9ca9b0f57f0346ca30de9e73e9fb1cd6dad2805f2ec46853a86c055aa17`
- Reviewed meaning: Interprets zero as a numeric literal.

Independently determine this declaration's effect on the current proposition.

### D067: `instAddCommMonoidWithOneENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `31d9551885e3007e5d1368365622cfd7638ea41cc6d885234041621de873f55c`

Hash-verified prior declaration review:

- Reuse SHA-256: `542ef9f852572fdb7abcb37dad45f1b1b9d712d73c87400a4812513e817eafcc`
- Reviewed meaning: Supplies additive and numeral structure on extended nonnegative reals.

Independently determine this declaration's effect on the current proposition.

### D068: `instHMul`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `1fd375514ac68e29e7941c94ba308ea936395db23d0fee63a5c69dcccd3b2bdc`

Hash-verified prior declaration review:

- Reuse SHA-256: `7a09e2dbbb290227a664f891ab39bd653aaa3db14e85801ff1d95faaa371cb49`
- Reviewed meaning: Supplies heterogeneous multiplication infrastructure.

Independently determine this declaration's effect on the current proposition.

### D069: `instHSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `aa782f2b5af3d068f4c5340de4b32b193fece2c659a45582cc3024a19b550c87`

Hash-verified prior declaration review:

- Reuse SHA-256: `d2df4a0d412d11a5cc8d01a348043c36fd9fae5aa4559b0900785bc5b1a63975`
- Reviewed meaning: Supplies heterogeneous subtraction infrastructure.

Independently determine this declaration's effect on the current proposition.

### D070: `instOfNatAtLeastTwo`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `37355febc51d6fa8ff12fc8e7b429771db340390d46411d7608c566bdffd358d`

Hash-verified prior declaration review:

- Reuse SHA-256: `d8a6eb0b5448a89ba28d10c9bbd058a30e81cbaae0f0832296283e53b8c2b149`
- Reviewed meaning: Supplies the at-least-two numeral instance.

Independently determine this declaration's effect on the current proposition.

### D071: `instOfNatNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7018dea92aae8c272f3a065f25e2bedb9732a0b602c3d54b166fa0cf2ce1ea92`

Hash-verified prior declaration review:

- Reuse SHA-256: `a3e8f340a12a6832d12bb06f24fcb6fa90583a08abf800092108f9b08a44b7be`
- Reviewed meaning: Supplies numeral infrastructure on natural numbers.

Independently determine this declaration's effect on the current proposition.

### D072: `instOneNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `be1ba7c9e9b4395e59c17c7a89b726801d594c6c78763ffff9bb49c61ecf93a2`

Hash-verified prior declaration review:

- Reuse SHA-256: `374730389e406b5d1070fe639f8c916b2a973cbe74c76d91a16d1367481fb7f8`
- Reviewed meaning: Supplies the value one in the nonnegative-real structure.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `f4997e6b888280d974fca251cdc84c006fa15a6b9be6fdea4ab496e846a2ef69`
- Reviewed meaning: Supplies the neighborhood filter used for convergence.

Independently determine this declaration's effect on the current proposition.

### D076: `AEMeasurable`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `6dc48478b911cadddc9129039bc8859282262cccd65bca8d46f3cdc5415a69cd`

Hash-verified prior declaration review:

- Reuse SHA-256: `67451b3ea6434c1aed8a9ee8ec85d28b90abbd992e1048e93f19f9e36d60b4d4`
- Reviewed meaning: Expresses almost-everywhere measurability of normalized finite sums.

Independently determine this declaration's effect on the current proposition.

### D077: `Finset.range`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Finset.Range`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `0d8947d3b91a57604f7b7be615f2ff236f2058a47281af31ea2498635666e9e7`

Hash-verified prior declaration review:

- Reuse SHA-256: `e2093cf6f1e5d0de89eea9c2c6bf0a5a8b0096770e80b0fc9f28883e5b1b318d`
- Reviewed meaning: Defines the finite range of indices for each partial sum.

Independently determine this declaration's effect on the current proposition.

### D078: `Finset.sum`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.BigOperators.Group.Finset.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `931ceac4e9efb5833f58970d10ced4621362e020ea1119492a8d379b7e692372`

Hash-verified prior declaration review:

- Reuse SHA-256: `e0b9465c46b3750465a06db77de89dc222c53e16a6dc55e78f85541ab022162e`
- Reviewed meaning: Forms the finite sum of centered random variables.

Independently determine this declaration's effect on the current proposition.

### D079: `HAdd.hAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `e0bf2a92addd6ea713343e4ef69f67e4e1155781d08f46957b9f71412d865f59`

Hash-verified prior declaration review:

- Reuse SHA-256: `465f534a903797d383da3f9e066fc4cd97dc43936089f5096bf411365c59557e`
- Reviewed meaning: Forms N plus one, producing the first N+1 variables.

Independently determine this declaration's effect on the current proposition.

### D080: `Inv.inv`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `c3aea3c6e2edd31a7b2cf071814315808ef7d84fd01d8c9b719313846ebca438`

Hash-verified prior declaration review:

- Reuse SHA-256: `167eedb689eac42b918c85a66baabf0f8e20d3649c9fc72605ebecfc301cacd5`
- Reviewed meaning: Supplies inversion used to divide by sigma times square root N.

Independently determine this declaration's effect on the current proposition.

### D081: `MeasureTheory.Measure.isProbabilityMeasure_map`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Typeclasses.Probability`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `5624854207c8bee28341ec39de7199a37aa6780067b481804214a292b0055dc0`

Hash-verified prior declaration review:

- Reuse SHA-256: `8a3f87e78110906d730611efa49157db88ed061cdea2ad0ab9aed3feb64dc208`
- Reviewed meaning: Certifies that the pushforward of the probability measure remains a probability measure.

Independently determine this declaration's effect on the current proposition.

### D082: `MeasureTheory.Measure.map`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Map`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `35d0f192bfc92d083756f0df86ca1ad37f0c1f0bfa39120f6adf90414c4a3b75`

Hash-verified prior declaration review:

- Reuse SHA-256: `51f1f7ba40ff43dbf2ed99a64a542918b7abadeb1a37a41c0855e9e726b5fde7`
- Reviewed meaning: Defines pushforward measure and hence each normalized-sum law.

Independently determine this declaration's effect on the current proposition.

### D083: `Nat.cast`

- Role: `external-frontier`
- Owner module: `Init.Data.Cast`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `6e24327ea908b1837083bb15aef27d593e950a2ff8ade81d8aa94bfe33b64450`

Hash-verified prior declaration review:

- Reuse SHA-256: `13e8a4a87d338757b8cb44fe155ce920eb5748a0af2813504733fda268b5466b`
- Reviewed meaning: Casts the natural sample size to a real before taking its square root.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `b1372d9d9ecaf97ac243bfa479d38d7e03a656007ba0b00d3dd8eb3f78de4a9d`
- Reviewed meaning: Supplies the standard additive commutative monoid on the reals.

Independently determine this declaration's effect on the current proposition.

### D086: `Real.instInv`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `8996fd673a1e2289aaf761085a60a161bdafebda8cdd48d1efb3c89da1382980`

Hash-verified prior declaration review:

- Reuse SHA-256: `dc115ffc39e710e839cff97a79063e5cdeac40acf02fcc5cc58505497d70c6a4`
- Reviewed meaning: Supplies the standard inverse on the reals.

Independently determine this declaration's effect on the current proposition.

### D087: `Real.instNatCast`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `5fc7a7becbc71d472fa1a28bd92d79b4c6ea4fdc643db7380031a2b890ca7e15`

Hash-verified prior declaration review:

- Reuse SHA-256: `6d4b491767da3bed390326ba12ce114a18a6ebbf053fe078d3aa9721815c44d6`
- Reviewed meaning: Supplies the standard natural-number cast into the reals.

Independently determine this declaration's effect on the current proposition.

### D088: `Real.sqrt`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Sqrt`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `67f9248ae1acb851b5392be301057ebb8b8ef2fb20f76d2d53a2d07ec8f30553`

Hash-verified prior declaration review:

- Reuse SHA-256: `a45e047ff1d6788736059a4679d03ba2a9e23cb388a4aa2e4c9a15de3da5948b`
- Reviewed meaning: Defines the nonnegative square root appearing in the normalization.

Independently determine this declaration's effect on the current proposition.

### D089: `Subtype.mk`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `constructor`
- Distance from target type: `2`
- Semantic SHA-256: `488ac61b6d3c07fb9a2f54a03a39e6001a4c7cedfd07515f0f9865e7fef9ef51`

Hash-verified prior declaration review:

- Reuse SHA-256: `0b71d3d504619c12f7ae0a4f803982d1f5e433dc954135d383b106920bd4f64f`
- Reviewed meaning: Constructs a bundled probability measure from a measure and its probability proof.

Independently determine this declaration's effect on the current proposition.

### D090: `instAddNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `a1534bcd3e1888406ac787d30eeff8a284cb6688c23f5e8de09351dda91a280c`

Hash-verified prior declaration review:

- Reuse SHA-256: `10993aeed3015dbe7076cabcd9d986a9f695a205960f2d92bebf3a2a1ca7eba0`
- Reviewed meaning: Supplies natural-number addition infrastructure.

Independently determine this declaration's effect on the current proposition.

### D091: `instHAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `38066efd17aeeca52ec2890d9aafca2fa3cce8fda7f5843c1b8e5da130d93981`

Hash-verified prior declaration review:

- Reuse SHA-256: `92976f8a587132eaf9209e8a78e2a32d2b1b99e77c7b456431145c124872202e`
- Reviewed meaning: Supplies heterogeneous addition infrastructure.

Independently determine this declaration's effect on the current proposition.

### D092: `ProbabilityTheory.gaussianReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.Distributions.Gaussian.Real`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `640e905d8e9530cec4dfeaf3d53f9e2b0e193d42ec6b75a24f451a6c1e866b28`

Hash-verified prior declaration review:

- Reuse SHA-256: `07f4f813315c07688c00baa751812206c9e4cbf0c26b37cc0138d417fcd9ac40`
- Reviewed meaning: Defines the Gaussian measure with mean zero and variance one.

Independently determine this declaration's effect on the current proposition.

### D093: `Real.instZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `860eaaa75b06ac6fccbf4f27e9e162807e8851d04bb42d2411332c6368b14882`

Hash-verified prior declaration review:

- Reuse SHA-256: `7fa0d7ab0240514c11bd409f8cd1359847125ac8448a6dfe1fc8a2accdb29433`
- Reviewed meaning: Supplies the standard zero of the reals.

Independently determine this declaration's effect on the current proposition.
