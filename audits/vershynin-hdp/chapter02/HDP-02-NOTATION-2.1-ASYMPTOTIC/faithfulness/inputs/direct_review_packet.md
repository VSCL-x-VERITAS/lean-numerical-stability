# Declaration dossier for HDP-02-NOTATION-2.1-ASYMPTOTIC

This dossier describes the theorem statement only. Its proof is excluded.
Interpret every dependency from its supplied declaration; names are not definitions.

## Proof-free source declaration

```lean
theorem hdp_02_hnotation_h2_d1_hasymptotic :
    ∀ f g : ℕ → ℝ,
      (IsComparableEverywhere f g ↔
        ∃ c C : ℝ, 0 < c ∧ 0 < C ∧
          ∀ n, c * f n ≤ g n ∧ g n ≤ C * f n) ∧
      (IsComparableEventually f g ↔
        ∃ c C : ℝ, 0 < c ∧ 0 < C ∧
          ∀ᶠ n in Filter.atTop, c * f n ≤ g n ∧ g n ≤ C * f n) ∧
      (IsLessSimEverywhere f g ↔
        ∃ C : ℝ, 0 < C ∧ ∀ n, f n ≤ C * g n) ∧
      (IsLessSimEventually f g ↔
        ∃ C : ℝ, 0 < C ∧ ∀ᶠ n in Filter.atTop, f n ≤ C * g n) ∧
      (IsGreaterSimEverywhere f g ↔
        ∃ c : ℝ, 0 < c ∧ ∀ n, g n ≤ c * f n) ∧
      (IsGreaterSimEventually f g ↔
        ∃ c : ℝ, 0 < c ∧ ∀ᶠ n in Filter.atTop, g n ≤ c * f n)
```

## Elaborated target type

```lean
∀ (f g : Nat → Real),
  And
    (Iff (NumStability.HDP.Scalar.AsymptoticComparisons.IsComparableEverywhere f g)
      (Exists fun c =>
        Exists fun C =>
          And (Real.instLT.lt 0 c)
            (And (Real.instLT.lt 0 C)
              (∀ (n : Nat),
                And (Real.instLE.le (instHMul.hMul c (f n)) (g n)) (Real.instLE.le (g n) (instHMul.hMul C (f n)))))))
    (And
      (Iff (NumStability.HDP.Scalar.AsymptoticComparisons.IsComparableEventually f g)
        (Exists fun c =>
          Exists fun C =>
            And (Real.instLT.lt 0 c)
              (And (Real.instLT.lt 0 C)
                (Filter.Eventually
                  (fun n =>
                    And (Real.instLE.le (instHMul.hMul c (f n)) (g n)) (Real.instLE.le (g n) (instHMul.hMul C (f n))))
                  Filter.atTop))))
      (And
        (Iff (NumStability.HDP.Scalar.AsymptoticComparisons.IsLessSimEverywhere f g)
          (Exists fun C => And (Real.instLT.lt 0 C) (∀ (n : Nat), Real.instLE.le (f n) (instHMul.hMul C (g n)))))
        (And
          (Iff (NumStability.HDP.Scalar.AsymptoticComparisons.IsLessSimEventually f g)
            (Exists fun C =>
              And (Real.instLT.lt 0 C)
                (Filter.Eventually (fun n => Real.instLE.le (f n) (instHMul.hMul C (g n))) Filter.atTop)))
          (And
            (Iff (NumStability.HDP.Scalar.AsymptoticComparisons.IsGreaterSimEverywhere f g)
              (Exists fun c => And (Real.instLT.lt 0 c) (∀ (n : Nat), Real.instLE.le (g n) (instHMul.hMul c (f n)))))
            (Iff (NumStability.HDP.Scalar.AsymptoticComparisons.IsGreaterSimEventually f g)
              (Exists fun c =>
                And (Real.instLT.lt 0 c)
                  (Filter.Eventually (fun n => Real.instLE.le (g n) (instHMul.hMul c (f n))) Filter.atTop)))))))
```

## Fully explicit elaborated target type

