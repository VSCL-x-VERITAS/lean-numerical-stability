# Blind Lean declaration dossier

Translate only the mathematical proposition below. Source identity, task metadata,
theorem name, source declaration, proof, and repository commentary are excluded.
Do not use tools or inspect filesystem content.

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
                      (LocalDef003
                          (LocalDef001 X m σ (instHAdd.hAdd N 1)) ⋯).toMeasure
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
          (@LocalDef003.{u_1} Ω inst μ inst_1
            (@LocalDef001.{u_1} Ω X m σ
              (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) N
                (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))))
            (@LocalDef002.{u_1} Ω inst μ X m σ
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

## Complete semantic dependency inventory

Return exactly one coverage record for every dependency ID, in order.

### D001: `LocalDef001`

- Role: `local`
- Owner module: `NumStability.HDP.Contracts.C_01_hdef_hzn`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f943669945c9a56ad7767e68c581b1afd29de5a9684965b46e8ea0ec1d6f510c`

Hash-verified prior declaration review:

- Reuse SHA-256: `9a4fe2383236ae79ca9cb74aa70bf413f3a0c2acd9d8d05ac2f8fe43429ce638`
- Reviewed meaning: Defines the normalized centered N-term sum, used at N+1 in the conclusion.

Independently determine this declaration's effect on the current proposition.

### D002: `LocalDef002`

- Role: `local`
- Owner module: `LocalImport001`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `a78ce8a1b73968a022da54db198c4291beb55c832d13ded7b0f25f699a856798`

Type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω) (X : Nat → Ω → Real) (m σ : Real) (N : Nat),
  (∀ (i : Nat), AEMeasurable (X i) μ) → AEMeasurable (LocalDef001 X m σ N) μ
```

### D003: `LocalDef003`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.LimitTheorems`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `9eb73233139c77e2ba4b054c7c5db48f89b1ed5c9e6cf501dec07d1ad6a32d63`

Hash-verified prior declaration review:

- Reuse SHA-256: `3e578296f6107114ad06ce1b9cda5a2e050fe7d72ea1a0b2cefa8a10ce395480`
- Reviewed meaning: Forms the probability distribution of an almost-everywhere measurable real function.

Independently determine this declaration's effect on the current proposition.

### D004: `AddCommMonoidWithOne.toAddMonoidWithOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `07f48d3cfc3c7c30b6298df8531409d9844ab8c7e0ba94dea2a3fd29879320af`

Hash-verified prior declaration review:

- Reuse SHA-256: `5e6c01857159729fd289fef64fba09a1b2fd62f1e81d8c238773ee4691ecccff`
- Reviewed meaning: Provides numeral-cast algebra infrastructure without proposition-level content.

Independently determine this declaration's effect on the current proposition.

### D005: `AddMonoidWithOne.toNatCast`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6b956e88ee642e7533983b76ff8087f4537eea04f025165ce1fa45dc80e795a2`

Hash-verified prior declaration review:

- Reuse SHA-256: `ced69774c76a2f55416a1bad6e393047b3c2fcdfc567c710d5e7e11b746320cd`
- Reviewed meaning: Interprets the numeral two in the L² exponent.

Independently determine this declaration's effect on the current proposition.

### D006: `ContinuousENorm.toENorm`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `31fb1ad5ceaae342dc2fe1c1f2eba1b18e67d9d01a5451201d210b585bde97c0`

Hash-verified prior declaration review:

- Reuse SHA-256: `e2f066fa9a628d0a3c96ae533fd0136bb836cdfb4bbcb31d3c7ad2e8545d1429`
- Reviewed meaning: Provides the extended-norm structure required by square-integrability.

Independently determine this declaration's effect on the current proposition.

### D007: `DFunLike.coe`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.FunLike.Basic`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `9db5c150b3c86d10b50e19602d0c0af9e5012dfe5f13b0d7b57925729f2478f0`

Hash-verified prior declaration review:

- Reuse SHA-256: `795ac2fc983893619012dc393ca4b734b87fdde7baa3b9eae910a12345265457`
- Reviewed meaning: Coerces function-like probability measures to functions.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `d40104f783790095ed2e85c21fc803575f73a8ea2eaec33eb92abb9391046d26`
- Reviewed meaning: Provides the extended nonnegative real type used for the L² exponent.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `90d5420b17b3fba19e6fe4f53800b8ff1ec3d1c2cca224decad8a7d105a6f906`
- Reviewed meaning: Interprets the stated mean and variance equations as equality.

Independently determine this declaration's effect on the current proposition.

### D014: `Filter.Tendsto`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Filter.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7e5f54349644c32198960083c0e0eb6c033c80a8656d02a78b3eae9a4f5131f2`

Hash-verified prior declaration review:

- Reuse SHA-256: `907b2d7a045d2fb158747ceee1512064010edfe424775c7dcda72e9c833d6f73`
- Reviewed meaning: Expresses filter convergence of cumulative probabilities.

Independently determine this declaration's effect on the current proposition.

### D015: `Filter.atTop`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Filter.AtTopBot.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f743a11da6fe9e156755f41ec35f4d61b87ca4af4575ede456b477a74caa45f3`

Hash-verified prior declaration review:

- Reuse SHA-256: `e5e5f1eb59f450fb8c46c1cae68ad969fd385dfc2b449b54fda9e3db8b5879f7`
- Reviewed meaning: Specifies that the natural-number parameter tends to infinity.

Independently determine this declaration's effect on the current proposition.

### D016: `HAdd.hAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `e0bf2a92addd6ea713343e4ef69f67e4e1155781d08f46957b9f71412d865f59`

Hash-verified prior declaration review:

- Reuse SHA-256: `94aac4c504fa30a338476cd7be55df954a7542605832cab7f80050672ad5a757`
- Reviewed meaning: Forms N plus one, producing the first N+1 variables.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `37ec60cd1f3566ba38bf7a4791c6988597da949805da0e31df63fc9148d75fe3`
- Reviewed meaning: Supplies multiplication used in normalization and scaling.

Independently determine this declaration's effect on the current proposition.

### D019: `HPow.hPow`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6196b8cbb884c4f39841ba74b23d75f3c753fe0d044cc402bd6e4e3bd59d5cb8`

Hash-verified prior declaration review:

- Reuse SHA-256: `e3040d2eff2327a6230f682e65ee1774baaf404a30968a069b433a28e78a678f`
- Reviewed meaning: Interprets sigma raised to the second power in the variance assumption.

Independently determine this declaration's effect on the current proposition.

### D020: `InnerProductSpace.toNormedSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.InnerProductSpace.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `683435a8d27d50ec1482d74d23f541d52d05ff0411c60f88d16c32132aca9f3e`

Hash-verified prior declaration review:

- Reuse SHA-256: `dcfbb5e9a40d534f437dc7c1ca95a787f6c1af5cf20ab3726e470324a7b05776`
- Reviewed meaning: Supplies real normed-space structure required by integration.

Independently determine this declaration's effect on the current proposition.

### D021: `Inv.inv`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `c3aea3c6e2edd31a7b2cf071814315808ef7d84fd01d8c9b719313846ebca438`

Hash-verified prior declaration review:

- Reuse SHA-256: `419112bbff2ff13557fe2ad379ee89d80023ce05d4e134fd097d4326e5fb53c9`
- Reviewed meaning: Supplies inversion used to divide by sigma times square root N.

Independently determine this declaration's effect on the current proposition.

### D022: `LT.lt`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `fd5699899f1a49c91982cb363d3a71557ab1b53ee772cd777c9ee7717abc2009`

Hash-verified prior declaration review:

- Reuse SHA-256: `90077b7cfd618bd431423daaceb9f029f439867e4804cca45f8f69ba2e6a0d2d`
- Reviewed meaning: Interprets the strict positivity assumption on sigma.

Independently determine this declaration's effect on the current proposition.

### D023: `MeasurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.MeasurableSpace.Defs`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `6825e55082259c6be2028d5ee0624c796293eccdd78af118da4583180067d196`

Hash-verified prior declaration review:

- Reuse SHA-256: `0bd96defeb4a71a50aaa99c23ce030a08b161ab47b9ae872073aaa99d4b41c58`
- Reviewed meaning: Provides the measurable-space structure on the sample space.

Independently determine this declaration's effect on the current proposition.

### D024: `MeasureTheory.IsProbabilityMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Typeclasses.Probability`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `f88b269cb95d165125e7553fd22f97d6e5f9b1b9bcdec7f6738a781dc674bf89`

Hash-verified prior declaration review:

- Reuse SHA-256: `f70a1cb9d6da5b528ac62f20ee9d3eeea6b6072f58469680d9baf9a7fed50c7b`
- Reviewed meaning: Expresses that the underlying measure is a probability measure.

Independently determine this declaration's effect on the current proposition.

### D025: `MeasureTheory.Measure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `ba8c23c70f3135407096406cee0b4d7d9f02d088e8b1d1a1e105071821a3a51b`

Hash-verified prior declaration review:

- Reuse SHA-256: `a6bf942ef791299a6cd83a6478c1bc717078ce7cb0124e830733c14852f72705`
- Reviewed meaning: Provides the measure type of the underlying probability measure.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `e2c424f386976dff071a7fecc66ce9609500aa8102159aec7285c6846ab2ee52`
- Reviewed meaning: Expresses square-integrability of every summand.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `dff166ee7ef1ccc050bd89bddef86e2bacec10911f6be6c6ccc118255129c6cf`
- Reviewed meaning: Defines the integral used to state the common mean.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `abe064bacdea176cb6aa84707de39e2cc223495fe29aa214a8f88bb5d8ff8840`
- Reviewed meaning: Supplies natural-number exponentiation used to form sigma squared.

Independently determine this declaration's effect on the current proposition.

### D036: `Nat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `2e1c25ca42e1e377a41827f0d2f09ae02cfb28ab155c30e277f1000f5e79b32c`

Hash-verified prior declaration review:

- Reuse SHA-256: `10a2a03240eff1012f4c39608a7147bda9531f2f1913f26736f477cb2ed74e7d`
- Reviewed meaning: Provides the natural-number index and partial-sum parameter type.

Independently determine this declaration's effect on the current proposition.

### D037: `Nat.instAtLeastTwoHAddOfNat`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Init`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `309ef94c4b7cfbe2e668952e6915279353921d5d48b6123a30f90dd932dac3e6`

Hash-verified prior declaration review:

- Reuse SHA-256: `c35362cb142a1a230e3c7b33347e795ac09d907932c8205cff86f56418aac485`
- Reviewed meaning: Provides technical arithmetic evidence for the L² exponent.

Independently determine this declaration's effect on the current proposition.

### D038: `Nat.instNeZeroSucc`

- Role: `external-frontier`
- Owner module: `Init.Data.Nat.Basic`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `a0735a528184c05594c4c79312c1225bb4dcffcdf0df7eb1a50c5733047c85ad`

Hash-verified prior declaration review:

- Reuse SHA-256: `11b38ffe99a9fcb0c0ecd8cc71fbf1e4eb47ff2f5010fd7d0108f68e7878cdb2`
- Reviewed meaning: Provides nonzero-successor numeral infrastructure.

Independently determine this declaration's effect on the current proposition.

### D039: `Nat.instPreorder`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5ea89e9915200c8782bc933f9184e28eb38f4c9610b00cf1310cc6e6435642d8`

Hash-verified prior declaration review:

- Reuse SHA-256: `fe085082b41e241c8ea85c7a524a7373d4be87dd38d33d39dae5b77a447dd284`
- Reviewed meaning: Supplies the natural-number preorder underlying the limit at infinity.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `939f71f63a50c4fc098335e52d4adabeeb7e4bd3671bd4474e8b2d28996bf888`
- Reviewed meaning: Projects standard real normed-ring structure; it adds no proposition-level content.

Independently determine this declaration's effect on the current proposition.

### D042: `NonUnitalSeminormedRing.toSeminormedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `db7996fa414ad67340b9d6991cd145ac2a5d251a870097d20f2f63e371fb101d`

Hash-verified prior declaration review:

- Reuse SHA-256: `8894bcc7f30d8fd96b4da3b545a5ff0302ee9373c08fb63994eefb8bda6cb886`
- Reviewed meaning: Projects standard real normed-ring structure; it adds no proposition-level content.

Independently determine this declaration's effect on the current proposition.

### D043: `NormedAddCommGroup.toSeminormedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7327759e5e9417c54393e7566584cd72d79c77b4ca018ea408c5d024667587be`

Hash-verified prior declaration review:

- Reuse SHA-256: `32e041ead234c844877c1d8c36737b993db1a12d4a73ed75b7ea446f5ea29ef9`
- Reviewed meaning: Projects standard real normed-ring structure; it adds no proposition-level content.

Independently determine this declaration's effect on the current proposition.

### D044: `NormedCommRing.toSeminormedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `ad504b2606febc5a066d58ac540c9826bd1b7fce734d59a7fef63c7c27112fe3`

Hash-verified prior declaration review:

- Reuse SHA-256: `c4570ce5eca5e9d24d0a631134c769e15aef3f690c1fad3822dc7f074308c6c0`
- Reviewed meaning: Projects standard real normed-ring structure; it adds no proposition-level content.

Independently determine this declaration's effect on the current proposition.

### D045: `OfNat.ofNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6a6a0720d091cfeb582747fe67b977e948f09706c0beae1f2f21830aa5821ead`

Hash-verified prior declaration review:

- Reuse SHA-256: `88193e4e2bfc36a51f75140e4d6d4f26d91ee19bf12bd00af947d8237a91ec25`
- Reviewed meaning: Interprets numeric literals in their ambient types.

Independently determine this declaration's effect on the current proposition.

### D046: `ProbabilityTheory.IdentDistrib`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.IdentDistrib`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `bfa67f6784b6c21a24b3b314a4519e3b86d23bd01bd4ecacbf50d4c9faa0d03e`

Hash-verified prior declaration review:

- Reuse SHA-256: `0d150ba49509a2e27509b25faa67b47dee6d7dd8ba5061a538f2590ebaa58eee`
- Reviewed meaning: Expresses that every summand has the same distribution as the first.

Independently determine this declaration's effect on the current proposition.

### D047: `ProbabilityTheory.iIndepFun`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.Independence.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `fc42c9fb6cb6d72ada8e7605b71644561e188fc9c555246dd3ef51d84fa13130`

Hash-verified prior declaration review:

- Reuse SHA-256: `78d776d799c1291d66a061f43063c86df501ff8dbe90003b6d86b134eaba32b5`
- Reviewed meaning: Expresses mutual independence of the indexed family.

Independently determine this declaration's effect on the current proposition.

### D048: `ProbabilityTheory.variance`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.Moments.Variance`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `2eb32ed492bfdd1df3ad84f7e963b9d4f0347489111c9ee4dddf93da3947d3a2`

Hash-verified prior declaration review:

- Reuse SHA-256: `f92f3606100d452f42640ac7ff701bd755ad19eb4e33ba5e5643a67d47b6e038`
- Reviewed meaning: Defines the variance used in the common-variance hypothesis.

Independently determine this declaration's effect on the current proposition.

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

### D050: `PseudoMetricSpace.toUniformSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.MetricSpace.Pseudo.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `a6831039b3ad5e37bd0e7692fd995a699d8bef791976e20262da929990521799`

Hash-verified prior declaration review:

- Reuse SHA-256: `ab3f52cf7e007fe790252173f1409abef9a48c3056bd9e02eda5394b155d4067`
- Reviewed meaning: Supplies standard metric structure on the reals.

Independently determine this declaration's effect on the current proposition.

### D051: `RCLike.toInnerProductSpaceReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.InnerProductSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f602276baee30d3dbe02bd6b756a9097f750d59a7f91ca7635dcfc935fd22981`

Hash-verified prior declaration review:

- Reuse SHA-256: `68348ed719eaeab6cd5cbfcc553afe733691492590995e0d8ef037e422cf7263`
- Reviewed meaning: Supplies standard inner-product structure on the reals.

Independently determine this declaration's effect on the current proposition.

### D052: `Real`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `38529f0578472feffc4c79d5d0755fa10fc3edafb232ab5e442336d13630ee90`

Hash-verified prior declaration review:

- Reuse SHA-256: `9c16039b81d3e6a4d95ccc1c4e29491c31878c82e6550c3eb49a8fd0dc75391f`
- Reviewed meaning: Provides the real-number type for summands, parameters, thresholds, sums, and limits.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `36162e767c118c65f37e15e6a09d56c41c3ea9e5752e5542bd519106479c2d80`
- Reviewed meaning: Supplies the standard inverse on the reals.

Independently determine this declaration's effect on the current proposition.

### D057: `Real.instLT`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `573bcfac2b62a55b90ee93bf35473d500cc64581698a699b2152c52f40d0e14a`

Hash-verified prior declaration review:

- Reuse SHA-256: `de64d7ba373001ba0e8df9e6bdbc8180aca39dceff2e78799178e103a59203d6`
- Reviewed meaning: Supplies the standard strict order on the reals.

Independently determine this declaration's effect on the current proposition.

### D058: `Real.instMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `37978679365b30167654c1ef9ecb0fa938325c2047191daa7208aee389c0b4b8`

Hash-verified prior declaration review:

- Reuse SHA-256: `28d7904cbddda78055b264417ffe6bad6b5580a58591e518ffb77aef1f63ed94`
- Reviewed meaning: Supplies the standard multiplicative structure on the reals.

Independently determine this declaration's effect on the current proposition.

### D059: `Real.instMul`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `459ccbe28a1d29ccd2b329ea29e1a84b329b8064b8a8ecc52764b69b23e229ed`

Hash-verified prior declaration review:

- Reuse SHA-256: `875b2d615a4f6d7d6ec3e3a56b29f8299488fdd536451c62b83d6b68933fc088`
- Reviewed meaning: Supplies the standard multiplication on the reals.

Independently determine this declaration's effect on the current proposition.

### D060: `Real.instNatCast`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5fc7a7becbc71d472fa1a28bd92d79b4c6ea4fdc643db7380031a2b890ca7e15`

Hash-verified prior declaration review:

- Reuse SHA-256: `bf4621bd861e9304df9e5d93c93a65399d7a9a5485e4cb6e7bbed40f80fb7f08`
- Reviewed meaning: Supplies the standard natural-number cast into the reals.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `18f6457a681c13baa15648583b4711a12517ef7d6e4e4063ed4fe6093f5f2c49`
- Reviewed meaning: Supplies the real preorder used for closed lower intervals.

Independently determine this declaration's effect on the current proposition.

### D063: `Real.instRCLike`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.RCLike.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `d2fdb97b9d861fcf61e6dbea9993dfa0ca6aa16609742f215c35b3f7ddd16b8e`

Hash-verified prior declaration review:

- Reuse SHA-256: `99848bc675ee28bf69c92331e665f7214230464a0c9ef6b332956b43c4cda8e6`
- Reviewed meaning: Supplies standard real-like analytic structure.

Independently determine this declaration's effect on the current proposition.

### D064: `Real.instZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `860eaaa75b06ac6fccbf4f27e9e162807e8851d04bb42d2411332c6368b14882`

Hash-verified prior declaration review:

- Reuse SHA-256: `0e0ff310cb78e31cabce694cc3ba185e26d599891473005ab28074693665a8ee`
- Reviewed meaning: Supplies the standard zero of the reals.

Independently determine this declaration's effect on the current proposition.

### D065: `Real.measurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Constructions.BorelSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `51b107725c4edbe40e50ff5651a2c7ee5a10037e341c2764964a6d6cc26d82a1`

Hash-verified prior declaration review:

- Reuse SHA-256: `18e4e1402661948908d02a9872fe0f95df9abb16b4638dd97bd98e8d43fcabeb`
- Reviewed meaning: Supplies the standard measurable structure on the reals.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `11d51257283b59b3cb989cce0957cdd8e52933454f75f7f156f844374042d1f0`
- Reviewed meaning: Supplies the standard normed additive structure on the reals.

Independently determine this declaration's effect on the current proposition.

### D069: `Real.normedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `69cccc1e864661e103785f4a2712b9ad164d845c03b7737801c37e5ac852bad7`

Hash-verified prior declaration review:

- Reuse SHA-256: `de2f016239c8ae69919f01e8625553f5fba860f573dbeb814efe042d34a6f2ea`
- Reviewed meaning: Supplies the standard normed commutative ring structure on the reals.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `6813ccf23eb42cd768d66af1e38ca98398506e55d1fd0f956a4f138ab81a1430`
- Reviewed meaning: Supplies the standard metric structure on the reals.

Independently determine this declaration's effect on the current proposition.

### D072: `Real.sqrt`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Sqrt`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `67f9248ae1acb851b5392be301057ebb8b8ef2fb20f76d2d53a2d07ec8f30553`

Hash-verified prior declaration review:

- Reuse SHA-256: `3f368e7a7126ba6fa6147d58bb3a44199246c37b2f9f4d953fe125e10e37b300`
- Reviewed meaning: Defines the nonnegative square root appearing in the normalization.

Independently determine this declaration's effect on the current proposition.

### D073: `SeminormedAddCommGroup.toSeminormedAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8cf35215f509cdee10a3a95158cbaadd3c5fb584bc0d1f4fad6ecfc69b1bd205`

Hash-verified prior declaration review:

- Reuse SHA-256: `27b18d008953d1d3cead95b5e79577a75cfef3ea287b8ce6d56bc99e6d767bd8`
- Reviewed meaning: Projects standard seminormed additive structure.

Independently determine this declaration's effect on the current proposition.

### D074: `SeminormedAddGroup.toContinuousENorm`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Continuity`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `17a83cbf3059dd0bbaefd43c93ce329f1d6b760d440889322b3582a18b23a141`

Hash-verified prior declaration review:

- Reuse SHA-256: `42b0083d6cbbdcb63660ef50b0530e5403a510b5fdc452fc6f8309a830f0ea44`
- Reviewed meaning: Projects standard continuous extended-norm structure.

Independently determine this declaration's effect on the current proposition.

### D075: `SeminormedAddGroup.toPseudoMetricSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `d4043bb9912319b688406ba77c3a5b0fdd8f53ab605cf1962721b51314c66d3f`

Hash-verified prior declaration review:

- Reuse SHA-256: `8f16f7380bd25b24b124956dd3ea9a1dbf9eec1adb703f8dfa72fd2d8312f4c8`
- Reviewed meaning: Projects standard pseudometric structure.

Independently determine this declaration's effect on the current proposition.

### D076: `SeminormedCommRing.toNonUnitalSeminormedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `a29f0377c9baf2265c34aaf85b852e7c4260b34d2dc04574484c335ebc09a6e9`

Hash-verified prior declaration review:

- Reuse SHA-256: `859ad872d716aa4fbdd850574e9d58fab4e05855ff966e64a9f13504324a6f38`
- Reviewed meaning: Projects standard seminormed commutative-ring structure.

Independently determine this declaration's effect on the current proposition.

### D077: `Set`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `a6e551515032966c16e4f42e4548ff1854c2dce05ffe51e98b66943caecc78ec`

Hash-verified prior declaration review:

- Reuse SHA-256: `4d83d1ed26fa6168a09a00d75ec7f2b3bd699fefc9466ea5a3f8731bd50bb048`
- Reviewed meaning: Provides the type of measurable subsets evaluated by the laws.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `822fd9b1928661b9bd8e90f62d0b7f8ff57904f8f637338cc08ca1193ba0f6e3`
- Reviewed meaning: Projects the topology from the standard uniform structure.

Independently determine this declaration's effect on the current proposition.

### D080: `Zero.toOfNat0`

- Role: `external-frontier`
- Owner module: `Init.Data.Zero`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f7ebe8a983de002c1ee751fd3c144a7c1933b3bb95c87c5001a3cabf5709031a`

Hash-verified prior declaration review:

- Reuse SHA-256: `c2089d533d36d0fe968c74a36342d708bc90d29bac6e0155f3fc356b429e6d52`
- Reviewed meaning: Interprets zero as a numeric literal.

Independently determine this declaration's effect on the current proposition.

### D081: `instAddCommMonoidWithOneENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `31d9551885e3007e5d1368365622cfd7638ea41cc6d885234041621de873f55c`

Hash-verified prior declaration review:

- Reuse SHA-256: `6985c5e520cca64dee2a2aae26237f9d7ece38f5146699c972396e37b0f82ebb`
- Reviewed meaning: Supplies additive and numeral structure on extended nonnegative reals.

Independently determine this declaration's effect on the current proposition.

### D082: `instAddNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `a1534bcd3e1888406ac787d30eeff8a284cb6688c23f5e8de09351dda91a280c`

Hash-verified prior declaration review:

- Reuse SHA-256: `ae227a32cbabf9be31ab10777c4fa99387755866049fd5e735c64afe2409383d`
- Reviewed meaning: Supplies natural-number addition infrastructure.

Independently determine this declaration's effect on the current proposition.

### D083: `instHAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `38066efd17aeeca52ec2890d9aafca2fa3cce8fda7f5843c1b8e5da130d93981`

Hash-verified prior declaration review:

- Reuse SHA-256: `ef826bcb8bf51db9290b8996d6d24551beb546773cdf0a6858b33071a97416a9`
- Reviewed meaning: Supplies heterogeneous addition infrastructure.

Independently determine this declaration's effect on the current proposition.

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

- Reuse SHA-256: `c96bdab4a857225d86fae29cdd50c9ee8f297e7f38e4e86b48adbb86422dff41`
- Reviewed meaning: Supplies heterogeneous multiplication infrastructure.

Independently determine this declaration's effect on the current proposition.

### D086: `instHPow`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `eb300d353d84392c776cad5e356479f878030744a43f9a1584942a89d16350b4`

Hash-verified prior declaration review:

- Reuse SHA-256: `96c0f0b1906b5c7aa7159cb36157747547099830a01fe99dd17f2e9f7f878c71`
- Reviewed meaning: Supplies homogeneous-power infrastructure.

Independently determine this declaration's effect on the current proposition.

### D087: `instOfNatAtLeastTwo`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `37355febc51d6fa8ff12fc8e7b429771db340390d46411d7608c566bdffd358d`

Hash-verified prior declaration review:

- Reuse SHA-256: `89080f307b7f60f339fc45834c01fa8082685fc4ff75909ccc8dfb615697321e`
- Reviewed meaning: Supplies the at-least-two numeral instance.

Independently determine this declaration's effect on the current proposition.

### D088: `instOfNatNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7018dea92aae8c272f3a065f25e2bedb9732a0b602c3d54b166fa0cf2ce1ea92`

Hash-verified prior declaration review:

- Reuse SHA-256: `2c56681dac2af147fc9b9faa01e65127c4896ed1d873615908ee5a8e2f139a36`
- Reviewed meaning: Supplies numeral infrastructure on natural numbers.

Independently determine this declaration's effect on the current proposition.

### D089: `nhds`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.Defs.Filter`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8eb445823f4b15a765f7e0cd634f73196d36b4f09054d2aef43a69d3138c6ce8`

Hash-verified prior declaration review:

- Reuse SHA-256: `4764a5f391e18d1e91b66d43c51fd5d062131b5db83c382df0440e761f3a0086`
- Reviewed meaning: Supplies the neighborhood filter used for convergence.

Independently determine this declaration's effect on the current proposition.

### D090: `AEMeasurable`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `6dc48478b911cadddc9129039bc8859282262cccd65bca8d46f3cdc5415a69cd`

Hash-verified prior declaration review:

- Reuse SHA-256: `300509f1540b062519baf8da1ae1d9ebe4ef44a0b89c8f631e03948e397bee7c`
- Reviewed meaning: Expresses almost-everywhere measurability of normalized finite sums.

Independently determine this declaration's effect on the current proposition.

### D091: `Finset.range`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Finset.Range`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `0d8947d3b91a57604f7b7be615f2ff236f2058a47281af31ea2498635666e9e7`

Hash-verified prior declaration review:

- Reuse SHA-256: `54749eb303f307b8a2fc886baa67a5e5bb34d8d3a4918e5450c55218cbf38af4`
- Reviewed meaning: Defines the finite range of indices for each partial sum.

Independently determine this declaration's effect on the current proposition.

### D092: `Finset.sum`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.BigOperators.Group.Finset.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `931ceac4e9efb5833f58970d10ced4621362e020ea1119492a8d379b7e692372`

Hash-verified prior declaration review:

- Reuse SHA-256: `ead2517f434d6512b0e7ef1aee170db18938c09173a070601f949c6655b8be36`
- Reviewed meaning: Forms the finite sum of centered random variables.

Independently determine this declaration's effect on the current proposition.

### D093: `HSub.hSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `98025b38d523c0eadea77ba4961a20b2a913b23c079c4bfeba24a7bfaa24a4bc`

Hash-verified prior declaration review:

- Reuse SHA-256: `51d0f07f8d99315b18abfbddf9d9ea714cb38529a4f3741fef233754fb2961c9`
- Reviewed meaning: Supplies subtraction used to center each variable.

Independently determine this declaration's effect on the current proposition.

### D094: `MeasureTheory.Measure.isProbabilityMeasure_map`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Typeclasses.Probability`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `5624854207c8bee28341ec39de7199a37aa6780067b481804214a292b0055dc0`

Hash-verified prior declaration review:

- Reuse SHA-256: `54f2434a98bc4a938fb4388d0518f2948d4616d6d9d621bb14510b62fdd67433`
- Reviewed meaning: Certifies that the pushforward of the probability measure remains a probability measure.

Independently determine this declaration's effect on the current proposition.

### D095: `MeasureTheory.Measure.map`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Map`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `35d0f192bfc92d083756f0df86ca1ad37f0c1f0bfa39120f6adf90414c4a3b75`

Hash-verified prior declaration review:

- Reuse SHA-256: `f95342ef833b6241b7c1f5a910854e5f8c90bc0653f56ffc8f062a920a351f38`
- Reviewed meaning: Defines pushforward measure and hence each normalized-sum law.

Independently determine this declaration's effect on the current proposition.

### D096: `MeasureTheory.ProbabilityMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.ProbabilityMeasure`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `251bef2162749e0bcb67a1413765bc7556e9854c7a23036b986ada6a2e2958be`

Hash-verified prior declaration review:

- Reuse SHA-256: `7518500cad381965fbb96fc8bf2746d7334ed16d1b051538c7b8c6c2527da717`
- Reviewed meaning: Provides the type of probability measures used for laws and the Gaussian limit.

Independently determine this declaration's effect on the current proposition.

### D097: `Nat.cast`

- Role: `external-frontier`
- Owner module: `Init.Data.Cast`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `6e24327ea908b1837083bb15aef27d593e950a2ff8ade81d8aa94bfe33b64450`

Hash-verified prior declaration review:

- Reuse SHA-256: `e3ae81eca795accaa87614ebfbbe59c6284a8233a0463b5e94b606d28d154d79`
- Reviewed meaning: Casts the natural sample size to a real before taking its square root.

Independently determine this declaration's effect on the current proposition.

### D098: `Real.instAddCommMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `11a549e6c9caa007a4627570dd86aea756ada755f141da0356b8766788f2eef7`

Hash-verified prior declaration review:

- Reuse SHA-256: `be925306af3ecbd25a9869d5ab6ec8fee9981d248cb650b08141b137d502e38f`
- Reviewed meaning: Supplies the standard additive commutative monoid on the reals.

Independently determine this declaration's effect on the current proposition.

### D099: `Real.instSub`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `926d9e8fcca2819a885d446e168b20c7c8aac2e542d59ed2b48e32c9a4659a36`

Hash-verified prior declaration review:

- Reuse SHA-256: `ea5594f6006841bf826786c83377c938997652bd74485546934ca1a9176918a9`
- Reviewed meaning: Supplies the standard subtraction on the reals.

Independently determine this declaration's effect on the current proposition.

### D100: `Subtype.mk`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `constructor`
- Distance from target type: `2`
- Semantic SHA-256: `488ac61b6d3c07fb9a2f54a03a39e6001a4c7cedfd07515f0f9865e7fef9ef51`

Hash-verified prior declaration review:

- Reuse SHA-256: `277fb0a8ea03d83909cb9306c72f3fc4e017c29a84d04751bf0d5b4d61f97b5b`
- Reviewed meaning: Constructs a bundled probability measure from a measure and its probability proof.

Independently determine this declaration's effect on the current proposition.

### D101: `instHSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `aa782f2b5af3d068f4c5340de4b32b193fece2c659a45582cc3024a19b550c87`

Hash-verified prior declaration review:

- Reuse SHA-256: `0e0a58337b2d6e7e92dfd24883459a022830ca80ca540ca9555f0a676afdc1f0`
- Reviewed meaning: Supplies heterogeneous subtraction infrastructure.

Independently determine this declaration's effect on the current proposition.
