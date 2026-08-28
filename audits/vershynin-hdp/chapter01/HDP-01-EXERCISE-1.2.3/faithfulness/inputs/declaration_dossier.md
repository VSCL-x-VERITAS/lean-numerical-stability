# Declaration dossier for HDP-01-EXERCISE-1.2.3

This dossier describes the theorem statement only. Its proof is excluded.
Interpret every dependency from its supplied declaration; names are not definitions.

## Proof-free source declaration

```lean
theorem hdp_01_hex_h1_d2_d3
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hX : Measurable X) {p : ℝ} (hp : 0 < p) :
    (NumStability.HDP.Scalar.Preliminaries.absoluteMoment μ X p =
        ENNReal.ofReal p *
          ∫⁻ t in Set.Ioi 0,
            μ {ω | t < |X ω|} * ENNReal.ofReal (t ^ (p - 1))) ∧
      (∀ hfinite :
          NumStability.HDP.Scalar.Preliminaries.absoluteMoment μ X p <
              (⊤ : ENNReal) ∨
            ENNReal.ofReal p *
                ∫⁻ t in Set.Ioi 0,
                  μ {ω | t < |X ω|} * ENNReal.ofReal (t ^ (p - 1)) <
              (⊤ : ENNReal),
        (NumStability.HDP.Scalar.Preliminaries.absoluteMoment μ X p).toReal =
          (ENNReal.ofReal p *
            ∫⁻ t in Set.Ioi 0,
              μ {ω | t < |X ω|} * ENNReal.ofReal (t ^ (p - 1))).toReal)
```

## Elaborated target type

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] {μ : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure μ]
  {X : Ω → Real},
  Measurable X →
    ∀ {p : Real},
      Real.instLT.lt 0 p →
        And
          (Eq (NumStability.HDP.Scalar.Preliminaries.absoluteMoment μ X p)
            (instHMul.hMul (ENNReal.ofReal p)
              (MeasureTheory.lintegral (Real.measureSpace.volume.restrict (Set.Ioi 0)) fun t =>
                instHMul.hMul (MeasureTheory.Measure.instFunLike.coe μ (setOf fun ω => Real.instLT.lt t (abs (X ω))))
                  (ENNReal.ofReal (instHPow.hPow t (instHSub.hSub p 1))))))
          (Or
              (ENNReal.instPartialOrder.lt (NumStability.HDP.Scalar.Preliminaries.absoluteMoment μ X p)
                instTopENNReal.top)
              (ENNReal.instPartialOrder.lt
                (instHMul.hMul (ENNReal.ofReal p)
                  (MeasureTheory.lintegral (Real.measureSpace.volume.restrict (Set.Ioi 0)) fun t =>
                    instHMul.hMul
                      (MeasureTheory.Measure.instFunLike.coe μ (setOf fun ω => Real.instLT.lt t (abs (X ω))))
                      (ENNReal.ofReal (instHPow.hPow t (instHSub.hSub p 1)))))
                instTopENNReal.top) →
            Eq (NumStability.HDP.Scalar.Preliminaries.absoluteMoment μ X p).toReal
              (instHMul.hMul (ENNReal.ofReal p)
                  (MeasureTheory.lintegral (Real.measureSpace.volume.restrict (Set.Ioi 0)) fun t =>
                    instHMul.hMul
                      (MeasureTheory.Measure.instFunLike.coe μ (setOf fun ω => Real.instLT.lt t (abs (X ω))))
                      (ENNReal.ofReal (instHPow.hPow t (instHSub.hSub p 1))))).toReal)
