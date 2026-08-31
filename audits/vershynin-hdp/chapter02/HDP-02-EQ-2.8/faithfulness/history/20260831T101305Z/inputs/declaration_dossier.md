# Declaration dossier for HDP-02-EQ-2.8

This dossier describes the theorem statement only. Its proof is excluded.
Interpret every dependency from its supplied declaration; names are not definitions.

## Proof-free source declaration

```lean
theorem hdp_02_heq_h2_d8
    (rate : ℝ≥0) {t : ℝ} (ht : (rate : ℝ) < t) :
    (poissonMeasure rate).real {n : ℕ | t ≤ (n : ℝ)} ≤
      Real.exp (-(rate : ℝ)) *
        ((Real.exp 1 * (rate : ℝ) / t) ^ t)
```

## Elaborated target type

```lean
∀ (rate : NNReal) {t : Real},
  Real.instLT.lt rate.toReal t →
    Real.instLE.le ((ProbabilityTheory.poissonMeasure rate).real (setOf fun n => Real.instLE.le t n.cast))
      (instHMul.hMul (Real.exp (Real.instNeg.neg rate.toReal))
        (instHPow.hPow (instHDiv.hDiv (instHMul.hMul (Real.exp 1) rate.toReal) t) t))
```

## Fully explicit elaborated target type

```lean
∀ (rate : NNReal) {t : Real} (ht : @LT.lt.{0} Real Real.instLT (NNReal.toReal rate) t),
  @LE.le.{0} Real Real.instLE
    (@MeasureTheory.Measure.real.{0} Nat Nat.instMeasurableSpace (ProbabilityTheory.poissonMeasure rate)
      (@setOf.{0} Nat fun (n : Nat) => @LE.le.{0} Real Real.instLE t (@Nat.cast.{0} Real Real.instNatCast n)))
    (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
      (Real.exp (@Neg.neg.{0} Real Real.instNeg (NNReal.toReal rate)))
      (@HPow.hPow.{0, 0, 0} Real Real Real (@instHPow.{0, 0} Real Real Real.instPow)
        (@HDiv.hDiv.{0, 0, 0} Real Real Real (@instHDiv.{0} Real (@DivInvMonoid.toDiv.{0} Real Real.instDivInvMonoid))
          (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
            (Real.exp (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne))) (NNReal.toReal rate))
          t)
        t))
```

## Local import graph

- `AuditTarget` imports: `NumStability.HDP.Scalar.IndependentSums.PoissonChernoff`
- `NumStability.HDP.Scalar.Preliminaries` imports: `Mathlib.Probability.Moments.Variance`, `Mathlib.Probability.CDF`, `Mathlib.MeasureTheory.Function.LpSpace.Basic`, `Mathlib.MeasureTheory.Function.LpSpace.Complete`, `Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm`, `Mathlib.MeasureTheory.Function.LpSeminorm.Indicator`, `Mathlib.Probability.UniformOn`, `Mathlib.Analysis.Convex.Integral`, `Mathlib.Analysis.Convex.Continuous`, `Mathlib.MeasureTheory.Integral.Bochner.Set`, `Mathlib.MeasureTheory.Integral.Lebesgue.Markov`, `Mathlib.MeasureTheory.Integral.Layercake`, `Mathlib.MeasureTheory.Measure.Lebesgue.Integral`, `Mathlib.Probability.Distributions.Cauchy`, `Mathlib.Analysis.SpecialFunctions.NonIntegrable`, `Mathlib.Analysis.SpecialFunctions.Pow.Integral`, `Mathlib.Tactic`
- `NumStability.HDP.Scalar.IndependentSums.Hoeffding` imports: `Mathlib.Probability.Independence.Integration`, `Mathlib.Probability.Moments.Basic`, `Mathlib.Probability.Moments.SubGaussian`, `Mathlib.Probability.ProbabilityMassFunction.Constructions`, `Mathlib.Probability.ProbabilityMassFunction.Integrals`, `Mathlib.Analysis.SpecialFunctions.Trigonometric.Series`, `Mathlib.Analysis.SpecialFunctions.ImproperIntegrals`, `Mathlib.Tactic`, `NumStability.HDP.Scalar.Preliminaries`
- `NumStability.HDP.Scalar.IndependentSums.GraphDegreeLaw` imports: `Mathlib.Probability.Combinatorics.BinomialRandomGraph.Defs`, `Mathlib.Combinatorics.SimpleGraph.Finite`, `Mathlib.Probability.HasLaw`, `Mathlib.Probability.ProbabilityMassFunction.Binomial`, `Mathlib.Tactic`
- `NumStability.HDP.Scalar.IndependentSums.Chernoff` imports: `Mathlib.Probability.Combinatorics.BinomialRandomGraph.Defs`, `Mathlib.Combinatorics.SimpleGraph.Finite`, `Mathlib.Probability.ProbabilityMassFunction.Integrals`, `Mathlib.Probability.HasLaw`, `Mathlib.Probability.Independence.Integration`, `Mathlib.Probability.Distributions.Poisson`, `Mathlib.MeasureTheory.Integral.Lebesgue.Countable`, `Mathlib.Analysis.Asymptotics.AsymptoticEquivalent`, `Mathlib.Analysis.SpecialFunctions.Stirling`, `Mathlib.Analysis.Complex.ExponentialBounds`, `Mathlib.Tactic`, `NumStability.HDP.Scalar.IndependentSums.Hoeffding`, `NumStability.HDP.Scalar.IndependentSums.GraphDegreeLaw`
- `NumStability.HDP.Scalar.IndependentSums.PoissonChernoff` imports: `NumStability.HDP.Scalar.IndependentSums.Chernoff`, `Mathlib.MeasureTheory.Integral.Bochner.Set`

## Semantic dependency inventory

`local` declarations are followed recursively through types and bodies. `external-frontier` declarations mark the one-level library trust boundary.

### D001: `DivInvMonoid.toDiv`

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

### D002: `HDiv.hDiv`

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

### D003: `HMul.hMul`

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

### D004: `HPow.hPow`

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

### D005: `LE.le`

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

### D006: `LT.lt`

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

### D007: `MeasureTheory.Measure.real`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `4723537c549f4ae1a83b89820f96e884bcbc0bc734ccd6e543bbf82330bffc29`

Type:

```lean
{α : Type u_6} → {m : MeasurableSpace α} → MeasureTheory.Measure α → Set α → Real
```

Fully explicit type:

```lean
{α : Type u_6} → {m : MeasurableSpace.{u_6} α} → (μ : @MeasureTheory.Measure.{u_6} α m) → (s : Set.{u_6} α) → Real
```

Definition body (one-level semantic boundary):

```lean
fun {α} {m} μ s => (MeasureTheory.Measure.instFunLike.coe μ s).toReal
```

### D008: `NNReal`

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

### D009: `NNReal.toReal`

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

### D010: `Nat`

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

### D011: `Nat.cast`

- Role: `external-frontier`
- Owner module: `Init.Data.Cast`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D012: `Nat.instMeasurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.MeasurableSpace.Instances`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D013: `Neg.neg`

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

### D014: `OfNat.ofNat`

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

### D015: `One.toOfNat1`

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

### D016: `ProbabilityTheory.poissonMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.Distributions.Poisson`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D017: `Real`

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

### D018: `Real.exp`

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

### D019: `Real.instDivInvMonoid`

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

### D020: `Real.instLE`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `144d825fc543455e17044e843560e0415f8e4e9da60afb52f34edb809b7c34d3`

Type:

```lean
LE Real
```

Fully explicit type:

```lean
LE.{0} Real
```

Definition body (one-level semantic boundary):

```lean
{ le := Real.le✝ }
```

### D021: `Real.instLT`

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

### D022: `Real.instMul`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D023: `Real.instNatCast`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D024: `Real.instNeg`

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

### D025: `Real.instOne`

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

### D026: `Real.instPow`

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

### D027: `instHDiv`

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

### D028: `instHMul`

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

### D029: `instHPow`

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

### D030: `setOf`

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

## Complete local imported sources

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

### `NumStability.HDP.Scalar.IndependentSums.Hoeffding`

Path: `lean-numerical-stability/NumStability/HDP/Scalar/IndependentSums/Hoeffding.lean`
SHA-256: `374e1393ee79a49ac90546f7e2c10e2c5c49ffaa7f784ff37e6e44966ab39622`

