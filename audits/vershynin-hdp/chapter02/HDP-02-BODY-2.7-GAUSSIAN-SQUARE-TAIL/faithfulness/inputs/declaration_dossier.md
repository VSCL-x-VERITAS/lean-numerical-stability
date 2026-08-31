# Declaration dossier for HDP-02-BODY-2.7-GAUSSIAN-SQUARE-TAIL

This dossier describes the theorem statement only. Its proof is excluded.
Interpret every dependency from its supplied declaration; names are not definitions.

## Proof-free source declaration

```lean
theorem hdp_02_hbody_h2_d7_hgaussian_hsquare_htail
    (t : ℝ) (ht : 0 < t) :
    standardNormalLaw.real {x : ℝ | x ^ 2 > t} =
        standardNormalLaw.real {x : ℝ | |x| > Real.sqrt t} ∧
      2 * (Real.sqrt (2 * Real.pi))⁻¹ *
            ((1 / Real.sqrt t - 1 / (Real.sqrt t) ^ 3) *
              Real.exp (-t / 2)) ≤
          standardNormalLaw.real {x : ℝ | x ^ 2 > t} ∧
        standardNormalLaw.real {x : ℝ | x ^ 2 > t} ≤
          2 * (Real.sqrt (2 * Real.pi))⁻¹ *
            ((1 / Real.sqrt t) * Real.exp (-t / 2))
```

## Elaborated target type

```lean
∀ (t : Real),
  Real.instLT.lt 0 t →
    And
      (Eq (NumStability.HDP.Scalar.LimitTheorems.standardNormalLaw.real (setOf fun x => GT.gt (instHPow.hPow x 2) t))
        (NumStability.HDP.Scalar.LimitTheorems.standardNormalLaw.real (setOf fun x => GT.gt (abs x) t.sqrt)))
      (And
        (Real.instLE.le
          (instHMul.hMul (instHMul.hMul 2 (Real.instInv.inv (instHMul.hMul 2 Real.pi).sqrt))
            (instHMul.hMul (instHSub.hSub (instHDiv.hDiv 1 t.sqrt) (instHDiv.hDiv 1 (instHPow.hPow t.sqrt 3)))
              (Real.exp (instHDiv.hDiv (Real.instNeg.neg t) 2))))
          (NumStability.HDP.Scalar.LimitTheorems.standardNormalLaw.real (setOf fun x => GT.gt (instHPow.hPow x 2) t)))
        (Real.instLE.le
          (NumStability.HDP.Scalar.LimitTheorems.standardNormalLaw.real (setOf fun x => GT.gt (instHPow.hPow x 2) t))
          (instHMul.hMul (instHMul.hMul 2 (Real.instInv.inv (instHMul.hMul 2 Real.pi).sqrt))
            (instHMul.hMul (instHDiv.hDiv 1 t.sqrt) (Real.exp (instHDiv.hDiv (Real.instNeg.neg t) 2))))))
```

## Fully explicit elaborated target type

```lean
∀ (t : Real)
  (ht : @LT.lt.{0} Real Real.instLT (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero)) t),
  And
    (@Eq.{1} Real
      (@MeasureTheory.Measure.real.{0} Real Real.measurableSpace NumStability.HDP.Scalar.LimitTheorems.standardNormalLaw
        (@setOf.{0} Real fun (x : Real) =>
          @GT.gt.{0} Real Real.instLT
            (@HPow.hPow.{0, 0, 0} Real Nat Real (@instHPow.{0, 0} Real Nat (@Monoid.toNatPow.{0} Real Real.instMonoid))
              x (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))))
            t))
      (@MeasureTheory.Measure.real.{0} Real Real.measurableSpace NumStability.HDP.Scalar.LimitTheorems.standardNormalLaw
        (@setOf.{0} Real fun (x : Real) =>
          @GT.gt.{0} Real Real.instLT (@abs.{0} Real Real.lattice Real.instAddGroup x) (Real.sqrt t))))
    (And
      (@LE.le.{0} Real Real.instLE
        (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
          (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
            (@OfNat.ofNat.{0} Real (nat_lit 2)
              (@instOfNatAtLeastTwo.{0} Real (nat_lit 2) Real.instNatCast
                (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                  (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))
            (@Inv.inv.{0} Real Real.instInv
              (Real.sqrt
                (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
                  (@OfNat.ofNat.{0} Real (nat_lit 2)
                    (@instOfNatAtLeastTwo.{0} Real (nat_lit 2) Real.instNatCast
                      (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                        (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))
                  Real.pi))))
          (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
            (@HSub.hSub.{0, 0, 0} Real Real Real (@instHSub.{0} Real Real.instSub)
              (@HDiv.hDiv.{0, 0, 0} Real Real Real
                (@instHDiv.{0} Real (@DivInvMonoid.toDiv.{0} Real Real.instDivInvMonoid))
                (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)) (Real.sqrt t))
              (@HDiv.hDiv.{0, 0, 0} Real Real Real
                (@instHDiv.{0} Real (@DivInvMonoid.toDiv.{0} Real Real.instDivInvMonoid))
                (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne))
                (@HPow.hPow.{0, 0, 0} Real Nat Real
                  (@instHPow.{0, 0} Real Nat (@Monoid.toNatPow.{0} Real Real.instMonoid)) (Real.sqrt t)
                  (@OfNat.ofNat.{0} Nat (nat_lit 3) (instOfNatNat (nat_lit 3))))))
            (Real.exp
              (@HDiv.hDiv.{0, 0, 0} Real Real Real
                (@instHDiv.{0} Real (@DivInvMonoid.toDiv.{0} Real Real.instDivInvMonoid))
                (@Neg.neg.{0} Real Real.instNeg t)
                (@OfNat.ofNat.{0} Real (nat_lit 2)
                  (@instOfNatAtLeastTwo.{0} Real (nat_lit 2) Real.instNatCast
                    (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                      (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))))))
        (@MeasureTheory.Measure.real.{0} Real Real.measurableSpace
          NumStability.HDP.Scalar.LimitTheorems.standardNormalLaw
          (@setOf.{0} Real fun (x : Real) =>
            @GT.gt.{0} Real Real.instLT
              (@HPow.hPow.{0, 0, 0} Real Nat Real
                (@instHPow.{0, 0} Real Nat (@Monoid.toNatPow.{0} Real Real.instMonoid)) x
                (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))))
              t)))
      (@LE.le.{0} Real Real.instLE
        (@MeasureTheory.Measure.real.{0} Real Real.measurableSpace
          NumStability.HDP.Scalar.LimitTheorems.standardNormalLaw
          (@setOf.{0} Real fun (x : Real) =>
            @GT.gt.{0} Real Real.instLT
              (@HPow.hPow.{0, 0, 0} Real Nat Real
                (@instHPow.{0, 0} Real Nat (@Monoid.toNatPow.{0} Real Real.instMonoid)) x
                (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))))
              t))
        (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
          (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
            (@OfNat.ofNat.{0} Real (nat_lit 2)
              (@instOfNatAtLeastTwo.{0} Real (nat_lit 2) Real.instNatCast
                (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                  (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))
            (@Inv.inv.{0} Real Real.instInv
              (Real.sqrt
                (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
                  (@OfNat.ofNat.{0} Real (nat_lit 2)
                    (@instOfNatAtLeastTwo.{0} Real (nat_lit 2) Real.instNatCast
                      (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                        (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))
                  Real.pi))))
          (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
            (@HDiv.hDiv.{0, 0, 0} Real Real Real
              (@instHDiv.{0} Real (@DivInvMonoid.toDiv.{0} Real Real.instDivInvMonoid))
              (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)) (Real.sqrt t))
            (Real.exp
              (@HDiv.hDiv.{0, 0, 0} Real Real Real
                (@instHDiv.{0} Real (@DivInvMonoid.toDiv.{0} Real Real.instDivInvMonoid))
                (@Neg.neg.{0} Real Real.instNeg t)
                (@OfNat.ofNat.{0} Real (nat_lit 2)
                  (@instOfNatAtLeastTwo.{0} Real (nat_lit 2) Real.instNatCast
                    (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                      (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))))))))
```

