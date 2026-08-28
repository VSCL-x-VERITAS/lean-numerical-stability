# Blind Lean declaration dossier

Translate only the mathematical proposition below. Source identity, task metadata,
theorem name, source declaration, proof, and repository commentary are excluded.
Do not use tools or inspect filesystem content.

## Elaborated target type

```lean
∀ {x : Real},
  Real.instLE.le 0 x →
    And (Eq x (MeasureTheory.integral (Real.measureSpace.volume.restrict (Set.Ioc 0 x)) fun t => 1))
      (Eq (ENNReal.ofReal x)
        (MeasureTheory.lintegral (Real.measureSpace.volume.restrict (Set.Ioi 0)) fun t =>
          (Set.Iio x).indicator (fun x => 1) t))
```

## Fully explicit elaborated target type

```lean
∀ {x : Real}
  (hx : @LE.le.{0} Real Real.instLE (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero)) x),
  And
    (@Eq.{1} Real x
      (@MeasureTheory.integral.{0, 0} Real Real Real.normedAddCommGroup
        (@InnerProductSpace.toNormedSpace.{0, 0} Real Real Real.instRCLike
          (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup)
          (@RCLike.toInnerProductSpaceReal.{0} Real Real.instRCLike))
        (@MeasureTheory.MeasureSpace.toMeasurableSpace.{0} Real Real.measureSpace)
        (@MeasureTheory.Measure.restrict.{0} Real
          (@MeasureTheory.MeasureSpace.toMeasurableSpace.{0} Real Real.measureSpace)
          (@MeasureTheory.MeasureSpace.volume.{0} Real Real.measureSpace)
          (@Set.Ioc.{0} Real Real.instPreorder
            (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero)) x))
        fun (t : Real) => @OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))
    (@Eq.{1} ENNReal (ENNReal.ofReal x)
      (@MeasureTheory.lintegral.{0} Real (@MeasureTheory.MeasureSpace.toMeasurableSpace.{0} Real Real.measureSpace)
        (@MeasureTheory.Measure.restrict.{0} Real
          (@MeasureTheory.MeasureSpace.toMeasurableSpace.{0} Real Real.measureSpace)
          (@MeasureTheory.MeasureSpace.volume.{0} Real Real.measureSpace)
          (@Set.Ioi.{0} Real Real.instPreorder
            (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))))
        fun (t : Real) =>
        @Set.indicator.{0, 0} Real ENNReal instZeroENNReal (@Set.Iio.{0} Real Real.instPreorder x)
          (fun (x : Real) =>
            @OfNat.ofNat.{0} ENNReal (nat_lit 1)
              (@One.toOfNat1.{0} ENNReal
                (@AddMonoidWithOne.toOne.{0} ENNReal
                  (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))))
          t))
```

## Complete semantic dependency inventory

Return exactly one coverage record for every dependency ID, in order.

### D001: `AddCommMonoidWithOne.toAddMonoidWithOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `07f48d3cfc3c7c30b6298df8531409d9844ab8c7e0ba94dea2a3fd29879320af`

Type:

```lean
{R : Type u_2} → [self : AddCommMonoidWithOne R] → AddMonoidWithOne R
```

Definition body (one-level semantic boundary):

```lean
fun R [self : AddCommMonoidWithOne R] => self.1
```

### D002: `AddMonoidWithOne.toOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `2ee638fd7292dbcf1e4adb85b14bbd0f304e8a260316e61621bf8eac03f03f6d`

Type:

```lean
{R : Type u_2} → [self : AddMonoidWithOne R] → One R
```

Definition body (one-level semantic boundary):

```lean
fun R [self : AddMonoidWithOne R] => self.3
```

### D003: `And`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `37ecdc009aa953e3d4924ef10e6a1fb591f6af993cd344fd5a6b5321466517c9`

Type:

```lean
Prop → Prop → Prop
```

### D004: `ENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5b8f4d61311ebccecf6a54ceca44191d394e0108c8596129a77f03c15a7e457f`