```lean
import Mathlib.Probability.Independence.Integration
import Mathlib.Probability.Moments.Basic
import Mathlib.Probability.Moments.SubGaussian
import Mathlib.Probability.ProbabilityMassFunction.Constructions
import Mathlib.Probability.ProbabilityMassFunction.Integrals
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Series
import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals
import Mathlib.Tactic
import NumStability.HDP.Scalar.Preliminaries

/-!
# MGF tensorization for independent sums

This module records the finite mutual-independence bridge behind the MGF
calculation in Chapter 2.  The exponential integrability hypotheses keep the
real-valued expectation interface honest; the weighted form includes the
unweighted sum by taking every coefficient to be one.
-/

noncomputable section

open MeasureTheory
open ProbabilityTheory
open scoped BigOperators ENNReal NNReal

namespace NumStability.HDP.Scalar.IndependentSums.Hoeffding

/-! The symmetric Bernoulli/Rademacher law from Definition 2.2.1. -/

/-- The affine encoding of a Boolean outcome as a Rademacher value. -/
def rademacherValue : Bool → ℝ := fun b => if b then 1 else -1

/-- The corresponding `{0,1}`-valued Bernoulli indicator. -/
def bernoulliIndicator : Bool → ℝ := fun b => if b then 1 else 0

/-- The fair Bernoulli law used by the canonical coupling. -/
noncomputable def fairBernoulliPMF : PMF Bool :=
  PMF.bernoulli (1 / 2 : ℝ≥0) (by norm_num)

/-- The symmetric Bernoulli/Rademacher law on `{-1,1}`. -/
noncomputable def rademacherPMF : PMF ℝ :=
  fairBernoulliPMF.map rademacherValue

/-- Pointwise, the Rademacher encoding is `2X-1` for a fair indicator. -/
theorem rademacherValue_eq_affine (b : Bool) :
    rademacherValue b = 2 * bernoulliIndicator b - 1 := by
  cases b
  · norm_num [rademacherValue, bernoulliIndicator]
  · norm_num [rademacherValue, bernoulliIndicator] <;> rfl

/-- The affine map which sends the usual Bernoulli support `{0, 1}` to the
Rademacher support `{-1, 1}`. -/
def affineBernoulliValue (x : ℝ) : ℝ := 2 * x - 1

/-- The inverse affine map from the Rademacher scale to the usual Bernoulli
scale. -/
def inverseAffineBernoulliValue (z : ℝ) : ℝ := (z + 1) / 2

/-- The fair usual Bernoulli law, represented on the real support `{0, 1}`. -/
noncomputable def fairBernoulliRealPMF : PMF ℝ :=
  fairBernoulliPMF.map bernoulliIndicator

/-- A real-valued law is the usual fair Bernoulli law exactly when its affine
image under `x ↦ 2x - 1` is the symmetric Bernoulli/Rademacher law.  This is
the arbitrary-law form of the equivalence following Definition 2.2.1. -/
theorem affineLawIsRademacherIff (q : PMF ℝ) :
    q.map affineBernoulliValue = rademacherPMF ↔
      q = fairBernoulliRealPMF := by
  constructor
  · intro h
    have h' := congrArg (fun law : PMF ℝ =>
      law.map inverseAffineBernoulliValue) h
    unfold rademacherPMF at h'
    change (q.map affineBernoulliValue).map inverseAffineBernoulliValue =
      (fairBernoulliPMF.map rademacherValue).map
        inverseAffineBernoulliValue at h'
    rw [PMF.map_comp, PMF.map_comp] at h'
    have hinv : inverseAffineBernoulliValue ∘ affineBernoulliValue = id := by
      funext x
      simp only [Function.comp_apply, affineBernoulliValue,
        inverseAffineBernoulliValue, id_eq]
      ring
    have hbool : inverseAffineBernoulliValue ∘ rademacherValue =
        bernoulliIndicator := by
      funext b
      cases b <;> norm_num [Function.comp_apply, inverseAffineBernoulliValue,
        rademacherValue, bernoulliIndicator]
    rw [hinv, hbool, PMF.map_id] at h'
    exact h'
  · intro h
    subst q
    unfold fairBernoulliRealPMF rademacherPMF
    rw [PMF.map_comp]
    congr 1
    funext b
    cases b <;> norm_num [Function.comp_apply, affineBernoulliValue,
      rademacherValue, bernoulliIndicator] <;> rfl

/-- An arbitrary real probability measure is the ordinary fair Bernoulli law
exactly when its affine image under `x ↦ 2x - 1` is the Rademacher law.  Unlike
the PMF specialization, this theorem retains the source sentence's full law
domain and does not assume discreteness in advance. -/
theorem affineMeasureIsRademacherIff (mu : Measure ℝ) :
    Measure.map affineBernoulliValue mu = rademacherPMF.toMeasure ↔
      mu = fairBernoulliRealPMF.toMeasure := by
  have hAffine : Measurable affineBernoulliValue := by
    unfold affineBernoulliValue
    fun_prop
  have hInverse : Measurable inverseAffineBernoulliValue := by
    unfold inverseAffineBernoulliValue
    fun_prop
  have hinv : inverseAffineBernoulliValue ∘ affineBernoulliValue = id := by
    funext x
    simp only [Function.comp_apply, affineBernoulliValue,
      inverseAffineBernoulliValue, id_eq]
    ring
  have hbool : inverseAffineBernoulliValue ∘ rademacherValue =
      bernoulliIndicator := by
    funext b
    cases b <;> norm_num [Function.comp_apply, inverseAffineBernoulliValue,
      rademacherValue, bernoulliIndicator]
  have href : Measure.map inverseAffineBernoulliValue
      rademacherPMF.toMeasure = fairBernoulliRealPMF.toMeasure := by
    rw [PMF.toMeasure_map inverseAffineBernoulliValue rademacherPMF hInverse]
    congr 1
    unfold rademacherPMF fairBernoulliRealPMF
    rw [PMF.map_comp, hbool]
  constructor
  · intro h
    have h' := congrArg (Measure.map inverseAffineBernoulliValue) h
    change Measure.map inverseAffineBernoulliValue
        (Measure.map affineBernoulliValue mu) =
      Measure.map inverseAffineBernoulliValue rademacherPMF.toMeasure at h'
    rw [Measure.map_map hInverse hAffine, hinv,
      Measure.map_id, href] at h'
    exact h'
  · intro h
    subst mu
    rw [PMF.toMeasure_map affineBernoulliValue fairBernoulliRealPMF hAffine]
    exact congrArg PMF.toMeasure
      ((affineLawIsRademacherIff fairBernoulliRealPMF).2 rfl)

@[simp]
theorem rademacherPMF_mass_one : rademacherPMF 1 = 1 / 2 := by
  simp [rademacherPMF, fairBernoulliPMF, rademacherValue, PMF.map_apply,
    PMF.bernoulli_apply]
  norm_num

@[simp]
theorem rademacherPMF_mass_neg_one : rademacherPMF (-1) = 1 / 2 := by
  simp [rademacherPMF, fairBernoulliPMF, rademacherValue, PMF.map_apply,
    PMF.bernoulli_apply]
  norm_num

theorem rademacherPMF_mean :
    ∫ x : ℝ, x ∂rademacherPMF.toMeasure = 0 := by
  let f : Bool → ℝ := rademacherValue
  have hf : Measurable f := measurable_of_countable f
  unfold rademacherPMF
  rw [← PMF.toMeasure_map f]
  · change (∫ y : ℝ, id y ∂Measure.map f
      fairBernoulliPMF.toMeasure) = 0
    rw [MeasureTheory.integral_map hf.aemeasurable
      (continuous_id.aestronglyMeasurable)]
    rw [PMF.integral_eq_sum]
    simp [f, fairBernoulliPMF, rademacherValue, PMF.bernoulli_apply]
    norm_num
  · exact hf

theorem rademacherPMF_variance :
    ∫ x : ℝ, (x - 0) ^ 2 ∂rademacherPMF.toMeasure = 1 := by
  let f : Bool → ℝ := rademacherValue
  have hf : Measurable f := measurable_of_countable f
  unfold rademacherPMF
  rw [← PMF.toMeasure_map f]
  · change (∫ y : ℝ, (id y - 0) ^ 2 ∂Measure.map f
      fairBernoulliPMF.toMeasure) = 1
    rw [MeasureTheory.integral_map hf.aemeasurable
      (((continuous_id.sub continuous_const).pow 2).aestronglyMeasurable)]
    rw [PMF.integral_eq_sum]
    simp [f, fairBernoulliPMF, rademacherValue, PMF.bernoulli_apply]
  · exact hf

theorem rademacherPMF_abs :
    ∫ x : ℝ, |x| ∂rademacherPMF.toMeasure = 1 := by
  let f : Bool → ℝ := rademacherValue
  have hf : Measurable f := measurable_of_countable f
  unfold rademacherPMF
  rw [← PMF.toMeasure_map f]
  · change (∫ y : ℝ, |y| ∂Measure.map f
      fairBernoulliPMF.toMeasure) = 1
    rw [MeasureTheory.integral_map hf.aemeasurable
      (continuous_abs.aestronglyMeasurable)]
    rw [PMF.integral_eq_sum]
    simp [f, fairBernoulliPMF, rademacherValue, PMF.bernoulli_apply]
  · exact hf

/-- The affine Bernoulli coupling is Rademacher exactly at the fair parameter. -/
theorem affineBernoulliIsRademacherIff {p : ℝ≥0} (hp : p ≤ 1) :
    PMF.map rademacherValue (PMF.bernoulli p hp) = rademacherPMF ↔
      p = (1 / 2 : ℝ≥0) := by
  constructor
  · intro h
    have h1 := congrArg (fun q : PMF ℝ => q 1) h
    have hneq : (1 : ℝ) ≠ -1 := by norm_num
    have h1simp : (p : ℝ≥0∞) = (1 / 2 : ℝ≥0∞) := by
      simpa [rademacherPMF, fairBernoulliPMF, PMF.map_apply,
        rademacherValue, PMF.bernoulli_apply, hneq] using h1
    have h1nn : (p : ℝ≥0∞) = ((1 / 2 : ℝ≥0) : ℝ≥0∞) := by
      convert h1simp using 1 <;> norm_num
    exact_mod_cast h1nn
  · intro hp'
    subst p
    rfl

/-- The complete source-facing package for Definition 2.2.1. -/
structure RademacherModelData where
  law : PMF ℝ
  mass_one : law 1 = 1 / 2
  mass_neg_one : law (-1) = 1 / 2
  affine_bernoulli_iff :
    ∀ {p : ℝ≥0} (hp : p ≤ 1),
      PMF.map rademacherValue (PMF.bernoulli p hp) = law ↔
        p = (1 / 2 : ℝ≥0)
  mean : ∫ x : ℝ, x ∂law.toMeasure = 0
  variance : ∫ x : ℝ, (x - 0) ^ 2 ∂law.toMeasure = 1
  abs_mean : ∫ x : ℝ, |x| ∂law.toMeasure = 1

/-- Canonical Rademacher law and its defining Bernoulli coupling and moments. -/
noncomputable def rademacherModel : RademacherModelData :=
  { law := rademacherPMF
    mass_one := rademacherPMF_mass_one
    mass_neg_one := rademacherPMF_mass_neg_one
    affine_bernoulli_iff := fun hp => affineBernoulliIsRademacherIff hp
    mean := rademacherPMF_mean
    variance := rademacherPMF_variance
    abs_mean := rademacherPMF_abs }

/-- The MGF of a weighted finite sum factors under mutual independence. -/
theorem mgfIndependentSum
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} (lam : ℝ) (a : ι → ℝ)
    (hX : iIndepFun X μ)
    (hExp : ∀ i, Integrable (fun ω => Real.exp (lam * (a i * X i ω))) μ) :
    ∫ ω, Real.exp (lam * ∑ i, a i * X i ω) ∂μ =
      ∏ i, ∫ ω, Real.exp (lam * (a i * X i ω)) ∂μ := by
  let Y : ι → Ω → ℝ := fun i ω => Real.exp (lam * (a i * X i ω))
  have hY : iIndepFun Y μ := by
    let g : ∀ i, ℝ → ℝ := fun i x => Real.exp (lam * (a i * x))
    have hg : ∀ i, Measurable (g i) := by
      intro i
      fun_prop
    have h := hX.comp g hg
    simpa [Y, g, Function.comp_def] using h
  have hY_meas : ∀ i, AEStronglyMeasurable (Y i) μ := by
    intro i
    exact (hExp i).aestronglyMeasurable
  calc
    ∫ ω, Real.exp (lam * ∑ i, a i * X i ω) ∂μ =
        ∫ ω, ∏ i, Y i ω ∂μ := by
          apply integral_congr_ae
          filter_upwards [] with ω
          simp only [Y]
          rw [Finset.mul_sum, Real.exp_sum]
    _ = ∏ i, ∫ ω, Y i ω ∂μ := by
      simpa only [Finset.prod_apply] using
        hY.integral_prod_eq_prod_integral hY_meas
    _ = ∏ i, ∫ ω, Real.exp (lam * (a i * X i ω)) ∂μ := by
      rfl

/-- The centered bounded-variable Hoeffding lemma, with all real MGF
parameters bundled by Mathlib's sub-Gaussian interface. -/
theorem hoeffdingBoundedMGF
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {a b : ℝ}
    (hX : AEMeasurable X μ)
    (hbound : ∀ᵐ ω ∂μ, X ω ∈ Set.Icc a b)
    (hmean : ∫ ω, X ω ∂μ = 0) :
    HasSubgaussianMGF X ((‖b - a‖₊ / 2) ^ 2) μ :=
  ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc_of_integral_eq_zero
    hX hbound hmean

/-- The noncentered bounded-variable form, obtained by subtracting the mean. -/
theorem hoeffdingCenteredMGF
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {a b : ℝ}
    (hX : AEMeasurable X μ)
    (hbound : ∀ᵐ ω ∂μ, X ω ∈ Set.Icc a b) :
    HasSubgaussianMGF (fun ω => X ω - ∫ y, X y ∂μ)
      ((‖b - a‖₊ / 2) ^ 2) μ :=
  ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc hX hbound

/-! The one-variable quadratic optimization used by the Hoeffding tail proof. -/
theorem hoeffdingOptimization {v t : ℝ} (hv : 0 < v) (ht : 0 ≤ t) :
    (∀ u : ℝ, 0 ≤ u →
      -t ^ 2 / (2 * v) ≤ -u * t + u ^ 2 * v / 2) ∧
      (-(t / v) * t + (t / v) ^ 2 * v / 2 = -t ^ 2 / (2 * v)) := by
  constructor
  · intro u hu
    have hsq : 0 ≤ (u * v - t) ^ 2 := sq_nonneg (u * v - t)
    field_simp
    nlinarith
  · field_simp
    ring

/-! The coefficientwise hyperbolic-cosine estimate used by Rademacher MGF bounds. -/
theorem coshLeExpHalfSq (x : ℝ) :
    Real.cosh x ≤ Real.exp (x ^ 2 / 2) :=
  Real.cosh_le_exp_half_sq x

/-! The one-sided finite exponential-Markov upper tail bound. -/
theorem exponentialMarkovUpper
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {S : Ω → ℝ} (hS : Measurable S)
    {lam t : ℝ} (hlam : 0 < lam)
    (hExp : Integrable (fun ω => Real.exp (lam * S ω)) μ) :
    μ.real (S ⁻¹' Set.Ici t) ≤
      Real.exp (-(lam * t)) * (∫ ω, Real.exp (lam * S ω) ∂μ) := by
  let Y : Ω → ℝ := fun ω => Real.exp (lam * S ω)
  have hY : Measurable Y := by
    simpa [Y] using (hS.const_mul lam).exp
  have hY_nonneg : ∀ᵐ ω ∂μ, 0 ≤ Y ω :=
    Filter.Eventually.of_forall (fun ω => le_of_lt (Real.exp_pos _))
  have hY_int : Integrable Y μ := by
    simpa [Y] using hExp
  have hY_markov :=
    NumStability.HDP.Scalar.Preliminaries.markovInequalityFinite
      hY hY_nonneg hY_int (Real.exp_pos (lam * t))
  have measureReal_mono_prob {A B : Set Ω} (hAB : A ⊆ B) :
      μ.real A ≤ μ.real B := by
    rw [Measure.real_def, Measure.real_def]
    exact ENNReal.toReal_mono (measure_ne_top μ B) (measure_mono hAB)
  have hsubset : S ⁻¹' Set.Ici t ⊆
      Y ⁻¹' Set.Ici (Real.exp (lam * t)) := by
    intro ω hω
    change t ≤ S ω at hω
    change Real.exp (lam * t) ≤ Real.exp (lam * S ω)
    exact (Real.exp_le_exp).2 (mul_le_mul_of_nonneg_left hω hlam.le)
  calc
    μ.real (S ⁻¹' Set.Ici t) ≤ μ.real (Y ⁻¹' Set.Ici (Real.exp (lam * t))) :=
      measureReal_mono_prob hsubset
    _ ≤ (∫ ω, Y ω ∂μ) / Real.exp (lam * t) := by
      simpa [Preliminaries.expectation] using hY_markov
    _ = Real.exp (-(lam * t)) * (∫ ω, Real.exp (lam * S ω) ∂μ) := by
      simp [Y, Real.exp_neg, div_eq_mul_inv]
      ring

/-! The exact one-coordinate MGF of a Rademacher law. -/
theorem rademacherWeightedMGFEqCosh
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hX : Measurable X)
    (hLaw : Measure.map X μ = rademacherPMF.toMeasure)
    (lam a : ℝ) :
    (∫ ω, Real.exp (lam * (a * X ω)) ∂μ) = Real.cosh (lam * a) := by
  let f : ℝ → ℝ := fun x => Real.exp (lam * (a * x))
  have hf : Measurable f := by fun_prop
  have hmap_integral :
      (∫ ω, Real.exp (lam * (a * X ω)) ∂μ) =
        ∫ x : ℝ, Real.exp (lam * (a * x)) ∂Measure.map X μ := by
    symm
    rw [MeasureTheory.integral_map hX.aemeasurable hf.aestronglyMeasurable]
  rw [hmap_integral, hLaw]
  unfold rademacherPMF
  rw [← PMF.toMeasure_map rademacherValue]
  · rw [MeasureTheory.integral_map
      (measurable_of_countable rademacherValue).aemeasurable
      hf.aestronglyMeasurable]
    rw [PMF.integral_eq_sum]
    simp [f, fairBernoulliPMF, rademacherValue, PMF.bernoulli_apply]
    calc
      2⁻¹ * Real.exp (lam * a) +
          (1 - 2⁻¹) * Real.exp (-(lam * a)) =
          (Real.exp (lam * a) + Real.exp (-(lam * a))) / 2 := by ring
      _ = Real.cosh (lam * a) := by rw [Real.cosh_eq]
  · exact measurable_of_countable rademacherValue

/-! The one-coordinate MGF estimate for a Rademacher law. -/
theorem rademacherWeightedMGFLe
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hX : Measurable X)
    (hLaw : Measure.map X μ = rademacherPMF.toMeasure)
    (lam a : ℝ) :
    (∫ ω, Real.exp (lam * (a * X ω)) ∂μ) ≤
      Real.exp ((lam * a) ^ 2 / 2) := by
  calc
    (∫ ω, Real.exp (lam * (a * X ω)) ∂μ) = Real.cosh (lam * a) :=
      rademacherWeightedMGFEqCosh hX hLaw lam a
    _ ≤ Real.exp ((lam * a) ^ 2 / 2) := coshLeExpHalfSq (lam * a)

/-! One-sided Rademacher Hoeffding, with the positive coefficient-energy branch
made explicit so the optimized exponent never divides by zero. -/
theorem integrable_exp_mul_rademacher
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ}
    (hX : Measurable X)
    (hLaw : Measure.map X μ = rademacherPMF.toMeasure)
    (lam a : ℝ) :
    Integrable (fun ω => Real.exp (lam * (a * X ω))) μ := by
  let f : ℝ → ℝ := fun x => Real.exp (lam * (a * x))
  have hf_bool :
      Integrable (fun b : Bool => f (rademacherValue b)) fairBernoulliPMF.toMeasure :=
    Integrable.of_finite
  have hf_rademacher : Integrable f rademacherPMF.toMeasure := by
    unfold rademacherPMF
    rw [← PMF.toMeasure_map]
    · rw [integrable_map_measure (by fun_prop)
          (measurable_of_countable rademacherValue).aemeasurable]
      simpa [Function.comp_def] using hf_bool
    · exact measurable_of_countable rademacherValue
  have hf_map : Integrable f (Measure.map X μ) := by
    rw [hLaw]
    exact hf_rademacher
  simpa [f, Function.comp_def] using hf_map.comp_measurable hX

theorem rademacherHoeffding
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {a : ι → ℝ} {t : ℝ}
    (hX : ∀ i, Measurable (X i))
    (hIndep : iIndepFun X μ)
    (hLaw : ∀ i, Measure.map (X i) μ =
      NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF.toMeasure)
    (hExp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam * (a i * X i ω))) μ)
    (ht : 0 ≤ t) (hv : 0 < ∑ i, (a i) ^ 2) :
    μ.real {ω | ∑ i, a i * X i ω ≥ t} ≤
      Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) := by
  let v : ℝ := ∑ i, (a i) ^ 2
  let S : Ω → ℝ := fun ω => ∑ i, a i * X i ω
  have hS_meas : Measurable S := by
    dsimp [S]
    exact Finset.measurable_sum Finset.univ
      (fun i _ => (hX i).const_mul (a i))
  have hS_exp (lam : ℝ) :
      Integrable (fun ω => Real.exp (lam * S ω)) μ := by
    let Y : ι → Ω → ℝ := fun i ω => a i * X i ω
    have hY_meas : ∀ i, Measurable (Y i) := by
      intro i
      simpa [Y] using (hX i).const_mul (a i)
    have hY_indep : iIndepFun Y μ := by
      have hcomp := hIndep.comp (fun i x => a i * x)
        (fun _ => by fun_prop)
      simpa [Y, Function.comp_def] using hcomp
    have hY_exp : ∀ i, Integrable (fun ω => Real.exp (lam * Y i ω)) μ := by
      intro i
      simpa [Y] using hExp lam i
    have h := hY_indep.integrable_exp_mul_sum hY_meas
      (s := Finset.univ) (fun i _ => hY_exp i)
    simpa [S, Y] using h
  have hmgf (lam : ℝ) :
      (∫ ω, Real.exp (lam * S ω) ∂μ) =
        ∏ i, ∫ ω, Real.exp (lam * (a i * X i ω)) ∂μ := by
    simpa [S] using
      (mgfIndependentSum (μ := μ) (X := X) lam a hIndep (hExp lam))
  have hfactor (lam : ℝ) (i : ι) :
      (∫ ω, Real.exp (lam * (a i * X i ω)) ∂μ) ≤
        Real.exp ((lam * a i) ^ 2 / 2) :=
    rademacherWeightedMGFLe (hX i) (hLaw i) lam (a i)
  by_cases ht0 : t = 0
  · rw [ht0]
    have hprob : μ.real {ω | ∑ i, a i * X i ω ≥ 0} ≤ 1 := by
      rw [Measure.real_def]
      exact ENNReal.toReal_mono ENNReal.one_ne_top prob_le_one
    simpa [v] using hprob
  · have htpos : 0 < t := lt_of_le_of_ne ht (Ne.symm ht0)
    let lam : ℝ := t / v
    have hlam : 0 < lam := div_pos htpos (by simpa [v] using hv)
    have hupper := exponentialMarkovUpper hS_meas (lam := lam) (t := t)
      hlam (hS_exp lam)
    have hprod :
        (∏ i, ∫ ω, Real.exp (lam * (a i * X i ω)) ∂μ) ≤
          ∏ i, Real.exp ((lam * a i) ^ 2 / 2) := by
      apply Finset.prod_le_prod
      · intro i hi
        exact MeasureTheory.integral_nonneg (fun ω => Real.exp_nonneg _)
      · intro i hi
        exact hfactor lam i
    have hmgf_upper :
        (∫ ω, Real.exp (lam * S ω) ∂μ) ≤
          Real.exp (lam ^ 2 * v / 2) := by
      rw [hmgf lam]
      calc
        (∏ i, ∫ ω, Real.exp (lam * (a i * X i ω)) ∂μ) ≤
            ∏ i, Real.exp ((lam * a i) ^ 2 / 2) := hprod
        _ = Real.exp (lam ^ 2 * v / 2) := by
          rw [← Real.exp_sum]
          congr 1
          dsimp [v]
          ring_nf
          rw [Finset.mul_sum, Finset.sum_mul]
    calc
      μ.real {ω | ∑ i, a i * X i ω ≥ t} =
          μ.real (S ⁻¹' Set.Ici t) := by rfl
      _ ≤ Real.exp (-(lam * t)) * (∫ ω, Real.exp (lam * S ω) ∂μ) := by
        simpa using hupper
      _ ≤ Real.exp (-(lam * t)) * Real.exp (lam ^ 2 * v / 2) :=
        mul_le_mul_of_nonneg_left hmgf_upper (Real.exp_nonneg _)
      _ = Real.exp (-t ^ 2 / (2 * v)) := by
        rw [← Real.exp_add]
        congr 1
        dsimp [lam]
        field_simp [ne_of_gt (by simpa [v] using hv)]
        ring
      _ = Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) := by rfl

/-- Source-form one-sided Rademacher Hoeffding.  The exponential moments are
automatic from the Rademacher laws, and the zero-energy branch has right-hand
side one under the real-division convention. -/
theorem rademacherHoeffdingAll
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {a : ι → ℝ} {t : ℝ}
    (hX : ∀ i, Measurable (X i))
    (hIndep : iIndepFun X μ)
    (hLaw : ∀ i, Measure.map (X i) μ = rademacherPMF.toMeasure)
    (ht : 0 ≤ t) :
    μ.real {ω | ∑ i, a i * X i ω ≥ t} ≤
      Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) := by
  have hExp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam * (a i * X i ω))) μ := by
    intro lam i
    exact integrable_exp_mul_rademacher (hX i) (hLaw i) lam (a i)
  by_cases hv : 0 < ∑ i, (a i) ^ 2
  · exact rademacherHoeffding hX hIndep hLaw hExp ht hv
  · have hv_nonneg : 0 ≤ ∑ i, (a i) ^ 2 :=
      Finset.sum_nonneg fun i _ => sq_nonneg (a i)
    have hv_zero : ∑ i, (a i) ^ 2 = 0 :=
      le_antisymm (le_of_not_gt hv) hv_nonneg
    have hprob : μ.real {ω | ∑ i, a i * X i ω ≥ t} ≤ 1 := by
      rw [Measure.real_def]
      exact ENNReal.toReal_mono ENNReal.one_ne_top prob_le_one
    simpa [hv_zero] using hprob

/-- Zero coefficient energy is the deterministic zero-sum branch. -/
theorem rademacherHoeffdingZero
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {a : ι → ℝ} {t : ℝ}
    (ha : ∀ i, a i = 0) (ht : 0 < t) :
    μ.real {ω | ∑ i, a i * X i ω ≥ t} = 0 := by
  have hevent : {ω | ∑ i, a i * X i ω ≥ t} = (∅ : Set Ω) := by
    ext ω
    simp [ha, ht]
  rw [hevent]
  simp

/-! Two-sided Rademacher Hoeffding, using the explicit sign-symmetry law. -/
theorem rademacherTwoSidedHoeffding
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {a : ι → ℝ} {t : ℝ}
    (hX : ∀ i, Measurable (X i))
    (hIndep : iIndepFun X μ)
    (hLaw : ∀ i, Measure.map (X i) μ = rademacherPMF.toMeasure)
    (hNegLaw : ∀ i, Measure.map (fun ω => -X i ω) μ = rademacherPMF.toMeasure)
    (hExp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam * (a i * X i ω))) μ)
    (ht : 0 < t) (hv : 0 < ∑ i, (a i) ^ 2) :
    μ.real {ω | |∑ i, a i * X i ω| ≥ t} ≤
      2 * Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) := by
  let S : Ω → ℝ := fun ω => ∑ i, a i * X i ω
  let A : Set Ω := {ω | S ω ≥ t}
  let B : Set Ω := {ω | -S ω ≥ t}
  have hupper := rademacherHoeffding hX hIndep hLaw hExp ht.le hv
  let Y : ι → Ω → ℝ := fun i ω => -X i ω
  have hY_meas : ∀ i, Measurable (Y i) := by
    intro i
    simpa [Y] using (hX i).neg
  have hY_indep : iIndepFun Y μ := by
    have hcomp := hIndep.comp (fun _ x => -x) (fun _ => by fun_prop)
    simpa [Y, Function.comp_def] using hcomp
  have hY_exp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam * (a i * Y i ω))) μ := by
    intro lam i
    simpa [Y, mul_assoc, mul_left_comm, mul_comm] using hExp (-lam) i
  have hY_law : ∀ i, Measure.map (Y i) μ = rademacherPMF.toMeasure := by
    intro i
    simpa [Y] using hNegLaw i
  have hlower := rademacherHoeffding hY_meas hY_indep hY_law hY_exp ht.le hv
  have measureReal_mono_prob {C D : Set Ω} (hCD : C ⊆ D) :
      μ.real C ≤ μ.real D := by
    rw [Measure.real_def, Measure.real_def]
    exact ENNReal.toReal_mono (measure_ne_top μ D) (measure_mono hCD)
  have hsubset : {ω | |S ω| ≥ t} ⊆ A ∪ B := by
    intro ω hω
    change t ≤ |S ω| at hω
    change t ≤ S ω ∨ t ≤ -S ω
    by_cases hupperS : t ≤ S ω
    · exact Or.inl hupperS
    · right
      have hSlt : S ω < t := lt_of_not_ge hupperS
      by_contra hnot
      have hneglt : -S ω < t := lt_of_not_ge hnot
      exact (not_lt_of_ge hω) ((abs_lt).2 (by constructor <;> linarith))
  have hmeasure_union : μ.real (A ∪ B) ≤ μ.real A + μ.real B := by
    rw [Measure.real_def, Measure.real_def, Measure.real_def]
    calc
      (μ (A ∪ B)).toReal ≤ (μ A + μ B).toReal := by
        apply ENNReal.toReal_mono
        · exact ENNReal.add_ne_top.mpr ⟨measure_ne_top μ A, measure_ne_top μ B⟩
        · exact measure_union_le A B
      _ = (μ A).toReal + (μ B).toReal :=
        ENNReal.toReal_add (measure_ne_top μ A) (measure_ne_top μ B)
  have hupperA : μ.real A ≤
      Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) := by
    simpa [A, S] using hupper
  have hlowerB : μ.real B ≤
      Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) := by
    simpa [B, S, Y, Finset.sum_neg_distrib] using hlower
  calc
    μ.real {ω | |∑ i, a i * X i ω| ≥ t} = μ.real {ω | |S ω| ≥ t} := by rfl
    _ ≤ μ.real (A ∪ B) := measureReal_mono_prob hsubset
    _ ≤ μ.real A + μ.real B := hmeasure_union
    _ ≤ Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) +
        Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) :=
      add_le_add hupperA hlowerB
    _ = 2 * Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) := by ring

/-! The fair-coin application before Remark 2.2.4. -/
theorem fairCoinHoeffding
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool}
    (hB : ∀ i, Measurable (B i))
    (hIndep : iIndepFun B μ)
    (hLaw : ∀ i, Measure.map (B i) μ = fairBernoulliPMF.toMeasure)
    (hExp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam * rademacherValue (B i ω))) μ)
    (hN : 0 < Fintype.card ι) :
    μ.real {ω | ∑ i, bernoulliIndicator (B i ω) ≥
      (3 / 4 : ℝ) * (Fintype.card ι : ℝ)} ≤
      Real.exp (-(Fintype.card ι : ℝ) / 8) := by
  let R : ι → Ω → ℝ := fun i ω => rademacherValue (B i ω)
  have hR : ∀ i, Measurable (R i) := by
    intro i
    simpa [R, Function.comp_def] using
      (measurable_of_countable rademacherValue).comp (hB i)
  have hR_indep : iIndepFun R μ := by
    have hcomp := hIndep.comp (fun _ b => rademacherValue b)
      (fun _ => measurable_of_countable rademacherValue)
    simpa [R, Function.comp_def] using hcomp
  have hR_law : ∀ i, Measure.map (R i) μ = rademacherPMF.toMeasure := by
    intro i
    rw [show R i = rademacherValue ∘ B i by rfl]
    rw [← MeasureTheory.Measure.map_map
      (measurable_of_countable rademacherValue) (hB i)]
    rw [hLaw i]
    change Measure.map rademacherValue fairBernoulliPMF.toMeasure =
      (PMF.map rademacherValue fairBernoulliPMF).toMeasure
    exact PMF.toMeasure_map rademacherValue fairBernoulliPMF
      (measurable_of_countable rademacherValue)
  have hR_exp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam * (1 * R i ω))) μ := by
    intro lam i
    simpa [R] using hExp lam i
  have htail := rademacherHoeffding (X := R) (a := fun _ => (1 : ℝ))
    (t := (Fintype.card ι : ℝ) / 2) hR hR_indep hR_law hR_exp
    (by positivity) (by simpa using hN)
  let A : Set Ω := {ω | ∑ i, bernoulliIndicator (B i ω) ≥
    (3 / 4 : ℝ) * (Fintype.card ι : ℝ)}
  let C : Set Ω := {ω | ∑ i, R i ω ≥ (Fintype.card ι : ℝ) / 2}
  have hAC : A ⊆ C := by
    intro ω hω
    have hsum : ∑ i, R i ω =
        2 * ∑ i, bernoulliIndicator (B i ω) - (Fintype.card ι : ℝ) := by
      simp_rw [R, rademacherValue_eq_affine]
      rw [Finset.sum_sub_distrib, ← Finset.mul_sum]
      simp
    change (Fintype.card ι : ℝ) / 2 ≤ ∑ i, R i ω
    rw [hsum]
    change (3 / 4 : ℝ) * (Fintype.card ι : ℝ) ≤
      ∑ i, bernoulliIndicator (B i ω) at hω
    linarith
  have hmeasure : μ.real A ≤ μ.real C := by
    rw [Measure.real_def, Measure.real_def]
    exact ENNReal.toReal_mono (measure_ne_top μ C) (measure_mono hAC)
  calc
    μ.real {ω | ∑ i, bernoulliIndicator (B i ω) ≥
        (3 / 4 : ℝ) * (Fintype.card ι : ℝ)} = μ.real A := by rfl
    _ ≤ μ.real C := hmeasure
    _ ≤ Real.exp (-((Fintype.card ι : ℝ) / 2) ^ 2 /
        (2 * ∑ i, (1 : ℝ) ^ 2)) := by
      simpa [C] using htail
    _ = Real.exp (-(Fintype.card ι : ℝ) / 8) := by
      congr 1
      have hNreal : 0 < (Fintype.card ι : ℝ) := by exact_mod_cast hN
      simp only [one_pow]
      rw [show (∑ i : ι, (1 : ℝ)) = (Fintype.card ι : ℝ) by simp]
      field_simp [ne_of_gt hNreal]
      ring

/-! The positive-total-width branch of the bounded-variable Hoeffding theorem. -/
theorem boundedIndependentHoeffding
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {m M : ι → ℝ} {t : ℝ}
    (hX : ∀ i, Measurable (X i))
    (hIndep : iIndepFun X μ)
    (hbound : ∀ i, ∀ᵐ ω ∂μ, X i ω ∈ Set.Icc (m i) (M i))
    (ht : 0 < t) (hv : 0 < ∑ i, ‖M i - m i‖ ^ 2) :
    μ.real {ω | ∑ i, (X i ω - ∫ y, X i y ∂μ) ≥ t} ≤
      Real.exp (-2 * t ^ 2 / (∑ i, ‖M i - m i‖ ^ 2)) := by
  let b : ι → ℝ := fun i => ∫ y, X i y ∂μ
  let Y : ι → Ω → ℝ := fun i ω => X i ω - b i
  let S : Ω → ℝ := fun ω => ∑ i, Y i ω
  let v : ℝ := ∑ i, ‖M i - m i‖ ^ 2
  have hY_meas : ∀ i, Measurable (Y i) := by
    intro i
    simpa [Y, b] using (hX i).sub measurable_const
  have hY_indep : iIndepFun Y μ := by
    have hcomp := hIndep.comp (fun i x => x - b i)
      (fun _ => by fun_prop)
    simpa [Y, b, Function.comp_def] using hcomp
  have hY_sub : ∀ i, HasSubgaussianMGF (Y i)
      ((‖M i - m i‖₊ / 2) ^ 2) μ := by
    intro i
    simpa [Y, b] using
      (hoeffdingCenteredMGF (μ := μ) (X := X i) (a := m i) (b := M i)
        (hX i).aemeasurable (hbound i))
  have hY_exp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam * Y i ω)) μ := by
    intro lam i
    simpa using (hY_sub i).integrable_exp_mul lam
  have hS_meas : Measurable S := by
    dsimp [S]
    exact Finset.measurable_sum Finset.univ (fun i _ => hY_meas i)
  have hS_exp (lam : ℝ) :
      Integrable (fun ω => Real.exp (lam * S ω)) μ := by
    have h := hY_indep.integrable_exp_mul_sum hY_meas
      (s := Finset.univ) (fun i _ => hY_exp lam i)
    simpa [S] using h
  have hmgf (lam : ℝ) :
      (∫ ω, Real.exp (lam * S ω) ∂μ) =
        ∏ i, ∫ ω, Real.exp (lam * (1 * Y i ω)) ∂μ := by
    simpa [S] using
      (mgfIndependentSum (μ := μ) (X := Y) lam (fun _ => (1 : ℝ))
        hY_indep (fun i => by simpa using hY_exp lam i))
  have hfactor (lam : ℝ) (i : ι) :
      (∫ ω, Real.exp (lam * (1 * Y i ω)) ∂μ) ≤
        Real.exp ((lam * ‖M i - m i‖) ^ 2 / 8) := by
    have hle := (hY_sub i).mgf_le lam
    convert hle using 1 <;>
      simp [ProbabilityTheory.mgf, Y, b, div_eq_mul_inv] <;> ring
  have hmgf_upper (lam : ℝ) :
      (∫ ω, Real.exp (lam * S ω) ∂μ) ≤
        Real.exp (lam ^ 2 * v / 8) := by
    have hprod :
        (∏ i, ∫ ω, Real.exp (lam * (1 * Y i ω)) ∂μ) ≤
          ∏ i, Real.exp ((lam * ‖M i - m i‖) ^ 2 / 8) := by
      apply Finset.prod_le_prod
      · intro i hi
        exact MeasureTheory.integral_nonneg (fun ω => Real.exp_nonneg _)
      · intro i hi
        exact hfactor lam i
    rw [hmgf]
    calc
      (∏ i, ∫ ω, Real.exp (lam * (1 * Y i ω)) ∂μ) ≤
          ∏ i, Real.exp ((lam * ‖M i - m i‖) ^ 2 / 8) := hprod
      _ = Real.exp (lam ^ 2 * v / 8) := by
        rw [← Real.exp_sum]
        congr 1
        dsimp [v]
        ring_nf
        rw [Finset.mul_sum, Finset.sum_mul]
  have hupper (lam : ℝ) (hlam : 0 < lam) :
      μ.real (S ⁻¹' Set.Ici t) ≤
        Real.exp (-(lam * t)) * Real.exp (lam ^ 2 * v / 8) := by
    calc
      μ.real (S ⁻¹' Set.Ici t) ≤
          Real.exp (-(lam * t)) * (∫ ω, Real.exp (lam * S ω) ∂μ) :=
        exponentialMarkovUpper hS_meas hlam (hS_exp lam)
      _ ≤ Real.exp (-(lam * t)) * Real.exp (lam ^ 2 * v / 8) :=
        mul_le_mul_of_nonneg_left (hmgf_upper lam) (Real.exp_nonneg _)
  have hv' : 0 < v := by simpa [v] using hv
  let lam : ℝ := 4 * t / v
  have hlam : 0 < lam := div_pos (by positivity) hv'
  have hupper' := hupper lam hlam
  calc
    μ.real {ω | ∑ i, (X i ω - ∫ y, X i y ∂μ) ≥ t} =
        μ.real (S ⁻¹' Set.Ici t) := by rfl
    _ ≤ Real.exp (-(lam * t)) * Real.exp (lam ^ 2 * v / 8) := hupper'
    _ = Real.exp (-2 * t ^ 2 / v) := by
      rw [← Real.exp_add]
      congr 1
      dsimp [lam]
      field_simp [ne_of_gt hv']
      ring
    _ = Real.exp (-2 * t ^ 2 / (∑ i, ‖M i - m i‖ ^ 2)) := by rfl

/-! Deterministic zero-width companion for the bounded-variable theorem. -/
theorem boundedIndependentHoeffdingZero
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {m : ι → ℝ} {t : ℝ}
    (hconst : ∀ i ω, X i ω = m i) (ht : 0 < t) :
    μ.real {ω | ∑ i, (X i ω - ∫ y, X i y ∂μ) ≥ t} = 0 := by
  have hmean : ∀ i, (∫ y, X i y ∂μ) = m i := by
    intro i
    simp [hconst i]
  have hevent : {ω | ∑ i, (X i ω - ∫ y, X i y ∂μ) ≥ t} = (∅ : Set Ω) := by
    ext ω
    simp [hconst, hmean, ht]
  rw [hevent]
  simp

/-! Majority-vote amplification from the bounded Hoeffding theorem. -/
theorem majorityVoteHoeffding
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {W : ι → Ω → ℝ} {δ ε : ℝ}
    (hW : ∀ i, Measurable (W i))
    (hIndep : iIndepFun W μ)
    (hbound : ∀ i, ∀ᵐ ω ∂μ, W i ω ∈ Set.Icc 0 1)
    (hmean : ∀ i, (∫ y, W i y ∂μ) ≤ 1 / 2 - δ)
    (hδ : 0 < δ) (hε0 : 0 < ε) (hε1 : ε < 1)
    (hN : 0 < Fintype.card ι)
    (hNlarge : Real.log (1 / ε) / (2 * δ ^ 2) ≤ (Fintype.card ι : ℝ)) :
    μ.real {ω | ∑ i, W i ω ≥ (Fintype.card ι : ℝ) / 2} ≤ ε := by
  let N : ℝ := Fintype.card ι
  let A : Set Ω := {ω | ∑ i, W i ω ≥ N / 2}
  let C : Set Ω := {ω | ∑ i, (W i ω - ∫ y, W i y ∂μ) ≥ N * δ}
  have hNpos : 0 < N := by simpa [N] using hN
  have htail := boundedIndependentHoeffding (X := W)
    (m := fun _ => (0 : ℝ)) (M := fun _ => (1 : ℝ)) (t := N * δ)
    hW hIndep hbound (by positivity)
    (by simpa [N] using hN)
  have hsum_mean : ∑ i, (∫ y, W i y ∂μ) ≤ N * (1 / 2 - δ) := by
    calc
      ∑ i, (∫ y, W i y ∂μ) ≤ ∑ i, (1 / 2 - δ) := by
        exact Finset.sum_le_sum (fun i hi => hmean i)
      _ = N * (1 / 2 - δ) := by simp [N]; ring
  have hAC : A ⊆ C := by
    intro ω hω
    have hsum : ∑ i, (W i ω - ∫ y, W i y ∂μ) =
        (∑ i, W i ω) - ∑ i, (∫ y, W i y ∂μ) := by
      rw [Finset.sum_sub_distrib]
    change N * δ ≤ ∑ i, (W i ω - ∫ y, W i y ∂μ)
    rw [hsum]
    change N / 2 ≤ ∑ i, W i ω at hω
    linarith
  have hmeasure : μ.real A ≤ μ.real C := by
    rw [Measure.real_def, Measure.real_def]
    exact ENNReal.toReal_mono (measure_ne_top μ C) (measure_mono hAC)
  have htailC : μ.real C ≤ Real.exp (-2 * (N * δ) ^ 2 / N) := by
    simpa [C, N] using htail
  have htailN : μ.real C ≤ Real.exp (-2 * N * δ ^ 2) := by
    calc
      μ.real C ≤ Real.exp (-2 * (N * δ) ^ 2 / N) := htailC
      _ = Real.exp (-2 * N * δ ^ 2) := by
        congr 1
        field_simp [ne_of_gt hNpos]
  have hlog_bound : -2 * N * δ ^ 2 ≤ Real.log ε := by
    have hden : 0 < 2 * δ ^ 2 := by positivity
    have hscaled := (div_le_iff₀ hden).1 hNlarge
    have hscaled' : -Real.log ε ≤ N * (2 * δ ^ 2) := by
      simpa [N, one_div, Real.log_inv] using hscaled
    linarith
  have hexp : Real.exp (-2 * N * δ ^ 2) ≤ ε := by
    calc
      Real.exp (-2 * N * δ ^ 2) ≤ Real.exp (Real.log ε) :=
        (Real.exp_le_exp).2 hlog_bound
      _ = ε := Real.exp_log hε0
  calc
    μ.real {ω | ∑ i, W i ω ≥ (Fintype.card ι : ℝ) / 2} = μ.real A := by rfl
    _ ≤ μ.real C := hmeasure
    _ ≤ Real.exp (-2 * N * δ ^ 2) := htailN
    _ ≤ ε := hexp

/-- A probability density supported on the nonnegative half-line and bounded by one. -/
structure BoundedDensityOnNonnegative (f : ℝ → ℝ) : Prop where
  nonnegative : ∀ᵐ x ∂(volume : Measure ℝ), 0 ≤ f x
  supported : ∀ᵐ x ∂(volume : Measure ℝ), x < 0 → f x = 0
  bounded : ∀ᵐ x ∂(volume : Measure ℝ), 0 ≤ x → f x ≤ 1
  integrable : Integrable f volume
  normalized : ∫ x, f x ∂volume = 1

/-- The Laplace transform of a nonnegative density bounded by one is at most `1 / t`. -/
theorem laplaceTransformLeInv {f : ℝ → ℝ}
    (hf : BoundedDensityOnNonnegative f) {t : ℝ} (ht : 0 < t) :
    ∫ x, Real.exp (-t * x) * f x ∂(volume : Measure ℝ) ≤ 1 / t := by
  let g : ℝ → ℝ := Set.indicator (Set.Ioi 0) (fun x => Real.exp (-t * x))
  have hg_on : IntegrableOn (fun x : ℝ => Real.exp (-t * x)) (Set.Ioi 0) := by
    simpa [mul_comm] using
      (integrableOn_exp_mul_Ioi (a := -t) (by linarith) (0 : ℝ))
  have hg : Integrable g (volume : Measure ℝ) :=
    hg_on.integrable_indicator measurableSet_Ioi
  have hnonneg : 0 ≤ᵐ[(volume : Measure ℝ)] fun x => Real.exp (-t * x) * f x := by
    filter_upwards [hf.nonnegative] with x hfx
    exact mul_nonneg (Real.exp_nonneg _) hfx
  have hle : (fun x => Real.exp (-t * x) * f x) ≤ᵐ[(volume : Measure ℝ)] g := by
    filter_upwards [hf.supported, hf.bounded, (volume : Measure ℝ).ae_ne 0] with x hs hb hx0
    by_cases hx : 0 ≤ x
    · have hx' : 0 < x := lt_of_le_of_ne hx (Ne.symm hx0)
      rw [show g x = Real.exp (-t * x) by simp [g, Set.mem_Ioi.mpr hx']]
      simpa using mul_le_mul_of_nonneg_left (hb hx) (Real.exp_nonneg (-t * x))
    · have hx' : x < 0 := lt_of_not_ge hx
      rw [show g x = 0 by simp [g, Set.mem_Ioi, not_lt.mpr (le_of_lt hx')], hs hx', mul_zero]
  calc
    ∫ x, Real.exp (-t * x) * f x ∂(volume : Measure ℝ)
        ≤ ∫ x, g x ∂(volume : Measure ℝ) :=
      integral_mono_of_nonneg hnonneg hg hle
    _ = ∫ x in Set.Ioi 0, Real.exp (-t * x) ∂(volume : Measure ℝ) := by
      simp [g, integral_indicator measurableSet_Ioi]
    _ = -Real.exp ((-t) * 0) / (-t) :=
      integral_exp_mul_Ioi (by linarith) 0
    _ = 1 / t := by simp

/-! The finite exponential-Markov upper and lower tail bounds. -/
theorem exponentialMarkov
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {S : Ω → ℝ} (hS : Measurable S)
    {lam t : ℝ} (hlam : 0 < lam)
    (hExp : Integrable (fun ω => Real.exp (lam * S ω)) μ)
    (hExpNeg : Integrable (fun ω => Real.exp (lam * (-S ω))) μ) :
    (μ.real (S ⁻¹' Set.Ici t) ≤
        Real.exp (-(lam * t)) *
          (∫ ω, Real.exp (lam * S ω) ∂μ)) ∧
      (μ.real ((fun ω => -S ω) ⁻¹' Set.Ici t) ≤
        Real.exp (-(lam * t)) *
          (∫ ω, Real.exp (lam * (-S ω)) ∂μ)) := by
  let Y : Ω → ℝ := fun ω => Real.exp (lam * S ω)
  have hY : Measurable Y := by
    simpa [Y] using (hS.const_mul lam).exp
  have hY_nonneg : ∀ᵐ ω ∂μ, 0 ≤ Y ω :=
    Filter.Eventually.of_forall (fun ω => le_of_lt (Real.exp_pos _))
  have hY_int : Integrable Y μ := by
    simpa [Y] using hExp
  have hY_markov :=
    NumStability.HDP.Scalar.Preliminaries.markovInequalityFinite
      hY hY_nonneg hY_int (Real.exp_pos (lam * t))
  have measureReal_mono_prob {A B : Set Ω} (hAB : A ⊆ B) :
      μ.real A ≤ μ.real B := by
    rw [Measure.real_def, Measure.real_def]
    exact ENNReal.toReal_mono (measure_ne_top μ B) (measure_mono hAB)
  have hupper_subset : S ⁻¹' Set.Ici t ⊆
      Y ⁻¹' Set.Ici (Real.exp (lam * t)) := by
    intro ω hω
    change t ≤ S ω at hω
    change Real.exp (lam * t) ≤ Real.exp (lam * S ω)
    exact (Real.exp_le_exp).2 (mul_le_mul_of_nonneg_left hω hlam.le)
  have hupper : μ.real (S ⁻¹' Set.Ici t) ≤
      Real.exp (-(lam * t)) * (∫ ω, Real.exp (lam * S ω) ∂μ) := by
    calc
      μ.real (S ⁻¹' Set.Ici t) ≤ μ.real (Y ⁻¹' Set.Ici (Real.exp (lam * t))) :=
        measureReal_mono_prob hupper_subset
      _ ≤ (∫ ω, Y ω ∂μ) / Real.exp (lam * t) := by
        simpa [Preliminaries.expectation] using hY_markov
      _ = Real.exp (-(lam * t)) * (∫ ω, Real.exp (lam * S ω) ∂μ) := by
        simp [Y, Real.exp_neg, div_eq_mul_inv]
        ring
  let Z : Ω → ℝ := fun ω => -S ω
  let W : Ω → ℝ := fun ω => Real.exp (lam * Z ω)
  have hZ : Measurable Z := by
    simpa [Z] using hS.neg
  have hW : Measurable W := by
    simpa [W] using (hZ.const_mul lam).exp
  have hW_nonneg : ∀ᵐ ω ∂μ, 0 ≤ W ω :=
    Filter.Eventually.of_forall (fun ω => le_of_lt (Real.exp_pos _))
  have hW_int : Integrable W μ := by
    simpa [W, Z] using hExpNeg
  have hW_markov :=
    NumStability.HDP.Scalar.Preliminaries.markovInequalityFinite
      hW hW_nonneg hW_int (Real.exp_pos (lam * t))
  have hlower_subset : Z ⁻¹' Set.Ici t ⊆
      W ⁻¹' Set.Ici (Real.exp (lam * t)) := by
    intro ω hω
    change t ≤ Z ω at hω
    change Real.exp (lam * t) ≤ Real.exp (lam * Z ω)
    exact (Real.exp_le_exp).2 (mul_le_mul_of_nonneg_left hω hlam.le)
  have hlower : μ.real (Z ⁻¹' Set.Ici t) ≤
      Real.exp (-(lam * t)) * (∫ ω, Real.exp (lam * (-S ω)) ∂μ) := by
    calc
      μ.real (Z ⁻¹' Set.Ici t) ≤ μ.real (W ⁻¹' Set.Ici (Real.exp (lam * t))) :=
        measureReal_mono_prob hlower_subset
      _ ≤ (∫ ω, W ω ∂μ) / Real.exp (lam * t) := by
        simpa [Preliminaries.expectation] using hW_markov
      _ = Real.exp (-(lam * t)) * (∫ ω, Real.exp (lam * (-S ω)) ∂μ) := by
        simp [W, Z, Real.exp_neg, div_eq_mul_inv]
        ring
  exact ⟨hupper, hlower⟩

/-! The finite independent-sum small-ball estimate from Exercise 2.2.10(b). -/
theorem smallBallProbability
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {ε : ℝ} (hε : 0 < ε)
    (hX : ∀ i, Measurable (X i)) (hIndep : iIndepFun X μ)
    (hLaplace : ∀ i,
      Integrable (fun ω => Real.exp (-(1 / ε) * X i ω)) μ ∧
        (∫ ω, Real.exp (-(1 / ε) * X i ω) ∂μ) ≤ ε) :
    μ.real {ω | ∑ i, X i ω ≤ ε * (Fintype.card ι : ℝ)} ≤
      (Real.exp 1 * ε) ^ Fintype.card ι := by
  let a : ι → ℝ := fun _ => -(1 / ε)
  let Z : ι → Ω → ℝ := fun i ω => a i * X i ω
  let S : Ω → ℝ := fun ω => ∑ i, Z i ω
  have ha_meas : ∀ i, Measurable (fun x : ℝ => a i * x) := by
    intro i
    fun_prop
  have hZ_meas : ∀ i, Measurable (Z i) := by
    intro i
    simpa [Z] using (hX i).const_mul (a i)
  have hZ_indep : iIndepFun Z μ := by
    simpa [Z, Function.comp_def] using hIndep.comp (fun i x => a i * x) ha_meas
  have hZ_exp : ∀ i, Integrable (fun ω => Real.exp (Z i ω)) μ := by
    intro i
    simpa [Z, a] using (hLaplace i).1
  have hS_meas : Measurable S := by
    dsimp [S]
    exact Finset.measurable_sum Finset.univ (fun i _ => hZ_meas i)
  have hS_exp : Integrable (fun ω => Real.exp (S ω)) μ := by
    simpa [S] using
      (hZ_indep.integrable_exp_mul_sum (t := (1 : ℝ)) hZ_meas
        (s := Finset.univ) (fun i _ => by simpa using hZ_exp i))
  have hmgf := mgfIndependentSum (μ := μ) (X := X) 1 a hIndep (by
    intro i
    simpa [Z, a] using hZ_exp i)
  have hupper := exponentialMarkovUpper hS_meas (lam := (1 : ℝ))
    (t := -(Fintype.card ι : ℝ)) one_pos (by simpa using hS_exp)
  have hS_formula : ∀ ω, S ω = -(∑ i, X i ω) / ε := by
    intro ω
    dsimp [S, Z, a]
    rw [← Finset.mul_sum]
    field_simp
  have hevent :
      {ω | ∑ i, X i ω ≤ ε * (Fintype.card ι : ℝ)} =
        S ⁻¹' Set.Ici (-(Fintype.card ι : ℝ)) := by
    ext ω
    rw [Set.mem_setOf_eq, Set.mem_preimage, Set.mem_Ici]
    rw [hS_formula]
    constructor
    · intro h
      apply (le_div_iff₀ hε).2
      linarith
    · intro h
      have h' := (le_div_iff₀ hε).1 h
      linarith
  have hmgfS :
      (∫ ω, Real.exp (S ω) ∂μ) =
        ∏ i, ∫ ω, Real.exp (a i * X i ω) ∂μ := by
    calc
      (∫ ω, Real.exp (S ω) ∂μ) =
          ∫ ω, Real.exp (1 * ∑ i, a i * X i ω) ∂μ := by
            simp [S, Z]
      _ = ∏ i, ∫ ω, Real.exp (1 * (a i * X i ω)) ∂μ := hmgf
      _ = ∏ i, ∫ ω, Real.exp (a i * X i ω) ∂μ := by
        simp
  have hprod :
      (∏ i, ∫ ω, Real.exp (a i * X i ω) ∂μ) ≤ ε ^ Fintype.card ι := by
    calc
      (∏ i, ∫ ω, Real.exp (a i * X i ω) ∂μ) ≤
          ∏ i, ε := Finset.prod_le_prod
            (fun i _ => integral_nonneg_of_ae
              (Filter.Eventually.of_forall (fun ω => le_of_lt (Real.exp_pos _))))
            (fun i _ => by simpa [a] using (hLaplace i).2)
      _ = ε ^ Fintype.card ι := by simp
  rw [hevent]
  calc
    μ.real (S ⁻¹' Set.Ici (-(Fintype.card ι : ℝ))) ≤
        Real.exp (Fintype.card ι : ℝ) * (∫ ω, Real.exp (S ω) ∂μ) := by
      simpa using hupper
    _ = Real.exp (Fintype.card ι : ℝ) *
        (∏ i, ∫ ω, Real.exp (a i * X i ω) ∂μ) := by rw [hmgfS]
    _ ≤ Real.exp (Fintype.card ι : ℝ) * ε ^ Fintype.card ι :=
      mul_le_mul_of_nonneg_left hprod (le_of_lt (Real.exp_pos _))
    _ = (Real.exp 1 * ε) ^ Fintype.card ι := by
      rw [mul_pow]
      congr 1
      rw [← Real.exp_nat_mul]
      norm_num

end NumStability.HDP.Scalar.IndependentSums.Hoeffding

namespace NumStability.HDP.Contract

/-! Stable source-facing alias for Theorem 2.2.2. -/
theorem hdp_02_hthm_h2_d2_d2
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {a : ι → ℝ} {t : ℝ}
    (hX : ∀ i, Measurable (X i))
    (hIndep : iIndepFun X μ)
    (hLaw : ∀ i, Measure.map (X i) μ =
      NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF.toMeasure)
    (ht : 0 ≤ t) :
    μ.real {ω | ∑ i, a i * X i ω ≥ t} ≤
      Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherHoeffdingAll
    hX hIndep hLaw ht

/-! Stable source-facing alias for Theorem 2.2.5. -/
theorem hdp_02_hthm_h2_d2_d5
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {a : ι → ℝ} {t : ℝ}
    (hX : ∀ i, Measurable (X i))
    (hIndep : iIndepFun X μ)
    (hLaw : ∀ i, Measure.map (X i) μ =
      NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF.toMeasure)
    (hNegLaw : ∀ i, Measure.map (fun ω => -X i ω) μ =
      NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF.toMeasure)
    (hExp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam * (a i * X i ω))) μ)
    (ht : 0 < t) (hv : 0 < ∑ i, (a i) ^ 2) :
    μ.real {ω | |∑ i, a i * X i ω| ≥ t} ≤
      2 * Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2)) :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherTwoSidedHoeffding
    hX hIndep hLaw hNegLaw hExp ht hv

/-! Stable Chapter 2 alias for the fair-coin Hoeffding application. -/
theorem hdp_02_hex_hfair_hcoin_hhoeffding
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool}
    (hB : ∀ i, Measurable (B i))
    (hIndep : iIndepFun B μ)
    (hLaw : ∀ i, Measure.map (B i) μ =
      NumStability.HDP.Scalar.IndependentSums.Hoeffding.fairBernoulliPMF.toMeasure)
    (hExp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam *
        NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherValue (B i ω))) μ)
    (hN : 0 < Fintype.card ι) :
    μ.real {ω | ∑ i,
        NumStability.HDP.Scalar.IndependentSums.Hoeffding.bernoulliIndicator (B i ω) ≥
      (3 / 4 : ℝ) * (Fintype.card ι : ℝ)} ≤
      Real.exp (-(Fintype.card ι : ℝ) / 8) :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.fairCoinHoeffding
    hB hIndep hLaw hExp hN

/-! Stable Chapter 2 alias for the bounded-variable Hoeffding theorem. -/
theorem hdp_02_hthm_h2_d2_d6
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {m M : ι → ℝ} {t : ℝ}
    (hX : ∀ i, Measurable (X i))
    (hIndep : iIndepFun X μ)
    (hbound : ∀ i, ∀ᵐ ω ∂μ, X i ω ∈ Set.Icc (m i) (M i))
    (ht : 0 < t) (hv : 0 < ∑ i, ‖M i - m i‖ ^ 2) :
    μ.real {ω | ∑ i, (X i ω - ∫ y, X i y ∂μ) ≥ t} ≤
      Real.exp (-2 * t ^ 2 / (∑ i, ‖M i - m i‖ ^ 2)) :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.boundedIndependentHoeffding
    hX hIndep hbound ht hv

/-! Stable Chapter 2 alias for the bounded-variable proof exercise. -/
theorem hdp_02_hex_h2_d2_d7
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {m M : ι → ℝ} {t : ℝ}
    (hX : ∀ i, Measurable (X i))
    (hIndep : iIndepFun X μ)
    (hbound : ∀ i, ∀ᵐ ω ∂μ, X i ω ∈ Set.Icc (m i) (M i))
    (ht : 0 < t) (hv : 0 < ∑ i, ‖M i - m i‖ ^ 2) :
    μ.real {ω | ∑ i, (X i ω - ∫ y, X i y ∂μ) ≥ t} ≤
      Real.exp (-2 * t ^ 2 / (∑ i, ‖M i - m i‖ ^ 2)) :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.boundedIndependentHoeffding
    hX hIndep hbound ht hv

/-! Stable Chapter 2 alias for the majority-vote amplification exercise. -/
theorem hdp_02_hex_h2_d2_d8
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {W : ι → Ω → ℝ} {δ ε : ℝ}
    (hW : ∀ i, Measurable (W i))
    (hIndep : iIndepFun W μ)
    (hbound : ∀ i, ∀ᵐ ω ∂μ, W i ω ∈ Set.Icc 0 1)
    (hmean : ∀ i, (∫ y, W i y ∂μ) ≤ 1 / 2 - δ)
    (hδ : 0 < δ) (hε0 : 0 < ε) (hε1 : ε < 1)
    (hN : 0 < Fintype.card ι)
    (hNlarge : Real.log (1 / ε) / (2 * δ ^ 2) ≤ (Fintype.card ι : ℝ)) :
    μ.real {ω | ∑ i, W i ω ≥ (Fintype.card ι : ℝ) / 2} ≤ ε :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.majorityVoteHoeffding
    hW hIndep hbound hmean hδ hε0 hε1 hN hNlarge

/-- Stable Chapter 2 alias for the centered bounded-variable Hoeffding lemma. -/
theorem hdp_02_hlem_hhoeffding_hbounded_hmgf
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {a b : ℝ}
    (hX : AEMeasurable X μ)
    (hbound : ∀ᵐ ω ∂μ, X ω ∈ Set.Icc a b)
    (hmean : ∫ ω, X ω ∂μ = 0) :
    HasSubgaussianMGF X ((‖b - a‖₊ / 2) ^ 2) μ :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.hoeffdingBoundedMGF
    hX hbound hmean

theorem hdp_02_hlem_hhoeffding_hoptimization {v t : ℝ} (hv : 0 < v)
    (ht : 0 ≤ t) :
    (∀ u : ℝ, 0 ≤ u →
      -t ^ 2 / (2 * v) ≤ -u * t + u ^ 2 * v / 2) ∧
      (-(t / v) * t + (t / v) ^ 2 * v / 2 = -t ^ 2 / (2 * v)) :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.hoeffdingOptimization hv ht

/-- Stable Chapter 2 alias for Exercise 2.2.3. -/
theorem hdp_02_hex_h2_d2_d3 (x : ℝ) :
    Real.cosh x ≤ Real.exp (x ^ 2 / 2) :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.coshLeExpHalfSq x

/-- Stable Chapter 2 alias for Exercise 2.2.10(a). -/
theorem hdp_02_hex_h2_d2_d10a {f : ℝ → ℝ}
    (hf : NumStability.HDP.Scalar.IndependentSums.Hoeffding.BoundedDensityOnNonnegative f)
    {t : ℝ} (ht : 0 < t) :
    ∫ x, Real.exp (-t * x) * f x ∂(volume : Measure ℝ) ≤ 1 / t :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.laplaceTransformLeInv hf ht

end NumStability.HDP.Contract
```