## Local import graph

- `AuditTarget` imports: `NumStability.HDP.ContractSignatures.C_02_hbody_h2_d7_hgaussian_hsquare_htail`, `NumStability.HDP.Scalar.GaussianSquareTail`
- `NumStability.HDP.Scalar.LimitTheorems` imports: `Mathlib.Probability.ProbabilityMassFunction.Binomial`, `Mathlib.Probability.ProbabilityMassFunction.Integrals`, `Mathlib.Probability.Distributions.Gaussian.Real`, `Mathlib.Probability.Distributions.Poisson`, `Mathlib.MeasureTheory.Function.ConvergenceInDistribution`, `Mathlib.Probability.StrongLaw`, `Mathlib.Tactic`
- `NumStability.HDP.ContractSignatures.C_02_hbody_h2_d7_hgaussian_hsquare_htail` imports: `NumStability.HDP.Scalar.LimitTheorems`
- `NumStability.HDP.Scalar.GaussianAtoms` imports: `NumStability.HDP.Scalar.LimitTheorems`
- `NumStability.HDP.Scalar.GaussianTails` imports: `NumStability.HDP.Scalar.LimitTheorems`
- `NumStability.HDP.Scalar.GaussianSquareTail` imports: `NumStability.HDP.Scalar.GaussianAtoms`, `NumStability.HDP.Scalar.GaussianTails`

## Semantic dependency inventory

`local` declarations are followed recursively through types and bodies. `external-frontier` declarations mark the one-level library trust boundary.

### D001: `NumStability.HDP.Scalar.LimitTheorems.standardNormalLaw`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.LimitTheorems`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D003: `DivInvMonoid.toDiv`

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

### D004: `Eq`

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

### D005: `GT.gt`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `6d958c76f324a8d3d32290da447408e6cc0e8b04b96c44db48baac18ccc7fb44`

Type:

```lean
{α : Type u} → [LT α] → α → α → Prop
```

Fully explicit type:

```lean
{α : Type u} → [LT.{u} α] → (a b : α) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : LT α] a b => inst.lt b a
```

### D006: `HDiv.hDiv`

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

### D007: `HMul.hMul`

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

### D008: `HPow.hPow`

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

### D009: `HSub.hSub`

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

### D010: `Inv.inv`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
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

### D011: `LE.le`

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

### D013: `MeasureTheory.Measure.real`

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

### D014: `Monoid.toNatPow`

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

### D015: `Nat`

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

### D016: `Nat.instAtLeastTwoHAddOfNat`

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

### D017: `Nat.instNeZeroSucc`

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

### D018: `Neg.neg`

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

### D019: `OfNat.ofNat`

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

### D020: `One.toOfNat1`

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

### D021: `Real`

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

### D022: `Real.exp`

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

### D023: `Real.instAddGroup`

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

### D024: `Real.instDivInvMonoid`

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

### D025: `Real.instInv`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D026: `Real.instLE`

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

### D027: `Real.instLT`

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

### D028: `Real.instMonoid`

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

### D029: `Real.instMul`

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

### D030: `Real.instNatCast`

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

### D031: `Real.instNeg`

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

### D032: `Real.instOne`

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

### D033: `Real.instSub`

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

### D034: `Real.instZero`

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

### D035: `Real.lattice`

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

### D036: `Real.measurableSpace`

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

### D037: `Real.pi`

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

### D038: `Real.sqrt`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Sqrt`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D039: `Zero.toOfNat0`

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

### D040: `abs`

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

### D041: `instHDiv`

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

### D042: `instHMul`

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

### D043: `instHPow`

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

### D044: `instHSub`

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

### D045: `instOfNatAtLeastTwo`

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

### D046: `instOfNatNat`

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

### D047: `setOf`

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

### D048: `MeasureTheory.Measure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `inductive`
- Distance from target type: `2`
- Semantic SHA-256: `ba8c23c70f3135407096406cee0b4d7d9f02d088e8b1d1a1e105071821a3a51b`

Type:

```lean
(α : Type u_6) → [MeasurableSpace α] → Type u_6
```

Fully explicit type:

```lean
(α : Type u_6) → [MeasurableSpace.{u_6} α] → Type u_6
```

### D049: `NNReal`

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

### D050: `ProbabilityTheory.gaussianReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.Distributions.Gaussian.Real`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D051: `instOneNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
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

### `NumStability.HDP.ContractSignatures.C_02_hbody_h2_d7_hgaussian_hsquare_htail`