```

## Fully explicit elaborated target type

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace.{u_1} Ω] {μ : @MeasureTheory.Measure.{u_1} Ω inst}
  [@MeasureTheory.IsProbabilityMeasure.{u_1} Ω inst μ] {X : Ω → Real}
  (hX : @Measurable.{u_1, 0} Ω Real inst Real.measurableSpace X) {p : Real}
  (hp : @LT.lt.{0} Real Real.instLT (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero)) p),
  And
    (@Eq.{1} ENNReal (@NumStability.HDP.Scalar.Preliminaries.absoluteMoment.{u_1} Ω inst μ X p)
      (@HMul.hMul.{0, 0, 0} ENNReal ENNReal ENNReal
        (@instHMul.{0} ENNReal
          (@Distrib.toMul.{0} ENNReal
            (@NonUnitalNonAssocSemiring.toDistrib.{0} ENNReal
              (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} ENNReal
                (@Semiring.toNonAssocSemiring.{0} ENNReal
                  (@CommSemiring.toSemiring.{0} ENNReal ENNReal.instCommSemiring))))))
        (ENNReal.ofReal p)
        (@MeasureTheory.lintegral.{0} Real (@MeasureTheory.MeasureSpace.toMeasurableSpace.{0} Real Real.measureSpace)
          (@MeasureTheory.Measure.restrict.{0} Real
            (@MeasureTheory.MeasureSpace.toMeasurableSpace.{0} Real Real.measureSpace)
            (@MeasureTheory.MeasureSpace.volume.{0} Real Real.measureSpace)
            (@Set.Ioi.{0} Real Real.instPreorder
              (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))))
          fun (t : Real) =>
          @HMul.hMul.{0, 0, 0} ENNReal ENNReal ENNReal
            (@instHMul.{0} ENNReal
              (@Distrib.toMul.{0} ENNReal
                (@NonUnitalNonAssocSemiring.toDistrib.{0} ENNReal
                  (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} ENNReal
                    (@Semiring.toNonAssocSemiring.{0} ENNReal
                      (@CommSemiring.toSemiring.{0} ENNReal ENNReal.instCommSemiring))))))
            (@DFunLike.coe.{u_1 + 1, u_1 + 1, 1} (@MeasureTheory.Measure.{u_1} Ω inst) (Set.{u_1} Ω)
              (fun (x : Set.{u_1} Ω) => ENNReal) (@MeasureTheory.Measure.instFunLike.{u_1} Ω inst) μ
              (@setOf.{u_1} Ω fun (ω : Ω) =>
                @LT.lt.{0} Real Real.instLT t (@abs.{0} Real Real.lattice Real.instAddGroup (X ω))))
            (ENNReal.ofReal
              (@HPow.hPow.{0, 0, 0} Real Real Real (@instHPow.{0, 0} Real Real Real.instPow) t
                (@HSub.hSub.{0, 0, 0} Real Real Real (@instHSub.{0} Real Real.instSub) p
                  (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne))))))))
    (∀
      (hfinite :
        Or
          (@LT.lt.{0} ENNReal
            (@Preorder.toLT.{0} ENNReal (@PartialOrder.toPreorder.{0} ENNReal ENNReal.instPartialOrder))
            (@NumStability.HDP.Scalar.Preliminaries.absoluteMoment.{u_1} Ω inst μ X p)
            (@Top.top.{0} ENNReal instTopENNReal))
          (@LT.lt.{0} ENNReal
            (@Preorder.toLT.{0} ENNReal (@PartialOrder.toPreorder.{0} ENNReal ENNReal.instPartialOrder))
            (@HMul.hMul.{0, 0, 0} ENNReal ENNReal ENNReal
              (@instHMul.{0} ENNReal
                (@Distrib.toMul.{0} ENNReal
                  (@NonUnitalNonAssocSemiring.toDistrib.{0} ENNReal
                    (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} ENNReal
                      (@Semiring.toNonAssocSemiring.{0} ENNReal
                        (@CommSemiring.toSemiring.{0} ENNReal ENNReal.instCommSemiring))))))
              (ENNReal.ofReal p)
              (@MeasureTheory.lintegral.{0} Real
                (@MeasureTheory.MeasureSpace.toMeasurableSpace.{0} Real Real.measureSpace)
                (@MeasureTheory.Measure.restrict.{0} Real
                  (@MeasureTheory.MeasureSpace.toMeasurableSpace.{0} Real Real.measureSpace)
                  (@MeasureTheory.MeasureSpace.volume.{0} Real Real.measureSpace)
                  (@Set.Ioi.{0} Real Real.instPreorder
                    (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))))
                fun (t : Real) =>
                @HMul.hMul.{0, 0, 0} ENNReal ENNReal ENNReal
                  (@instHMul.{0} ENNReal
                    (@Distrib.toMul.{0} ENNReal
                      (@NonUnitalNonAssocSemiring.toDistrib.{0} ENNReal
                        (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} ENNReal
                          (@Semiring.toNonAssocSemiring.{0} ENNReal
                            (@CommSemiring.toSemiring.{0} ENNReal ENNReal.instCommSemiring))))))
                  (@DFunLike.coe.{u_1 + 1, u_1 + 1, 1} (@MeasureTheory.Measure.{u_1} Ω inst) (Set.{u_1} Ω)
                    (fun (x : Set.{u_1} Ω) => ENNReal) (@MeasureTheory.Measure.instFunLike.{u_1} Ω inst) μ
                    (@setOf.{u_1} Ω fun (ω : Ω) =>
                      @LT.lt.{0} Real Real.instLT t (@abs.{0} Real Real.lattice Real.instAddGroup (X ω))))
                  (ENNReal.ofReal
                    (@HPow.hPow.{0, 0, 0} Real Real Real (@instHPow.{0, 0} Real Real Real.instPow) t
                      (@HSub.hSub.{0, 0, 0} Real Real Real (@instHSub.{0} Real Real.instSub) p
                        (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))))))
            (@Top.top.{0} ENNReal instTopENNReal))),
      @Eq.{1} Real (ENNReal.toReal (@NumStability.HDP.Scalar.Preliminaries.absoluteMoment.{u_1} Ω inst μ X p))
        (ENNReal.toReal
          (@HMul.hMul.{0, 0, 0} ENNReal ENNReal ENNReal
            (@instHMul.{0} ENNReal
              (@Distrib.toMul.{0} ENNReal
                (@NonUnitalNonAssocSemiring.toDistrib.{0} ENNReal
                  (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} ENNReal
                    (@Semiring.toNonAssocSemiring.{0} ENNReal
                      (@CommSemiring.toSemiring.{0} ENNReal ENNReal.instCommSemiring))))))
            (ENNReal.ofReal p)
            (@MeasureTheory.lintegral.{0} Real
              (@MeasureTheory.MeasureSpace.toMeasurableSpace.{0} Real Real.measureSpace)
              (@MeasureTheory.Measure.restrict.{0} Real
                (@MeasureTheory.MeasureSpace.toMeasurableSpace.{0} Real Real.measureSpace)
                (@MeasureTheory.MeasureSpace.volume.{0} Real Real.measureSpace)
                (@Set.Ioi.{0} Real Real.instPreorder
                  (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))))
              fun (t : Real) =>
              @HMul.hMul.{0, 0, 0} ENNReal ENNReal ENNReal
                (@instHMul.{0} ENNReal
                  (@Distrib.toMul.{0} ENNReal
                    (@NonUnitalNonAssocSemiring.toDistrib.{0} ENNReal
                      (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} ENNReal
                        (@Semiring.toNonAssocSemiring.{0} ENNReal
                          (@CommSemiring.toSemiring.{0} ENNReal ENNReal.instCommSemiring))))))
                (@DFunLike.coe.{u_1 + 1, u_1 + 1, 1} (@MeasureTheory.Measure.{u_1} Ω inst) (Set.{u_1} Ω)
                  (fun (x : Set.{u_1} Ω) => ENNReal) (@MeasureTheory.Measure.instFunLike.{u_1} Ω inst) μ
                  (@setOf.{u_1} Ω fun (ω : Ω) =>
                    @LT.lt.{0} Real Real.instLT t (@abs.{0} Real Real.lattice Real.instAddGroup (X ω))))
                (ENNReal.ofReal
                  (@HPow.hPow.{0, 0, 0} Real Real Real (@instHPow.{0, 0} Real Real Real.instPow) t
                    (@HSub.hSub.{0, 0, 0} Real Real Real (@instHSub.{0} Real Real.instSub) p
                      (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))))))))
```