### `NumStability.HDP.Scalar.IndependentSums.GraphDegreeLaw`

Path: `lean-numerical-stability/NumStability/HDP/Scalar/IndependentSums/GraphDegreeLaw.lean`
SHA-256: `f599b61bad2a08d3dc892d64492576db70dea8e247c18c8e575264c5ab3afc57`

```lean
import Mathlib.Probability.Combinatorics.BinomialRandomGraph.Defs
import Mathlib.Combinatorics.SimpleGraph.Finite
import Mathlib.Probability.HasLaw
import Mathlib.Probability.ProbabilityMassFunction.Binomial
import Mathlib.Tactic

/-!
# Vertex-degree laws for the binomial random graph

Reusable support for HDP Section 2.4.  This module isolates the combinatorial
and distributional facts about a single vertex's degree in the Erdős--Rényi
model `G(n, p)`: the star edge set at a vertex, its cardinality, and the
identification of the degree with a binomial random variable.  Keeping these
facts here lets `Chernoff` apply a concentration bound to a vertex degree
without re-deriving the underlying graph combinatorics.

No numbered-source wrapper is imported; this is reusable mathematics.
-/

noncomputable section

open MeasureTheory ProbabilityTheory
open scoped BigOperators ENNReal NNReal

namespace NumStability.HDP.Scalar.IndependentSums.Chernoff

def graphStarEdgeFinset {V : Type*} (v : V) (S : Finset V) : Finset (Sym2 V) :=
  S.map (Sym2.mkEmbedding v)

@[simp] theorem graphStarEdgeFinset_card {V : Type*} (v : V) (S : Finset V) :
    (graphStarEdgeFinset v S).card = S.card := by
  simp [graphStarEdgeFinset]

def setBernoulliFinsetExactEvent {ι : Type*} (E T : Finset ι) : Set (Set ι) :=
  {s | ∀ e ∈ E, (e ∈ s ↔ e ∈ T)}

lemma finset_prod_ite_mem_eq_pow_mul_pow {α M : Type*}
    [DecidableEq α] [CommMonoid M] (E T : Finset α) (hT : T ⊆ E)
    (a b : M) :
    (∏ e ∈ E, if e ∈ T then a else b) =
      a ^ T.card * b ^ (E.card - T.card) := by
  classical
  have hfilter : E.filter (fun e => e ∈ T) = T := by
    ext e
    constructor
    · intro h
      exact (Finset.mem_filter.mp h).2
    · intro heT
      exact Finset.mem_filter.mpr ⟨hT heT, heT⟩
  have hfilterNot : E.filter (fun e => e ∉ T) = E \ T := by
    ext e
    simp
  calc
    (∏ e ∈ E, if e ∈ T then a else b) =
        (∏ e ∈ E.filter (fun e => e ∈ T), if e ∈ T then a else b) *
          (∏ e ∈ E.filter (fun e => e ∉ T), if e ∈ T then a else b) := by
      rw [← Finset.prod_filter_mul_prod_filter_not
        (s := E) (p := fun e => e ∈ T)
        (f := fun e => if e ∈ T then a else b)]
    _ = (∏ _e ∈ T, a) * (∏ _e ∈ E \ T, b) := by
      rw [hfilter, hfilterNot]
      congr 1
      · exact Finset.prod_congr rfl fun e he => by simp [he]
      · refine Finset.prod_congr rfl fun e he => ?_
        have hnot : e ∉ T := (Finset.mem_sdiff.mp he).2
        simp [hnot]
    _ = a ^ T.card * b ^ (E.card - T.card) := by
      simp [Finset.card_sdiff_of_subset hT]

lemma setBernoulliFinsetExactEvent_probability
    {ι : Type*} [DecidableEq ι] (u : Set ι) (p : Set.Icc (0 : ℝ) 1)
    (E T : Finset ι) (hE : (E : Set ι) ⊆ u) (hT : T ⊆ E) :
    setBer(u, p) (setBernoulliFinsetExactEvent E T) =
      (unitInterval.toNNReal p : ℝ≥0∞) ^ T.card *
        (unitInterval.toNNReal (unitInterval.symm p) : ℝ≥0∞) ^
          (E.card - T.card) := by
  classical
  rw [ProbabilityTheory.setBernoulli_apply']
  have hpre :
      ((fun q : ι → Prop => {i | q i}) ⁻¹'
          setBernoulliFinsetExactEvent E T) =
        Set.pi (E : Set ι)
          (fun e => if e ∈ T then ({True} : Set Prop) else ({False} : Set Prop)) := by
    ext f
    simp only [Set.mem_preimage, setBernoulliFinsetExactEvent,
      Set.mem_setOf_eq, Set.mem_pi, Finset.mem_coe]
    constructor
    · intro h e heE
      by_cases heT : e ∈ T
      · simp [heT, (h e heE).2 heT]
      · have hnot : ¬ f e := fun hf => heT ((h e heE).1 hf)
        simp [heT, hnot]
    · intro h e heE
      have he := h e heE
      by_cases heT : e ∈ T
      · simp [heT] at he
        exact ⟨fun _ => heT, fun _ => he⟩
      · simp [heT] at he
        exact ⟨fun hf => (he hf).elim, fun hmem => False.elim (heT hmem)⟩
  rw [hpre, Measure.infinitePi_pi]
  · calc
      (∏ e ∈ E,
          (unitInterval.toNNReal p • Measure.dirac (e ∈ u) +
              unitInterval.toNNReal (unitInterval.symm p) • Measure.dirac False)
            (if e ∈ T then ({True} : Set Prop) else ({False} : Set Prop))) =
        ∏ e ∈ E, if e ∈ T then
          (unitInterval.toNNReal p : ℝ≥0∞) else
          (unitInterval.toNNReal (unitInterval.symm p) : ℝ≥0∞) := by
            refine Finset.prod_congr rfl ?_
            intro e heE
            have heu : e ∈ u := hE (by simpa using heE)
            by_cases heT : e ∈ T <;>
              simp [heT, heu, ENNReal.smul_def]
      _ = (unitInterval.toNNReal p : ℝ≥0∞) ^ T.card *
          (unitInterval.toNNReal (unitInterval.symm p) : ℝ≥0∞) ^
            (E.card - T.card) :=
          finset_prod_ite_mem_eq_pow_mul_pow E T hT _ _
  · intro e _he
    by_cases heT : e ∈ T <;> simp [heT]

def graphStarExactEvent {V : Type*} (v : V) (S T : Finset V) : Set (SimpleGraph V) :=
  {G | ∀ w ∈ S, (G.Adj v w ↔ w ∈ T)}

lemma graphStarEdgeFinset_subset_diag_compl {V : Type*} {v : V} {S : Finset V}
    (hvS : v ∉ S) :
    (graphStarEdgeFinset v S : Set (Sym2 V)) ⊆ Sym2.diagSetᶜ := by
  intro e he
  rcases Finset.mem_map.mp he with ⟨w, hw, rfl⟩
  change s(v, w) ∈ Sym2.diagSetᶜ
  rw [Set.mem_compl_iff, Sym2.mem_diagSet, Sym2.mk_isDiag_iff]
  intro hvw
  exact hvS (by simpa [hvw] using hw)

def graphEdgesExactFinsetEvent {V : Type*} (E T : Finset (Sym2 V)) :
    Set (SimpleGraph V) :=
  {G | ∀ e ∈ E, (e ∈ G.edgeSet ↔ e ∈ T)}

lemma measurableSet_graphEdgesExactFinsetEvent {V : Type*}
    [DecidableEq (Sym2 V)] (E T : Finset (Sym2 V)) :
    MeasurableSet (graphEdgesExactFinsetEvent E T) := by
  classical
  rw [show graphEdgesExactFinsetEvent E T =
      ⋂ e ∈ E,
        if e ∈ T then {G : SimpleGraph V | e ∈ G.edgeSet}
        else {G : SimpleGraph V | e ∉ G.edgeSet} by
    ext G
    simp only [Set.mem_iInter, graphEdgesExactFinsetEvent, Set.mem_setOf_eq]
    constructor
    · intro h e heE
      by_cases heT : e ∈ T
      · simp [heT, (h e heE).2 heT]
      · have hnot : e ∉ G.edgeSet := fun hmem => heT ((h e heE).1 hmem)
        simp [heT, hnot]
    · intro h e heE
      have he := h e heE
      by_cases heT : e ∈ T
      · simp [heT] at he
        exact ⟨fun _ => heT, fun _ => he⟩
      · simp [heT] at he
        exact ⟨fun hmem => (he hmem).elim,
          fun hmemT => False.elim (heT hmemT)⟩]
  exact E.measurableSet_biInter fun e _he => by
    by_cases heT : e ∈ T
    · simpa only [heT, if_true] using
        (measurableSet_mem e).preimage SimpleGraph.measurable_edgeSet
    · simpa only [heT, if_false] using
        ((measurableSet_mem e).preimage SimpleGraph.measurable_edgeSet).compl

lemma graphStarExactEvent_eq_graphEdgesExactFinsetEvent
    {V : Type*} {v : V} {S T : Finset V} (hvS : v ∉ S) :
    graphStarExactEvent v S T =
      graphEdgesExactFinsetEvent (graphStarEdgeFinset v S)
        (graphStarEdgeFinset v T) := by
  ext G
  simp [graphStarExactEvent, graphEdgesExactFinsetEvent,
    graphStarEdgeFinset, SimpleGraph.mem_edgeSet]
  constructor
  · intro h a haS
    have hmem : (∃ b ∈ T, b = a ∨ v = a ∧ b = v) ↔ a ∈ T := by
      constructor
      · rintro ⟨b, hbT, hba | ⟨hva, _hbv⟩⟩
        · simpa [hba] using hbT
        · exact False.elim (hvS (by simpa [hva] using haS))
      · intro haT
        exact ⟨a, haT, Or.inl rfl⟩
    exact (h a haS).trans hmem.symm
  · intro h a haS
    have hmem : (∃ b ∈ T, b = a ∨ v = a ∧ b = v) ↔ a ∈ T := by
      constructor
      · rintro ⟨b, hbT, hba | ⟨hva, _hbv⟩⟩
        · simpa [hba] using hbT
        · exact False.elim (hvS (by simpa [hva] using haS))
      · intro haT
        exact ⟨a, haT, Or.inl rfl⟩
    exact (h a haS).trans hmem

lemma binomialRandom_graphStarExactEvent_probability
    {V : Type*} [Countable V] [DecidableEq (Sym2 V)] (p : Set.Icc (0 : ℝ) 1)
    {v : V} {S T : Finset V} (hvS : v ∉ S) (hT : T ⊆ S) :
    SimpleGraph.binomialRandom V p (graphStarExactEvent v S T) =
      (unitInterval.toNNReal p : ℝ≥0∞) ^ T.card *
        (unitInterval.toNNReal (unitInterval.symm p) : ℝ≥0∞) ^
          (S.card - T.card) := by
  rw [graphStarExactEvent_eq_graphEdgesExactFinsetEvent hvS]
  rw [SimpleGraph.binomialRandom_eq_map]
  rw [Measure.map_apply SimpleGraph.measurable_fromEdgeSet]
  · have hpre :
        SimpleGraph.fromEdgeSet ⁻¹'
            (graphEdgesExactFinsetEvent (graphStarEdgeFinset v S)
              (graphStarEdgeFinset v T)) =
          setBernoulliFinsetExactEvent (graphStarEdgeFinset v S)
            (graphStarEdgeFinset v T) := by
      ext s
      simp only [Set.mem_preimage, graphEdgesExactFinsetEvent,
        setBernoulliFinsetExactEvent, Set.mem_setOf_eq]
      constructor
      · intro hs e heE
        have hnotdiag : e ∈ Sym2.diagSetᶜ :=
          graphStarEdgeFinset_subset_diag_compl hvS (by simpa using heE)
        have hnotdiag' : ¬ e.IsDiag := by simpa [Sym2.mem_diagSet] using hnotdiag
        rw [SimpleGraph.edgeSet_fromEdgeSet] at hs
        have hiff := hs e heE
        simpa [hnotdiag'] using hiff
      · intro hs e heE
        have hnotdiag : e ∈ Sym2.diagSetᶜ :=
          graphStarEdgeFinset_subset_diag_compl hvS (by simpa using heE)
        have hnotdiag' : ¬ e.IsDiag := by simpa [Sym2.mem_diagSet] using hnotdiag
        rw [SimpleGraph.edgeSet_fromEdgeSet]
        simp [hnotdiag', hs e heE]
    rw [hpre]
    simpa [graphStarEdgeFinset] using (setBernoulliFinsetExactEvent_probability
      (u := Sym2.diagSetᶜ) (p := p)
      (E := graphStarEdgeFinset v S) (T := graphStarEdgeFinset v T)
      (graphStarEdgeFinset_subset_diag_compl hvS)
      (by simpa [graphStarEdgeFinset] using hT))
  · exact measurableSet_graphEdgesExactFinsetEvent _ _

lemma measurableSet_graphStarExactEvent
    {V : Type*} [DecidableEq (Sym2 V)] {v : V} {S T : Finset V}
    (hvS : v ∉ S) : MeasurableSet (graphStarExactEvent v S T) := by
  rw [graphStarExactEvent_eq_graphEdgesExactFinsetEvent hvS]
  exact measurableSet_graphEdgesExactFinsetEvent _ _

def graphStarExactCardEvent {V : Type*} (v : V) (S : Finset V) (k : ℕ) :
    Set (SimpleGraph V) :=
  ⋃ T ∈ S.powersetCard k, graphStarExactEvent v S T

lemma measurableSet_graphStarExactCardEvent
    {V : Type*} [DecidableEq (Sym2 V)] {v : V} {S : Finset V}
    (hvS : v ∉ S) (k : ℕ) :
    MeasurableSet (graphStarExactCardEvent v S k) := by
  classical
  exact (S.powersetCard k).measurableSet_biUnion fun T _hT =>
    measurableSet_graphStarExactEvent hvS

lemma graphStarExactEvent_disjoint_of_ne
    {V : Type*} {v : V} {S T U : Finset V}
    (hT : T ⊆ S) (hU : U ⊆ S) (hne : T ≠ U) :
    Disjoint (graphStarExactEvent v S T) (graphStarExactEvent v S U) := by
  rw [Set.disjoint_left]
  intro G hGT hGU
  exact hne (by
    ext w
    by_cases hwS : w ∈ S
    · constructor
      · intro hwT
        exact (hGU w hwS).1 ((hGT w hwS).2 hwT)
      · intro hwU
        exact (hGT w hwS).1 ((hGU w hwS).2 hwU)
    · constructor
      · intro hwT
        exact False.elim (hwS (hT hwT))
      · intro hwU
        exact False.elim (hwS (hU hwU)))

lemma binomialRandom_graphStarExactCardEvent_probability_real
    {V : Type*} [Fintype V] [Countable V] [DecidableEq (Sym2 V)]
    (p : Set.Icc (0 : ℝ) 1) {v : V} {S : Finset V} (hvS : v ∉ S) (k : ℕ) :
    (SimpleGraph.binomialRandom V p).real
        (graphStarExactCardEvent v S k) =
      (Nat.choose S.card k : ℝ) * (unitInterval.toNNReal p : ℝ) ^ k *
        (unitInterval.toNNReal (unitInterval.symm p) : ℝ) ^ (S.card - k) := by
  classical
  let C : Finset (Finset V) := S.powersetCard k
  let A : Finset V → Set (SimpleGraph V) :=
    fun T => graphStarExactEvent v S T
  have hpd : (↑C : Set (Finset V)).PairwiseDisjoint A := by
    intro T hTC U hUC hne
    exact graphStarExactEvent_disjoint_of_ne
      (Finset.mem_powersetCard.mp hTC).1
      (Finset.mem_powersetCard.mp hUC).1 hne
  have hmeas : ∀ T ∈ C, MeasurableSet (A T) := by
    intro T _hT
    exact measurableSet_graphStarExactEvent hvS
  have hUnionReal :
      (SimpleGraph.binomialRandom V p).real (⋃ T ∈ C, A T) =
        ∑ T ∈ C, (SimpleGraph.binomialRandom V p).real (A T) := by
    exact MeasureTheory.measureReal_biUnion_finset (μ := SimpleGraph.binomialRandom V p)
      hpd hmeas
  calc
    (SimpleGraph.binomialRandom V p).real
        (graphStarExactCardEvent v S k) =
      (SimpleGraph.binomialRandom V p).real (⋃ T ∈ C, A T) := by rfl
    _ = ∑ T ∈ C, (SimpleGraph.binomialRandom V p).real (A T) := hUnionReal
    _ = ∑ _T ∈ C,
        ((unitInterval.toNNReal p : ℝ) ^ k *
          (unitInterval.toNNReal (unitInterval.symm p) : ℝ) ^ (S.card - k)) := by
      apply Finset.sum_congr rfl
      intro T hTC
      dsimp [A]
      rw [measureReal_def, binomialRandom_graphStarExactEvent_probability
        (p := p) hvS (Finset.mem_powersetCard.mp hTC).1]
      rw [(Finset.mem_powersetCard.mp hTC).2]
      simp
    _ = (C.card : ℝ) *
        ((unitInterval.toNNReal p : ℝ) ^ k *
          (unitInterval.toNNReal (unitInterval.symm p) : ℝ) ^ (S.card - k)) := by
      simp
    _ = (Nat.choose S.card k : ℝ) *
        ((unitInterval.toNNReal p : ℝ) ^ k *
          (unitInterval.toNNReal (unitInterval.symm p) : ℝ) ^ (S.card - k)) := by
      simp [C, Finset.card_powersetCard]
    _ = (Nat.choose S.card k : ℝ) * (unitInterval.toNNReal p : ℝ) ^ k *
        (unitInterval.toNNReal (unitInterval.symm p) : ℝ) ^ (S.card - k) := by
      ring

lemma binomialRandom_graphStarExactCardEvent_probability
    {V : Type*} [Fintype V] [Countable V] [DecidableEq (Sym2 V)]
    (p : Set.Icc (0 : ℝ) 1) {v : V} {S : Finset V} (hvS : v ∉ S) (k : ℕ) :
    SimpleGraph.binomialRandom V p (graphStarExactCardEvent v S k) =
      (Nat.choose S.card k : ℝ≥0∞) *
        (unitInterval.toNNReal p : ℝ≥0∞) ^ k *
          (unitInterval.toNNReal (unitInterval.symm p) : ℝ≥0∞) ^ (S.card - k) := by
  classical
  let C : Finset (Finset V) := S.powersetCard k
  let A : Finset V → Set (SimpleGraph V) :=
    fun T => graphStarExactEvent v S T
  have hpd : (↑C : Set (Finset V)).PairwiseDisjoint A := by
    intro T hTC U hUC hne
    exact graphStarExactEvent_disjoint_of_ne
      (Finset.mem_powersetCard.mp hTC).1
      (Finset.mem_powersetCard.mp hUC).1 hne
  have hmeas : ∀ T ∈ C, MeasurableSet (A T) := by
    intro T _hT
    exact measurableSet_graphStarExactEvent hvS
  calc
    SimpleGraph.binomialRandom V p (graphStarExactCardEvent v S k) =
        SimpleGraph.binomialRandom V p (⋃ T ∈ C, A T) := by rfl
    _ = ∑ T ∈ C, SimpleGraph.binomialRandom V p (A T) :=
      MeasureTheory.measure_biUnion_finset (μ := SimpleGraph.binomialRandom V p) hpd hmeas
    _ = ∑ _T ∈ C,
        ((unitInterval.toNNReal p : ℝ≥0∞) ^ k *
          (unitInterval.toNNReal (unitInterval.symm p) : ℝ≥0∞) ^ (S.card - k)) := by
      apply Finset.sum_congr rfl
      intro T hTC
      dsimp [A]
      rw [binomialRandom_graphStarExactEvent_probability
        (p := p) hvS (Finset.mem_powersetCard.mp hTC).1]
      rw [(Finset.mem_powersetCard.mp hTC).2]
    _ = (C.card : ℝ≥0∞) *
        ((unitInterval.toNNReal p : ℝ≥0∞) ^ k *
          (unitInterval.toNNReal (unitInterval.symm p) : ℝ≥0∞) ^ (S.card - k)) := by
      simp
    _ = (Nat.choose S.card k : ℝ≥0∞) *
        ((unitInterval.toNNReal p : ℝ≥0∞) ^ k *
          (unitInterval.toNNReal (unitInterval.symm p) : ℝ≥0∞) ^ (S.card - k)) := by
      simp [C, Finset.card_powersetCard]
    _ = (Nat.choose S.card k : ℝ≥0∞) *
        (unitInterval.toNNReal p : ℝ≥0∞) ^ k *
          (unitInterval.toNNReal (unitInterval.symm p) : ℝ≥0∞) ^ (S.card - k) := by
      ring

def graphDegree {V : Type*} (v : V) (G : SimpleGraph V) : ℕ :=
  (G.neighborSet v).ncard

noncomputable def graphDegreeSum {V : Type*} [Fintype V] (v : V) (G : SimpleGraph V) : ℕ := by
  classical
  exact ∑ w : V, if G.Adj v w then 1 else 0

lemma graphDegreeSum_eq_graphDegree {V : Type*} [Fintype V]
    (v : V) (G : SimpleGraph V) :
    graphDegreeSum v G = graphDegree v G := by
  classical
  unfold graphDegreeSum graphDegree
  rw [Finset.sum_boole]
  simp only [SimpleGraph.neighborSet]
  rw [Set.ncard_eq_toFinset_card']
  simp

lemma measurable_graphDegreeSum {V : Type*} [Fintype V] (v : V) :
    Measurable (graphDegreeSum v) := by
  unfold graphDegreeSum
  refine Finset.measurable_fun_sum Finset.univ ?_
  intro w hw
  have hAdj : Measurable (fun G : SimpleGraph V => G.Adj v w) := by
    fun_prop
  have hset : MeasurableSet {G : SimpleGraph V | G.Adj v w} := by
    convert hAdj (measurableSet_singleton True) using 1
    ext G
    simp
  exact Measurable.ite hset measurable_const measurable_const

lemma graphStarExactCardEvent_eq_preimage_graphDegree
    {V : Type*} [Fintype V] [DecidableEq V] {v : V} (k : ℕ) :
    graphStarExactCardEvent v (Finset.univ.erase v) k =
      graphDegree v ⁻¹' ({k} : Set ℕ) := by
  classical
  ext G
  constructor
  · intro hG
    simp only [graphStarExactCardEvent, Set.mem_iUnion] at hG
    rcases hG with ⟨T, hTC, hGT⟩
    have hTsub : T ⊆ Finset.univ.erase v :=
      (Finset.mem_powersetCard.mp hTC).1
    have hTcard : T.card = k := (Finset.mem_powersetCard.mp hTC).2
    have hneighbors : G.neighborSet v = (T : Set V) := by
      ext w
      constructor
      · intro hw
        have hwS : w ∈ (Finset.univ.erase v : Set V) := by
          simp only [Finset.mem_coe, Finset.mem_erase, Finset.mem_univ, true_and]
          exact ⟨by
            intro hwv
            subst w
            simpa using hw, trivial⟩
        exact (hGT w hwS).1 (by simpa using hw)
      · intro hwT
        have hwS : w ∈ (Finset.univ.erase v : Set V) := hTsub (by simpa using hwT)
        exact (by simpa using (hGT w hwS).2 (by simpa using hwT))
    change (G.neighborSet v).ncard = k
    rw [hneighbors, Set.ncard_coe_finset]
    exact hTcard
  · intro hG
    have hdeg : graphDegree v G = k := by simpa using hG
    let T : Finset V := (G.neighborSet v).toFinset
    have hTsub : T ⊆ Finset.univ.erase v := by
      intro w hw
      have hwN : w ∈ G.neighborSet v := by simpa [T] using hw
      have hwv : w ≠ v := by
        intro hwv
        subst w
        simpa using hwN
      simp [hwv]
    have hTcard : T.card = k := by
      calc
        T.card = (G.neighborSet v).ncard := by
          simp [T, Set.ncard_eq_toFinset_card']
        _ = graphDegree v G := rfl
        _ = k := hdeg
    have hGT : G ∈ graphStarExactEvent v (Finset.univ.erase v) T := by
      intro w hwS
      constructor
      · intro hwAdj
        have hwN : w ∈ G.neighborSet v := by simpa using hwAdj
        simpa [T] using hwN
      · intro hwT
        have hwN : w ∈ G.neighborSet v := by simpa [T] using hwT
        simpa using hwN
    simp only [graphStarExactCardEvent, Set.mem_iUnion]
    exact ⟨T, Finset.mem_powersetCard.mpr ⟨hTsub, hTcard⟩, hGT⟩

lemma graphStarExactCardEvent_eq_preimage_graphDegreeSum
    {V : Type*} [Fintype V] [DecidableEq V] {v : V} (k : ℕ) :
    graphStarExactCardEvent v (Finset.univ.erase v) k =
      graphDegreeSum v ⁻¹' ({k} : Set ℕ) := by
  rw [graphStarExactCardEvent_eq_preimage_graphDegree k]
  ext G
  simp [graphDegreeSum_eq_graphDegree]

noncomputable def graphBinomialLaw (n : ℕ) (p : Set.Icc (0 : ℝ) 1) : Measure ℕ :=
  ((PMF.binomial (unitInterval.toNNReal p)
      (by change (p : ℝ) ≤ 1; exact p.2.2) (n - 1)).map
      (fun i : Fin (n - 1 + 1) => (i : ℕ))).toMeasure

lemma graphBinomialLaw_apply_of_lt (n : ℕ) (p : Set.Icc (0 : ℝ) 1) (k : ℕ)
    (hk : k < n - 1 + 1) :
    graphBinomialLaw n p {k} =
      ↑((unitInterval.toNNReal p) ^ k *
        (1 - unitInterval.toNNReal p) ^ ((n - 1) - k) *
          ((n - 1).choose k : ℕ) : ℝ≥0∞) := by
  rw [graphBinomialLaw, PMF.toMeasure_apply_singleton _ k (measurableSet_singleton k)]
  rw [PMF.map_apply, tsum_fintype]
  simp only [PMF.binomial_apply]
  rw [Finset.sum_eq_single (⟨k, hk⟩ : Fin (n - 1 + 1))]
  · simp
  · intro b _hb hbk
    by_cases h : k = (b : ℕ)
    · exfalso
      apply hbk
      apply Fin.ext
      exact h.symm
    · simp [h]
  · simp

theorem graphDegreeSum_map_apply {n : ℕ} (p : Set.Icc (0 : ℝ) 1) (v : Fin n) (k : ℕ) :
    (SimpleGraph.binomialRandom (Fin n) p).map (graphDegreeSum v) {k} =
      graphBinomialLaw n p {k} := by
  rw [Measure.map_apply (measurable_graphDegreeSum v) (measurableSet_singleton k)]
  rw [← graphStarExactCardEvent_eq_preimage_graphDegreeSum k]
  rw [binomialRandom_graphStarExactCardEvent_probability
    (p := p) (v := v) (S := Finset.univ.erase v) (by simp) k]
  rw [graphBinomialLaw, PMF.toMeasure_apply_singleton _ k (measurableSet_singleton k)]
  rw [PMF.map_apply, tsum_fintype]
  by_cases hk : k < n - 1 + 1
  · rw [Finset.sum_eq_single (⟨k, hk⟩ : Fin (n - 1 + 1))]
    · have hq : 1 - unitInterval.toNNReal p =
          unitInterval.toNNReal (unitInterval.symm p) := by
        exact (eq_tsub_of_add_eq (unitInterval.toNNReal_symm_add_toNNReal p)).symm
      have hpNN : unitInterval.toNNReal p ≤ 1 := by
        change (p : ℝ) ≤ 1
        exact p.2.2
      have hqE : (unitInterval.toNNReal (unitInterval.symm p) : ℝ≥0∞) =
          1 - (unitInterval.toNNReal p : ℝ≥0∞) := by
        calc
          (unitInterval.toNNReal (unitInterval.symm p) : ℝ≥0∞) =
              (1 - unitInterval.toNNReal p : ℝ≥0∞) :=
            congrArg (fun x : ℝ≥0 => (x : ℝ≥0∞)) hq.symm
          _ = 1 - (unitInterval.toNNReal p : ℝ≥0∞) := by
            rfl
      simp [PMF.binomial_apply, Finset.card_erase_of_mem, hk, hqE]
      ring
    · intro b _hb hbk
      by_cases h : k = (b : ℕ)
      · exfalso
        apply hbk
        apply Fin.ext
        exact h.symm
      · simp [h]
    · simp
  · have hk' : n - 1 + 1 ≤ k := Nat.le_of_not_gt hk
    simp only [PMF.binomial_apply]
    have hlt : n - 1 < k := by omega
    have hne : ∀ b : Fin (n - 1 + 1), k ≠ (b : ℕ) := by
      intro b h
      omega
    simp [Finset.card_erase_of_mem, Nat.choose_eq_zero_of_lt hlt, hne]

theorem graphDegreeSum_hasLaw {n : ℕ} (p : Set.Icc (0 : ℝ) 1) (v : Fin n) :
    HasLaw (graphDegreeSum v) (graphBinomialLaw n p)
      (SimpleGraph.binomialRandom (Fin n) p) := by
  refine { aemeasurable := (measurable_graphDegreeSum v).aemeasurable, map_eq := ?_ }
  apply Measure.ext_of_singleton
  intro k
  exact graphDegreeSum_map_apply p v k

end NumStability.HDP.Scalar.IndependentSums.Chernoff
```