Path: `lean-numerical-stability/NumStability/HDP/ContractSignatures/C_02_hbody_h2_d7_hgaussian_hsquare_htail.lean`
SHA-256: `cb2a32f25fe5b59c8a82a00de3c8c87d5909c0e57605b1ef1f195c42ebb72d8b`

```lean
import NumStability.HDP.Scalar.LimitTheorems

/-!
# Frozen contract for the Gaussian-square tail display in Section 2.7

The source suppresses the Mills-ratio prefactor.  This proof-free signature
pins a precise stronger form: the displayed event identity plus the exact
two-sided bounds inherited from Proposition 2.1.2.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Set
open scoped ENNReal NNReal

namespace NumStability.HDP.Contract

open NumStability.HDP.Scalar.LimitTheorems

def hdp_02_hbody_h2_d7_hgaussian_hsquare_htail__contract_type : Prop :=
  ∀ t : ℝ, 0 < t →
    standardNormalLaw.real {x : ℝ | x ^ 2 > t} =
        standardNormalLaw.real {x : ℝ | |x| > Real.sqrt t} ∧
      2 * (Real.sqrt (2 * Real.pi))⁻¹ *
            ((1 / Real.sqrt t - 1 / (Real.sqrt t) ^ 3) *
              Real.exp (-t / 2)) ≤
          standardNormalLaw.real {x : ℝ | x ^ 2 > t} ∧
        standardNormalLaw.real {x : ℝ | x ^ 2 > t} ≤
          2 * (Real.sqrt (2 * Real.pi))⁻¹ *
            ((1 / Real.sqrt t) * Real.exp (-t / 2))

end NumStability.HDP.Contract
```

### `NumStability.HDP.Scalar.GaussianAtoms`

Path: `lean-numerical-stability/NumStability/HDP/Scalar/GaussianAtoms.lean`
SHA-256: `64cfb0b74672bca1e8e472cb655b669b5739e17b4a4acd5d5a9aa474adfebbd0`

```lean
import NumStability.HDP.Scalar.LimitTheorems

/-!
# Gaussian atomlessness

Reusable singleton-mass consequences of the nondegenerate real Gaussian law.
Kept separate from the audited Gaussian-tail module so later atomlessness work
does not invalidate its completed source audits.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Set

namespace NumStability.HDP.Scalar.GaussianAtoms

open NumStability.HDP.Scalar.LimitTheorems

/-- Every singleton has literal zero `ℝ≥0∞` mass under the standard-normal law. -/
theorem standardNormalLaw_singleton (x : ℝ) :
    standardNormalLaw {x} = 0 := by
  letI : NoAtoms (gaussianReal 0 1) :=
    noAtoms_gaussianReal (by norm_num : (1 : NNReal) ≠ 0)
  rw [standardNormalLaw, measure_singleton]

/-- Real-valued corollary of `standardNormalLaw_singleton`. -/
theorem standardNormalLaw_real_singleton (x : ℝ) :
    standardNormalLaw.real {x} = 0 := by
  rw [Measure.real_def, standardNormalLaw_singleton, ENNReal.toReal_zero]

end NumStability.HDP.Scalar.GaussianAtoms
```

### `NumStability.HDP.Scalar.GaussianTails`

Path: `lean-numerical-stability/NumStability/HDP/Scalar/GaussianTails.lean`
SHA-256: `417ca3576e3175cbcba797e9509002102814edfaa50887e9ae186abd50ab8571`