## Local import graph

- `AuditTarget` imports: `NumStability.HDP.Scalar.Preliminaries`
- `NumStability.HDP.Scalar.Preliminaries` imports: `Mathlib.Probability.Moments.Variance`, `Mathlib.Probability.CDF`, `Mathlib.MeasureTheory.Function.LpSpace.Basic`, `Mathlib.MeasureTheory.Function.LpSpace.Complete`, `Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm`, `Mathlib.MeasureTheory.Function.LpSeminorm.Indicator`, `Mathlib.Probability.UniformOn`, `Mathlib.Analysis.Convex.Integral`, `Mathlib.Analysis.Convex.Continuous`, `Mathlib.MeasureTheory.Integral.Bochner.Set`, `Mathlib.MeasureTheory.Integral.Lebesgue.Markov`, `Mathlib.MeasureTheory.Integral.Layercake`, `Mathlib.MeasureTheory.Measure.Lebesgue.Integral`, `Mathlib.Probability.Distributions.Cauchy`, `Mathlib.Analysis.SpecialFunctions.NonIntegrable`, `Mathlib.Analysis.SpecialFunctions.Pow.Integral`, `Mathlib.Tactic`

## Semantic dependency inventory

`local` declarations are followed recursively through types and bodies. `external-frontier` declarations mark the one-level library trust boundary.