Type:

```lean
Type
```

Definition body (one-level semantic boundary):

```lean
WithTop NNReal
```

### D005: `ENNReal.ofReal`

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

### D006: `Eq`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `63e9afa87e04d13393a2fe09e8e76489d96be3982734b4b40a52fc6ebea863d7`

Type:

```lean
{α : Sort u_1} → α → α → Prop
```

### D007: `InnerProductSpace.toNormedSpace`

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

Definition body (one-level semantic boundary):

```lean
fun 𝕜 E {inst} {inst_1} [self : InnerProductSpace 𝕜 E] => self.1
```

### D008: `LE.le`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `54a32f2661f788eb2b860006c4d1e8031e126febafe1c8d03ce50529b773dc48`

Type:

```lean
{α : Type u} → [self : LE α] → α → α → Prop
```

Definition body (one-level semantic boundary):

```lean
fun α [self : LE α] => self.1
```

### D009: `MeasureTheory.Measure.restrict`

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

### D010: `MeasureTheory.MeasureSpace.toMeasurableSpace`

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

### D011: `MeasureTheory.MeasureSpace.volume`

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

### D012: `MeasureTheory.integral`

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

Definition body (one-level semantic boundary):

```lean
MeasureTheory.wrapped✝.1
```

### D013: `MeasureTheory.lintegral`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Integral.Lebesgue.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `e34294e65599ea3bdb2f1120ae912ae07a22313a7b238e200c71ae3b882cdb09`

Type:

```lean
{α : Type u_4} → {m : MeasurableSpace α} → MeasureTheory.Measure α → (α → ENNReal) → ENNReal
```

Definition body (one-level semantic boundary):

```lean
MeasureTheory.wrapped✝.1
```

### D014: `NormedAddCommGroup.toSeminormedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7327759e5e9417c54393e7566584cd72d79c77b4ca018ea408c5d024667587be`

Type:

```lean
{E : Type u_5} → [NormedAddCommGroup E] → SeminormedAddCommGroup E
```

Definition body (one-level semantic boundary):

```lean
fun {E} [inst : NormedAddCommGroup E] =>
  have __src := inst;
  { toNorm := __src.toNorm, toAddCommGroup := __src.toAddCommGroup, toPseudoMetricSpace := __src.toPseudoMetricSpace,
    dist_eq := ⋯ }
```

### D015: `OfNat.ofNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6a6a0720d091cfeb582747fe67b977e948f09706c0beae1f2f21830aa5821ead`

Type:

```lean
{α : Type u} → (x : Nat) → [self : OfNat α x] → α
```

Definition body (one-level semantic boundary):

```lean
fun α x [self : OfNat α x] => self.1
```

### D016: `One.toOfNat1`

- Role: `external-frontier`
- Owner module: `Init.Data.Zero`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `cc544b5b2a2aabc84389a9fe2f052127dc6dae9964782b117b9b19b773e542d5`

Type:

```lean
{α : Type u_1} → [One α] → OfNat α 1
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : One α] => { ofNat := inst.one }
```

### D017: `RCLike.toInnerProductSpaceReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.InnerProductSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f602276baee30d3dbe02bd6b756a9097f750d59a7f91ca7635dcfc935fd22981`

Type:

```lean
{𝕜 : Type u_1} → [inst : RCLike 𝕜] → InnerProductSpace Real 𝕜
```

Definition body (one-level semantic boundary):

```lean
fun {𝕜} [RCLike 𝕜] =>
  let __spread.0 := Inner.rclikeToReal 𝕜 𝕜;
  { toNormedSpace := NormedAlgebra.toNormedSpace 𝕜, toInner := __spread.0, norm_sq_eq_re_inner := ⋯,
    conj_inner_symm := ⋯, add_left := ⋯, smul_left := ⋯ }
```

### D018: `Real`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `38529f0578472feffc4c79d5d0755fa10fc3edafb232ab5e442336d13630ee90`