```lean
import NumStability.HDP.Scalar.LimitTheorems

/-!
# Standard-normal tail estimates

Density and calculus foundations for the two-sided Mills-ratio estimate in
Proposition 2.1.2.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Set Filter
open scoped ENNReal NNReal Topology

namespace NumStability.HDP.Scalar.GaussianTails

open NumStability.HDP.Scalar.LimitTheorems

/-- The upper tail of the standard-normal law is the integral of its printed
density over the open ray.  The endpoint does not matter because Lebesgue
measure has no atoms. -/
theorem standardNormalTail_eq_densityIntegral (t : ℝ) :
    standardNormalLaw.real (Ici t) =
      (Real.sqrt (2 * Real.pi))⁻¹ *
        ∫ x in Ioi t, Real.exp (-(x ^ 2) / 2) := by
  rw [Measure.real_def, standardNormalLaw,
    gaussianReal_apply_eq_integral 0 (by norm_num : (1 : ℝ≥0) ≠ 0) (Ici t)]
  rw [ENNReal.toReal_ofReal (integral_nonneg fun x ↦ gaussianPDFReal_nonneg 0 1 x)]
  rw [standardNormalLaw_pdf, integral_const_mul]
  rw [integral_Ici_eq_integral_Ioi]

/-- The elementary antiderivative identity used in the upper Gaussian-tail
bound. -/
theorem integral_Ioi_mul_exp_neg_sq_div_two (t : ℝ) :
    ∫ x in Ioi t, x * Real.exp (-(x ^ 2) / 2) =
      Real.exp (-(t ^ 2) / 2) := by
  let f : ℝ → ℝ := fun x ↦ -Real.exp (-(x ^ 2) / 2)
  let f' : ℝ → ℝ := fun x ↦ x * Real.exp (-(x ^ 2) / 2)
  have hderiv : ∀ x : ℝ, HasDerivAt f (f' x) x := by
    intro x
    have h := ((hasDerivAt_pow 2 x).const_mul (-(1 / 2 : ℝ))).exp.neg
    dsimp [f, f']
    convert h using 1
    · ext y
      congr 1
      ring
    · simp
      ring
  have hint : IntegrableOn f' (Ioi t) := by
    have h : IntegrableOn (fun x : ℝ ↦ x * Real.exp (-(1 / 2 : ℝ) * x ^ 2))
        (Ioi t) := (integrable_mul_exp_neg_mul_sq
          (by norm_num : (0 : ℝ) < 1 / 2)).integrableOn
    apply h.congr
    filter_upwards [] with x
    dsimp [f']
    congr 1
    ring
  have htend : Tendsto f atTop (𝓝 0) := by
    have hpow : Tendsto (fun x : ℝ ↦ x ^ 2) atTop atTop :=
      tendsto_pow_atTop (by norm_num)
    have hinner : Tendsto (fun x : ℝ ↦ -(1 / 2 : ℝ) * x ^ 2) atTop atBot :=
      hpow.const_mul_atTop_of_neg (by norm_num)
    have hexp : Tendsto (fun x : ℝ ↦ Real.exp (-(1 / 2 : ℝ) * x ^ 2))
        atTop (𝓝 0) := Real.tendsto_exp_atBot.comp hinner
    convert hexp.neg using 1
    · ext x
      dsimp [f]
      congr 2
      ring
    · simp
  have hftc := integral_Ioi_of_hasDerivAt_of_tendsto'
    (fun x _ ↦ hderiv x) hint htend
  simpa only [f, f', zero_sub, neg_neg] using hftc

/-- Integration by parts for the unnormalized second moment on a Gaussian
upper tail.  This is the calculus identity behind Exercise 2.1.4. -/
theorem integral_Ioi_sq_mul_exp_neg_sq_div_two (t : ℝ) (ht : 0 < t) :
    (∫ x in Ioi t, x ^ 2 * Real.exp (-(x ^ 2) / 2)) =
      t * Real.exp (-(t ^ 2) / 2) +
        ∫ x in Ioi t, Real.exp (-(x ^ 2) / 2) := by
  have hgauss : IntegrableOn (fun x : ℝ ↦ Real.exp (-(x ^ 2) / 2)) (Ioi t) := by
    have h : IntegrableOn (fun x : ℝ ↦ Real.exp (-(1 / 2 : ℝ) * x ^ 2))
        (Ioi t) := (integrable_exp_neg_mul_sq
          (by norm_num : (0 : ℝ) < 1 / 2)).integrableOn
    apply h.congr
    filter_upwards [] with x
    apply congrArg Real.exp
    ring
  have hsq : IntegrableOn
      (fun x : ℝ ↦ x ^ 2 * Real.exp (-(x ^ 2) / 2)) (Ioi t) := by
    have hraw := integrableOn_rpow_mul_exp_neg_mul_sq
      (b := (1 / 2 : ℝ)) (s := (2 : ℝ)) (by norm_num) (by norm_num)
    have hsub : Ioi t ⊆ Ioi (0 : ℝ) := Ioi_subset_Ioi ht.le
    apply (hraw.mono_set hsub).congr
    filter_upwards [] with x
    rw [Real.rpow_two]
    congr 2
    ring
  let f : ℝ → ℝ := fun x ↦ -(x * Real.exp (-(x ^ 2) / 2))
  let f' : ℝ → ℝ := fun x ↦ (x ^ 2 - 1) * Real.exp (-(x ^ 2) / 2)
  have hderiv : ∀ x : ℝ, HasDerivAt f (f' x) x := by
    intro x
    have hexp := ((hasDerivAt_pow 2 x).const_mul (-(1 / 2 : ℝ))).exp
    dsimp [f, f']
    convert ((hasDerivAt_id x).mul hexp).neg using 1
    · ext y
      congr 2
      ring
    · simp
      ring
  have hf'int : IntegrableOn f' (Ioi t) := by
    apply (hsq.sub hgauss).congr
    filter_upwards [] with x
    dsimp [f']
    ring
  have htend : Tendsto f atTop (𝓝 0) := by
    have hdecay : Tendsto
        (fun x : ℝ ↦ x ^ (1 : ℝ) * Real.exp (-(1 / 2 : ℝ) * x ^ 2))
        atTop (𝓝 0) :=
      (rpow_mul_exp_neg_mul_sq_isLittleO_exp_neg
        (by norm_num : (0 : ℝ) < 1 / 2) 1).tendsto_zero_of_tendsto
        (Real.tendsto_exp_atBot.comp
          (tendsto_id.const_mul_atTop_of_neg (by norm_num : -(1 / 2 : ℝ) < 0)))
    have hmul : Tendsto
        (fun x : ℝ ↦ x * Real.exp (-(x ^ 2) / 2)) atTop (𝓝 0) := by
      apply hdecay.congr'
      filter_upwards [eventually_gt_atTop 0] with x hx
      rw [Real.rpow_one]
      congr 2
      ring
    simpa only [f, neg_zero] using hmul.neg
  have hmain :
      (∫ x in Ioi t, (x ^ 2 - 1) * Real.exp (-(x ^ 2) / 2)) =
        t * Real.exp (-(t ^ 2) / 2) := by
    have hftc := integral_Ioi_of_hasDerivAt_of_tendsto'
      (fun x _ ↦ hderiv x) hf'int htend
    simpa only [f, f', zero_sub, neg_neg] using hftc
  calc
    (∫ x in Ioi t, x ^ 2 * Real.exp (-(x ^ 2) / 2)) =
        ∫ x in Ioi t,
          (x ^ 2 - 1) * Real.exp (-(x ^ 2) / 2) +
            Real.exp (-(x ^ 2) / 2) := by
      apply integral_congr_ae
      filter_upwards [] with x
      ring
    _ = (∫ x in Ioi t, (x ^ 2 - 1) * Real.exp (-(x ^ 2) / 2)) +
          ∫ x in Ioi t, Real.exp (-(x ^ 2) / 2) :=
      integral_add hf'int hgauss
    _ = t * Real.exp (-(t ^ 2) / 2) +
          ∫ x in Ioi t, Real.exp (-(x ^ 2) / 2) := by rw [hmain]

/-- The upper half of the unnormalized Mills-ratio estimate. -/
theorem gaussianIntegral_Ioi_le (t : ℝ) (ht : 0 < t) :
    (∫ x in Ioi t, Real.exp (-(x ^ 2) / 2)) ≤
      (1 / t) * Real.exp (-(t ^ 2) / 2) := by
  have hgauss : IntegrableOn (fun x : ℝ ↦ Real.exp (-(x ^ 2) / 2)) (Ioi t) := by
    have h : IntegrableOn (fun x : ℝ ↦ Real.exp (-(1 / 2 : ℝ) * x ^ 2))
        (Ioi t) := (integrable_exp_neg_mul_sq
          (by norm_num : (0 : ℝ) < 1 / 2)).integrableOn
    apply h.congr
    filter_upwards [] with x
    apply congrArg Real.exp
    ring
  have hscaled : IntegrableOn
      (fun x : ℝ ↦ (1 / t) * (x * Real.exp (-(x ^ 2) / 2))) (Ioi t) := by
    have hmul : IntegrableOn (fun x : ℝ ↦ x * Real.exp (-(x ^ 2) / 2)) (Ioi t) := by
      have h : IntegrableOn (fun x : ℝ ↦ x * Real.exp (-(1 / 2 : ℝ) * x ^ 2))
          (Ioi t) := (integrable_mul_exp_neg_mul_sq
            (by norm_num : (0 : ℝ) < 1 / 2)).integrableOn
      apply h.congr
      filter_upwards [] with x
      congr 2
      ring
    exact hmul.const_mul _
  calc
    (∫ x in Ioi t, Real.exp (-(x ^ 2) / 2)) ≤
        ∫ x in Ioi t, (1 / t) * (x * Real.exp (-(x ^ 2) / 2)) := by
      apply setIntegral_mono_on hgauss hscaled measurableSet_Ioi
      intro x hx
      have hratio : 1 ≤ (1 / t) * x := by
        have h' : 1 ≤ x / t := (le_div_iff₀ ht).2 (by simpa using le_of_lt hx)
        simpa [div_eq_mul_inv, mul_comm] using h'
      nlinarith [Real.exp_pos (-(x ^ 2) / 2)]
    _ = (1 / t) * ∫ x in Ioi t, x * Real.exp (-(x ^ 2) / 2) := by
      rw [integral_const_mul]
    _ = (1 / t) * Real.exp (-(t ^ 2) / 2) := by
      rw [integral_Ioi_mul_exp_neg_sq_div_two]

/-- Integration by parts with `x ↦ exp (-x² / 2) / x`.  This identity gives a
slightly stronger lower Mills-ratio bound than the one printed in Proposition
2.1.2. -/
theorem integral_Ioi_one_add_inv_sq_mul_exp_neg_sq_div_two (t : ℝ) (ht : 0 < t) :
    (∫ x in Ioi t, (1 + 1 / x ^ 2) * Real.exp (-(x ^ 2) / 2)) =
      (1 / t) * Real.exp (-(t ^ 2) / 2) := by
  let f : ℝ → ℝ := fun x ↦ -(x⁻¹ * Real.exp (-(x ^ 2) / 2))
  let f' : ℝ → ℝ := fun x ↦ (1 + 1 / x ^ 2) * Real.exp (-(x ^ 2) / 2)
  have hderiv : ∀ x ∈ Ici t, HasDerivAt f (f' x) x := by
    intro x hx
    have hxpos : 0 < x := ht.trans_le hx
    have hexp := ((hasDerivAt_pow 2 x).const_mul (-(1 / 2 : ℝ))).exp
    have hinv := hasDerivAt_inv hxpos.ne'
    dsimp [f, f']
    convert (hinv.mul hexp).neg using 1
    · ext y
      congr 2
      ring
    · field_simp
      ring
  have hnonneg : ∀ x ∈ Ioi t, 0 ≤ f' x := by
    intro x hx
    dsimp [f']
    positivity
  have htend : Tendsto f atTop (𝓝 0) := by
    have hpow : Tendsto (fun x : ℝ ↦ x ^ 2) atTop atTop :=
      tendsto_pow_atTop (by norm_num)
    have hinner : Tendsto (fun x : ℝ ↦ -(1 / 2 : ℝ) * x ^ 2) atTop atBot :=
      hpow.const_mul_atTop_of_neg (by norm_num)
    have hexp : Tendsto (fun x : ℝ ↦ Real.exp (-(1 / 2 : ℝ) * x ^ 2))
        atTop (𝓝 0) := Real.tendsto_exp_atBot.comp hinner
    have hprod := (tendsto_inv_atTop_zero :
      Tendsto (fun x : ℝ ↦ x⁻¹) atTop (𝓝 0)).mul hexp
    convert hprod.neg using 1
    · ext x
      dsimp [f]
      congr 3
      ring
    · simp
  have hftc := integral_Ioi_of_hasDerivAt_of_nonneg' hderiv hnonneg htend
  simpa only [f, f', zero_sub, neg_neg, one_div] using hftc

/-- The lower half of the unnormalized Mills-ratio estimate, in the exact form
printed in Proposition 2.1.2. -/
theorem gaussianIntegral_Ioi_ge (t : ℝ) (ht : 0 < t) :
    (1 / t - 1 / t ^ 3) * Real.exp (-(t ^ 2) / 2) ≤
      ∫ x in Ioi t, Real.exp (-(x ^ 2) / 2) := by
  have hgauss : IntegrableOn (fun x : ℝ ↦ Real.exp (-(x ^ 2) / 2)) (Ioi t) := by
    have h : IntegrableOn (fun x : ℝ ↦ Real.exp (-(1 / 2 : ℝ) * x ^ 2))
        (Ioi t) := (integrable_exp_neg_mul_sq
          (by norm_num : (0 : ℝ) < 1 / 2)).integrableOn
    apply h.congr
    filter_upwards [] with x
    apply congrArg Real.exp
    ring
  let c : ℝ := 1 + 1 / t ^ 2
  have hcpos : 0 < c := by
    dsimp [c]
    positivity
  have hscaled : IntegrableOn
      (fun x : ℝ ↦ c * Real.exp (-(x ^ 2) / 2)) (Ioi t) := hgauss.const_mul c
  have hpoint : ∀ x ∈ Ioi t,
      (1 + 1 / x ^ 2) * Real.exp (-(x ^ 2) / 2) ≤
        c * Real.exp (-(x ^ 2) / 2) := by
    intro x hx
    have hxpos : 0 < x := ht.trans hx
    have hsq : t ^ 2 ≤ x ^ 2 :=
      (sq_le_sq₀ ht.le hxpos.le).2 (le_of_lt hx)
    have hinv : 1 / x ^ 2 ≤ 1 / t ^ 2 :=
      one_div_le_one_div_of_le (sq_pos_of_pos ht) hsq
    exact mul_le_mul_of_nonneg_right (by simpa [c] using add_le_add_left hinv 1)
      (Real.exp_pos _).le
  have hleft : IntegrableOn
      (fun x : ℝ ↦ (1 + 1 / x ^ 2) * Real.exp (-(x ^ 2) / 2)) (Ioi t) := by
    apply Integrable.mono hscaled
    · have hcont : ContinuousOn
          (fun x : ℝ ↦ (1 + 1 / x ^ 2) * Real.exp (-(x ^ 2) / 2)) (Ioi t) := by
        intro x hx
        have hx0 : x ≠ 0 := (ht.trans hx).ne'
        have hinvcont : ContinuousAt (fun y : ℝ ↦ 1 / y ^ 2) x :=
          continuousAt_const.div₀ (continuousAt_id.pow 2) (pow_ne_zero 2 hx0)
        have hexpcont : ContinuousAt (fun y : ℝ ↦ Real.exp (-(y ^ 2) / 2)) x :=
          Real.continuous_exp.continuousAt.comp
            ((continuousAt_id.pow 2).neg.div_const (2 : ℝ))
        exact ((continuousAt_const.add hinvcont).mul hexpcont).continuousWithinAt
      exact hcont.aestronglyMeasurable measurableSet_Ioi
    · filter_upwards [ae_restrict_mem measurableSet_Ioi] with x hx
      simp only [Real.norm_eq_abs]
      rw [abs_of_nonneg (by positivity :
        0 ≤ (1 + 1 / x ^ 2) * Real.exp (-(x ^ 2) / 2)),
        abs_of_nonneg (by positivity : 0 ≤ c * Real.exp (-(x ^ 2) / 2))]
      exact hpoint x hx
  have hmain : (1 / t) * Real.exp (-(t ^ 2) / 2) ≤
      c * (∫ x in Ioi t, Real.exp (-(x ^ 2) / 2)) := by
    rw [← integral_const_mul]
    rw [← integral_Ioi_one_add_inv_sq_mul_exp_neg_sq_div_two t ht]
    exact setIntegral_mono_on hleft hscaled measurableSet_Ioi hpoint
  apply (mul_le_mul_iff_left₀ hcpos).mp
  calc
    ((1 / t - 1 / t ^ 3) * Real.exp (-(t ^ 2) / 2)) * c =
        ((1 / t - 1 / t ^ 3) * c) * Real.exp (-(t ^ 2) / 2) := by ring
    _ ≤ (1 / t) * Real.exp (-(t ^ 2) / 2) := by
      apply mul_le_mul_of_nonneg_right
      · dsimp [c]
        have hnonneg : 0 ≤ t⁻¹ ^ 5 := by positivity
        field_simp
        nlinarith
      · positivity
    _ ≤ c * (∫ x in Ioi t, Real.exp (-(x ^ 2) / 2)) := hmain
    _ = (∫ x in Ioi t, Real.exp (-(x ^ 2) / 2)) * c := by ring

/-- Proposition 2.1.2: the standard-normal upper tail lies between the two
printed Mills-ratio expressions. -/
theorem standardNormalTail_bounds (t : ℝ) (ht : 0 < t) :
    (Real.sqrt (2 * Real.pi))⁻¹ *
          ((1 / t - 1 / t ^ 3) * Real.exp (-(t ^ 2) / 2)) ≤
        standardNormalLaw.real (Ici t) ∧
      standardNormalLaw.real (Ici t) ≤
        (Real.sqrt (2 * Real.pi))⁻¹ *
          ((1 / t) * Real.exp (-(t ^ 2) / 2)) := by
  rw [standardNormalTail_eq_densityIntegral]
  constructor
  · exact mul_le_mul_of_nonneg_left (gaussianIntegral_Ioi_ge t ht) (by positivity)
  · exact mul_le_mul_of_nonneg_left (gaussianIntegral_Ioi_le t ht) (by positivity)

/-- Equation (2.3): above threshold one, the standard-normal upper tail is at
most the density evaluated at the threshold. -/
theorem standardNormalTail_le_density (t : ℝ) (ht : 1 ≤ t) :
    standardNormalLaw.real (Ici t) ≤
      (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-(t ^ 2) / 2) := by
  have htpos : 0 < t := zero_lt_one.trans_le ht
  have hinv : 1 / t ≤ 1 := (div_le_one htpos).2 ht
  calc
    standardNormalLaw.real (Ici t) ≤
        (Real.sqrt (2 * Real.pi))⁻¹ *
          ((1 / t) * Real.exp (-(t ^ 2) / 2)) := (standardNormalTail_bounds t htpos).2
    _ ≤ (Real.sqrt (2 * Real.pi))⁻¹ *
          (1 * Real.exp (-(t ^ 2) / 2)) := by
      exact mul_le_mul_of_nonneg_left
        (mul_le_mul_of_nonneg_right hinv (Real.exp_pos _).le) (by positivity)
    _ = (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-(t ^ 2) / 2) := by ring

/-- Equation (2.10): the standard normal has the usual two-sided Gaussian
tail bound. -/
theorem standardNormal_twoSidedTail_le (t : ℝ) (ht : 0 ≤ t) :
    standardNormalLaw.real {x : ℝ | |x| ≥ t} ≤
      2 * Real.exp (-(t ^ 2) / 2) := by
  by_cases ht1 : 1 ≤ t
  · have hset : {x : ℝ | |x| ≥ t} = Ici t ∪ Iic (-t) := by
      ext x
      simp only [mem_setOf_eq, mem_union, mem_Iic, mem_Ici]
      constructor
      · intro h
        rcases (le_abs.mp h) with h | h
        · exact Or.inl h
        · exact Or.inr (by linarith)
      · rintro (h | h)
        · exact le_abs.mpr (Or.inl h)
        · exact le_abs.mpr (Or.inr (by linarith))
    have hmap : standardNormalLaw.map (fun x : ℝ => -x) = standardNormalLaw := by
      simpa [standardNormalLaw] using
        (ProbabilityTheory.gaussianReal_map_neg (μ := (0 : ℝ)) (v := (1 : ℝ≥0)))
    have hsym : standardNormalLaw.real (Iic (-t)) =
        standardNormalLaw.real (Ici t) := by
      calc
        standardNormalLaw.real (Iic (-t)) =
            (standardNormalLaw.map (fun x : ℝ => -x)).real (Iic (-t)) := by rw [hmap]
        _ = standardNormalLaw.real (Ici t) := by
          simp only [Measure.real_def,
            Measure.map_apply (by fun_prop : Measurable (fun x : ℝ => -x)) measurableSet_Iic,
            neg_preimage, neg_Iic, neg_neg]
    have hc : (Real.sqrt (2 * Real.pi))⁻¹ ≤ 1 := by
      have hpi : 1 ≤ 2 * Real.pi := by nlinarith [Real.two_le_pi]
      have hsqrt : 1 ≤ Real.sqrt (2 * Real.pi) := by
        rw [← Real.sqrt_one]
        exact Real.sqrt_le_sqrt hpi
      exact (inv_le_one₀ (by positivity)).2 hsqrt
    rw [hset]
    calc
      standardNormalLaw.real (Ici t ∪ Iic (-t)) ≤
          standardNormalLaw.real (Ici t) +
            standardNormalLaw.real (Iic (-t)) := measureReal_union_le _ _
      _ = 2 * standardNormalLaw.real (Ici t) := by rw [hsym]; ring
      _ ≤ 2 * ((Real.sqrt (2 * Real.pi))⁻¹ *
          Real.exp (-(t ^ 2) / 2)) := by
        gcongr
        exact standardNormalTail_le_density t ht1
      _ ≤ 2 * Real.exp (-(t ^ 2) / 2) := by
        gcongr
        simpa only [one_mul] using
          mul_le_mul_of_nonneg_right hc (Real.exp_pos (-(t ^ 2) / 2)).le
  · have htlt : t < 1 := lt_of_not_ge ht1
    have hprob : standardNormalLaw.real {x : ℝ | |x| ≥ t} ≤ 1 := by
      calc
        standardNormalLaw.real {x : ℝ | |x| ≥ t} ≤
            standardNormalLaw.real Set.univ := by
          simp only [Measure.real_def]
          exact ENNReal.toReal_mono (measure_ne_top standardNormalLaw Set.univ)
            (measure_mono (Set.subset_univ _))
        _ = 1 := probReal_univ
    have hsquare : t ^ 2 ≤ 1 := by nlinarith [sq_nonneg t]
    have hexp_half : (1 / 2 : ℝ) ≤ Real.exp (-(1 : ℝ) / 2) := by
      have h := Real.add_one_le_exp (-(1 : ℝ) / 2)
      norm_num at h ⊢
      exact h
    have hexp : Real.exp (-(1 : ℝ) / 2) ≤ Real.exp (-(t ^ 2) / 2) := by
      exact Real.exp_le_exp.mpr (by linarith)
    calc
      standardNormalLaw.real {x : ℝ | |x| ≥ t} ≤ 1 := hprob
      _ ≤ 2 * Real.exp (-(1 : ℝ) / 2) := by linarith
      _ ≤ 2 * Real.exp (-(t ^ 2) / 2) := by gcongr

/-- The standard-normal second moment above `t` equals a boundary density term
plus the upper-tail probability. -/
theorem standardNormal_truncatedSecondMoment_eq (t : ℝ) (ht : 0 < t) :
    (∫ x in Ioi t, x ^ 2 ∂standardNormalLaw) =
      t * (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-(t ^ 2) / 2) +
        standardNormalLaw.real (Ici t) := by
  let c : ℝ := (Real.sqrt (2 * Real.pi))⁻¹
  have hconvert :
      (∫ x in Ioi t, x ^ 2 ∂standardNormalLaw) =
        c * ∫ x in Ioi t, x ^ 2 * Real.exp (-(x ^ 2) / 2) := by
    rw [← integral_indicator measurableSet_Ioi]
    rw [standardNormalLaw,
      ProbabilityTheory.integral_gaussianReal_eq_integral_smul
        (by norm_num : (1 : ℝ≥0) ≠ 0)]
    calc
      (∫ x, ProbabilityTheory.gaussianPDFReal 0 1 x •
          (Ioi t).indicator (fun x : ℝ ↦ x ^ 2) x) =
          ∫ x, c * (Ioi t).indicator
            (fun x : ℝ ↦ x ^ 2 * Real.exp (-(x ^ 2) / 2)) x := by
        apply integral_congr_ae
        filter_upwards [] with x
        rw [standardNormalLaw_pdf]
        by_cases hx : x ∈ Ioi t <;> simp [hx, c]
        ring
      _ = c * ∫ x, (Ioi t).indicator
          (fun x : ℝ ↦ x ^ 2 * Real.exp (-(x ^ 2) / 2)) x := by
        rw [integral_const_mul]
      _ = c * ∫ x in Ioi t, x ^ 2 * Real.exp (-(x ^ 2) / 2) := by
        rw [integral_indicator measurableSet_Ioi]
  rw [hconvert, integral_Ioi_sq_mul_exp_neg_sq_div_two t ht, mul_add]
  rw [← standardNormalTail_eq_densityIntegral t]
  dsimp [c]
  ring

/-- Exercise 2.1.4: the exact truncated-second-moment identity and the bound
obtained by applying the upper Mills estimate. -/
theorem standardNormal_truncatedSecondMoment (t : ℝ) (ht : 1 ≤ t) :
    (∫ x in Ioi t, x ^ 2 ∂standardNormalLaw) =
        t * (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-(t ^ 2) / 2) +
          standardNormalLaw.real (Ici t) ∧
      (∫ x in Ioi t, x ^ 2 ∂standardNormalLaw) ≤
        (t + 1 / t) * (Real.sqrt (2 * Real.pi))⁻¹ *
          Real.exp (-(t ^ 2) / 2) := by
  have htpos : 0 < t := zero_lt_one.trans_le ht
  have heq := standardNormal_truncatedSecondMoment_eq t htpos
  refine ⟨heq, ?_⟩
  rw [heq]
  calc
    t * (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-(t ^ 2) / 2) +
          standardNormalLaw.real (Ici t) ≤
        t * (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-(t ^ 2) / 2) +
          (Real.sqrt (2 * Real.pi))⁻¹ *
            ((1 / t) * Real.exp (-(t ^ 2) / 2)) := by
      gcongr
      exact (standardNormalTail_bounds t htpos).2
    _ = (t + 1 / t) * (Real.sqrt (2 * Real.pi))⁻¹ *
          Real.exp (-(t ^ 2) / 2) := by ring

end NumStability.HDP.Scalar.GaussianTails
```