### D001: `NumStability.HDP.Scalar.Preliminaries.absoluteMoment`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.Preliminaries`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `1d447b77387eaaecbbae02e0d7933e42002deb4c2314c94be7a67380f07023c2`

Type:

```lean
{Ω : Type u_1} → [inst : MeasurableSpace Ω] → MeasureTheory.Measure Ω → (Ω → Real) → Real → ENNReal
```

Fully explicit type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace.{u_1} Ω] → (μ : @MeasureTheory.Measure.{u_1} Ω inst) → (X : Ω → Real) → (p : Real) → ENNReal
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} [MeasurableSpace Ω] μ X p => MeasureTheory.lintegral μ fun ω => ENNReal.ofReal ((abs (X ω)).rpow p)
```

### D002: `And`

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

### D003: `CommSemiring.toSemiring`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `bcda2e78d6b7602d359ab954baf5c3bd0f6b2503b3ec9a72e1a21a48b9d18d89`

Type:

```lean
{R : Type u} → [self : CommSemiring R] → Semiring R
```

Fully explicit type:

```lean
{R : Type u} → [self : CommSemiring.{u} R] → Semiring.{u} R
```

Definition body (one-level semantic boundary):

```lean
fun R [self : CommSemiring R] => self.1
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

### D005: `Distrib.toMul`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `1d05ddf657021fb5615c5054f46b4863aec4ca856ca48fbb75add25e1f0fe06f`

Type:

```lean
{R : Type u_1} → [self : Distrib R] → Mul R
```

Fully explicit type:

```lean
{R : Type u_1} → [self : Distrib.{u_1} R] → Mul.{u_1} R
```

Definition body (one-level semantic boundary):

```lean
fun R [self : Distrib R] => self.1
```

### D006: `ENNReal`

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

### D007: `ENNReal.instCommSemiring`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D008: `ENNReal.instPartialOrder`

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

### D009: `ENNReal.ofReal`

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

### D010: `ENNReal.toReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `1aa070f54e8aff7a6558c977220472990963777ddc5f04c5284f49422c06b41f`

Type:

```lean
ENNReal → Real
```

Fully explicit type:

```lean
(a : ENNReal) → Real
```

Definition body (one-level semantic boundary):

```lean
fun a => a.toNNReal.toReal
```

### D011: `Eq`

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

### D012: `HMul.hMul`

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

### D013: `HPow.hPow`

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