### `NumStability.HDP.Scalar.IndependentSums.Chernoff`

Path: `lean-numerical-stability/NumStability/HDP/Scalar/IndependentSums/Chernoff.lean`
SHA-256: `52b1a9ee479e525072cda203e88f168459e9c305db350d21eaad012b96a98e85`

```lean
import Mathlib.Probability.Combinatorics.BinomialRandomGraph.Defs
import Mathlib.Combinatorics.SimpleGraph.Finite
import Mathlib.Probability.ProbabilityMassFunction.Integrals
import Mathlib.Probability.HasLaw
import Mathlib.Probability.Independence.Integration
import Mathlib.Probability.Distributions.Poisson
import Mathlib.MeasureTheory.Integral.Lebesgue.Countable
import Mathlib.Analysis.Asymptotics.AsymptoticEquivalent
import Mathlib.Analysis.SpecialFunctions.Stirling
import Mathlib.Analysis.Complex.ExponentialBounds
import Mathlib.Tactic
import NumStability.HDP.Scalar.IndependentSums.Hoeffding
import NumStability.HDP.Scalar.IndependentSums.GraphDegreeLaw

/-!
# The Erdős--Rényi random graph interface

This module uses Mathlib's canonical binomial random graph law on finite simple
graphs and exposes the vertex-degree observable used by the Chapter 2
application.
-/

noncomputable section

open MeasureTheory
open ProbabilityTheory
open scoped BigOperators
open scoped ENNReal
open scoped NNReal
open scoped Asymptotics

namespace NumStability.HDP.Scalar.IndependentSums.Chernoff

theorem bernoulliMgfExact (p : ℝ≥0) (hp : p ≤ 1) (lam : ℝ) :
    (∫ b : Bool, Real.exp (lam * (if b then 1 else 0)) ∂
      (PMF.bernoulli p hp).toMeasure) =
      1 + (Real.exp lam - 1) * (p : ℝ) := by
  rw [PMF.integral_eq_sum]
  simp [PMF.bernoulli_apply]
  rw [NNReal.coe_sub hp]
  norm_num
  ring

theorem bernoulliMgfBound (p : ℝ≥0) (hp : p ≤ 1) (lam : ℝ) :
    ((∫ b : Bool, Real.exp (lam * (if b then 1 else 0)) ∂
        (PMF.bernoulli p hp).toMeasure) =
        1 + (Real.exp lam - 1) * (p : ℝ)) ∧
      (1 + (Real.exp lam - 1) * (p : ℝ) ≤
        Real.exp ((Real.exp lam - 1) * (p : ℝ))) := by
  refine ⟨bernoulliMgfExact p hp lam, ?_⟩
  simpa [add_comm] using Real.add_one_le_exp ((Real.exp lam - 1) * (p : ℝ))

theorem poissonBinomialMgfBound
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool} {p : ι → ℝ≥0}
    (hp : ∀ i, p i ≤ 1)
    (hB : iIndepFun B μ)
    (hLaw : ∀ i, HasLaw (B i) (PMF.bernoulli (p i) (hp i)).toMeasure μ)
    (lam : ℝ)
    (hExp : ∀ i, Integrable
      (fun ω => Real.exp (lam * (if B i ω then 1 else 0))) μ) :
    (∫ ω, Real.exp (lam * ∑ i, (if B i ω then 1 else 0)) ∂μ) ≤
      Real.exp ((Real.exp lam - 1) * ∑ i, (p i : ℝ)) := by
  let Y : ι → Ω → ℝ := fun i ω => if B i ω then 1 else 0
  have hY : iIndepFun Y μ := by
    let g : ∀ _ : ι, Bool → ℝ := fun _ b => if b then 1 else 0
    have h := hB.comp g (fun _ => by fun_prop)
    simpa [Y, g, Function.comp_def] using h
  have hExpY : ∀ i, Integrable (fun ω => Real.exp (lam * (1 * Y i ω))) μ := by
    intro i
    simpa [Y, one_mul] using hExp i
  have hFactor : ∀ i, (∫ ω, Real.exp (lam * (1 * Y i ω)) ∂μ) ≤
      Real.exp ((Real.exp lam - 1) * (p i : ℝ)) := by
    intro i
    have hcomp := (hLaw i).integral_comp
      (f := fun b : Bool => Real.exp (lam * (if b then 1 else 0))) (by fun_prop)
    calc
      (∫ ω, Real.exp (lam * (1 * Y i ω)) ∂μ) =
          ∫ b : Bool, Real.exp (lam * (if b then 1 else 0)) ∂
            (PMF.bernoulli (p i) (hp i)).toMeasure := by
        simpa [Y, Function.comp_def] using hcomp
      _ = 1 + (Real.exp lam - 1) * (p i : ℝ) := bernoulliMgfExact (p i) (hp i) lam
      _ ≤ Real.exp ((Real.exp lam - 1) * (p i : ℝ)) :=
        (bernoulliMgfBound (p i) (hp i) lam).2
  calc
    (∫ ω, Real.exp (lam * ∑ i, (if B i ω then 1 else 0)) ∂μ) =
        ∏ i, ∫ ω, Real.exp (lam * (1 * Y i ω)) ∂μ := by
      simpa [Y] using
          (NumStability.HDP.Scalar.IndependentSums.Hoeffding.mgfIndependentSum
          (μ := μ) (X := Y) lam (fun _ => 1) hY hExpY)
    _ ≤ ∏ i, Real.exp ((Real.exp lam - 1) * (p i : ℝ)) := by
      apply Finset.prod_le_prod
      · intro i _
        exact integral_nonneg (fun _ => Real.exp_nonneg _)
      · intro i _
        exact hFactor i
    _ = Real.exp ((Real.exp lam - 1) * ∑ i, (p i : ℝ)) := by
      rw [← Real.exp_sum]
      congr 1
      rw [Finset.mul_sum]

theorem poissonBinomialChernoffBound
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool} {p : ι → ℝ≥0}
    (hp : ∀ i, p i ≤ 1)
    (hB : iIndepFun B μ)
    (hLaw : ∀ i, HasLaw (B i) (PMF.bernoulli (p i) (hp i)).toMeasure μ)
    (hMeas : ∀ i, Measurable (B i))
    {t : ℝ}
    (hExp : ∀ i, Integrable
      (fun ω => Real.exp (Real.log (t / (∑ i, (p i : ℝ))) *
        (if B i ω then 1 else 0))) μ)
    (ht : ∑ i, (p i : ℝ) < t)
    (hμ : 0 < ∑ i, (p i : ℝ))
    (hExpS : Integrable
      (fun ω => Real.exp (Real.log (t / (∑ i, (p i : ℝ))) *
        ∑ i, (if B i ω then 1 else 0))) μ) :
    μ.real {ω | t ≤ ∑ i, (if B i ω then 1 else 0)} ≤
      Real.exp (-(∑ i, (p i : ℝ))) *
        ((Real.exp 1 * (∑ i, (p i : ℝ)) / t) ^ t) := by
  let S : Ω → ℝ := fun ω => ∑ i, (if B i ω then 1 else 0)
  have hS : Measurable S := by
    dsimp [S]
    refine Finset.measurable_fun_sum Finset.univ ?_
    intro i hi
    exact Measurable.ite
      (measurableSet_preimage (hMeas i) (measurableSet_singleton (true : Bool)))
      measurable_const measurable_const
  have hlogpos : 0 < Real.log (t / (∑ i, (p i : ℝ))) := by
    apply Real.log_pos
    rw [one_lt_div hμ]
    exact ht
  have hmgf := poissonBinomialMgfBound hp hB hLaw
    (Real.log (t / (∑ i, (p i : ℝ)))) hExp
  have hmarkov :=
    NumStability.HDP.Scalar.IndependentSums.Hoeffding.exponentialMarkovUpper
      (lam := Real.log (t / (∑ i, (p i : ℝ)))) (t := t) hS hlogpos hExpS
  have hbound :
      (∫ ω, Real.exp (Real.log (t / (∑ i, (p i : ℝ))) * S ω) ∂μ) ≤
        Real.exp ((Real.exp (Real.log (t / (∑ i, (p i : ℝ)))) - 1) *
          (∑ i, (p i : ℝ))) := by
    simpa [S] using hmgf
  have hmul :
      Real.exp (-(Real.log (t / (∑ i, (p i : ℝ))) * t)) *
          (∫ ω, Real.exp (Real.log (t / (∑ i, (p i : ℝ))) * S ω) ∂μ) ≤
        Real.exp (-(Real.log (t / (∑ i, (p i : ℝ))) * t)) *
          Real.exp ((Real.exp (Real.log (t / (∑ i, (p i : ℝ)))) - 1) *
            (∑ i, (p i : ℝ))) :=
    mul_le_mul_of_nonneg_left hbound (Real.exp_nonneg _)
  calc
    μ.real {ω | t ≤ ∑ i, (if B i ω then 1 else 0)} =
        μ.real (S ⁻¹' Set.Ici t) := by
      rfl
    _ ≤ Real.exp (-(Real.log (t / (∑ i, (p i : ℝ))) * t)) *
        (∫ ω, Real.exp (Real.log (t / (∑ i, (p i : ℝ))) * S ω) ∂μ) := by
      simpa [S, mul_comm] using hmarkov
    _ ≤ Real.exp (-(Real.log (t / (∑ i, (p i : ℝ))) * t)) *
        Real.exp ((Real.exp (Real.log (t / (∑ i, (p i : ℝ)))) - 1) *
          (∑ i, (p i : ℝ))) := hmul
    _ = Real.exp (-(∑ i, (p i : ℝ))) *
        ((Real.exp 1 * (∑ i, (p i : ℝ)) / t) ^ t) := by
      have ht0 : 0 < t := lt_trans hμ ht
      have hratio : 0 < t / (∑ i, (p i : ℝ)) := div_pos ht0 hμ
      have hbase : 0 < Real.exp 1 * (∑ i, (p i : ℝ)) / t :=
        div_pos (mul_pos (Real.exp_pos _) hμ) ht0
      rw [Real.exp_log hratio]
      rw [Real.rpow_def_of_pos hbase]
      rw [Real.log_div (mul_ne_zero (ne_of_gt (Real.exp_pos (1 : ℝ)))
        (ne_of_gt hμ)) (ne_of_gt ht0)]
      rw [Real.log_mul (ne_of_gt (Real.exp_pos (1 : ℝ))) (ne_of_gt hμ)]
      rw [Real.log_exp]
      rw [← Real.exp_add]
      rw [← Real.exp_add]
      congr 1
      rw [Real.log_div (ne_of_gt (lt_trans hμ ht)) (ne_of_gt hμ)]
      field_simp
      ring

theorem poissonBinomialLowerChernoffBound
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool} {p : ι → ℝ≥0}
    (hp : ∀ i, p i ≤ 1)
    (hB : iIndepFun B μ)
    (hLaw : ∀ i, HasLaw (B i) (PMF.bernoulli (p i) (hp i)).toMeasure μ)
    (hMeas : ∀ i, Measurable (B i))
    {t : ℝ}
    (hExp : ∀ i, Integrable
      (fun ω => Real.exp ((-Real.log ((∑ i, (p i : ℝ)) / t)) *
        (if B i ω then 1 else 0))) μ)
    (ht : 0 < t)
    (htμ : t < ∑ i, (p i : ℝ))
    (hExpS : Integrable
      (fun ω => Real.exp (Real.log ((∑ i, (p i : ℝ)) / t) *
        (-∑ i, (if B i ω then 1 else 0)))) μ) :
    μ.real {ω | ∑ i, (if B i ω then 1 else 0) ≤ t} ≤
      Real.exp (-(∑ i, (p i : ℝ))) *
        ((Real.exp 1 * (∑ i, (p i : ℝ)) / t) ^ t) := by
  let S : Ω → ℝ := fun ω => ∑ i, (if B i ω then 1 else 0)
  have hS : Measurable S := by
    dsimp [S]
    refine Finset.measurable_fun_sum Finset.univ ?_
    intro i hi
    exact Measurable.ite
      (measurableSet_preimage (hMeas i) (measurableSet_singleton (true : Bool)))
      measurable_const measurable_const
  have hμpos : 0 < ∑ i, (p i : ℝ) := lt_trans ht htμ
  have hratio : 0 < (∑ i, (p i : ℝ)) / t := div_pos hμpos ht
  have hlogpos : 0 < Real.log ((∑ i, (p i : ℝ)) / t) := by
    apply Real.log_pos
    rw [one_lt_div ht]
    exact htμ
  have hmgf := poissonBinomialMgfBound hp hB hLaw
    (-Real.log ((∑ i, (p i : ℝ)) / t)) hExp
  have hmarkov :=
    NumStability.HDP.Scalar.IndependentSums.Hoeffding.exponentialMarkovUpper
      (S := fun ω => -S ω)
      (lam := Real.log ((∑ i, (p i : ℝ)) / t)) (t := -t)
      hS.neg hlogpos hExpS
  have hbound :
      (∫ ω, Real.exp (Real.log ((∑ i, (p i : ℝ)) / t) * (-S ω)) ∂μ) ≤
        Real.exp ((Real.exp (-Real.log ((∑ i, (p i : ℝ)) / t)) - 1) *
          (∑ i, (p i : ℝ))) := by
    simpa [S, mul_neg] using hmgf
  have hmul :
      Real.exp (Real.log ((∑ i, (p i : ℝ)) / t) * t) *
          (∫ ω, Real.exp (Real.log ((∑ i, (p i : ℝ)) / t) * (-S ω)) ∂μ) ≤
        Real.exp (Real.log ((∑ i, (p i : ℝ)) / t) * t) *
          Real.exp ((Real.exp (-Real.log ((∑ i, (p i : ℝ)) / t)) - 1) *
            (∑ i, (p i : ℝ))) :=
    mul_le_mul_of_nonneg_left hbound (Real.exp_nonneg _)
  calc
    μ.real {ω | ∑ i, (if B i ω then 1 else 0) ≤ t} =
        μ.real ((fun ω => -S ω) ⁻¹' Set.Ici (-t)) := by
      congr 1
      ext ω
      simp [S, le_neg]
    _ ≤ Real.exp (Real.log ((∑ i, (p i : ℝ)) / t) * t) *
        (∫ ω, Real.exp (Real.log ((∑ i, (p i : ℝ)) / t) * (-S ω)) ∂μ) := by
      simpa [mul_neg, mul_comm] using hmarkov
    _ ≤ Real.exp (Real.log ((∑ i, (p i : ℝ)) / t) * t) *
        Real.exp ((Real.exp (-Real.log ((∑ i, (p i : ℝ)) / t)) - 1) *
          (∑ i, (p i : ℝ))) := hmul
    _ = Real.exp (-(∑ i, (p i : ℝ))) *
        ((Real.exp 1 * (∑ i, (p i : ℝ)) / t) ^ t) := by
      have hμpos : 0 < ∑ i, (p i : ℝ) := lt_trans ht htμ
      have hbase : 0 < Real.exp 1 * (∑ i, (p i : ℝ)) / t :=
        div_pos (mul_pos (Real.exp_pos _) hμpos) ht
      rw [Real.exp_neg, Real.exp_log hratio]
      rw [Real.rpow_def_of_pos hbase]
      rw [Real.log_div (mul_ne_zero (ne_of_gt (Real.exp_pos (1 : ℝ)))
        (ne_of_gt hμpos)) (ne_of_gt ht)]
      rw [Real.log_mul (ne_of_gt (Real.exp_pos (1 : ℝ))) (ne_of_gt hμpos)]
      rw [Real.log_exp]
      rw [← Real.exp_add]
      rw [← Real.exp_add]
      congr 1
      rw [Real.log_div (ne_of_gt hμpos) (ne_of_gt ht)]
      field_simp
      ring

theorem poissonBinomialChernoffZeroCase
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool} {t : ℝ}
    (ht : 0 < t)
    (hZero : ∀ ω, ∑ i, (if B i ω then (1 : ℝ) else 0) = 0) :
    μ.real {ω | t ≤ ∑ i, (if B i ω then 1 else 0)} = 0 := by
  have hset : {ω | t ≤ ∑ i, (if B i ω then 1 else 0)} = (∅ : Set Ω) := by
    ext ω
    simp only [Set.mem_setOf_eq, Set.mem_empty_iff_false, iff_false]
    intro hω
    have hω' : t ≤ 0 := by
      calc
        t ≤ ∑ i, (if B i ω then 1 else 0) := hω
        _ = 0 := hZero ω
    exact (not_le_of_gt ht) hω'
  rw [hset]
  simp

private lemma poissonMeasure_mass (rate : ℝ≥0) (k : ℕ) :
    ProbabilityTheory.poissonMeasure rate {k} =
      ENNReal.ofReal (ProbabilityTheory.poissonPMFReal rate k) := by
  rw [ProbabilityTheory.poissonMeasure,
    PMF.toMeasure_apply_singleton _ k (measurableSet_singleton k)]
  rfl

private lemma poisson_add_fiber (n x : ℕ) :
    Prod.mk x ⁻¹' ((fun p : ℕ × ℕ => p.1 + p.2) ⁻¹' ({n} : Set ℕ)) =
      if x ≤ n then ({n - x} : Set ℕ) else ∅ := by
  by_cases h : x ≤ n
  · ext y
    simp only [Set.mem_preimage, Set.mem_singleton_iff]
    rw [if_pos h]
    constructor
    · intro heq
      exact Nat.eq_sub_of_add_eq (by simpa [Nat.add_comm] using heq)
    · intro heq
      rw [heq]
      exact Nat.add_sub_of_le h
  · ext y
    simp only [Set.mem_preimage, Set.mem_singleton_iff]
    rw [if_neg h]
    constructor
    · intro heq
      exact False.elim (h (by rw [← heq]; exact Nat.le_add_right x y))
    · intro heq
      exact False.elim heq

private lemma finite_tsum_of_support_le (n : ℕ) (f : ℕ → ℝ≥0∞)
    (hf : ∀ x, x > n → f x = 0) :
    (∑' x : ℕ, f x) = ∑ x ∈ Finset.range (n + 1), f x := by
  have hsupp : Function.support f ⊆ (↑(Finset.range (n + 1)) : Set ℕ) := by
    intro x hx
    simp only [Finset.mem_coe, Finset.mem_range]
    by_contra hxn
    apply hx
    exact hf x (Nat.le_of_not_gt hxn)
  rw [← tsum_subtype_eq_of_support_subset hsupp]
  exact Finset.tsum_subtype' (Finset.range (n + 1)) f

/-- The convolution of two Poisson measures is Poisson with the summed rate. -/
theorem poissonMeasure_conv_poissonMeasure (r s : ℝ≥0) :
    ProbabilityTheory.poissonMeasure r ∗ ProbabilityTheory.poissonMeasure s =
      ProbabilityTheory.poissonMeasure (r + s) := by
  apply Measure.ext_of_singleton
  intro n
  rw [Measure.conv, Measure.map_apply measurable_add (measurableSet_singleton n)]
  rw [Measure.prod_apply]
  rw [lintegral_countable']
  have hinner (x : ℕ) :
      ProbabilityTheory.poissonMeasure s
          (Prod.mk x ⁻¹' ((fun p : ℕ × ℕ => p.1 + p.2) ⁻¹' ({n} : Set ℕ))) =
        if x ≤ n then ENNReal.ofReal (ProbabilityTheory.poissonPMFReal s (n - x))
        else 0 := by
    rw [poisson_add_fiber]
    split_ifs with h
    · rw [poissonMeasure_mass]
    · simp
  simp_rw [hinner, poissonMeasure_mass]
  let f : ℕ → ℝ≥0∞ := fun x =>
    (if x ≤ n then ENNReal.ofReal (ProbabilityTheory.poissonPMFReal s (n - x)) else 0) *
      ENNReal.ofReal (ProbabilityTheory.poissonPMFReal r x)
  have hfinite : (∑' x : ℕ, f x) = ∑ x ∈ Finset.range (n + 1), f x := by
    apply finite_tsum_of_support_le
    intro x hx
    simp [f, Nat.not_le_of_gt hx]
  change (∑' x : ℕ, f x) = _
  rw [hfinite]
  have hsum_nonneg (x : ℕ) (hx : x ∈ Finset.range (n + 1)) :
      0 ≤ ProbabilityTheory.poissonPMFReal s (n - x) *
        ProbabilityTheory.poissonPMFReal r x :=
    mul_nonneg ProbabilityTheory.poissonPMFReal_nonneg
      ProbabilityTheory.poissonPMFReal_nonneg
  have hsum :
      (∑ x ∈ Finset.range (n + 1), f x) =
        ENNReal.ofReal
          (∑ x ∈ Finset.range (n + 1),
            ProbabilityTheory.poissonPMFReal s (n - x) *
              ProbabilityTheory.poissonPMFReal r x) := by
    rw [ENNReal.ofReal_sum_of_nonneg hsum_nonneg]
    apply Finset.sum_congr rfl
    intro x hx
    have hxn : x ≤ n := Nat.le_of_lt_succ (Finset.mem_range.1 hx)
    simp only [f, if_pos hxn]
    rw [← ENNReal.ofReal_mul ProbabilityTheory.poissonPMFReal_nonneg]
  rw [hsum]
  apply congrArg ENNReal.ofReal
  calc
    (∑ x ∈ Finset.range (n + 1),
        ProbabilityTheory.poissonPMFReal s (n - x) *
          ProbabilityTheory.poissonPMFReal r x) =
      ∑ x ∈ Finset.range (n + 1),
        Real.exp (-(↑r + ↑s)) / (n.factorial : ℝ) *
          (n.choose x : ℝ) * (↑s : ℝ) ^ (n - x) * (↑r : ℝ) ^ x := by
        apply Finset.sum_congr rfl
        intro x hx
        have hxn : x ≤ n := Nat.le_of_lt_succ (Finset.mem_range.1 hx)
        have hfac_nat := Nat.choose_mul_factorial_mul_factorial hxn
        have hfac : (n.choose x : ℝ) * (x.factorial : ℝ) *
            ((n - x).factorial : ℝ) = (n.factorial : ℝ) := by
          exact_mod_cast hfac_nat
        simp only [ProbabilityTheory.poissonPMFReal]
        have hexp : Real.exp (-↑s) * Real.exp (-↑r) =
            Real.exp (-(↑r + ↑s)) := by
          rw [← Real.exp_add]
          congr 1
          ring
        field_simp [Nat.factorial_ne_zero, Real.exp_ne_zero]
        calc
          _ = Real.exp (-↑s) * Real.exp (-↑r) * (↑s : ℝ) ^ (n - x) *
              (↑r : ℝ) ^ x * (n.factorial : ℝ) := by ring
          _ = _ := by
            rw [hexp]
            rw [← hfac]
            ring
    _ = Real.exp (-(↑r + ↑s)) / (n.factorial : ℝ) * (↑r + ↑s) ^ n := by
      calc
        (∑ x ∈ Finset.range (n + 1),
            Real.exp (-(↑r + ↑s)) / (n.factorial : ℝ) *
              (n.choose x : ℝ) * (↑s : ℝ) ^ (n - x) * (↑r : ℝ) ^ x) =
          Real.exp (-(↑r + ↑s)) / (n.factorial : ℝ) *
            ∑ x ∈ Finset.range (n + 1),
              (n.choose x : ℝ) * (↑s : ℝ) ^ (n - x) * (↑r : ℝ) ^ x := by
            rw [Finset.mul_sum]
            apply Finset.sum_congr rfl
            intro x hx
            ring
        _ = Real.exp (-(↑r + ↑s)) / (n.factorial : ℝ) * (↑r + ↑s) ^ n := by
          have hbin := add_pow (↑r : ℝ) (↑s : ℝ) n
          calc
            Real.exp (-(↑r + ↑s)) / (n.factorial : ℝ) *
                ∑ x ∈ Finset.range (n + 1),
                  (n.choose x : ℝ) * (↑s : ℝ) ^ (n - x) * (↑r : ℝ) ^ x =
              Real.exp (-(↑r + ↑s)) / (n.factorial : ℝ) *
                ∑ x ∈ Finset.range (n + 1),
                  (↑r : ℝ) ^ x * (↑s : ℝ) ^ (n - x) * (n.choose x : ℝ) := by
                    apply congrArg (fun z => Real.exp (-(↑r + ↑s)) /
                      (n.factorial : ℝ) * z)
                    apply Finset.sum_congr rfl
                    intro x hx
                    ring
            _ = Real.exp (-(↑r + ↑s)) / (n.factorial : ℝ) * (↑r + ↑s) ^ n := by
              rw [hbin]
    _ = ProbabilityTheory.poissonPMFReal (r + s) n := by
      simp only [ProbabilityTheory.poissonPMFReal, NNReal.coe_add]
      ring
  all_goals exact measurableSet_preimage measurable_add (measurableSet_singleton n)

private lemma exp_add_half_le (δ : ℝ) (hδ0 : 0 ≤ δ) (hδ1 : δ ≤ 1) :
    Real.exp (δ / 2) ≤ 1 + δ / 2 + (δ / 2) ^ 2 := by
  have hrem := Real.abs_exp_sub_one_sub_id_le (x := δ / 2) (by
    calc
      |δ / 2| = δ / 2 := abs_of_nonneg (by positivity)
      _ ≤ 1 := by linarith)
  have hrem' : Real.exp (δ / 2) - 1 - δ / 2 ≤ (δ / 2) ^ 2 :=
    (le_abs_self _).trans hrem
  linarith

private lemma exp_neg_half_le (δ : ℝ) (hδ0 : 0 ≤ δ) (hδ1 : δ ≤ 1) :
    Real.exp (-δ / 2) ≤ 1 - δ / 2 + (δ / 2) ^ 2 := by
  have hrem := Real.abs_exp_sub_one_sub_id_le (x := -δ / 2) (by
    calc
      |-δ / 2| = δ / 2 := by
        rw [abs_of_nonpos (by linarith)]
        ring
      _ ≤ 1 := by linarith)
  have hrem' : Real.exp (-δ / 2) - 1 - (-δ / 2) ≤ (-δ / 2) ^ 2 :=
    (le_abs_self _).trans hrem
  linarith

/-! Exercise 2.3.5: the optimized Poisson-binomial Chernoff bounds imply a
quadratic two-sided estimate.  We use the non-optimized parameter `δ/2`; the
second-order exponential remainder gives the explicit universal constant
`c = 1/4` uniformly for `0 < δ ≤ 1`. -/
theorem poissonBinomialTwoSidedQuadraticBound
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool} {p : ι → ℝ≥0}
    (hp : ∀ i, p i ≤ 1)
    (hB : iIndepFun B μ)
    (hLaw : ∀ i, HasLaw (B i) (PMF.bernoulli (p i) (hp i)).toMeasure μ)
    (hMeas : ∀ i, Measurable (B i))
    {δ : ℝ} (hδ0 : 0 < δ) (hδ1 : δ ≤ 1)
    (hExp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam * (if B i ω then 1 else 0))) μ)
    (hExpS : ∀ (lam : ℝ),
      Integrable (fun ω => Real.exp (lam * ∑ i, (if B i ω then 1 else 0))) μ) :
    μ.real {ω |
        δ * (∑ i, (p i : ℝ)) ≤
          |(∑ i, (if B i ω then 1 else 0)) - ∑ i, (p i : ℝ)|} ≤
      2 * Real.exp (-(∑ i, (p i : ℝ)) * δ ^ 2 / 4) := by
  let S : Ω → ℝ := fun ω => ∑ i, (if B i ω then 1 else 0)
  let m : ℝ := ∑ i, (p i : ℝ)
  have hm : 0 ≤ m := by
    dsimp [m]
    exact Finset.sum_nonneg (fun i _ => by positivity)
  have hS : Measurable S := by
    dsimp [S]
    refine Finset.measurable_fun_sum Finset.univ ?_
    intro i hi
    exact Measurable.ite
      (measurableSet_preimage (hMeas i) (measurableSet_singleton (true : Bool)))
      measurable_const measurable_const
  have hupper_mgf := poissonBinomialMgfBound hp hB hLaw (δ / 2) (by
    intro i
    exact hExp (δ / 2) i)
  have hlower_mgf := poissonBinomialMgfBound hp hB hLaw (-δ / 2) (by
    intro i
    exact hExp (-δ / 2) i)
  have hupper_markov :=
    NumStability.HDP.Scalar.IndependentSums.Hoeffding.exponentialMarkovUpper
      (μ := μ) (t := (1 + δ) * m) hS (by linarith) (hExpS (δ / 2))
  have hlower_markov :=
    NumStability.HDP.Scalar.IndependentSums.Hoeffding.exponentialMarkovUpper
      (μ := μ) (S := fun ω => -S ω) (lam := δ / 2) (t := -(1 - δ) * m)
      hS.neg (by linarith)
    (by
      have hEq :
          (fun ω => Real.exp (δ / 2 * (fun ω => -S ω) ω)) =
            (fun ω => Real.exp ((-δ / 2) * ∑ i, (if B i ω then 1 else 0))) := by
        funext ω
        dsimp [S]
        congr 1
        ring
      rw [hEq]
      exact hExpS (-δ / 2))
  have hupper_exp : Real.exp (δ / 2) ≤ 1 + δ / 2 + (δ / 2) ^ 2 :=
    exp_add_half_le δ hδ0.le hδ1
  have hlower_exp : Real.exp (-δ / 2) ≤ 1 - δ / 2 + (δ / 2) ^ 2 :=
    exp_neg_half_le δ hδ0.le hδ1
  have hupper_coeff :
      -(δ / 2 * ((1 + δ) * m)) + (Real.exp (δ / 2) - 1) * m ≤
        -(m * δ ^ 2 / 4) := by
    have hcoeff :
        -(δ / 2 * (1 + δ)) + (Real.exp (δ / 2) - 1) ≤ -(δ ^ 2 / 4) := by
      nlinarith [hupper_exp]
    have := mul_le_mul_of_nonneg_right hcoeff hm
    nlinarith
  have hlower_coeff :
      -(δ / 2 * (-(1 - δ) * m)) + (Real.exp (-δ / 2) - 1) * m ≤
        -(m * δ ^ 2 / 4) := by
    have hcoeff :
        (δ / 2) * (1 - δ) + (Real.exp (-δ / 2) - 1) ≤ -(δ ^ 2 / 4) := by
      nlinarith [hlower_exp]
    have := mul_le_mul_of_nonneg_right hcoeff hm
    nlinarith
  have hupper_raw : μ.real (S ⁻¹' Set.Ici ((1 + δ) * m)) ≤
      Real.exp (-(δ / 2 * ((1 + δ) * m))) *
        Real.exp ((Real.exp (δ / 2) - 1) * m) := by
    apply le_trans hupper_markov
    apply mul_le_mul_of_nonneg_left _ (Real.exp_nonneg _)
    simpa [S, m, mul_assoc] using hupper_mgf
  have hlower_raw : μ.real ((fun ω => -S ω) ⁻¹' Set.Ici (-(1 - δ) * m)) ≤
      Real.exp (-(δ / 2 * (-(1 - δ) * m))) *
        Real.exp ((Real.exp (-δ / 2) - 1) * m) := by
    apply le_trans hlower_markov
    apply mul_le_mul_of_nonneg_left _ (Real.exp_nonneg _)
    have hEq :
        (fun ω => Real.exp (δ / 2 * (fun ω => -S ω) ω)) =
          (fun ω => Real.exp ((-δ / 2) * ∑ i, (if B i ω then 1 else 0))) := by
      funext ω
      dsimp [S]
      congr 1
      ring
    rw [hEq]
    simpa [m] using hlower_mgf
  have hupper : μ.real {ω | (1 + δ) * m ≤ S ω} ≤
      Real.exp (-(m * δ ^ 2 / 4)) := by
    rw [show {ω | (1 + δ) * m ≤ S ω} = S ⁻¹' Set.Ici ((1 + δ) * m) by rfl]
    refine hupper_raw.trans ?_
    rw [← Real.exp_add]
    exact Real.exp_le_exp.2 hupper_coeff
  have hlower : μ.real {ω | S ω ≤ (1 - δ) * m} ≤
      Real.exp (-(m * δ ^ 2 / 4)) := by
    have hset : {ω | S ω ≤ (1 - δ) * m} =
        (fun ω => -S ω) ⁻¹' Set.Ici (-(1 - δ) * m) := by
      ext ω
      simp only [Set.mem_setOf_eq, Set.mem_preimage, Set.mem_Ici]
      constructor <;> intro h <;> linarith
    rw [hset]
    refine hlower_raw.trans ?_
    rw [← Real.exp_add]
    exact Real.exp_le_exp.2 hlower_coeff
  let U : Set Ω := {ω | (1 + δ) * m ≤ S ω}
  let L : Set Ω := {ω | S ω ≤ (1 - δ) * m}
  have hsubset : {ω | δ * m ≤ |S ω - m|} ⊆ U ∪ L := by
    intro ω hω
    change δ * m ≤ |S ω - m| at hω
    by_cases hupper : (1 + δ) * m ≤ S ω
    · exact Or.inl hupper
    · right
      have hnotupper : S ω < (1 + δ) * m := lt_of_not_ge hupper
      by_contra hnotlower
      have hlower' : (1 - δ) * m < S ω := lt_of_not_ge hnotlower
      have habs : |S ω - m| < δ * m := by
        rw [abs_lt]
        constructor <;> linarith
      exact (not_lt_of_ge hω) habs
  have hmono {A B : Set Ω} (hAB : A ⊆ B) : μ.real A ≤ μ.real B := by
    rw [Measure.real_def, Measure.real_def]
    exact ENNReal.toReal_mono (measure_ne_top μ B) (measure_mono hAB)
  have hunion : μ.real (U ∪ L) ≤ μ.real U + μ.real L := by
    rw [Measure.real_def, Measure.real_def, Measure.real_def]
    calc
      (μ (U ∪ L)).toReal ≤ (μ U + μ L).toReal := by
        apply ENNReal.toReal_mono
        · exact ENNReal.add_ne_top.mpr ⟨measure_ne_top μ U, measure_ne_top μ L⟩
        · exact measure_union_le U L
      _ = (μ U).toReal + (μ L).toReal :=
        ENNReal.toReal_add (measure_ne_top μ U) (measure_ne_top μ L)
  have hfinal : μ.real {ω | δ * m ≤ |S ω - m|} ≤
      2 * Real.exp (-m * δ ^ 2 / 4) := by
    calc
      μ.real {ω | δ * m ≤ |S ω - m|} ≤ μ.real (U ∪ L) := hmono hsubset
      _ ≤ μ.real U + μ.real L := hunion
      _ ≤ Real.exp (-(m * δ ^ 2 / 4)) + Real.exp (-(m * δ ^ 2 / 4)) :=
        add_le_add (by simpa [U] using hupper) (by simpa [L] using hlower)
      _ = 2 * Real.exp (-m * δ ^ 2 / 4) := by ring
  simpa [S, m] using hfinal

/-! The sum of independent Poisson variables has the Poisson law with summed rate. -/
theorem poissonAddLaw
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X Y : Ω → ℕ} {r s : ℝ≥0}
    (hX : HasLaw X (ProbabilityTheory.poissonMeasure r) μ)
    (hY : HasLaw Y (ProbabilityTheory.poissonMeasure s) μ)
    (hXY : X ⟂ᵢ[μ] Y) :
    HasLaw (X + Y) (ProbabilityTheory.poissonMeasure (r + s)) μ := by
  have h := hXY.hasLaw_add hX hY
  rw [poissonMeasure_conv_poissonMeasure] at h
  exact h

/-! The point-mass sharpness calculation from Remark 2.3.4.  We state the
asymptotic with its exact Stirling normalization; the book's `≍` notation is
the corresponding two-sided constant-factor consequence. -/
theorem poissonPointMass_isEquivalent_stirling (rate : ℝ≥0) (hrate : 0 < rate) :
    (fun k : ℕ => ProbabilityTheory.poissonPMFReal rate k) ~[Filter.atTop]
      (fun k : ℕ =>
        Real.exp (-(rate : ℝ)) *
          (Real.exp 1 * (rate : ℝ) / (k : ℝ)) ^ k /
            Real.sqrt (2 * (k : ℝ) * Real.pi)) := by
  have _hrate_real : 0 < (rate : ℝ) := by exact_mod_cast hrate
  have hfactorial := Stirling.factorial_isEquivalent_stirling
  have hnumerator :
      (fun k : ℕ => Real.exp (-(rate : ℝ)) * (rate : ℝ) ^ k) ~[Filter.atTop]
        (fun k : ℕ => Real.exp (-(rate : ℝ)) * (rate : ℝ) ^ k) :=
    Asymptotics.IsEquivalent.refl
  have hinverse :
      (fun k : ℕ => ((k.factorial : ℝ)⁻¹)) ~[Filter.atTop]
        (fun k : ℕ =>
          (Real.sqrt (2 * (k : ℝ) * Real.pi) *
          ((k : ℝ) / Real.exp 1) ^ k)⁻¹) := by
    simpa only [Pi.inv_apply] using hfactorial.inv
  have hproduct :
      (fun k : ℕ =>
        Real.exp (-(rate : ℝ)) * (rate : ℝ) ^ k *
          ((k.factorial : ℝ)⁻¹)) ~[Filter.atTop]
        (fun k : ℕ =>
          Real.exp (-(rate : ℝ)) * (rate : ℝ) ^ k *
            (Real.sqrt (2 * (k : ℝ) * Real.pi) *
            ((k : ℝ) / Real.exp 1) ^ k)⁻¹) := by
    simpa only [Pi.mul_apply] using hnumerator.mul hinverse
  have hleft :
      (fun k : ℕ =>
        Real.exp (-(rate : ℝ)) * (rate : ℝ) ^ k *
          ((k.factorial : ℝ)⁻¹)) =ᶠ[Filter.atTop]
        (fun k : ℕ => ProbabilityTheory.poissonPMFReal rate k) := by
    filter_upwards [] with k
    simp [ProbabilityTheory.poissonPMFReal, div_eq_mul_inv]
  have hright :
      (fun k : ℕ =>
        Real.exp (-(rate : ℝ)) * (rate : ℝ) ^ k *
          (Real.sqrt (2 * (k : ℝ) * Real.pi) *
            ((k : ℝ) / Real.exp 1) ^ k)⁻¹) =ᶠ[Filter.atTop]
        (fun k : ℕ =>
          Real.exp (-(rate : ℝ)) *
            (Real.exp 1 * (rate : ℝ) / (k : ℝ)) ^ k /
              Real.sqrt (2 * (k : ℝ) * Real.pi)) := by
    have hlarge : ∀ᶠ k : ℕ in Filter.atTop, 1 ≤ k :=
      Filter.eventually_atTop.2 ⟨1, fun _ hk => hk⟩
    filter_upwards [hlarge] with k hk
    have hk0 : (k : ℝ) ≠ 0 := by
      exact_mod_cast (Nat.ne_of_gt hk)
    have hscale : Real.sqrt (2 * (k : ℝ) * Real.pi) ≠ 0 := by
      positivity
    rw [div_pow, div_pow]
    field_simp [hk0, hscale, Real.exp_ne_zero]
    rw [mul_pow]
  exact (hproduct.congr_left hleft).congr_right hright

structure BernoulliMgfModelData : Prop where
  scalar : ∀ (p : ℝ≥0), (hp : p ≤ 1) → ∀ lam : ℝ,
    ((∫ b : Bool, Real.exp (lam * (if b then 1 else 0)) ∂
        (PMF.bernoulli p hp).toMeasure) =
        1 + (Real.exp lam - 1) * (p : ℝ)) ∧
      (1 + (Real.exp lam - 1) * (p : ℝ) ≤
        Real.exp ((Real.exp lam - 1) * (p : ℝ)))
  tensor : ∀ {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool} {p : ι → ℝ≥0},
    (hp : ∀ i, p i ≤ 1) →
    iIndepFun B μ →
    (∀ i, HasLaw (B i) (PMF.bernoulli (p i) (hp i)).toMeasure μ) →
    ∀ lam : ℝ,
    (∀ i, Integrable
      (fun ω => Real.exp (lam * (if B i ω then 1 else 0))) μ) →
    (∫ ω, Real.exp (lam * ∑ i, (if B i ω then 1 else 0)) ∂μ) ≤
      Real.exp ((Real.exp lam - 1) * ∑ i, (p i : ℝ))

theorem bernoulliMgfModel : BernoulliMgfModelData :=
  { scalar := fun p hp lam => bernoulliMgfBound p hp lam
    tensor := fun hp hB hLaw lam hExp => poissonBinomialMgfBound hp hB hLaw lam hExp }

/-- The source-facing data for `G(n,p)` and its vertex-degree observable. -/
structure ErdosRenyiModelData (n : ℕ) (p : Set.Icc (0 : ℝ) 1) where
  graphLaw : Measure (SimpleGraph (Fin n))
  degree : Fin n → SimpleGraph (Fin n) → ℕ

/-- The Erdős--Rényi model on `Fin n`, with independent edge indicators. -/
noncomputable def erdosRenyiModel (n : ℕ) (p : Set.Icc (0 : ℝ) 1) :
    ErdosRenyiModelData n p :=
  { graphLaw := SimpleGraph.binomialRandom (Fin n) p
    degree := fun v G =>
      @SimpleGraph.degree (Fin n) G v (Fintype.ofFinite (G.neighborSet v)) }

theorem erdosRenyiModel_degree_eq_graphDegreeSum
    (n : ℕ) (p : Set.Icc (0 : ℝ) 1) (v : Fin n) (G : SimpleGraph (Fin n)) :
    (erdosRenyiModel n p).degree v G = graphDegreeSum v G := by
  dsimp [erdosRenyiModel]
  letI : Fintype (G.neighborSet v) := Fintype.ofFinite _
  calc
    @SimpleGraph.degree (Fin n) G v (Fintype.ofFinite (G.neighborSet v)) =
        Fintype.card (G.neighborSet v) :=
      (SimpleGraph.card_neighborSet_eq_degree G v).symm
    _ = (G.neighborSet v).ncard := by
      rw [Set.ncard_eq_toFinset_card', Set.toFinset_card]
    _ = graphDegreeSum v G := (graphDegreeSum_eq_graphDegree v G).symm

/-- The fixed set of possible edges incident to a vertex.  This is the finite
edge-coordinate index set used when reducing a random-graph degree to a
Bernoulli product observable. -/
def potentialIncidentEdges {V : Type*} (v : V) : Set (Sym2 V) :=
  (⊤ : SimpleGraph V).incidenceSet v

/-- Count the selected edges in the fixed potential incidence set. -/
def incidentEdgeCount {V : Type*} [Fintype V] (v : V) (G : SimpleGraph V) : ℕ :=
  (potentialIncidentEdges v ∩ G.edgeSet).ncard

theorem potentialIncidentEdges_inter_edgeSet {V : Type*} [Fintype V]
    (v : V) (G : SimpleGraph V) :
    potentialIncidentEdges v ∩ G.edgeSet = G.incidenceSet v := by
  classical
  ext e
  constructor
  · rintro ⟨⟨_, hv⟩, he⟩
    exact ⟨he, hv⟩
  · rintro ⟨he, hv⟩
    have heTop : e ∈ (⊤ : SimpleGraph V).edgeSet := by
      simpa [SimpleGraph.edgeSet] using G.not_isDiag_of_mem_edgeSet he
    exact ⟨⟨heTop, hv⟩, he⟩

theorem incidentEdgeCount_eq_degree {V : Type*} [Fintype V]
    (v : V) (G : SimpleGraph V) :
    incidentEdgeCount v G = @SimpleGraph.degree V G v (Fintype.ofFinite (G.neighborSet v)) := by
  classical
  letI : Fintype (G.neighborSet v) := Fintype.ofFinite _
  rw [incidentEdgeCount, potentialIncidentEdges_inter_edgeSet]
  simpa [Set.ncard_eq_toFinset_card'] using
    (SimpleGraph.card_incidenceSet_eq_degree G v).symm

/-- The canonical Erdős--Rényi law is a probability measure. -/
instance erdosRenyiModel.isProbabilityMeasure
    (n : ℕ) (p : Set.Icc (0 : ℝ) 1) :
    IsProbabilityMeasure (erdosRenyiModel n p).graphLaw := by
  dsimp [erdosRenyiModel]
  infer_instance

theorem erdosRenyiDegreeLaw
    (n : ℕ) (p : Set.Icc (0 : ℝ) 1) (v : Fin n) :
    HasLaw ((erdosRenyiModel n p).degree v)
      (graphBinomialLaw n p)
      (erdosRenyiModel n p).graphLaw := by
  have h := graphDegreeSum_hasLaw p v
  have hcongr :
      (erdosRenyiModel n p).degree v = graphDegreeSum v := by
    funext G
    exact erdosRenyiModel_degree_eq_graphDegreeSum n p v G
  have h' := h.congr (Filter.Eventually.of_forall (fun G => congrFun hcongr G))
  simpa [erdosRenyiModel] using h'

/-! The exact finite MGF of Mathlib's canonical binomial PMF. -/
theorem binomialMgfExact (n : ℕ) (p : Set.Icc (0 : ℝ) 1) (lam : ℝ) :
    (∫ k : Fin (n + 1), Real.exp (lam * (k : ℝ)) ∂
      (PMF.binomial (unitInterval.toNNReal p)
        (by change (p : ℝ) ≤ 1; exact p.2.2) n).toMeasure) =
      (1 - (p : ℝ) + (p : ℝ) * Real.exp lam) ^ n := by
  rw [PMF.integral_eq_sum]
  simp only [smul_eq_mul, PMF.binomial_apply]
  rw [Finset.sum_fin_eq_sum_range]
  simp only [Finset.sum_apply]
  have hpNN : unitInterval.toNNReal p ≤ 1 := by
    change (p : ℝ) ≤ 1
    exact p.2.2
  have hq :
      (1 - (unitInterval.toNNReal p : ℝ≥0∞)).toReal = 1 - (p : ℝ) := by
    rw [ENNReal.toReal_sub_of_le (by exact_mod_cast hpNN) ENNReal.one_ne_top]
    rfl
  rw [show 1 - (p : ℝ) + (p : ℝ) * Real.exp lam =
      ((p : ℝ) * Real.exp lam) + (1 - (p : ℝ)) by ring]
  rw [add_pow]
  apply Finset.sum_congr rfl
  intro x hx
  have hxn : x ≤ n := Nat.le_of_lt_succ (Finset.mem_range.mp hx)
  have hexp : Real.exp (lam * (x : ℝ)) = Real.exp lam ^ x := by
    rw [mul_comm, Real.exp_nat_mul]
  simp only [dif_pos (Nat.lt_succ_of_le hxn)]
  simp [hq, ENNReal.toReal_mul, hexp]
  ring

theorem binomialMgfBound (n : ℕ) (p : Set.Icc (0 : ℝ) 1) (lam : ℝ) :
    (∫ k : Fin (n + 1), Real.exp (lam * (k : ℝ)) ∂
      (PMF.binomial (unitInterval.toNNReal p)
        (by change (p : ℝ) ≤ 1; exact p.2.2) n).toMeasure) ≤
      Real.exp ((Real.exp lam - 1) * (n * (p : ℝ))) := by
  rw [binomialMgfExact]
  have hbase : 1 + (Real.exp lam - 1) * (p : ℝ) ≤
      Real.exp ((Real.exp lam - 1) * (p : ℝ)) := by
    simpa [add_comm] using
      Real.add_one_le_exp ((Real.exp lam - 1) * (p : ℝ))
  have hpow :
      (1 + (Real.exp lam - 1) * (p : ℝ)) ^ n ≤
        Real.exp ((Real.exp lam - 1) * (p : ℝ)) ^ n :=
    pow_le_pow_left₀ (by
      have hp0 : 0 ≤ (p : ℝ) := p.2.1
      have hp1 : (p : ℝ) ≤ 1 := p.2.2
      have hprod : -(p : ℝ) ≤ (Real.exp lam - 1) * (p : ℝ) := by
        have he : 0 ≤ Real.exp lam := (Real.exp_pos lam).le
        nlinarith [mul_le_mul_of_nonneg_right (by linarith) hp0]
      linarith [hp1, hprod]) hbase n
  calc
    (1 - (p : ℝ) + (p : ℝ) * Real.exp lam) ^ n =
        (1 + (Real.exp lam - 1) * (p : ℝ)) ^ n := by
      congr 1
      ring
    _ ≤ Real.exp ((Real.exp lam - 1) * (p : ℝ)) ^ n := hpow
    _ = Real.exp ((Real.exp lam - 1) * (n * (p : ℝ))) := by
      rw [← Real.exp_nat_mul]
      congr 1
      ring

private lemma exp_add_half_le_graph (δ : ℝ) (hδ0 : 0 ≤ δ) (hδ1 : δ ≤ 1) :
    Real.exp (δ / 2) ≤ 1 + δ / 2 + (δ / 2) ^ 2 := by
  have hrem := Real.abs_exp_sub_one_sub_id_le (x := δ / 2) (by
    calc
      |δ / 2| = δ / 2 := abs_of_nonneg (by positivity)
      _ ≤ 1 := by linarith)
  have hrem' : Real.exp (δ / 2) - 1 - δ / 2 ≤ (δ / 2) ^ 2 :=
    (le_abs_self _).trans hrem
  linarith

private lemma exp_neg_half_le_graph (δ : ℝ) (hδ0 : 0 ≤ δ) (hδ1 : δ ≤ 1) :
    Real.exp (-δ / 2) ≤ 1 - δ / 2 + (δ / 2) ^ 2 := by
  have hrem := Real.abs_exp_sub_one_sub_id_le (x := -δ / 2) (by
    calc
      |-δ / 2| = δ / 2 := by
        rw [abs_of_nonpos (by linarith)]
        ring
      _ ≤ 1 := by linarith)
  have hrem' : Real.exp (-δ / 2) - 1 - (-δ / 2) ≤ (-δ / 2) ^ 2 :=
    (le_abs_self _).trans hrem
  linarith

theorem binomialTwoSidedBound (m : ℕ) (p : Set.Icc (0 : ℝ) 1) {δ : ℝ}
    (hδ0 : 0 < δ) (hδ1 : δ ≤ 1) :
    let μ : Measure (Fin (m + 1)) :=
      (PMF.binomial (unitInterval.toNNReal p)
        (by change (p : ℝ) ≤ 1; exact p.2.2) m).toMeasure
    μ.real {k |
        δ * (m * (p : ℝ)) ≤ |(k : ℝ) - m * (p : ℝ)|} ≤
      2 * Real.exp (-(m * (p : ℝ)) * δ ^ 2 / 4) := by
  dsimp
  let μ : Measure (Fin (m + 1)) :=
    (PMF.binomial (unitInterval.toNNReal p)
      (by change (p : ℝ) ≤ 1; exact p.2.2) m).toMeasure
  let S : Fin (m + 1) → ℝ := fun k => (k : ℝ)
  let mr : ℝ := m * (p : ℝ)
  have hm : 0 ≤ mr := by
    dsimp [mr]
    exact mul_nonneg (by positivity) p.2.1
  have hS : Measurable S := by
    dsimp [S]
    exact measurable_of_finite _
  have hupper_mgf :
      (∫ k, Real.exp ((δ / 2) * S k) ∂μ) ≤
        Real.exp ((Real.exp (δ / 2) - 1) * mr) := by
    simpa [S, mr, μ] using binomialMgfBound m p (δ / 2)
  have hlower_mgf :
      (∫ k, Real.exp ((-δ / 2) * S k) ∂μ) ≤
        Real.exp ((Real.exp (-δ / 2) - 1) * mr) := by
    simpa [S, mr, μ] using binomialMgfBound m p (-δ / 2)
  have hupper_markov :=
    NumStability.HDP.Scalar.IndependentSums.Hoeffding.exponentialMarkovUpper
      (μ := μ) (S := S) (lam := δ / 2) (t := (1 + δ) * mr) hS (by linarith)
      (by exact Integrable.of_finite)
  have hlower_markov :=
    NumStability.HDP.Scalar.IndependentSums.Hoeffding.exponentialMarkovUpper
      (μ := μ) (S := fun k => -S k) (lam := δ / 2)
      (t := -(1 - δ) * mr) hS.neg (by linarith)
      (by exact Integrable.of_finite)
  have hupper_exp : Real.exp (δ / 2) ≤ 1 + δ / 2 + (δ / 2) ^ 2 :=
    exp_add_half_le_graph δ hδ0.le hδ1
  have hlower_exp : Real.exp (-δ / 2) ≤ 1 - δ / 2 + (δ / 2) ^ 2 :=
    exp_neg_half_le_graph δ hδ0.le hδ1
  have hupper_coeff :
      -(δ / 2 * ((1 + δ) * mr)) + (Real.exp (δ / 2) - 1) * mr ≤
        -(mr * δ ^ 2 / 4) := by
    have hcoeff :
        -(δ / 2 * (1 + δ)) + (Real.exp (δ / 2) - 1) ≤ -(δ ^ 2 / 4) := by
      nlinarith [hupper_exp]
    have := mul_le_mul_of_nonneg_right hcoeff hm
    nlinarith
  have hlower_coeff :
      -(δ / 2 * (-(1 - δ) * mr)) + (Real.exp (-δ / 2) - 1) * mr ≤
        -(mr * δ ^ 2 / 4) := by
    have hcoeff :
        (δ / 2) * (1 - δ) + (Real.exp (-δ / 2) - 1) ≤ -(δ ^ 2 / 4) := by
      nlinarith [hlower_exp]
    have := mul_le_mul_of_nonneg_right hcoeff hm
    nlinarith
  have hupper_raw : μ.real (S ⁻¹' Set.Ici ((1 + δ) * mr)) ≤
      Real.exp (-(δ / 2 * ((1 + δ) * mr))) *
        Real.exp ((Real.exp (δ / 2) - 1) * mr) := by
    apply le_trans hupper_markov
    apply mul_le_mul_of_nonneg_left _ (Real.exp_nonneg _)
    simpa [S, mr] using hupper_mgf
  have hlower_raw : μ.real ((fun k => -S k) ⁻¹' Set.Ici (-(1 - δ) * mr)) ≤
      Real.exp (-(δ / 2 * (-(1 - δ) * mr))) *
        Real.exp ((Real.exp (-δ / 2) - 1) * mr) := by
    apply le_trans hlower_markov
    apply mul_le_mul_of_nonneg_left _ (Real.exp_nonneg _)
    convert hlower_mgf using 1 <;> simp [S, mr] <;> ring
  have hupper : μ.real {k | (1 + δ) * mr ≤ S k} ≤
      Real.exp (-(mr * δ ^ 2 / 4)) := by
    rw [show {k | (1 + δ) * mr ≤ S k} = S ⁻¹' Set.Ici ((1 + δ) * mr) by rfl]
    refine hupper_raw.trans ?_
    rw [← Real.exp_add]
    exact Real.exp_le_exp.2 hupper_coeff
  have hlower : μ.real {k | S k ≤ (1 - δ) * mr} ≤
      Real.exp (-(mr * δ ^ 2 / 4)) := by
    have hset : {k | S k ≤ (1 - δ) * mr} =
        (fun k => -S k) ⁻¹' Set.Ici (-(1 - δ) * mr) := by
      ext k
      simp only [Set.mem_setOf_eq, Set.mem_preimage, Set.mem_Ici]
      constructor <;> intro h <;> linarith
    rw [hset]
    refine hlower_raw.trans ?_
    rw [← Real.exp_add]
    exact Real.exp_le_exp.2 hlower_coeff
  let U : Set (Fin (m + 1)) := {k | (1 + δ) * mr ≤ S k}
  let L : Set (Fin (m + 1)) := {k | S k ≤ (1 - δ) * mr}
  have hsubset : {k | δ * mr ≤ |S k - mr|} ⊆ U ∪ L := by
    intro k h
    change δ * mr ≤ |S k - mr| at h
    by_cases hu : (1 + δ) * mr ≤ S k
    · exact Or.inl hu
    · right
      have hnu : S k < (1 + δ) * mr := lt_of_not_ge hu
      by_contra hnl
      have hnl' : (1 - δ) * mr < S k := lt_of_not_ge hnl
      have habs : |S k - mr| < δ * mr := by
        rw [abs_lt]
        constructor <;> linarith
      exact (not_lt_of_ge h) habs
  have hmono {A B : Set (Fin (m + 1))} (hAB : A ⊆ B) : μ.real A ≤ μ.real B := by
    rw [Measure.real_def, Measure.real_def]
    exact ENNReal.toReal_mono (measure_ne_top μ B) (measure_mono hAB)
  have hunion : μ.real (U ∪ L) ≤ μ.real U + μ.real L := by
    rw [Measure.real_def, Measure.real_def, Measure.real_def]
    calc
      (μ (U ∪ L)).toReal ≤ (μ U + μ L).toReal := by
        apply ENNReal.toReal_mono
        · exact ENNReal.add_ne_top.mpr ⟨measure_ne_top μ U, measure_ne_top μ L⟩
        · exact measure_union_le U L
      _ = (μ U).toReal + (μ L).toReal :=
        ENNReal.toReal_add (measure_ne_top μ U) (measure_ne_top μ L)
  have hfinal : μ.real {k | δ * mr ≤ |S k - mr|} ≤
      2 * Real.exp (-mr * δ ^ 2 / 4) := by
    calc
      μ.real {k | δ * mr ≤ |S k - mr|} ≤ μ.real (U ∪ L) := hmono hsubset
      _ ≤ μ.real U + μ.real L := hunion
      _ ≤ Real.exp (-(mr * δ ^ 2 / 4)) + Real.exp (-(mr * δ ^ 2 / 4)) :=
        add_le_add (by simpa [U] using hupper) (by simpa [L] using hlower)
      _ = 2 * Real.exp (-mr * δ ^ 2 / 4) := by ring
  simpa [S, mr, μ] using hfinal

set_option maxHeartbeats 4000000 in
theorem erdosRenyiDegreeDeviationBound
    (n : ℕ) (p : Set.Icc (0 : ℝ) 1) (v : Fin n) {δ : ℝ}
    (hδ0 : 0 < δ) (hδ1 : δ ≤ 1) :
    (erdosRenyiModel n p).graphLaw.real {G |
        δ * ((n - 1) * (p : ℝ)) ≤
          |((erdosRenyiModel n p).degree v G : ℝ) - (n - 1) * (p : ℝ)|} ≤
      2 * Real.exp (-((n - 1) * (p : ℝ)) * δ ^ 2 / 4) := by
  let A : Set ℕ := {k |
    δ * ((n - 1) * (p : ℝ)) ≤ |(k : ℝ) - (n - 1) * (p : ℝ)|}
  have hA : MeasurableSet A := by
    exact (Set.to_countable A).measurableSet
  have hLaw := erdosRenyiDegreeLaw n p v
  have hn0 : n ≠ 0 := by
    intro hn0
    subst n
    exact Nat.not_lt_zero _ v.isLt
  have hn1 : 1 ≤ n := Nat.one_le_iff_ne_zero.mpr hn0
  have hsub : ((n - 1 : ℕ) : ℝ) = (n : ℝ) - 1 := by
    rw [Nat.cast_sub hn1]
    norm_num
  have hgraph :
      (erdosRenyiModel n p).graphLaw.real
          ((erdosRenyiModel n p).degree v ⁻¹' A) =
        (graphBinomialLaw n p).real A := by
    rw [Measure.real_def, Measure.real_def, ← hLaw.map_eq,
      Measure.map_apply_of_aemeasurable hLaw.aemeasurable hA]
  rw [show {G |
      δ * ((n - 1) * (p : ℝ)) ≤
        |((erdosRenyiModel n p).degree v G : ℝ) - (n - 1) * (p : ℝ)|} =
      ((erdosRenyiModel n p).degree v ⁻¹' A) by
        ext G
        rfl]
  rw [hgraph]
  rw [graphBinomialLaw]
  have hpmf :
      ((PMF.map (fun i : Fin (n - 1 + 1) => (i : ℕ))
          (PMF.binomial (unitInterval.toNNReal p)
            (by change (p : ℝ) ≤ 1; exact p.2.2) (n - 1))).toMeasure).real A =
        (PMF.binomial (unitInterval.toNNReal p)
          (by change (p : ℝ) ≤ 1; exact p.2.2) (n - 1)).toMeasure.real
          ((fun i : Fin (n - 1 + 1) => (i : ℕ)) ⁻¹' A) := by
    change (((PMF.map (fun i : Fin (n - 1 + 1) => (i : ℕ))
        (PMF.binomial (unitInterval.toNNReal p)
          (by change (p : ℝ) ≤ 1; exact p.2.2) (n - 1))).toMeasure A).toReal) =
      ((PMF.binomial (unitInterval.toNNReal p)
        (by change (p : ℝ) ≤ 1; exact p.2.2) (n - 1)).toMeasure
        ((fun i : Fin (n - 1 + 1) => (i : ℕ)) ⁻¹' A)).toReal
    rw [PMF.toMeasure_map_apply (p := PMF.binomial (unitInterval.toNNReal p)
      (by change (p : ℝ) ≤ 1; exact p.2.2) (n - 1))
      (f := fun i : Fin (n - 1 + 1) => (i : ℕ))
      A (measurable_of_countable _) hA]
  rw [hpmf]
  have hpre :
      (fun i : Fin (n - 1 + 1) => (i : ℕ)) ⁻¹' A =
        {i : Fin (n - 1 + 1) | δ * ((n - 1) * (p : ℝ)) ≤
          |((i : ℕ) : ℝ) - (n - 1) * (p : ℝ)|} := by
    ext i
    rfl
  rw [hpre]
  simpa [hsub] using (binomialTwoSidedBound (n - 1) p hδ0 hδ1)

theorem binomialUpperTailBound (m : ℕ) (p : Set.Icc (0 : ℝ) 1) {t : ℝ} :
    let μ : Measure (Fin (m + 1)) :=
      (PMF.binomial (unitInterval.toNNReal p)
        (by change (p : ℝ) ≤ 1; exact p.2.2) m).toMeasure
    μ.real {k | t ≤ (k : ℝ)} ≤
      Real.exp (-t + 2 * (m * (p : ℝ))) := by
  dsimp
  let μ : Measure (Fin (m + 1)) :=
    (PMF.binomial (unitInterval.toNNReal p)
      (by change (p : ℝ) ≤ 1; exact p.2.2) m).toMeasure
  let S : Fin (m + 1) → ℝ := fun k => (k : ℝ)
  have hS : Measurable S := by
    dsimp [S]
    exact measurable_of_finite _
  have hmgf :
      (∫ k, Real.exp (S k) ∂μ) ≤
        Real.exp ((Real.exp 1 - 1) * (m * (p : ℝ))) := by
    simpa [S, μ, one_mul] using binomialMgfBound m p 1
  have hmarkov :=
    NumStability.HDP.Scalar.IndependentSums.Hoeffding.exponentialMarkovUpper
      (μ := μ) (S := S) (lam := 1) (t := t) hS (by norm_num)
      (by exact Integrable.of_finite)
  have hraw : μ.real (S ⁻¹' Set.Ici t) ≤
      Real.exp (-t) * Real.exp ((Real.exp 1 - 1) * (m * (p : ℝ))) := by
    calc
      μ.real (S ⁻¹' Set.Ici t) ≤
          Real.exp (-t) * (∫ k, Real.exp (S k) ∂μ) := by
        simpa [S, one_mul] using hmarkov
      _ ≤ Real.exp (-t) *
          Real.exp ((Real.exp 1 - 1) * (m * (p : ℝ))) :=
        mul_le_mul_of_nonneg_left hmgf (Real.exp_nonneg _)
  calc
    μ.real {k | t ≤ (k : ℝ)} = μ.real (S ⁻¹' Set.Ici t) := by rfl
    _ ≤ Real.exp (-t) *
        Real.exp ((Real.exp 1 - 1) * (m * (p : ℝ))) := hraw
    _ = Real.exp (-t + (Real.exp 1 - 1) * (m * (p : ℝ))) := by
      rw [← Real.exp_add]
    _ ≤ Real.exp (-t + 2 * (m * (p : ℝ))) := by
      apply Real.exp_le_exp.2
      have hμ : 0 ≤ (m : ℝ) * (p : ℝ) :=
        mul_nonneg (Nat.cast_nonneg _) p.2.1
      have hexp : Real.exp 1 - 1 < 2 := by
        linarith [Real.exp_one_lt_three]
      nlinarith

theorem erdosRenyiDegreeUpperBound
    (n : ℕ) (p : Set.Icc (0 : ℝ) 1) (v : Fin n) {t : ℝ} :
    (erdosRenyiModel n p).graphLaw.real {G |
        t ≤ ((erdosRenyiModel n p).degree v G : ℝ)} ≤
      Real.exp (-t + 2 * ((n - 1) * (p : ℝ))) := by
  let A : Set ℕ := {k | t ≤ (k : ℝ)}
  have hA : MeasurableSet A := by
    exact (Set.to_countable A).measurableSet
  have hLaw := erdosRenyiDegreeLaw n p v
  have hn0 : n ≠ 0 := by
    intro hn0
    subst n
    exact Nat.not_lt_zero _ v.isLt
  have hn1 : 1 ≤ n := Nat.one_le_iff_ne_zero.mpr hn0
  have hsub : ((n - 1 : ℕ) : ℝ) = (n : ℝ) - 1 := by
    rw [Nat.cast_sub hn1]
    norm_num
  have hgraph :
      (erdosRenyiModel n p).graphLaw.real
          ((erdosRenyiModel n p).degree v ⁻¹' A) =
        (graphBinomialLaw n p).real A := by
    rw [Measure.real_def, Measure.real_def, ← hLaw.map_eq,
      Measure.map_apply_of_aemeasurable hLaw.aemeasurable hA]
  rw [show {G |
      t ≤ ((erdosRenyiModel n p).degree v G : ℝ)} =
      ((erdosRenyiModel n p).degree v ⁻¹' A) by
        ext G
        rfl]
  rw [hgraph, graphBinomialLaw]
  have hpmf :
      ((PMF.map (fun i : Fin (n - 1 + 1) => (i : ℕ))
          (PMF.binomial (unitInterval.toNNReal p)
            (by change (p : ℝ) ≤ 1; exact p.2.2) (n - 1))).toMeasure).real A =
        (PMF.binomial (unitInterval.toNNReal p)
          (by change (p : ℝ) ≤ 1; exact p.2.2) (n - 1)).toMeasure.real
          ((fun i : Fin (n - 1 + 1) => (i : ℕ)) ⁻¹' A) := by
    change (((PMF.map (fun i : Fin (n - 1 + 1) => (i : ℕ))
        (PMF.binomial (unitInterval.toNNReal p)
          (by change (p : ℝ) ≤ 1; exact p.2.2) (n - 1))).toMeasure A).toReal) =
      ((PMF.binomial (unitInterval.toNNReal p)
        (by change (p : ℝ) ≤ 1; exact p.2.2) (n - 1)).toMeasure
        ((fun i : Fin (n - 1 + 1) => (i : ℕ)) ⁻¹' A)).toReal
    rw [PMF.toMeasure_map_apply (p := PMF.binomial (unitInterval.toNNReal p)
      (by change (p : ℝ) ≤ 1; exact p.2.2) (n - 1))
      (f := fun i : Fin (n - 1 + 1) => (i : ℕ))
      A (measurable_of_countable _) hA]
  rw [hpmf]
  have hpre :
      (fun i : Fin (n - 1 + 1) => (i : ℕ)) ⁻¹' A =
        {i : Fin (n - 1 + 1) | t ≤ ((i : ℕ) : ℝ)} := by
    ext i
    rfl
  rw [hpre]
  simpa [hsub] using (binomialUpperTailBound (n - 1) p (t := t))

theorem binomialUpperTailMgfBound (m : ℕ) (p : Set.Icc (0 : ℝ) 1)
    {t lam : ℝ} (hlam : 0 < lam) :
    let μ : Measure (Fin (m + 1)) :=
      (PMF.binomial (unitInterval.toNNReal p)
        (by change (p : ℝ) ≤ 1; exact p.2.2) m).toMeasure
    μ.real {k | t ≤ (k : ℝ)} ≤
      Real.exp (-lam * t + (Real.exp lam - 1) * (m * (p : ℝ))) := by
  dsimp
  let μ : Measure (Fin (m + 1)) :=
    (PMF.binomial (unitInterval.toNNReal p)
      (by change (p : ℝ) ≤ 1; exact p.2.2) m).toMeasure
  let S : Fin (m + 1) → ℝ := fun k => (k : ℝ)
  have hS : Measurable S := by
    dsimp [S]
    exact measurable_of_finite _
  have hmgf :
      (∫ k, Real.exp (lam * S k) ∂μ) ≤
        Real.exp ((Real.exp lam - 1) * (m * (p : ℝ))) := by
    simpa [S, μ] using binomialMgfBound m p lam
  have hmarkov :=
    NumStability.HDP.Scalar.IndependentSums.Hoeffding.exponentialMarkovUpper
      (μ := μ) (S := S) (lam := lam) (t := t) hS hlam
      (by exact Integrable.of_finite)
  calc
    μ.real {k | t ≤ (k : ℝ)} = μ.real (S ⁻¹' Set.Ici t) := by rfl
    _ ≤ Real.exp (-lam * t) * (∫ k, Real.exp (lam * S k) ∂μ) := by
      simpa [S] using hmarkov
    _ ≤ Real.exp (-lam * t) *
        Real.exp ((Real.exp lam - 1) * (m * (p : ℝ))) :=
      mul_le_mul_of_nonneg_left hmgf (Real.exp_nonneg _)
    _ = Real.exp (-lam * t + (Real.exp lam - 1) * (m * (p : ℝ))) := by
      rw [← Real.exp_add]

theorem erdosRenyiDegreeUpperBoundAt
    (n : ℕ) (p : Set.Icc (0 : ℝ) 1) (v : Fin n)
    {t lam : ℝ} (hlam : 0 < lam) :
    (erdosRenyiModel n p).graphLaw.real {G |
        t ≤ ((erdosRenyiModel n p).degree v G : ℝ)} ≤
      Real.exp (-lam * t + (Real.exp lam - 1) * ((n - 1) * (p : ℝ))) := by
  let A : Set ℕ := {k | t ≤ (k : ℝ)}
  have hA : MeasurableSet A := by
    exact (Set.to_countable A).measurableSet
  have hLaw := erdosRenyiDegreeLaw n p v
  have hn0 : n ≠ 0 := by
    intro hn0
    subst n
    exact Nat.not_lt_zero _ v.isLt
  have hn1 : 1 ≤ n := Nat.one_le_iff_ne_zero.mpr hn0
  have hsub : ((n - 1 : ℕ) : ℝ) = (n : ℝ) - 1 := by
    rw [Nat.cast_sub hn1]
    norm_num
  have hgraph :
      (erdosRenyiModel n p).graphLaw.real
          ((erdosRenyiModel n p).degree v ⁻¹' A) =
        (graphBinomialLaw n p).real A := by
    rw [Measure.real_def, Measure.real_def, ← hLaw.map_eq,
      Measure.map_apply_of_aemeasurable hLaw.aemeasurable hA]
  rw [show {G |
      t ≤ ((erdosRenyiModel n p).degree v G : ℝ)} =
      ((erdosRenyiModel n p).degree v ⁻¹' A) by
        ext G
        rfl]
  rw [hgraph, graphBinomialLaw]
  have hpmf :
      ((PMF.map (fun i : Fin (n - 1 + 1) => (i : ℕ))
          (PMF.binomial (unitInterval.toNNReal p)
            (by change (p : ℝ) ≤ 1; exact p.2.2) (n - 1))).toMeasure).real A =
        (PMF.binomial (unitInterval.toNNReal p)
          (by change (p : ℝ) ≤ 1; exact p.2.2) (n - 1)).toMeasure.real
          ((fun i : Fin (n - 1 + 1) => (i : ℕ)) ⁻¹' A) := by
    change (((PMF.map (fun i : Fin (n - 1 + 1) => (i : ℕ))
        (PMF.binomial (unitInterval.toNNReal p)
          (by change (p : ℝ) ≤ 1; exact p.2.2) (n - 1))).toMeasure A).toReal) =
      ((PMF.binomial (unitInterval.toNNReal p)
        (by change (p : ℝ) ≤ 1; exact p.2.2) (n - 1)).toMeasure
        ((fun i : Fin (n - 1 + 1) => (i : ℕ)) ⁻¹' A)).toReal
    rw [PMF.toMeasure_map_apply (p := PMF.binomial (unitInterval.toNNReal p)
      (by change (p : ℝ) ≤ 1; exact p.2.2) (n - 1))
      (f := fun i : Fin (n - 1 + 1) => (i : ℕ))
      A (measurable_of_countable _) hA]
  rw [hpmf]
  have hpre :
      (fun i : Fin (n - 1 + 1) => (i : ℕ)) ⁻¹' A =
        {i : Fin (n - 1 + 1) | t ≤ ((i : ℕ) : ℝ)} := by
    ext i
    rfl
  rw [hpre]
  simpa [hsub] using (binomialUpperTailMgfBound (n - 1) p (t := t) hlam)

set_option maxHeartbeats 4000000 in
theorem erdosRenyiAlmostRegular
    (n : ℕ) (hn : 2 ≤ n) (p : Set.Icc (0 : ℝ) 1)
    (hd : 4000 * Real.log (n : ℝ) ≤ (n - 1) * (p : ℝ)) :
    (erdosRenyiModel n p).graphLaw.real {G |
        ∀ v : Fin n,
          |((erdosRenyiModel n p).degree v G : ℝ) - (n - 1) * (p : ℝ)| <
            ((n - 1) * (p : ℝ)) / 10} ≥ (9 : ℝ) / 10 := by
  let d : ℝ := (n - 1) * (p : ℝ)
  let P : Measure (SimpleGraph (Fin n)) := (erdosRenyiModel n p).graphLaw
  let Bad : Fin n → Set (SimpleGraph (Fin n)) := fun v =>
    {G | (1 / 10 : ℝ) * d ≤
      |((erdosRenyiModel n p).degree v G : ℝ) - d|}
  let Good : Set (SimpleGraph (Fin n)) := {G |
    ∀ v : Fin n,
      |((erdosRenyiModel n p).degree v G : ℝ) - d| < d / 10}
  have hbad_meas : ∀ v : Fin n, MeasurableSet (Bad v) := by
    intro v
    have heq : Bad v = {G |
        (1 / 10 : ℝ) * d ≤ |(graphDegreeSum v G : ℝ) - d|} := by
      ext G
      simp only [Bad, Set.mem_setOf_eq]
      rw [erdosRenyiModel_degree_eq_graphDegreeSum]
    rw [heq]
    have hcast : Measurable (fun k : ℕ => (k : ℝ)) := measurable_of_countable _
    have hmeas : Measurable (fun G : SimpleGraph (Fin n) =>
        |(graphDegreeSum v G : ℝ) - d|) := by
      exact ((hcast.comp (measurable_graphDegreeSum v)).sub measurable_const).abs
    exact hmeas (measurableSet_Ici)
  have hbad_each : ∀ v : Fin n, P.real (Bad v) ≤
      2 * Real.exp (-d / 400) := by
    intro v
    dsimp [P, Bad, d]
    convert erdosRenyiDegreeDeviationBound n p v
      (δ := (1 : ℝ) / 10) (by norm_num) (by norm_num) using 1 <;> ring
  have hbad_union : P.real (⋃ v, Bad v) ≤
      2 * (n : ℝ) * Real.exp (-d / 400) := by
    calc
      P.real (⋃ v, Bad v) ≤ ∑ v, P.real (Bad v) :=
        measureReal_iUnion_fintype_le (μ := P) Bad
      _ ≤ ∑ _v : Fin n, 2 * Real.exp (-d / 400) := by
        exact Finset.sum_le_sum (fun v _ => hbad_each v)
      _ = 2 * (n : ℝ) * Real.exp (-d / 400) := by
        simp
        ring
  have hnpos : 0 < (n : ℝ) := by
    exact_mod_cast (Nat.zero_lt_of_lt hn)
  have hn2 : (2 : ℝ) ≤ (n : ℝ) := by exact_mod_cast hn
  have hdexp : Real.exp (-d / 400) ≤
      Real.exp (-10 * Real.log (n : ℝ)) := by
    apply Real.exp_le_exp.2
    dsimp [d]
    nlinarith [hd]
  have hexp : Real.exp (-10 * Real.log (n : ℝ)) =
      ((n : ℝ) ^ 10)⁻¹ := by
    have hpow : Real.exp (10 * Real.log (n : ℝ)) = (n : ℝ) ^ 10 := by
      calc
        Real.exp (10 * Real.log (n : ℝ)) =
            Real.exp (Real.log (n : ℝ)) ^ 10 := by
          convert Real.exp_nat_mul (Real.log (n : ℝ)) 10 using 1 <;> norm_num
        _ = (n : ℝ) ^ 10 := by rw [Real.exp_log hnpos]
    rw [show -10 * Real.log (n : ℝ) = -(10 * Real.log (n : ℝ)) by ring,
      Real.exp_neg, hpow]
  have hpow9 : (2 : ℝ) ^ 9 ≤ (n : ℝ) ^ 9 :=
    pow_le_pow_left₀ (by norm_num) hn2 9
  have h20 : 20 * (n : ℝ) ≤ (n : ℝ) ^ 10 := by
    have hmul := mul_le_mul_of_nonneg_left hpow9 hnpos.le
    calc
      20 * (n : ℝ) ≤ 512 * (n : ℝ) := by nlinarith
      _ = (n : ℝ) * (2 : ℝ) ^ 9 := by ring
      _ ≤ (n : ℝ) * (n : ℝ) ^ 9 := hmul
      _ = (n : ℝ) ^ 10 := by ring
  have hsmall : 2 * (n : ℝ) * Real.exp (-d / 400) ≤ (1 : ℝ) / 10 := by
    have hpowpos : 0 < (n : ℝ) ^ 10 := by positivity
    have hdiv : 2 * (n : ℝ) / (n : ℝ) ^ 10 ≤ (1 : ℝ) / 10 := by
      rw [div_le_iff₀ hpowpos]
      nlinarith [h20]
    calc
      2 * (n : ℝ) * Real.exp (-d / 400) ≤
          2 * (n : ℝ) * Real.exp (-10 * Real.log (n : ℝ)) :=
        mul_le_mul_of_nonneg_left hdexp (by positivity)
      _ = 2 * (n : ℝ) / (n : ℝ) ^ 10 := by
        rw [hexp]
        simp [div_eq_mul_inv]
      _ ≤ (1 : ℝ) / 10 := hdiv
  have hbad_small : P.real (⋃ v, Bad v) ≤ (1 : ℝ) / 10 :=
    hbad_union.trans hsmall
  have hgood_eq : Good = (⋃ v, Bad v)ᶜ := by
    ext G
    simp only [Good, Bad, Set.mem_compl_iff, Set.mem_iUnion, Set.mem_setOf_eq]
    constructor
    · intro hG hbad
      rcases hbad with ⟨v, hv⟩
      exact (not_le_of_gt (hG v)) (by
        convert hv using 1 <;> ring)
    · intro hG v
      have hnot : ¬ (1 / 10 : ℝ) * d ≤
          |((erdosRenyiModel n p).degree v G : ℝ) - d| := by
        intro hv
        exact hG ⟨v, hv⟩
      exact (lt_of_not_ge (by
        convert hnot using 1 <;> ring))
  have hUmeas : MeasurableSet (⋃ v, Bad v) := by
    exact MeasurableSet.iUnion hbad_meas
  have hgoodprob : P.real Good ≥ (9 : ℝ) / 10 := by
    rw [hgood_eq, measureReal_compl hUmeas]
    have hP : P.real Set.univ = 1 := by
      simp [P]
    rw [hP]
    linarith
  simpa [P, Good, d] using hgoodprob

theorem erdosRenyiSparseMaxDegreeLogBound
    (p : ℕ → Set.Icc (0 : ℝ) 1) (C : ℝ) (hC : 0 ≤ C)
    (hbound : ∀ᶠ n in Filter.atTop,
      ((n - 1 : ℕ) : ℝ) * (p n : ℝ) ≤ C * Real.log (n : ℝ)) :
    ∀ᶠ n in Filter.atTop,
      (erdosRenyiModel n (p n)).graphLaw.real {G |
        ∀ v : Fin n,
          ((erdosRenyiModel n (p n)).degree v G : ℝ) <
            (2 * C + 5) * Real.log (n : ℝ)} ≥ (9 : ℝ) / 10 := by
  filter_upwards [hbound,
    Filter.eventually_atTop.2 ⟨3, fun n hn => hn⟩] with n hdn hn3
  let d : ℝ := ((n - 1 : ℕ) : ℝ) * (p n : ℝ)
  let T : ℝ := (2 * C + 5) * Real.log (n : ℝ)
  let P : Measure (SimpleGraph (Fin n)) := (erdosRenyiModel n (p n)).graphLaw
  let Bad : Fin n → Set (SimpleGraph (Fin n)) := fun v =>
    {G | T ≤ ((erdosRenyiModel n (p n)).degree v G : ℝ)}
  let Good : Set (SimpleGraph (Fin n)) := {G |
    ∀ v : Fin n,
      ((erdosRenyiModel n (p n)).degree v G : ℝ) < T}
  have hnpos : 0 < (n : ℝ) := by
    exact_mod_cast (Nat.zero_lt_of_lt hn3)
  have hn2 : (2 : ℝ) ≤ (n : ℝ) := by
    exact_mod_cast (show 2 ≤ n by omega)
  have hn1 : 1 ≤ n := by omega
  have hsub : ((n - 1 : ℕ) : ℝ) = (n : ℝ) - 1 := by
    rw [Nat.cast_sub hn1]
    norm_num
  have hlogpos : 0 < Real.log (n : ℝ) := by
    apply Real.log_pos
    exact_mod_cast (show 1 < n by omega)
  have hdn' : d ≤ C * Real.log (n : ℝ) := by
    simpa [d] using hdn
  have hbad_meas : ∀ v : Fin n, MeasurableSet (Bad v) := by
    intro v
    have heq : Bad v = {G |
        T ≤ (graphDegreeSum v G : ℝ)} := by
      ext G
      simp only [Bad, Set.mem_setOf_eq]
      rw [erdosRenyiModel_degree_eq_graphDegreeSum]
    rw [heq]
    have hcast : Measurable (fun k : ℕ => (k : ℝ)) := measurable_of_countable _
    have hmeas : Measurable (fun G : SimpleGraph (Fin n) =>
        (graphDegreeSum v G : ℝ)) := by
      exact hcast.comp (measurable_graphDegreeSum v)
    exact hmeas (measurableSet_Ici)
  have hbad_each : ∀ v : Fin n, P.real (Bad v) ≤
      Real.exp (-T + 2 * d) := by
    intro v
    dsimp [P, Bad, T, d]
    simpa [hsub] using (erdosRenyiDegreeUpperBound n (p n) v
      (t := (2 * C + 5) * Real.log (n : ℝ)))
  have hbad_union : P.real (⋃ v, Bad v) ≤
      (n : ℝ) * Real.exp (-T + 2 * d) := by
    calc
      P.real (⋃ v, Bad v) ≤ ∑ v, P.real (Bad v) :=
        measureReal_iUnion_fintype_le (μ := P) Bad
      _ ≤ ∑ _v : Fin n, Real.exp (-T + 2 * d) := by
        exact Finset.sum_le_sum (fun v _ => hbad_each v)
      _ = (n : ℝ) * Real.exp (-T + 2 * d) := by
        simp
  have hexp_tail : Real.exp (-T + 2 * d) ≤
      Real.exp (-5 * Real.log (n : ℝ)) := by
    apply Real.exp_le_exp.2
    dsimp [T]
    nlinarith [hdn']
  have hpow : Real.exp (5 * Real.log (n : ℝ)) = (n : ℝ) ^ 5 := by
    calc
      Real.exp (5 * Real.log (n : ℝ)) =
          Real.exp (Real.log (n : ℝ)) ^ 5 := by
        convert Real.exp_nat_mul (Real.log (n : ℝ)) 5 using 1 <;> norm_num
      _ = (n : ℝ) ^ 5 := by rw [Real.exp_log hnpos]
  have hexp5 : Real.exp (-5 * Real.log (n : ℝ)) =
      ((n : ℝ) ^ 5)⁻¹ := by
    rw [show -5 * Real.log (n : ℝ) = -(5 * Real.log (n : ℝ)) by ring,
      Real.exp_neg, hpow]
  have hpow4 : (2 : ℝ) ^ 4 ≤ (n : ℝ) ^ 4 :=
    pow_le_pow_left₀ (by norm_num) hn2 4
  have hpow4' : (16 : ℝ) ≤ (n : ℝ) ^ 4 := by
    norm_num at hpow4 ⊢
    exact hpow4
  have hten : 10 * (n : ℝ) ≤ (n : ℝ) ^ 5 := by
    have hmul := mul_le_mul_of_nonneg_left hpow4' hnpos.le
    calc
      10 * (n : ℝ) ≤ 16 * (n : ℝ) := by nlinarith
      _ ≤ (n : ℝ) * (n : ℝ) ^ 4 := by simpa [mul_comm] using hmul
      _ = (n : ℝ) ^ 5 := by ring
  have hsmall : (n : ℝ) * Real.exp (-5 * Real.log (n : ℝ)) ≤
      (1 : ℝ) / 10 := by
    have hpowpos : 0 < (n : ℝ) ^ 5 := by positivity
    have hdiv : (n : ℝ) / (n : ℝ) ^ 5 ≤ (1 : ℝ) / 10 := by
      rw [div_le_iff₀ hpowpos]
      nlinarith [hten]
    rw [hexp5]
    simpa [div_eq_mul_inv] using hdiv
  have hbad_small : P.real (⋃ v, Bad v) ≤ (1 : ℝ) / 10 :=
    hbad_union.trans <| by
      calc
        (n : ℝ) * Real.exp (-T + 2 * d) ≤
            (n : ℝ) * Real.exp (-5 * Real.log (n : ℝ)) :=
          mul_le_mul_of_nonneg_left hexp_tail hnpos.le
        _ ≤ (1 : ℝ) / 10 := hsmall
  have hgood_eq : Good = (⋃ v, Bad v)ᶜ := by
    ext G
    simp only [Good, Bad, Set.mem_compl_iff, Set.mem_iUnion, Set.mem_setOf_eq]
    constructor
    · intro hG hbad
      rcases hbad with ⟨v, hv⟩
      exact (not_le_of_gt (hG v)) hv
    · intro hG v
      exact lt_of_not_ge (fun hv => hG ⟨v, hv⟩)
  have hUmeas : MeasurableSet (⋃ v, Bad v) := by
    exact MeasurableSet.iUnion hbad_meas
  have hgoodprob : P.real Good ≥ (9 : ℝ) / 10 := by
    rw [hgood_eq, measureReal_compl hUmeas]
    have hP : P.real Set.univ = 1 := by
      simp [P]
    rw [hP]
    linarith
  simpa [P, Good, T] using hgoodprob

theorem erdosRenyiVerySparseMaxDegreeLogLogBound
    (p : ℕ → Set.Icc (0 : ℝ) 1) (C : ℝ) (hC : 0 ≤ C)
    (hbound : ∀ᶠ n in Filter.atTop,
      ((n - 1 : ℕ) : ℝ) * (p n : ℝ) ≤ C) :
    ∀ᶠ n in Filter.atTop,
      (erdosRenyiModel n (p n)).graphLaw.real {G |
        ∀ v : Fin n,
          ((erdosRenyiModel n (p n)).degree v G : ℝ) <
            (C + 5) * Real.log (n : ℝ) / Real.log (Real.log (n : ℝ))} ≥
      (9 : ℝ) / 10 := by
  filter_upwards [hbound,
    Filter.eventually_atTop.2 ⟨16, fun n hn => hn⟩] with n hdn hn16
  let d : ℝ := ((n - 1 : ℕ) : ℝ) * (p n : ℝ)
  let L : ℝ := Real.log (n : ℝ)
  let LL : ℝ := Real.log L
  let T : ℝ := (C + 5) * L / LL
  let lambda : ℝ := LL
  let P : Measure (SimpleGraph (Fin n)) := (erdosRenyiModel n (p n)).graphLaw
  let Bad : Fin n → Set (SimpleGraph (Fin n)) := fun v =>
    {G | T ≤ ((erdosRenyiModel n (p n)).degree v G : ℝ)}
  let Good : Set (SimpleGraph (Fin n)) := {G |
    ∀ v : Fin n,
      ((erdosRenyiModel n (p n)).degree v G : ℝ) < T}
  have hnpos : 0 < (n : ℝ) := by
    exact_mod_cast (Nat.zero_lt_of_lt hn16)
  have hn2 : (2 : ℝ) ≤ (n : ℝ) := by
    exact_mod_cast (show 2 ≤ n by omega)
  have hn3 : (3 : ℝ) ≤ (n : ℝ) := by
    exact_mod_cast (show 3 ≤ n by omega)
  have hn1 : 1 ≤ n := by omega
  have hsub : ((n - 1 : ℕ) : ℝ) = (n : ℝ) - 1 := by
    rw [Nat.cast_sub hn1]
    norm_num
  have hLpos : 0 < L := by
    dsimp [L]
    exact Real.log_pos (by exact_mod_cast (show 1 < n by omega))
  have hL1 : 1 < L := by
    dsimp [L]
    apply (Real.lt_log_iff_exp_lt hnpos).2
    exact lt_of_lt_of_le Real.exp_one_lt_three hn3
  have hLLpos : 0 < LL := by
    dsimp [LL]
    exact Real.log_pos hL1
  have hLLne : LL ≠ 0 := ne_of_gt hLLpos
  have hlam : 0 < lambda := by simpa [lambda] using hLLpos
  have hdn' : d ≤ C := by
    simpa [d] using hdn
  have hexpLambda : Real.exp lambda = L := by
    dsimp [lambda]
    rw [Real.exp_log hLpos]
  have hLLne' : Real.log (Real.log (n : ℝ)) ≠ 0 := by
    simpa [LL, L] using hLLne
  have hlambdaT : lambda * T = (C + 5) * L := by
    dsimp [lambda, T]
    field_simp [hLLne']
  have hdnonneg : 0 ≤ d := by
    dsimp [d]
    exact mul_nonneg (Nat.cast_nonneg _) (p n).2.1
  have hmul : (L - 1) * d ≤ (L - 1) * C := by
    apply mul_le_mul_of_nonneg_left hdn'
    linarith
  have hstep : (L - 1) * C ≤ L * C := by
    nlinarith [hC]
  have htail : -lambda * T + (Real.exp lambda - 1) * d ≤ -5 * L := by
    rw [show -lambda * T = -(lambda * T) by ring, hlambdaT, hexpLambda]
    nlinarith [hmul, hstep]
  have hbad_meas : ∀ v : Fin n, MeasurableSet (Bad v) := by
    intro v
    have heq : Bad v = {G |
        T ≤ (graphDegreeSum v G : ℝ)} := by
      ext G
      simp only [Bad, Set.mem_setOf_eq]
      rw [erdosRenyiModel_degree_eq_graphDegreeSum]
    rw [heq]
    have hcast : Measurable (fun k : ℕ => (k : ℝ)) := measurable_of_countable _
    have hmeas : Measurable (fun G : SimpleGraph (Fin n) =>
        (graphDegreeSum v G : ℝ)) := by
      exact hcast.comp (measurable_graphDegreeSum v)
    exact hmeas (measurableSet_Ici)
  have hbad_each : ∀ v : Fin n, P.real (Bad v) ≤
      Real.exp (-lambda * T + (Real.exp lambda - 1) * d) := by
    intro v
    dsimp [P, Bad, T, lambda, d, L, LL]
    simpa [hsub] using (erdosRenyiDegreeUpperBoundAt n (p n) v
      (t := (C + 5) * Real.log (n : ℝ) / Real.log (Real.log (n : ℝ)))
      (lam := Real.log (Real.log (n : ℝ))) hlam)
  have hbad_union : P.real (⋃ v, Bad v) ≤
      (n : ℝ) * Real.exp (-lambda * T + (Real.exp lambda - 1) * d) := by
    calc
      P.real (⋃ v, Bad v) ≤ ∑ v, P.real (Bad v) :=
        measureReal_iUnion_fintype_le (μ := P) Bad
      _ ≤ ∑ _v : Fin n,
          Real.exp (-lambda * T + (Real.exp lambda - 1) * d) := by
        exact Finset.sum_le_sum (fun v _ => hbad_each v)
      _ = (n : ℝ) * Real.exp (-lambda * T +
          (Real.exp lambda - 1) * d) := by
        simp
  have hexp_tail : Real.exp (-lambda * T + (Real.exp lambda - 1) * d) ≤
      Real.exp (-5 * L) := by
    exact Real.exp_le_exp.2 htail
  have hpow : Real.exp (5 * L) = (n : ℝ) ^ 5 := by
    dsimp [L]
    calc
      Real.exp (5 * Real.log (n : ℝ)) =
          Real.exp (Real.log (n : ℝ)) ^ 5 := by
        convert Real.exp_nat_mul (Real.log (n : ℝ)) 5 using 1 <;> norm_num
      _ = (n : ℝ) ^ 5 := by rw [Real.exp_log hnpos]
  have hexp5 : Real.exp (-5 * L) = ((n : ℝ) ^ 5)⁻¹ := by
    rw [show -5 * L = -(5 * L) by ring, Real.exp_neg, hpow]
  have hpow4 : (2 : ℝ) ^ 4 ≤ (n : ℝ) ^ 4 :=
    pow_le_pow_left₀ (by norm_num) hn2 4
  have hpow4' : (16 : ℝ) ≤ (n : ℝ) ^ 4 := by
    norm_num at hpow4 ⊢
    exact hpow4
  have hten : 10 * (n : ℝ) ≤ (n : ℝ) ^ 5 := by
    have hmul' := mul_le_mul_of_nonneg_left hpow4' hnpos.le
    calc
      10 * (n : ℝ) ≤ 16 * (n : ℝ) := by nlinarith
      _ ≤ (n : ℝ) * (n : ℝ) ^ 4 := by simpa [mul_comm] using hmul'
      _ = (n : ℝ) ^ 5 := by ring
  have hsmall : (n : ℝ) * Real.exp (-5 * L) ≤ (1 : ℝ) / 10 := by
    have hpowpos : 0 < (n : ℝ) ^ 5 := by positivity
    have hdiv : (n : ℝ) / (n : ℝ) ^ 5 ≤ (1 : ℝ) / 10 := by
      rw [div_le_iff₀ hpowpos]
      nlinarith [hten]
    rw [hexp5]
    simpa [div_eq_mul_inv] using hdiv
  have hbad_small : P.real (⋃ v, Bad v) ≤ (1 : ℝ) / 10 :=
    hbad_union.trans <| by
      calc
        (n : ℝ) * Real.exp (-lambda * T + (Real.exp lambda - 1) * d) ≤
            (n : ℝ) * Real.exp (-5 * L) :=
          mul_le_mul_of_nonneg_left hexp_tail hnpos.le
        _ ≤ (1 : ℝ) / 10 := hsmall
  have hgood_eq : Good = (⋃ v, Bad v)ᶜ := by
    ext G
    simp only [Good, Bad, Set.mem_compl_iff, Set.mem_iUnion, Set.mem_setOf_eq]
    constructor
    · intro hG hbad
      rcases hbad with ⟨v, hv⟩
      exact (not_le_of_gt (hG v)) hv
    · intro hG v
      exact lt_of_not_ge (fun hv => hG ⟨v, hv⟩)
  have hUmeas : MeasurableSet (⋃ v, Bad v) := by
    exact MeasurableSet.iUnion hbad_meas
  have hgoodprob : P.real Good ≥ (9 : ℝ) / 10 := by
    rw [hgood_eq, measureReal_compl hUmeas]
    have hP : P.real Set.univ = 1 := by
      simp [P]
    rw [hP]
    linarith
  simpa [P, Good, T, L, LL] using hgoodprob

end NumStability.HDP.Scalar.IndependentSums.Chernoff

namespace NumStability.HDP.Contract

theorem hdp_02_hlem_hpoisson_hadd
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X Y : Ω → ℕ} {r s : ℝ≥0}
    (hX : HasLaw X (ProbabilityTheory.poissonMeasure r) μ)
    (hY : HasLaw Y (ProbabilityTheory.poissonMeasure s) μ)
    (hXY : X ⟂ᵢ[μ] Y) :
    HasLaw (X + Y) (ProbabilityTheory.poissonMeasure (r + s)) μ :=
  NumStability.HDP.Scalar.IndependentSums.Chernoff.poissonAddLaw hX hY hXY

theorem hdp_02_hrem_h2_d3_d4 (rate : ℝ≥0) (hrate : 0 < rate) :
    (fun k : ℕ => ProbabilityTheory.poissonPMFReal rate k) ~[Filter.atTop]
      (fun k : ℕ =>
        Real.exp (-(rate : ℝ)) *
          (Real.exp 1 * (rate : ℝ) / (k : ℝ)) ^ k /
            Real.sqrt (2 * (k : ℝ) * Real.pi)) :=
  NumStability.HDP.Scalar.IndependentSums.Chernoff.poissonPointMass_isEquivalent_stirling
    rate hrate

theorem hdp_02_hthm_h2_d3_d1
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool} {p : ι → ℝ≥0}
    (hp : ∀ i, p i ≤ 1)
    (hB : iIndepFun B μ)
    (hLaw : ∀ i, HasLaw (B i) (PMF.bernoulli (p i) (hp i)).toMeasure μ)
    (hMeas : ∀ i, Measurable (B i))
    {t : ℝ}
    (hExp : ∀ i, Integrable
      (fun ω => Real.exp (Real.log (t / (∑ i, (p i : ℝ))) *
        (if B i ω then 1 else 0))) μ)
    (ht : ∑ i, (p i : ℝ) < t)
    (hμ : 0 < ∑ i, (p i : ℝ))
    (hExpS : Integrable
      (fun ω => Real.exp (Real.log (t / (∑ i, (p i : ℝ))) *
        ∑ i, (if B i ω then 1 else 0))) μ) :
    μ.real {ω | t ≤ ∑ i, (if B i ω then 1 else 0)} ≤
      Real.exp (-(∑ i, (p i : ℝ))) *
        ((Real.exp 1 * (∑ i, (p i : ℝ)) / t) ^ t) :=
  NumStability.HDP.Scalar.IndependentSums.Chernoff.poissonBinomialChernoffBound
    hp hB hLaw hMeas hExp ht hμ hExpS

theorem hdp_02_hex_h2_d3_d2
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool} {p : ι → ℝ≥0}
    (hp : ∀ i, p i ≤ 1)
    (hB : iIndepFun B μ)
    (hLaw : ∀ i, HasLaw (B i) (PMF.bernoulli (p i) (hp i)).toMeasure μ)
    (hMeas : ∀ i, Measurable (B i))
    {t : ℝ}
    (hExp : ∀ i, Integrable
      (fun ω => Real.exp ((-Real.log ((∑ i, (p i : ℝ)) / t)) *
        (if B i ω then 1 else 0))) μ)
    (ht : 0 < t)
    (htμ : t < ∑ i, (p i : ℝ))
    (hExpS : Integrable
      (fun ω => Real.exp (Real.log ((∑ i, (p i : ℝ)) / t) *
        (-∑ i, (if B i ω then 1 else 0)))) μ) :
    μ.real {ω | ∑ i, (if B i ω then 1 else 0) ≤ t} ≤
      Real.exp (-(∑ i, (p i : ℝ))) *
        ((Real.exp 1 * (∑ i, (p i : ℝ)) / t) ^ t) :=
  NumStability.HDP.Scalar.IndependentSums.Chernoff.poissonBinomialLowerChernoffBound
    hp hB hLaw hMeas hExp ht htμ hExpS

theorem hdp_02_hlem_hbernoulli_hmgf_hbound :
    NumStability.HDP.Scalar.IndependentSums.Chernoff.BernoulliMgfModelData :=
  NumStability.HDP.Scalar.IndependentSums.Chernoff.bernoulliMgfModel

theorem hdp_02_hlem_hbernoulli_hmgf_hbound_scalar
    (p : ℝ≥0) (hp : p ≤ 1) (lam : ℝ) :
    ((∫ b : Bool, Real.exp (lam * (if b then 1 else 0)) ∂
        (PMF.bernoulli p hp).toMeasure) =
        1 + (Real.exp lam - 1) * (p : ℝ)) ∧
      (1 + (Real.exp lam - 1) * (p : ℝ) ≤
        Real.exp ((Real.exp lam - 1) * (p : ℝ))) :=
  NumStability.HDP.Scalar.IndependentSums.Chernoff.bernoulliMgfBound p hp lam

theorem hdp_02_hlem_her_hdegree_hlaw
    (n : ℕ) (p : Set.Icc (0 : ℝ) 1) (v : Fin n) :
    HasLaw ((NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p).degree v)
      (NumStability.HDP.Scalar.IndependentSums.Chernoff.graphBinomialLaw n p)
      (NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p).graphLaw :=
  NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiDegreeLaw n p v

theorem hdp_02_hprop_h2_d4_d1
    (n : ℕ) (hn : 2 ≤ n) (p : Set.Icc (0 : ℝ) 1)
    (hd : 4000 * Real.log (n : ℝ) ≤ (n - 1) * (p : ℝ)) :
    (NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p).graphLaw.real
        {G |
          ∀ v : Fin n,
            |((NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p).degree v G : ℝ) -
                (n - 1) * (p : ℝ)| <
              ((n - 1) * (p : ℝ)) / 10} ≥ (9 : ℝ) / 10 :=
  NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiAlmostRegular n hn p hd

theorem hdp_02_hex_h2_d4_d2
    (p : ℕ → Set.Icc (0 : ℝ) 1) (C : ℝ) (hC : 0 ≤ C)
    (hbound : ∀ᶠ n in Filter.atTop,
      ((n - 1 : ℕ) : ℝ) * (p n : ℝ) ≤ C * Real.log (n : ℝ)) :
    ∀ᶠ n in Filter.atTop,
      (NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n (p n)).graphLaw.real
        {G |
          ∀ v : Fin n,
            ((NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n (p n)).degree v G : ℝ) <
              (2 * C + 5) * Real.log (n : ℝ)} ≥ (9 : ℝ) / 10 :=
  NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiSparseMaxDegreeLogBound
    p C hC hbound

theorem hdp_02_hex_h2_d4_d3
    (p : ℕ → Set.Icc (0 : ℝ) 1) (C : ℝ) (hC : 0 ≤ C)
    (hbound : ∀ᶠ n in Filter.atTop,
      ((n - 1 : ℕ) : ℝ) * (p n : ℝ) ≤ C) :
    ∀ᶠ n in Filter.atTop,
      (NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n (p n)).graphLaw.real
        {G |
          ∀ v : Fin n,
            ((NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n (p n)).degree v G : ℝ) <
              (C + 5) * Real.log (n : ℝ) / Real.log (Real.log (n : ℝ))} ≥
        (9 : ℝ) / 10 :=
  NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiVerySparseMaxDegreeLogLogBound
    p C hC hbound

end NumStability.HDP.Contract
```

