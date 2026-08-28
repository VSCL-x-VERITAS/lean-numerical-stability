# Declaration dossier for HDP-01-DEF-CONVERGENCE-DISTRIBUTION

This dossier describes the theorem statement only. Its proof is excluded.
Interpret every dependency from its supplied declaration; names are not definitions.

## Proof-free source declaration

```lean
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
          (NumStability.HDP.Scalar.LimitTheorems.probabilityLaw Z hZ (Set.Iic t)))
```

## Elaborated target type

```lean
∀ {Ω : Type u_1} {ι : Type u_2} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω)
  [inst_1 : MeasureTheory.IsProbabilityMeasure μ] (X : ι → Ω → Real) (l : Filter ι) (Z : Ω → Real)
  (hX : ∀ (i : ι), AEMeasurable (X i) μ) (hZ : AEMeasurable Z μ),
  Iff (NumStability.HDP.Contract.hdp_01_hdef_hconvergence_hin_hdistribution_pointwise_cdf μ X l Z hX hZ)
    (∀ (t : Real),
      Filter.Tendsto
        (fun i =>
          MeasureTheory.ProbabilityMeasure.instFunLike.coe
            (NumStability.HDP.Scalar.LimitTheorems.probabilityLaw (X i) ⋯) (Set.Iic t))
        l
        (nhds
          (MeasureTheory.ProbabilityMeasure.instFunLike.coe (NumStability.HDP.Scalar.LimitTheorems.probabilityLaw Z hZ)
            (Set.Iic t))))
```

## Fully explicit elaborated target type

```lean
∀ {Ω : Type u_1} {ι : Type u_2} [inst : MeasurableSpace.{u_1} Ω] (μ : @MeasureTheory.Measure.{u_1} Ω inst)
  [inst_1 : @MeasureTheory.IsProbabilityMeasure.{u_1} Ω inst μ] (X : ι → Ω → Real) (l : Filter.{u_2} ι) (Z : Ω → Real)
  (hX : ∀ (i : ι), @AEMeasurable.{u_1, 0} Ω Real Real.measurableSpace inst (X i) μ)
  (hZ : @AEMeasurable.{u_1, 0} Ω Real Real.measurableSpace inst Z μ),
  Iff
    (@NumStability.HDP.Contract.hdp_01_hdef_hconvergence_hin_hdistribution_pointwise_cdf.{u_1, u_2} Ω ι inst μ inst_1 X
      l Z hX hZ)
    (∀ (t : Real),
      @Filter.Tendsto.{u_2, 0} ι NNReal
        (fun (i : ι) =>
          @DFunLike.coe.{1, 1, 1} (@MeasureTheory.ProbabilityMeasure.{0} Real Real.measurableSpace) (Set.{0} Real)
            (fun (x : Set.{0} Real) => NNReal)
            (@MeasureTheory.ProbabilityMeasure.instFunLike.{0} Real Real.measurableSpace)
            (@NumStability.HDP.Scalar.LimitTheorems.probabilityLaw.{u_1} Ω inst μ inst_1 (X i) (hX i))
            (@Set.Iic.{0} Real Real.instPreorder t))
        l
        (@nhds.{0} NNReal NNReal.instTopologicalSpace
          (@DFunLike.coe.{1, 1, 1} (@MeasureTheory.ProbabilityMeasure.{0} Real Real.measurableSpace) (Set.{0} Real)
            (fun (x : Set.{0} Real) => NNReal)
            (@MeasureTheory.ProbabilityMeasure.instFunLike.{0} Real Real.measurableSpace)
            (@NumStability.HDP.Scalar.LimitTheorems.probabilityLaw.{u_1} Ω inst μ inst_1 Z hZ)
            (@Set.Iic.{0} Real Real.instPreorder t))))
```

## Local import graph