### D014: `HSub.hSub`

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

### D015: `LT.lt`

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

### D016: `Measurable`

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

### D017: `MeasurableSpace`

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

### D018: `MeasureTheory.IsProbabilityMeasure`

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

### D019: `MeasureTheory.Measure`

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

### D020: `MeasureTheory.Measure.instFunLike`

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

### D021: `MeasureTheory.Measure.restrict`

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

### D022: `MeasureTheory.MeasureSpace.toMeasurableSpace`

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

### D023: `MeasureTheory.MeasureSpace.volume`

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

### D024: `MeasureTheory.lintegral`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Integral.Lebesgue.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `e34294e65599ea3bdb2f1120ae912ae07a22313a7b238e200c71ae3b882cdb09`

Type:

```lean
{α : Type u_4} → {m : MeasurableSpace α} → MeasureTheory.Measure α → (α → ENNReal) → ENNReal
```

Fully explicit type:

```lean
{α : Type u_4} → {m : MeasurableSpace.{u_4} α} → (μ : @MeasureTheory.Measure.{u_4} α m) → (f : α → ENNReal) → ENNReal
```

Definition body (one-level semantic boundary):

```lean
MeasureTheory.wrapped✝.1
```

### D025: `NonAssocSemiring.toNonUnitalNonAssocSemiring`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `1674e66231d0f66dfe9fae191c7ae33207a78635bcf5490a9cfbb402d16f9bc0`

Type:

```lean
{α : Type u} → [self : NonAssocSemiring α] → NonUnitalNonAssocSemiring α
```

Fully explicit type:

```lean
{α : Type u} → [self : NonAssocSemiring.{u} α] → NonUnitalNonAssocSemiring.{u} α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : NonAssocSemiring α] => self.1
```

### D026: `NonUnitalNonAssocSemiring.toDistrib`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `5b49ec28e539eea6192ab07a9aee6da537ed1b5e017f2b9ef44d3a0ae51d79c6`

Type:

```lean
{α : Type u} → [self : NonUnitalNonAssocSemiring α] → Distrib α
```

Fully explicit type:

```lean
{α : Type u} → [self : NonUnitalNonAssocSemiring.{u} α] → Distrib.{u} α
```

Definition body (one-level semantic boundary):

```lean
fun α self => { toMul := self.toMul, toAdd := self.toAdd, left_distrib := ⋯, right_distrib := ⋯ }
```

### D027: `OfNat.ofNat`

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

### D028: `One.toOfNat1`

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

### D029: `Or`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `de438fb54053199506d3db7df89e4ed6f1bc296d2e49a7e63e7a4b73a1b23d7e`

Type:

```lean
Prop → Prop → Prop
```

Fully explicit type:

```lean
(a b : Prop) → Prop
```

### D030: `PartialOrder.toPreorder`

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

### D031: `Preorder.toLT`

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

### D032: `Real`

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

### D033: `Real.instAddGroup`

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

### D034: `Real.instLT`

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

### D035: `Real.instOne`

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

### D036: `Real.instPow`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.SpecialFunctions.Pow.Real`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `d7348547260a6fa37dab6a95efbf0e3e5560a074d2443d0cb606f21bce228fe0`

Type:

```lean
Pow Real Real
```

Fully explicit type:

```lean
Pow.{0, 0} Real Real
```

Definition body (one-level semantic boundary):

```lean
{ pow := Real.rpow }
```

### D037: `Real.instPreorder`

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

### D038: `Real.instSub`

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

### D039: `Real.instZero`

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

### D040: `Real.lattice`

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

### D041: `Real.measurableSpace`

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

### D042: `Real.measureSpace`

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

### D043: `Semiring.toNonAssocSemiring`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
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

### D044: `Set`

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