```lean
∀ (f g : Nat → Real),
  And
    (Iff (NumStability.HDP.Scalar.AsymptoticComparisons.IsComparableEverywhere f g)
      (@Exists.{1} Real fun (c : Real) =>
        @Exists.{1} Real fun (C : Real) =>
          And
            (@LT.lt.{0} Real Real.instLT (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero)) c)
            (And
              (@LT.lt.{0} Real Real.instLT (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
                C)
              (∀ (n : Nat),
                And
                  (@LE.le.{0} Real Real.instLE
                    (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul) c (f n)) (g n))
                  (@LE.le.{0} Real Real.instLE (g n)
                    (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul) C (f n)))))))
    (And
      (Iff (NumStability.HDP.Scalar.AsymptoticComparisons.IsComparableEventually f g)
        (@Exists.{1} Real fun (c : Real) =>
          @Exists.{1} Real fun (C : Real) =>
            And
              (@LT.lt.{0} Real Real.instLT (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
                c)
              (And
                (@LT.lt.{0} Real Real.instLT (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
                  C)
                (@Filter.Eventually.{0} Nat
                  (fun (n : Nat) =>
                    And
                      (@LE.le.{0} Real Real.instLE
                        (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul) c (f n)) (g n))
                      (@LE.le.{0} Real Real.instLE (g n)
                        (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul) C (f n))))
                  (@Filter.atTop.{0} Nat Nat.instPreorder)))))
      (And
        (Iff (NumStability.HDP.Scalar.AsymptoticComparisons.IsLessSimEverywhere f g)
          (@Exists.{1} Real fun (C : Real) =>
            And
              (@LT.lt.{0} Real Real.instLT (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
                C)
              (∀ (n : Nat),
                @LE.le.{0} Real Real.instLE (f n)
                  (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul) C (g n)))))
        (And
          (Iff (NumStability.HDP.Scalar.AsymptoticComparisons.IsLessSimEventually f g)
            (@Exists.{1} Real fun (C : Real) =>
              And
                (@LT.lt.{0} Real Real.instLT (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
                  C)
                (@Filter.Eventually.{0} Nat
                  (fun (n : Nat) =>
                    @LE.le.{0} Real Real.instLE (f n)
                      (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul) C (g n)))
                  (@Filter.atTop.{0} Nat Nat.instPreorder))))
          (And
            (Iff (NumStability.HDP.Scalar.AsymptoticComparisons.IsGreaterSimEverywhere f g)
              (@Exists.{1} Real fun (c : Real) =>
                And
                  (@LT.lt.{0} Real Real.instLT
                    (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero)) c)
                  (∀ (n : Nat),
                    @LE.le.{0} Real Real.instLE (g n)
                      (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul) c (f n)))))
            (Iff (NumStability.HDP.Scalar.AsymptoticComparisons.IsGreaterSimEventually f g)
              (@Exists.{1} Real fun (c : Real) =>
                And
                  (@LT.lt.{0} Real Real.instLT
                    (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero)) c)
                  (@Filter.Eventually.{0} Nat
                    (fun (n : Nat) =>
                      @LE.le.{0} Real Real.instLE (g n)
                        (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul) c (f n)))
                    (@Filter.atTop.{0} Nat Nat.instPreorder))))))))
```

## Local import graph

- `AuditTarget` imports: `NumStability.HDP.ContractSignatures.C_02_hnotation_h2_d1_hasymptotic`
- `NumStability.HDP.Scalar.AsymptoticComparisons` imports: `Mathlib.Analysis.Asymptotics.Theta`
- `NumStability.HDP.ContractSignatures.C_02_hnotation_h2_d1_hasymptotic` imports: `NumStability.HDP.Scalar.AsymptoticComparisons`

## Semantic dependency inventory

`local` declarations are followed recursively through types and bodies. `external-frontier` declarations mark the one-level library trust boundary.

### D001: `NumStability.HDP.Scalar.AsymptoticComparisons.IsComparableEventually`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.AsymptoticComparisons`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `981daead209f2c48a604d63826249c9937987bf13b08c0812beead575d19d39b`

Type:

```lean
(Nat → Real) → (Nat → Real) → Prop
```

Fully explicit type:

```lean
(f g : Nat → Real) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun f g =>
  Exists fun c =>
    Exists fun C =>
      And (Real.instLT.lt 0 c)
        (And (Real.instLT.lt 0 C)
          (Filter.Eventually
            (fun n => And (Real.instLE.le (instHMul.hMul c (f n)) (g n)) (Real.instLE.le (g n) (instHMul.hMul C (f n))))
            Filter.atTop))
```

### D002: `NumStability.HDP.Scalar.AsymptoticComparisons.IsComparableEverywhere`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.AsymptoticComparisons`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `b060b41a9f6814310933ce5e10513f45b4afedf0b512cca19e58d5a59f1f4327`

Type:

```lean
(Nat → Real) → (Nat → Real) → Prop
```

Fully explicit type:

```lean
(f g : Nat → Real) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun f g =>
  Exists fun c =>
    Exists fun C =>
      And (Real.instLT.lt 0 c)
        (And (Real.instLT.lt 0 C)
          (∀ (n : Nat),
            And (Real.instLE.le (instHMul.hMul c (f n)) (g n)) (Real.instLE.le (g n) (instHMul.hMul C (f n)))))
```

### D003: `NumStability.HDP.Scalar.AsymptoticComparisons.IsGreaterSimEventually`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.AsymptoticComparisons`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `e2f1c575f1923c7f839180587fcaa843569596f087c9f95b4c698104613b7ad0`

Type:

```lean
(Nat → Real) → (Nat → Real) → Prop
```

Fully explicit type:

```lean
(f g : Nat → Real) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun f g => NumStability.HDP.Scalar.AsymptoticComparisons.IsLessSimEventually g f
```

### D004: `NumStability.HDP.Scalar.AsymptoticComparisons.IsGreaterSimEverywhere`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.AsymptoticComparisons`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `a36aebed0fbde38457becab679fefbdbdfed97aabf2cf3523d68135ef3cbc499`

Type:

```lean
(Nat → Real) → (Nat → Real) → Prop
```

Fully explicit type:

```lean
(f g : Nat → Real) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun f g => NumStability.HDP.Scalar.AsymptoticComparisons.IsLessSimEverywhere g f
```

### D005: `NumStability.HDP.Scalar.AsymptoticComparisons.IsLessSimEventually`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.AsymptoticComparisons`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `87cbb509a104ad49935be305f25f43611ac587d4bf0309408b4d583579b0c839`

Type:

```lean
(Nat → Real) → (Nat → Real) → Prop
```

Fully explicit type:

```lean
(f g : Nat → Real) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun f g =>
  Exists fun C =>
    And (Real.instLT.lt 0 C) (Filter.Eventually (fun n => Real.instLE.le (f n) (instHMul.hMul C (g n))) Filter.atTop)
```

### D006: `NumStability.HDP.Scalar.AsymptoticComparisons.IsLessSimEverywhere`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.AsymptoticComparisons`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `11727676adc1151fd03a3b59df4da58ab1c48c3c326be7ca0296e7e977fcaa7b`

Type:

```lean
(Nat → Real) → (Nat → Real) → Prop
```

Fully explicit type:

```lean
(f g : Nat → Real) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun f g => Exists fun C => And (Real.instLT.lt 0 C) (∀ (n : Nat), Real.instLE.le (f n) (instHMul.hMul C (g n)))
```

### D007: `And`

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

### D008: `Exists`

- Role: `external-frontier`
- Owner module: `Init.Core`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `a24a6eb72dcf5b3765659a28bb9d3814ed7ebd3e3fa1fd11e8f3c7acc80e0dde`

Type:

```lean
{α : Sort u} → (α → Prop) → Prop
```

Fully explicit type:

```lean
{α : Sort u} → (p : α → Prop) → Prop
```

### D009: `Filter.Eventually`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Filter.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `48c8fc03616b0f899835653f1d062e3de4f566255a80b15231ebdedcb0a5c4c4`

Type:

```lean
{α : Type u_1} → (α → Prop) → Filter α → Prop
```

Fully explicit type:

```lean
{α : Type u_1} → (p : α → Prop) → (f : Filter.{u_1} α) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun {α} p f => Filter.instMembership.mem f (setOf fun x => p x)
```

### D010: `Filter.atTop`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Filter.AtTopBot.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f743a11da6fe9e156755f41ec35f4d61b87ca4af4575ede456b477a74caa45f3`

Type:

```lean
{α : Type u_3} → [Preorder α] → Filter α
```

Fully explicit type:

```lean
{α : Type u_3} → [Preorder.{u_3} α] → Filter.{u_3} α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [Preorder α] => iInf fun a => Filter.principal (Set.Ici a)
```

### D011: `HMul.hMul`

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

### D012: `Iff`

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

### D013: `LE.le`

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

### D014: `LT.lt`

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

### D016: `Nat.instPreorder`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5ea89e9915200c8782bc933f9184e28eb38f4c9610b00cf1310cc6e6435642d8`

Type:

```lean
Preorder Nat
```

Fully explicit type:

```lean
Preorder.{0} Nat
```

Definition body (one-level semantic boundary):

```lean
inferInstance
```

### D017: `OfNat.ofNat`

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

Fully explicit type:

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

Fully explicit type:

```lean
LE.{0} Real
```

Definition body (one-level semantic boundary):

```lean
{ le := Real.le✝ }
```

### D020: `Real.instLT`

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

### D021: `Real.instMul`

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

### D022: `Real.instZero`

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

### D023: `Zero.toOfNat0`

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

### D024: `instHMul`

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