### `NumStability.HDP.Scalar.IndependentSums.PoissonChernoff`

Path: `lean-numerical-stability/NumStability/HDP/Scalar/IndependentSums/PoissonChernoff.lean`
SHA-256: `0e1cac89e76542f620cfe16e38358a50be39cabdda0de40337c509528771f6df`

```lean
import NumStability.HDP.Scalar.IndependentSums.Chernoff
import Mathlib.MeasureTheory.Integral.Bochner.Set

/-! Chernoff foundations for the Poisson law. -/

noncomputable section

open MeasureTheory ProbabilityTheory
open scoped BigOperators ENNReal NNReal Function

namespace NumStability.HDP.Scalar.IndependentSums.PoissonChernoff

lemma poissonMeasureReal_singleton (rate : ℝ≥0) (n : ℕ) :
    (ProbabilityTheory.poissonMeasure rate).real {n} =
      ProbabilityTheory.poissonPMFReal rate n := by
  rw [Measure.real_def, ProbabilityTheory.poissonMeasure,
    PMF.toMeasure_apply_singleton _ n (measurableSet_singleton n)]
  rw [ProbabilityTheory.poissonPMF]
  exact ENNReal.toReal_ofReal ProbabilityTheory.poissonPMFReal_nonneg

theorem integrable_exp_nat_poisson (rate : ℝ≥0) (s : ℝ) :
    Integrable (fun n : ℕ => Real.exp (s * (n : ℝ)))
      (ProbabilityTheory.poissonMeasure rate) := by
  let f : ℕ → ℝ := fun n => Real.exp (s * (n : ℝ))
  have hsingle : ∀ n : ℕ, IntegrableOn f {n}
      (ProbabilityTheory.poissonMeasure rate) := by
    intro n
    exact integrableOn_singleton
  have hseries : Summable (fun n : ℕ =>
      Real.exp (-(rate : ℝ)) *
        (((rate : ℝ) * Real.exp s) ^ n / (Nat.factorial n : ℝ))) := by
    exact Summable.mul_left _
      (NormedSpace.expSeries_div_hasSum_exp ((rate : ℝ) * Real.exp s)).summable
  have hnorm : Summable (fun n : ℕ =>
      ∫ x : ℕ in ({n} : Set ℕ), ‖f x‖ ∂
        (ProbabilityTheory.poissonMeasure rate)) := by
    apply hseries.congr
    intro n
    rw [integral_singleton, poissonMeasureReal_singleton]
    simp only [smul_eq_mul, f, Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)]
    rw [ProbabilityTheory.poissonPMFReal]
    have hexp : Real.exp (s * (n : ℝ)) = Real.exp s ^ n := by
      rw [mul_comm, Real.exp_nat_mul]
    rw [hexp, mul_pow]
    ring
  have hunion : (⋃ n : ℕ, ({n} : Set ℕ)) = Set.univ := by
    ext n
    simp
  have h := integrableOn_iUnion_of_summable_integral_norm hsingle hnorm
  simpa [hunion, integrableOn_univ, f] using h

/-- The exact moment-generating function of a Poisson random variable. -/
theorem poissonMgfExact (rate : ℝ≥0) (s : ℝ) :
    (∫ n : ℕ, Real.exp (s * (n : ℝ)) ∂
        (ProbabilityTheory.poissonMeasure rate)) =
      Real.exp ((rate : ℝ) * (Real.exp s - 1)) := by
  rw [ProbabilityTheory.poissonMeasure]
  rw [PMF.integral_eq_tsum _ _ (integrable_exp_nat_poisson rate s)]
  simp_rw [smul_eq_mul]
  have hpmf (n : ℕ) :
      ((ProbabilityTheory.poissonPMF rate) n).toReal =
        ProbabilityTheory.poissonPMFReal rate n := by
    rw [ProbabilityTheory.poissonPMF]
    exact ENNReal.toReal_ofReal ProbabilityTheory.poissonPMFReal_nonneg
  simp_rw [hpmf]
  have hterm (n : ℕ) :
      ProbabilityTheory.poissonPMFReal rate n * Real.exp (s * (n : ℝ)) =
        Real.exp (-(rate : ℝ)) *
          (((rate : ℝ) * Real.exp s) ^ n / (Nat.factorial n : ℝ)) := by
    rw [ProbabilityTheory.poissonPMFReal]
    have hexp : Real.exp (s * (n : ℝ)) = Real.exp s ^ n := by
      rw [mul_comm, Real.exp_nat_mul]
    rw [hexp, mul_pow]
    ring
  calc
    (∑' n : ℕ, ProbabilityTheory.poissonPMFReal rate n *
        Real.exp (s * (n : ℝ))) =
        ∑' n : ℕ, Real.exp (-(rate : ℝ)) *
          (((rate : ℝ) * Real.exp s) ^ n / (Nat.factorial n : ℝ)) :=
      tsum_congr hterm
    _ = Real.exp (-(rate : ℝ)) *
        ∑' n : ℕ, (((rate : ℝ) * Real.exp s) ^ n /
          (Nat.factorial n : ℝ)) := tsum_mul_left
    _ = Real.exp (-(rate : ℝ)) *
        Real.exp ((rate : ℝ) * Real.exp s) := by
      congr 1
      exact
        (NormedSpace.expSeries_div_hasSum_exp
          ((rate : ℝ) * Real.exp s)).tsum_eq.trans
          (congr_fun Real.exp_eq_exp_ℝ ((rate : ℝ) * Real.exp s)).symm
    _ = Real.exp ((rate : ℝ) * (Real.exp s - 1)) := by
      rw [← Real.exp_add]
      congr 1
      ring

/-- Chernoff's upper-tail bound for a Poisson random variable. -/
theorem poissonChernoffUpper
    (rate : ℝ≥0) {t : ℝ} (ht : (rate : ℝ) < t) :
    (ProbabilityTheory.poissonMeasure rate).real {n : ℕ | t ≤ (n : ℝ)} ≤
      Real.exp (-(rate : ℝ)) *
        ((Real.exp 1 * (rate : ℝ) / t) ^ t) := by
  have ht0 : 0 < t := lt_of_le_of_lt (NNReal.coe_nonneg rate) ht
  by_cases hr0 : rate = 0
  · subst rate
    have hsub : {n : ℕ | t ≤ (n : ℝ)} ⊆ ({0} : Set ℕ)ᶜ := by
      intro n hn hn0
      simp only [Set.mem_singleton_iff] at hn0
      subst n
      norm_num at hn
      linarith
    have hmass0 :
        (ProbabilityTheory.poissonMeasure (0 : ℝ≥0)).real ({0} : Set ℕ) = 1 := by
      simpa [ProbabilityTheory.poissonPMFReal] using
        poissonMeasureReal_singleton (0 : ℝ≥0) 0
    have hcomp :
        (ProbabilityTheory.poissonMeasure (0 : ℝ≥0)).real ({0} : Set ℕ)ᶜ = 0 := by
      rw [probReal_compl_eq_one_sub (measurableSet_singleton 0), hmass0]
      norm_num
    have hevent :
        (ProbabilityTheory.poissonMeasure (0 : ℝ≥0)).real
          {n : ℕ | t ≤ (n : ℝ)} = 0 := by
      apply le_antisymm
      · exact (measureReal_mono hsub).trans_eq hcomp
      · positivity
    rw [hevent]
    positivity
  have hr : 0 < (rate : ℝ) := lt_of_le_of_ne (NNReal.coe_nonneg rate)
    (by exact_mod_cast Ne.symm hr0)
  let s : ℝ := Real.log (t / (rate : ℝ))
  have hs : 0 < s := by
    dsimp [s]
    apply Real.log_pos
    rw [one_lt_div hr]
    exact ht
  have hmarkov :=
    NumStability.HDP.Scalar.IndependentSums.Hoeffding.exponentialMarkovUpper
      (μ := ProbabilityTheory.poissonMeasure rate)
      (S := fun n : ℕ => (n : ℝ)) (lam := s) (t := t)
      (measurable_of_countable _) hs (integrable_exp_nat_poisson rate s)
  calc
    (ProbabilityTheory.poissonMeasure rate).real {n : ℕ | t ≤ (n : ℝ)} ≤
        Real.exp (-(s * t)) *
          (∫ n : ℕ, Real.exp (s * (n : ℝ)) ∂
            (ProbabilityTheory.poissonMeasure rate)) := by
      exact hmarkov
    _ = Real.exp (-(s * t)) *
        Real.exp ((rate : ℝ) * (Real.exp s - 1)) := by
      rw [poissonMgfExact]
    _ = Real.exp (-(rate : ℝ)) *
        ((Real.exp 1 * (rate : ℝ) / t) ^ t) := by
      have hratio : 0 < t / (rate : ℝ) := div_pos ht0 hr
      have hbase : 0 < Real.exp 1 * (rate : ℝ) / t :=
        div_pos (mul_pos (Real.exp_pos _) hr) ht0
      dsimp [s]
      rw [Real.exp_log hratio]
      rw [Real.rpow_def_of_pos hbase]
      rw [Real.log_div (mul_ne_zero (ne_of_gt (Real.exp_pos (1 : ℝ)))
        (ne_of_gt hr)) (ne_of_gt ht0)]
      rw [Real.log_mul (ne_of_gt (Real.exp_pos (1 : ℝ))) (ne_of_gt hr)]
      rw [Real.log_exp]
      rw [← Real.exp_add]
      rw [← Real.exp_add]
      congr 1
      rw [Real.log_div (ne_of_gt ht0) (ne_of_gt hr)]
      field_simp
      ring

private lemma exp_add_half_le (δ : ℝ) (hδ0 : 0 ≤ δ) (hδ1 : δ ≤ 1) :
    Real.exp (δ / 2) ≤ 1 + δ / 2 + (δ / 2) ^ 2 := by
  have hrem := Real.abs_exp_sub_one_sub_id_le (x := δ / 2) (by
    calc
      |δ / 2| = δ / 2 := abs_of_nonneg (by positivity)
      _ ≤ 1 := by linarith)
  have hrem' : Real.exp (δ / 2) - 1 - δ / 2 ≤ (δ / 2) ^ 2 :=
    (le_abs_self _).trans hrem
  linarith

private lemma exp_neg_half_le (δ : ℝ) (hδ0 : 0 ≤ δ) (hδ1 : δ ≤ 1) :
    Real.exp (-δ / 2) ≤ 1 - δ / 2 + (δ / 2) ^ 2 := by
  have hrem := Real.abs_exp_sub_one_sub_id_le (x := -δ / 2) (by
    calc
      |-δ / 2| = δ / 2 := by
        rw [abs_of_nonpos (by linarith)]
        ring
      _ ≤ 1 := by linarith)
  have hrem' : Real.exp (-δ / 2) - 1 - (-δ / 2) ≤ (-δ / 2) ^ 2 :=
    (le_abs_self _).trans hrem
  linarith

/-- A two-sided quadratic concentration bound for a Poisson law, with the
explicit universal constant `1 / 4`. -/
theorem poissonTwoSidedQuadraticBound
    (rate : ℝ≥0) {δ : ℝ} (hδ0 : 0 < δ) (hδ1 : δ ≤ 1) :
    (ProbabilityTheory.poissonMeasure rate).real
        {n : ℕ | δ * (rate : ℝ) ≤ |(n : ℝ) - (rate : ℝ)|} ≤
      2 * Real.exp (-(rate : ℝ) * δ ^ 2 / 4) := by
  let m : ℝ := rate
  have hm : 0 ≤ m := by positivity
  have hupper_markov :=
    NumStability.HDP.Scalar.IndependentSums.Hoeffding.exponentialMarkovUpper
      (μ := ProbabilityTheory.poissonMeasure rate)
      (S := fun n : ℕ => (n : ℝ)) (lam := δ / 2) (t := (1 + δ) * m)
      (measurable_of_countable _) (by linarith)
      (integrable_exp_nat_poisson rate (δ / 2))
  have hlower_markov :=
    NumStability.HDP.Scalar.IndependentSums.Hoeffding.exponentialMarkovUpper
      (μ := ProbabilityTheory.poissonMeasure rate)
      (S := fun n : ℕ => -(n : ℝ)) (lam := δ / 2) (t := -(1 - δ) * m)
      (measurable_of_countable _) (by linarith)
      (by
        convert integrable_exp_nat_poisson rate (-δ / 2) using 1
        ext n
        congr 1
        ring)
  have hupper_exp : Real.exp (δ / 2) ≤ 1 + δ / 2 + (δ / 2) ^ 2 :=
    exp_add_half_le δ hδ0.le hδ1
  have hlower_exp : Real.exp (-δ / 2) ≤ 1 - δ / 2 + (δ / 2) ^ 2 :=
    exp_neg_half_le δ hδ0.le hδ1
  have hupper_coeff :
      -(δ / 2 * ((1 + δ) * m)) + (Real.exp (δ / 2) - 1) * m ≤
        -(m * δ ^ 2 / 4) := by
    have hcoeff :
        -(δ / 2 * (1 + δ)) + (Real.exp (δ / 2) - 1) ≤
          -(δ ^ 2 / 4) := by
      nlinarith [hupper_exp]
    have := mul_le_mul_of_nonneg_right hcoeff hm
    nlinarith
  have hlower_coeff :
      -(δ / 2 * (-(1 - δ) * m)) + (Real.exp (-δ / 2) - 1) * m ≤
        -(m * δ ^ 2 / 4) := by
    have hcoeff :
        (δ / 2) * (1 - δ) + (Real.exp (-δ / 2) - 1) ≤
          -(δ ^ 2 / 4) := by
      nlinarith [hlower_exp]
    have := mul_le_mul_of_nonneg_right hcoeff hm
    nlinarith
  have hupper_raw :
      (ProbabilityTheory.poissonMeasure rate).real
          ((fun n : ℕ => (n : ℝ)) ⁻¹' Set.Ici ((1 + δ) * m)) ≤
        Real.exp (-(δ / 2 * ((1 + δ) * m))) *
          Real.exp ((Real.exp (δ / 2) - 1) * m) := by
    refine hupper_markov.trans_eq ?_
    rw [poissonMgfExact]
    congr 2
    dsimp [m]
    ring
  have hlower_raw :
      (ProbabilityTheory.poissonMeasure rate).real
          ((fun n : ℕ => -(n : ℝ)) ⁻¹' Set.Ici (-(1 - δ) * m)) ≤
        Real.exp (-(δ / 2 * (-(1 - δ) * m))) *
          Real.exp ((Real.exp (-δ / 2) - 1) * m) := by
    refine hlower_markov.trans_eq ?_
    have hint :
        (∫ n : ℕ, Real.exp (δ / 2 * -(n : ℝ)) ∂
            (ProbabilityTheory.poissonMeasure rate)) =
          Real.exp ((rate : ℝ) * (Real.exp (-δ / 2) - 1)) := by
      have hfun : (fun n : ℕ => Real.exp (δ / 2 * -(n : ℝ))) =
          (fun n : ℕ => Real.exp ((-δ / 2) * (n : ℝ))) := by
        funext n
        congr 1
        ring
      rw [hfun, poissonMgfExact]
    rw [hint]
    congr 2
    dsimp [m]
    ring
  have hupper :
      (ProbabilityTheory.poissonMeasure rate).real
          {n : ℕ | (1 + δ) * m ≤ (n : ℝ)} ≤
        Real.exp (-(m * δ ^ 2 / 4)) := by
    refine hupper_raw.trans ?_
    rw [← Real.exp_add]
    exact Real.exp_le_exp.2 hupper_coeff
  have hlower :
      (ProbabilityTheory.poissonMeasure rate).real
          {n : ℕ | (n : ℝ) ≤ (1 - δ) * m} ≤
        Real.exp (-(m * δ ^ 2 / 4)) := by
    have hset : {n : ℕ | (n : ℝ) ≤ (1 - δ) * m} =
        (fun n : ℕ => -(n : ℝ)) ⁻¹' Set.Ici (-(1 - δ) * m) := by
      ext n
      simp only [Set.mem_setOf_eq, Set.mem_preimage, Set.mem_Ici]
      constructor <;> intro h <;> linarith
    rw [hset]
    refine hlower_raw.trans ?_
    rw [← Real.exp_add]
    exact Real.exp_le_exp.2 hlower_coeff
  let U : Set ℕ := {n | (1 + δ) * m ≤ (n : ℝ)}
  let L : Set ℕ := {n | (n : ℝ) ≤ (1 - δ) * m}
  have hsubset : {n : ℕ | δ * m ≤ |(n : ℝ) - m|} ⊆ U ∪ L := by
    intro n hn
    by_cases hu : (1 + δ) * m ≤ (n : ℝ)
    · exact Or.inl hu
    · right
      have hnotupper : (n : ℝ) < (1 + δ) * m := lt_of_not_ge hu
      by_contra hnotlower
      have hlower' : (1 - δ) * m < (n : ℝ) := lt_of_not_ge hnotlower
      have habs : |(n : ℝ) - m| < δ * m := by
        rw [abs_lt]
        constructor <;> linarith
      exact (not_lt_of_ge hn) habs
  have hmono {A B : Set ℕ} (hAB : A ⊆ B) :
      (ProbabilityTheory.poissonMeasure rate).real A ≤
        (ProbabilityTheory.poissonMeasure rate).real B := by
    exact measureReal_mono hAB
  have hunion :
      (ProbabilityTheory.poissonMeasure rate).real (U ∪ L) ≤
        (ProbabilityTheory.poissonMeasure rate).real U +
          (ProbabilityTheory.poissonMeasure rate).real L := by
    rw [Measure.real_def, Measure.real_def, Measure.real_def]
    calc
      ((ProbabilityTheory.poissonMeasure rate) (U ∪ L)).toReal ≤
          ((ProbabilityTheory.poissonMeasure rate) U +
            (ProbabilityTheory.poissonMeasure rate) L).toReal := by
        apply ENNReal.toReal_mono
        · exact ENNReal.add_ne_top.mpr
            ⟨measure_ne_top _ U, measure_ne_top _ L⟩
        · exact measure_union_le U L
      _ = ((ProbabilityTheory.poissonMeasure rate) U).toReal +
          ((ProbabilityTheory.poissonMeasure rate) L).toReal :=
        ENNReal.toReal_add (measure_ne_top _ U) (measure_ne_top _ L)
  calc
    (ProbabilityTheory.poissonMeasure rate).real
        {n : ℕ | δ * (rate : ℝ) ≤ |(n : ℝ) - (rate : ℝ)|} ≤
        (ProbabilityTheory.poissonMeasure rate).real (U ∪ L) := by
      simpa [m] using hmono hsubset
    _ ≤ (ProbabilityTheory.poissonMeasure rate).real U +
        (ProbabilityTheory.poissonMeasure rate).real L := hunion
    _ ≤ Real.exp (-(m * δ ^ 2 / 4)) + Real.exp (-(m * δ ^ 2 / 4)) :=
      add_le_add (by simpa [U] using hupper) (by simpa [L] using hlower)
    _ = 2 * Real.exp (-(rate : ℝ) * δ ^ 2 / 4) := by
      dsimp [m]
      ring

/-! Exact foundations for the endpoint and sharpness discussion in Remark 2.3.4. -/

/-- The Stirling equivalent for a Poisson point mass also holds at rate zero.
At that endpoint both sides vanish eventually. -/
theorem poissonPointMass_isEquivalent_stirling_all (rate : ℝ≥0) :
    Asymptotics.IsEquivalent Filter.atTop
      (fun k : ℕ => ProbabilityTheory.poissonPMFReal rate k)
      (fun k : ℕ =>
        Real.exp (-(rate : ℝ)) *
          (Real.exp 1 * (rate : ℝ) / (k : ℝ)) ^ k /
            Real.sqrt (2 * (k : ℝ) * Real.pi)) := by
  rcases eq_or_lt_of_le (zero_le rate) with hrate | hrate
  · subst rate
    have hleft : (fun _ : ℕ => (0 : ℝ)) =ᶠ[Filter.atTop]
        (fun k : ℕ => ProbabilityTheory.poissonPMFReal (0 : ℝ≥0) k) := by
      filter_upwards [Filter.eventually_atTop.2
        ⟨1, fun _ hk => hk⟩] with k hk
      have hk0 : k ≠ 0 := Nat.ne_of_gt (lt_of_lt_of_le Nat.zero_lt_one hk)
      simp [ProbabilityTheory.poissonPMFReal, hk0]
    have hright : (fun _ : ℕ => (0 : ℝ)) =ᶠ[Filter.atTop]
        (fun k : ℕ =>
          Real.exp (-((0 : ℝ≥0) : ℝ)) *
            (Real.exp 1 * ((0 : ℝ≥0) : ℝ) / (k : ℝ)) ^ k /
              Real.sqrt (2 * (k : ℝ) * Real.pi)) := by
      filter_upwards [Filter.eventually_atTop.2
        ⟨1, fun _ hk => hk⟩] with k hk
      have hk0 : k ≠ 0 := Nat.ne_of_gt (lt_of_lt_of_le Nat.zero_lt_one hk)
      simp [hk0]
    exact (Asymptotics.IsEquivalent.refl.congr_left hleft).congr_right hright
  · exact
      NumStability.HDP.Scalar.IndependentSums.Chernoff.poissonPointMass_isEquivalent_stirling
        rate hrate

/-- A Poisson upper tail contains its first point mass and is bounded by the
matching Chernoff profile.  Together with Stirling's formula this is the exact
tail-versus-point comparison used to justify sharpness up to a square-root
factor. -/
theorem poissonPointMass_le_upperTail_le_chernoffProfile
    (rate : ℝ≥0) {k : ℕ} (hk : (rate : ℝ) < (k : ℝ)) :
    ProbabilityTheory.poissonPMFReal rate k ≤
        (ProbabilityTheory.poissonMeasure rate).real
          {n : ℕ | (k : ℝ) ≤ (n : ℝ)} ∧
      (ProbabilityTheory.poissonMeasure rate).real
          {n : ℕ | (k : ℝ) ≤ (n : ℝ)} ≤
        Real.exp (-(rate : ℝ)) *
          (Real.exp 1 * (rate : ℝ) / (k : ℝ)) ^ k := by
  constructor
  · rw [← poissonMeasureReal_singleton]
    apply measureReal_mono
    intro n hn
    have hn' : n = k := by
      simpa only [Set.mem_singleton_iff] using hn
    subst n
    change (k : ℝ) ≤ (k : ℝ)
    exact le_rfl
    · exact measure_ne_top _ _
  · simpa only [Real.rpow_natCast] using
      poissonChernoffUpper rate (t := (k : ℝ)) hk

end NumStability.HDP.Scalar.IndependentSums.PoissonChernoff
```