### D045: `Set.Ioi`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Interval.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `ad556a749b4ff2a341c66bd35e0369f79888567fa7730aab8ee2fdd700fbfd52`

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
fun {α} [inst : Preorder α] b => setOf fun x => inst.lt b x
```

### D046: `Top.top`

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

### D047: `Zero.toOfNat0`

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

### D048: `abs`

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

### D049: `instHMul`

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

### D050: `instHPow`

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

### D051: `instHSub`

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

### D052: `instTopENNReal`

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

### D053: `setOf`

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

### D054: `Real.rpow`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.SpecialFunctions.Pow.Real`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `bb15cef4d4e582cc0420fd1cb23ac3ac1c3d4852233d8e94e6b31a3235ec89d2`

Type:

```lean
Real → Real → Real
```

Fully explicit type:

```lean
(x y : Real) → Real
```

Definition body (one-level semantic boundary):

```lean
fun x y => (instHPow.hPow (Complex.ofReal x) (Complex.ofReal y)).re
```

## Complete local imported sources

### `NumStability.HDP.Scalar.Preliminaries`

Path: `lean-numerical-stability/NumStability/HDP/Scalar/Preliminaries.lean`
SHA-256: `4f93cb7056c78517c4851cf6f291dbc7fe28b83e6e377f450a8d2534e448ae01`

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

namespace NumStability.HDP.Contract

theorem hdp_01_hthm_hlp_hbanach_hquasinorm
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (p : ENNReal) [Fact (1 ≤ p)] :
    NumStability.HDP.Scalar.Preliminaries.LpQuotientBanachModelData μ p :=
  NumStability.HDP.Scalar.Preliminaries.lpQuotientBanach μ p

theorem hdp_01_hthm_hlp_hbanach_hquasinorm_counterexample :
    ∃ (μ : Measure (Fin 2)) (f g : Fin 2 → ℝ),
      IsProbabilityMeasure μ ∧
        ¬ MeasureTheory.eLpNorm (f + g) (1 / 2 : ENNReal) μ ≤
          MeasureTheory.eLpNorm f (1 / 2 : ENNReal) μ +
            MeasureTheory.eLpNorm g (1 / 2 : ENNReal) μ :=
  NumStability.HDP.Scalar.Preliminaries.twoPointLpTriangleFailure

theorem hdp_01_hdef_hconvex_hfunction
    {φ : ℝ → ℝ}
    (hφ : NumStability.HDP.Scalar.Preliminaries.convexFunctionInterface φ)
    (r : ℝ) :
    Convex ℝ {x : ℝ | x ∈ (Set.univ : Set ℝ) ∧ φ x ≤ r} :=
  NumStability.HDP.Scalar.Preliminaries.convexFunction_sublevel_convex hφ r

theorem hdp_01_hthm_hjensen
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {φ : ℝ → ℝ}
    (hφ : ConvexOn ℝ Set.univ φ)
    (hX : Integrable X μ)
    (hφX : Integrable (fun ω => φ (X ω)) μ) :
    φ (NumStability.HDP.Scalar.Preliminaries.expectation μ X) ≤
      NumStability.HDP.Scalar.Preliminaries.expectation μ (fun ω => φ (X ω)) :=
  NumStability.HDP.Scalar.Preliminaries.jensenIntegral hφ hX hφX

theorem hdp_01_hlem_h1_d2_d1
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hX : Measurable X)
    (hNonneg : ∀ ω, 0 ≤ X ω) :
    ((∫⁻ ω, ENNReal.ofReal (X ω) ∂μ) =
        ∫⁻ t in Set.Ioi 0, μ {ω | t < X ω}) ∧
      (∀ hInt : Integrable X μ,
        NumStability.HDP.Scalar.Preliminaries.expectation μ X =
          ∫ t in Set.Ioi 0, μ.real {ω | t < X ω}) :=
  NumStability.HDP.Scalar.Preliminaries.layerCakeExpectation hX hNonneg

theorem hdp_01_hlem_hmarkov_hindicator_hbound {x t : ℝ}
    (hx : 0 ≤ x) (ht : 0 < t) :
    t * Set.indicator (Set.Ici t) (fun _ => (1 : ℝ)) x ≤ x :=
  NumStability.HDP.Scalar.Preliminaries.markovIndicatorBound hx ht