Type:

```lean
Type
```

### D019: `Real.instLE`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `144d825fc543455e17044e843560e0415f8e4e9da60afb52f34edb809b7c34d3`

Type:

```lean
LE Real
```

Definition body (one-level semantic boundary):

```lean
{ le := Real.le✝ }
```

### D020: `Real.instOne`

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

### D021: `Real.instPreorder`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `896bb94fc15867c0df82ea0f639eb6116e90a24819a66a54db9442e47cba7274`

Type:

```lean
Preorder Real
```

Definition body (one-level semantic boundary):

```lean
inferInstance
```

### D022: `Real.instRCLike`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.RCLike.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `d2fdb97b9d861fcf61e6dbea9993dfa0ca6aa16609742f215c35b3f7ddd16b8e`

Type:

```lean
RCLike Real
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

### D023: `Real.instZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `860eaaa75b06ac6fccbf4f27e9e162807e8851d04bb42d2411332c6368b14882`

Type:

```lean
Zero Real
```

Definition body (one-level semantic boundary):

```lean
{ zero := Real.zero✝ }
```

### D024: `Real.measureSpace`

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

### D025: `Real.normedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Real`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `9ff0d896c635e2a38531d689d24ee70cfffa41565354ce15f6ff59b51650bd93`

Type:

```lean
NormedAddCommGroup Real
```

Definition body (one-level semantic boundary):

```lean
{ toNorm := Real.norm, toAddCommGroup := Real.instAddCommGroup, toMetricSpace := Real.metricSpace, dist_eq := ⋯ }
```

### D026: `Set.Iio`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Interval.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7d2fb1f1a25e32137e405a3246c71735490bca2e04477240797df205bd739c7e`

Type:

```lean
{α : Type u_1} → [Preorder α] → α → Set α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Preorder α] b => setOf fun x => inst.lt x b
```

### D027: `Set.Ioc`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Interval.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `ff05a5eaafe9ff8d3ce7c60e46836b8850e9f73e10712fccf83973114737c089`

Type:

```lean
{α : Type u_1} → [Preorder α] → α → α → Set α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Preorder α] a b => setOf fun x => And (inst.lt a x) (inst.le x b)
```

### D028: `Set.Ioi`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Interval.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `ad556a749b4ff2a341c66bd35e0369f79888567fa7730aab8ee2fdd700fbfd52`

Type:

```lean
{α : Type u_1} → [Preorder α] → α → Set α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Preorder α] b => setOf fun x => inst.lt b x
```

### D029: `Set.indicator`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Notation.Indicator`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5ce2dc18d0d6ce591fe4a2df5e8a99ec38ce907b0862c81f7fe78b9e66664bbe`

Type:

```lean
{α : Type u_1} → {M : Type u_3} → [Zero M] → Set α → (α → M) → α → M
```

Definition body (one-level semantic boundary):

```lean
fun {α} {M} [Zero M] s f x => ite (Set.instMembership.mem s x) (f x) 0
```

### D030: `Zero.toOfNat0`

- Role: `external-frontier`
- Owner module: `Init.Data.Zero`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f7ebe8a983de002c1ee751fd3c144a7c1933b3bb95c87c5001a3cabf5709031a`

Type:

```lean
{α : Type u_1} → [Zero α] → OfNat α 0
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Zero α] => { ofNat := inst.zero }
```

### D031: `instAddCommMonoidWithOneENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `31d9551885e3007e5d1368365622cfd7638ea41cc6d885234041621de873f55c`

Type:

```lean
AddCommMonoidWithOne ENNReal
```

Definition body (one-level semantic boundary):

```lean
WithTop.addCommMonoidWithOne
```

### D032: `instZeroENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `6e5878abb65d5809d3258e569c8ff0f08b39804b377a07fec18d700b4e3fea86`

Type:

```lean
Zero ENNReal
```

Definition body (one-level semantic boundary):

```lean
WithTop.zero
```