- `AuditTarget` imports: `NumStability.HDP.Scalar.LimitTheorems`
- `NumStability.HDP.Scalar.LimitTheorems` imports: `Mathlib.Probability.ProbabilityMassFunction.Binomial`, `Mathlib.Probability.ProbabilityMassFunction.Integrals`, `Mathlib.Probability.Distributions.Gaussian.Real`, `Mathlib.Probability.Distributions.Poisson`, `Mathlib.MeasureTheory.Function.ConvergenceInDistribution`, `Mathlib.Probability.StrongLaw`, `Mathlib.Tactic`

## Semantic dependency inventory

`local` declarations are followed recursively through types and bodies. `external-frontier` declarations mark the one-level library trust boundary.

### D001: `NumStability.HDP.Contract.hdp_01_hdef_hconvergence_hin_hdistribution_pointwise_cdf`

- Role: `local`
- Owner module: `AuditTarget`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f2ca3d2f2134def5a3446a8477c263b285e853e8049870d19c576eb9daa96f21`

Type:

```lean
{Ω : Type u_1} →
  {ι : Type u_2} →
    [inst : MeasurableSpace Ω] →
      (μ : MeasureTheory.Measure Ω) →
        [MeasureTheory.IsProbabilityMeasure μ] →
          (X : ι → Ω → Real) → Filter ι → (Z : Ω → Real) → (∀ (i : ι), AEMeasurable (X i) μ) → AEMeasurable Z μ → Prop
```

Fully explicit type:

```lean
{Ω : Type u_1} →
  {ι : Type u_2} →
    [inst : MeasurableSpace.{u_1} Ω] →
      (μ : @MeasureTheory.Measure.{u_1} Ω inst) →
        [@MeasureTheory.IsProbabilityMeasure.{u_1} Ω inst μ] →
          (X : ι → Ω → Real) →
            (l : Filter.{u_2} ι) →
              (Z : Ω → Real) →
                (hX : ∀ (i : ι), @AEMeasurable.{u_1, 0} Ω Real Real.measurableSpace inst (X i) μ) →
                  (hZ : @AEMeasurable.{u_1, 0} Ω Real Real.measurableSpace inst Z μ) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} {ι} [MeasurableSpace Ω] μ [MeasureTheory.IsProbabilityMeasure μ] X l Z hX hZ =>
  ∀ (t : Real),
    Filter.Tendsto
      (fun i =>
        MeasureTheory.ProbabilityMeasure.instFunLike.coe (NumStability.HDP.Scalar.LimitTheorems.probabilityLaw (X i) ⋯)
          (Set.Iic t))
      l
      (nhds
        (MeasureTheory.ProbabilityMeasure.instFunLike.coe (NumStability.HDP.Scalar.LimitTheorems.probabilityLaw Z hZ)
          (Set.Iic t)))
```

### D002: `NumStability.HDP.Scalar.LimitTheorems.probabilityLaw`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.LimitTheorems`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D003: `AEMeasurable`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D004: `DFunLike.coe`

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

### D005: `Filter`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Filter.Defs`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `f178b01470c6b39d870c442162d6d76a8f2124db69fab7f84fe3f0f559dd4616`

Type:

```lean
Type u_1 → Type u_1
```

Fully explicit type:

```lean
(α : Type u_1) → Type u_1
```

### D006: `Filter.Tendsto`

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

### D007: `Iff`

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

### D008: `MeasurableSpace`

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

### D009: `MeasureTheory.IsProbabilityMeasure`

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

### D010: `MeasureTheory.Measure`

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

### D011: `MeasureTheory.ProbabilityMeasure`

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

### D012: `MeasureTheory.ProbabilityMeasure.instFunLike`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.ProbabilityMeasure`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D013: `NNReal`

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

### D014: `NNReal.instTopologicalSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.UniformSpace.Real`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D015: `Real`

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

### D016: `Real.instPreorder`

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

### D017: `Real.measurableSpace`

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

### D018: `Set`

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

### D019: `Set.Iic`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Interval.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D020: `nhds`

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

### D021: `MeasureTheory.Measure.isProbabilityMeasure_map`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Typeclasses.Probability`
- Declaration kind: `theorem`
- Distance from target type: `2`
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

### D022: `MeasureTheory.Measure.map`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Map`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D023: `Subtype.mk`

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