theorem hdp_01_hex_h1_d2_d6
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X : Ω → ℝ} (hX : Measurable X)
    (hInt : Integrable X μ)
    (hSqInt : Integrable
      (fun ω => (X ω - NumStability.HDP.Scalar.Preliminaries.expectation μ X) ^ 2) μ)
    {t : ℝ} (ht : 0 < t) :
    μ.real {ω | |X ω - NumStability.HDP.Scalar.Preliminaries.expectation μ X| ≥ t} ≤
      NumStability.HDP.Scalar.Preliminaries.variance μ X / t ^ 2 :=
  NumStability.HDP.Scalar.Preliminaries.chebyshevEventBound hX hInt hSqInt ht

theorem hdp_01_hcor_h1_d2_d5
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X : Ω → ℝ} (hX : Measurable X)
    (hInt : Integrable X μ)
    (hSqInt : Integrable
      (fun ω => (X ω - NumStability.HDP.Scalar.Preliminaries.expectation μ X) ^ 2) μ)
    {t : ℝ} (ht : 0 < t) :
    μ.real {ω | |X ω - NumStability.HDP.Scalar.Preliminaries.expectation μ X| ≥ t} ≤
      NumStability.HDP.Scalar.Preliminaries.variance μ X / t ^ 2 :=
  NumStability.HDP.Scalar.Preliminaries.chebyshevEventBound hX hInt hSqInt ht

theorem hdp_01_hthm_hminkowski
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X Y : Ω → ℝ} {p : ENNReal}
    (hX : AEStronglyMeasurable X μ) (hY : AEStronglyMeasurable Y μ)
    (hp : 1 ≤ p) :
    MeasureTheory.eLpNorm (X + Y) p μ ≤
      MeasureTheory.eLpNorm X p μ + MeasureTheory.eLpNorm Y p μ :=
  NumStability.HDP.Scalar.Preliminaries.minkowskiEpnorm hX hY hp

/-! Corrected equation (1.3): positive Lp exponents are monotone on a
  probability space, with the zero-exponent source endpoint recorded
  separately as a discrepancy. -/
theorem hdp_01_hcor_hlp_hmonotone
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {p q : ENNReal}
    (hpq : p ≤ q) (hX : AEStronglyMeasurable X μ) :
    MeasureTheory.eLpNorm X p μ ≤ MeasureTheory.eLpNorm X q μ :=
  NumStability.HDP.Scalar.Preliminaries.lpNormMonoProbability hpq hX

theorem hdp_01_hcor_hlp_hmonotone_zero :
    ∀ {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} {X : Ω → ℝ},
      MeasureTheory.eLpNorm X 0 μ = 0 :=
  fun {_} {_} {_} => NumStability.HDP.Scalar.Preliminaries.lpNormExponentZero

theorem hdp_01_hthm_hholder
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X Y : Ω → ℝ) :
    NumStability.HDP.Scalar.Preliminaries.HolderModelData μ X Y :=
  NumStability.HDP.Scalar.Preliminaries.holderModel μ X Y

theorem hdp_01_hthm_hcdf_hdetermines_hlaw
    {μ ν : Measure ℝ} [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] :
    (∀ t : ℝ, μ (Set.Iic t) = ν (Set.Iic t)) ↔ μ = ν :=
  NumStability.HDP.Scalar.Preliminaries.cdfDeterminesLaw

theorem hdp_01_hrem_h1_d1_d1
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X Y : Ω → ℝ}
    (hX : MemLp X 2 μ) (hY : MemLp Y 2 μ) :
    ‖NumStability.HDP.Scalar.Preliminaries.covariance μ X Y‖ ≤
      NumStability.HDP.Scalar.Preliminaries.standardDeviation μ X *
        NumStability.HDP.Scalar.Preliminaries.standardDeviation μ Y :=
  NumStability.HDP.Scalar.Preliminaries.covarianceCauchySchwarzBound hX hY

end NumStability.HDP.Contract
```