### `NumStability.HDP.Scalar.GaussianSquareTail`

Path: `lean-numerical-stability/NumStability/HDP/Scalar/GaussianSquareTail.lean`
SHA-256: `32ee22f9d8683d2a48adea4b174550081ceb72f8eede437abc9eb08fb91991df`

```lean
import NumStability.HDP.Scalar.GaussianAtoms
import NumStability.HDP.Scalar.GaussianTails

/-!
# Tails of the square of a standard normal

This module turns the deterministic identity `g² > t ↔ |g| > √t` into
exact standard-normal probability identities and Mills-ratio bounds.  The
result keeps the polynomial prefactor that the source suppresses when it says
the square has exponential-scale tail `exp (-t / 2)`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Set
open scoped ENNReal NNReal

namespace NumStability.HDP.Scalar.GaussianSquareTail

open NumStability.HDP.Scalar.LimitTheorems
open NumStability.HDP.Scalar.GaussianTails
open NumStability.HDP.Scalar.GaussianAtoms

/-- Squaring exceeds a nonnegative threshold exactly when absolute value
exceeds its square root. -/
theorem sq_gt_iff_abs_gt_sqrt (x t : ℝ) (ht : 0 ≤ t) :
    x ^ 2 > t ↔ |x| > Real.sqrt t := by
  calc
    x ^ 2 > t ↔ |x| ^ 2 > (Real.sqrt t) ^ 2 := by
      rw [sq_abs, Real.sq_sqrt ht]
    _ ↔ |x| > Real.sqrt t :=
      sq_lt_sq₀ (Real.sqrt_nonneg t) (abs_nonneg x)

/-- Set form of `sq_gt_iff_abs_gt_sqrt`, split into the two Gaussian tails. -/
theorem sq_tail_set_eq_union (t : ℝ) (ht : 0 ≤ t) :
    {x : ℝ | x ^ 2 > t} = Ioi (Real.sqrt t) ∪ Iio (-Real.sqrt t) := by
  ext x
  simp only [mem_setOf_eq, mem_union, mem_Ioi, mem_Iio]
  rw [sq_gt_iff_abs_gt_sqrt x t ht]
  change Real.sqrt t < |x| ↔ Real.sqrt t < x ∨ x < -Real.sqrt t
  rw [lt_abs]
  constructor
  · rintro (h | h)
    · exact Or.inl h
    · exact Or.inr (by linarith)
  · rintro (h | h)
    · exact Or.inl h
    · exact Or.inr (by linarith)

/-- The standard normal has the same mass on an open upper tail and the
corresponding closed upper tail because it has no atoms. -/
theorem standardNormalLaw_real_Ioi_eq_Ici (s : ℝ) :
    standardNormalLaw.real (Ioi s) = standardNormalLaw.real (Ici s) := by
  have hset : Ici s = {s} ∪ Ioi s := by
    ext x
    simp only [mem_Ici, mem_union, mem_singleton_iff, mem_Ioi]
    constructor
    · intro h
      rcases h.eq_or_lt with h | h
      · exact Or.inl h.symm
      · exact Or.inr h
    · rintro (rfl | h)
      · exact le_rfl
      · exact h.le
  have hdisj : Disjoint ({s} : Set ℝ) (Ioi s) := by
    rw [Set.disjoint_left]
    intro x hx htail
    simp only [mem_singleton_iff] at hx
    subst x
    exact (lt_irrefl s) htail
  have hunion := measureReal_union (μ := standardNormalLaw)
    hdisj measurableSet_Ioi
  rw [← hset] at hunion
  rw [standardNormalLaw_real_singleton] at hunion
  linarith

/-- Reflection symmetry identifies the lower open tail with the upper one. -/
theorem standardNormalLaw_real_Iio_neg (s : ℝ) :
    standardNormalLaw.real (Iio (-s)) = standardNormalLaw.real (Ioi s) := by
  have hmap : standardNormalLaw.map (fun x : ℝ => -x) = standardNormalLaw := by
    simpa [standardNormalLaw] using
      (ProbabilityTheory.gaussianReal_map_neg (μ := (0 : ℝ)) (v := (1 : ℝ≥0)))
  calc
    standardNormalLaw.real (Iio (-s)) =
        (standardNormalLaw.map (fun x : ℝ => -x)).real (Iio (-s)) := by
          rw [hmap]
    _ = standardNormalLaw.real (Ioi s) := by
      simp only [Measure.real_def,
        Measure.map_apply (by fun_prop : Measurable (fun x : ℝ => -x)) measurableSet_Iio,
        neg_preimage, neg_Iio, neg_neg]

/-- The square tail is exactly twice the one-sided Gaussian tail at `√t`. -/
theorem standardNormal_squareTail_eq_two_mul_tail (t : ℝ) (ht : 0 ≤ t) :
    standardNormalLaw.real {x : ℝ | x ^ 2 > t} =
      2 * standardNormalLaw.real (Ici (Real.sqrt t)) := by
  rw [sq_tail_set_eq_union t ht]
  have hs : 0 ≤ Real.sqrt t := Real.sqrt_nonneg t
  have hdisj : Disjoint (Ioi (Real.sqrt t)) (Iio (-Real.sqrt t)) := by
    rw [Set.disjoint_left]
    intro x hupper hlower
    simp only [mem_Ioi] at hupper
    simp only [mem_Iio] at hlower
    linarith
  rw [measureReal_union hdisj measurableSet_Iio]
  rw [standardNormalLaw_real_Iio_neg, standardNormalLaw_real_Ioi_eq_Ici]
  ring

/-- Exact two-sided Mills-ratio bounds for the tail of a squared standard
normal.  In particular, its exponential scale is `exp (-t / 2)`. -/
theorem standardNormal_squareTail_bounds (t : ℝ) (ht : 0 < t) :
    2 * (Real.sqrt (2 * Real.pi))⁻¹ *
          ((1 / Real.sqrt t - 1 / (Real.sqrt t) ^ 3) *
            Real.exp (-t / 2)) ≤
        standardNormalLaw.real {x : ℝ | x ^ 2 > t} ∧
      standardNormalLaw.real {x : ℝ | x ^ 2 > t} ≤
        2 * (Real.sqrt (2 * Real.pi))⁻¹ *
          ((1 / Real.sqrt t) * Real.exp (-t / 2)) := by
  rw [standardNormal_squareTail_eq_two_mul_tail t ht.le]
  have hspos : 0 < Real.sqrt t := Real.sqrt_pos.2 ht
  have htail := standardNormalTail_bounds (Real.sqrt t) hspos
  constructor
  · have h := mul_le_mul_of_nonneg_left htail.1 (by norm_num : (0 : ℝ) ≤ 2)
    simpa [Real.sq_sqrt ht.le, mul_assoc] using h
  · have h := mul_le_mul_of_nonneg_left htail.2 (by norm_num : (0 : ℝ) ≤ 2)
    simpa [Real.sq_sqrt ht.le, mul_assoc] using h

end NumStability.HDP.Scalar.GaussianSquareTail
```
