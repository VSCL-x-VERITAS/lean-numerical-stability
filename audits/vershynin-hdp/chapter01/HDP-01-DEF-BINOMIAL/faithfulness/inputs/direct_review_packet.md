# Declaration dossier for HDP-01-DEF-BINOMIAL

This dossier describes the theorem statement only. Its proof is excluded.
Interpret every dependency from its supplied declaration; names are not definitions.

## Proof-free source declaration

```lean
theorem hdp_01_hdef_hbinomial
    (p : ℝ≥0) (hp0 : 0 < p) (hp1 : p < 1) (N : ℕ) (hN : 0 < N) :
    (NumStability.HDP.Scalar.LimitTheorems.bernoulliTrialVectorPMF p
      (le_of_lt hp1) N).map
        (NumStability.HDP.Scalar.LimitTheorems.bernoulliSuccessCount N) =
      NumStability.HDP.Scalar.LimitTheorems.binomialNatPMF p (le_of_lt hp1) N
```

## Elaborated target type

```lean
∀ (p : NNReal),
  instPartialOrderNNReal.lt 0 p →
    ∀ (hp1 : instPartialOrderNNReal.lt p 1) (N : Nat),
      instLTNat.lt 0 N →
        Eq
          (PMF.map (NumStability.HDP.Scalar.LimitTheorems.bernoulliSuccessCount N)
            (NumStability.HDP.Scalar.LimitTheorems.bernoulliTrialVectorPMF p ⋯ N))
          (NumStability.HDP.Scalar.LimitTheorems.binomialNatPMF p ⋯ N)
```

## Fully explicit elaborated target type

```lean
∀ (p : NNReal)
  (hp0 :
    @LT.lt.{0} NNReal (@Preorder.toLT.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
      (@OfNat.ofNat.{0} NNReal (nat_lit 0) (@Zero.toOfNat0.{0} NNReal instZeroNNReal)) p)
  (hp1 :
    @LT.lt.{0} NNReal (@Preorder.toLT.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal)) p
      (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)))
  (N : Nat) (hN : @LT.lt.{0} Nat instLTNat (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))) N),
  @Eq.{1} (PMF.{0} Nat)
    (@PMF.map.{0, 0} (Fin N → Bool) Nat (NumStability.HDP.Scalar.LimitTheorems.bernoulliSuccessCount N)
      (NumStability.HDP.Scalar.LimitTheorems.bernoulliTrialVectorPMF p
        (@le_of_lt.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal) p
          (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)) hp1)
        N))
    (NumStability.HDP.Scalar.LimitTheorems.binomialNatPMF p
      (@le_of_lt.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal) p
        (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)) hp1)
      N)
```

## Local import graph

- `AuditTarget` imports: `NumStability.HDP.Scalar.LimitTheorems`
- `NumStability.HDP.Scalar.LimitTheorems` imports: `Mathlib.Probability.ProbabilityMassFunction.Binomial`, `Mathlib.Probability.ProbabilityMassFunction.Integrals`, `Mathlib.Probability.Distributions.Gaussian.Real`, `Mathlib.Probability.Distributions.Poisson`, `Mathlib.MeasureTheory.Function.ConvergenceInDistribution`, `Mathlib.Probability.StrongLaw`, `Mathlib.Tactic`

## Semantic dependency inventory

`local` declarations are followed recursively through types and bodies. `external-frontier` declarations mark the one-level library trust boundary.

### D001: `NumStability.HDP.Scalar.LimitTheorems.bernoulliSuccessCount`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.LimitTheorems`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `22f6bf8737b6754f91bb96062e7f72d82f7a367c2332a206062e0f48cc3b3a2a`

Type:

```lean
(N : Nat) → (Fin N → Bool) → Nat
```

Fully explicit type:

```lean
(N : Nat) → (f : Fin N → Bool) → Nat
```

Definition body (one-level semantic boundary):

```lean
fun N f => (Finset.filter (fun i => Eq (f i) Bool.true) Finset.univ).card
```

### D002: `NumStability.HDP.Scalar.LimitTheorems.bernoulliTrialVectorPMF`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.LimitTheorems`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `889ad5979fc94dba8ce3d25c44ea9fa1afc96c5bfa3bc08444833909e06d9937`

Type:

```lean
(p : NNReal) → instPartialOrderNNReal.le p 1 → (N : Nat) → PMF (Fin N → Bool)
```

Fully explicit type:

```lean
(p : NNReal) →
  (hp :
      @LE.le.{0} NNReal (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal)) p
        (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))) →
    (N : Nat) → PMF.{0} (Fin N → Bool)
```

Definition body (one-level semantic boundary):

```lean
fun p hp N => PMF.ofFintype (NumStability.HDP.Scalar.LimitTheorems.bernoulliTrialWeight✝ p N) ⋯
```

### D003: `NumStability.HDP.Scalar.LimitTheorems.binomialNatPMF`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.LimitTheorems`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `db5e957d7e91f4d0d11ac800915398678705cd2cd0f551d1864f0a16d44d886f`

Type:

```lean
(p : NNReal) → instPartialOrderNNReal.le p 1 → Nat → PMF Nat
```

Fully explicit type:

```lean
(p : NNReal) →
  (hp :
      @LE.le.{0} NNReal (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal)) p
        (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))) →
    (N : Nat) → PMF.{0} Nat
```

Definition body (one-level semantic boundary):

```lean
fun p hp N => PMF.map (fun i => i.val) (PMF.binomial p hp N)
```

### D004: `NumStability.HDP.Scalar.LimitTheorems.bernoulliTrialWeight_sum_eq_one`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.LimitTheorems`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `00fbaec6908d0290ab7fafde1aec59152f63ba77ac5cd08fb4eca49e4ebffbc3`

Type:

```lean
∀ (p : NNReal),
  instPartialOrderNNReal.le p 1 →
    ∀ (N : Nat), Eq (Finset.univ.sum fun f => NumStability.HDP.Scalar.LimitTheorems.bernoulliTrialWeight✝ p N f) 1
```

Fully explicit type:

```lean
∀ (p : NNReal)
  (hp :
    @LE.le.{0} NNReal (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal)) p
      (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)))
  (N : Nat),
  @Eq.{1} ENNReal
    (@Finset.sum.{0, 0} (Fin N → Bool) ENNReal ENNReal.instAddCommMonoid
      (@Finset.univ.{0} (Fin N → Bool)
        (@Pi.instFintype.{0, 0} (Fin N) (fun (a : Fin N) => Bool) (instDecidableEqFin N) (Fin.fintype N)
          fun (a : Fin N) => Bool.fintype))
      fun (f : Fin N → Bool) =>
      _private.NumStability.HDP.Scalar.LimitTheorems.0.NumStability.HDP.Scalar.LimitTheorems.bernoulliTrialWeight p N f)
    (@OfNat.ofNat.{0} ENNReal (nat_lit 1)
      (@One.toOfNat1.{0} ENNReal
        (@AddMonoidWithOne.toOne.{0} ENNReal
          (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))))
```

### D005: `_private.NumStability.HDP.Scalar.LimitTheorems.0.NumStability.HDP.Scalar.LimitTheorems.bernoulliTrialWeight`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.LimitTheorems`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `945dd7c8e80928b60b3be33cccc0a1a1fd5767917039a87cc33f6c3611ee4696`

Type:

```lean
NNReal → (N : Nat) → (Fin N → Bool) → ENNReal
```

Fully explicit type:

```lean
(p : NNReal) → (N : Nat) → (f : Fin N → Bool) → ENNReal
```

Definition body (one-level semantic boundary):

```lean
fun p N f =>
  Finset.univ.prod fun i => ite (Eq (f i) Bool.true) (ENNReal.ofNNReal p) (instHSub.hSub 1 (ENNReal.ofNNReal p))
```

### D006: `Bool`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `e95da6be35714acbe5505fa5c6ba913c979305a6d87f38e35096664b551ce829`

Type:

```lean
Type
```

Fully explicit type:

```lean
Type
```

### D007: `Eq`

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

### D008: `Fin`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `59788903be5da78a88e4dc3844df38effdaabdfa82bb364602790d2271da7fda`

Type:

```lean
Nat → Type
```

Fully explicit type:

```lean
(n : Nat) → Type
```

### D009: `LT.lt`

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

### D010: `NNReal`

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

### D011: `Nat`

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

### D012: `OfNat.ofNat`

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

### D013: `One.toOfNat1`

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

### D014: `PMF`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5cdd3cb545c2651a0d9472303e779ab9bdd063a0c7b1e1e553a96f7f194b1a15`

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
fun α => Subtype fun f => HasSum f 1
```

### D015: `PMF.map`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Constructions`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `bf06e1738c76887901adc4a0d90d5a668ae2745ad47d1faeee70fb3db7bbf391`

Type:

```lean
{α : Type u_1} → {β : Type u_2} → (α → β) → PMF α → PMF β
```

Fully explicit type:

```lean
{α : Type u_1} → {β : Type u_2} → (f : α → β) → (p : PMF.{u_1} α) → PMF.{u_2} β
```

Definition body (one-level semantic boundary):

```lean
fun {α} {β} f p => p.bind (Function.comp PMF.pure f)
```

### D016: `PartialOrder.toPreorder`

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

### D017: `Preorder.toLT`

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

### D018: `Zero.toOfNat0`

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

### D019: `instLTNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `4054f2341fdda887b2040c624c0867866ab56eabf3441d6ffc9451c94ae1663c`

Type:

```lean
LT Nat
```

Fully explicit type:

```lean
LT.{0} Nat
```

Definition body (one-level semantic boundary):

```lean
{ lt := Nat.lt }
```

### D020: `instOfNatNat`

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

### D021: `instOneNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D022: `instPartialOrderNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f4a763f4ba425a9513216d6fa2ff1928b1eb5120c77749230299df64cb590bb5`

Type:

```lean
PartialOrder NNReal
```

Fully explicit type:

```lean
PartialOrder.{0} NNReal
```

Definition body (one-level semantic boundary):

```lean
Subtype.partialOrder fun r => Real.instLE.le 0 r
```

### D023: `instZeroNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7e5325f2345acdef49f085110522dadb25b9bd4fce1907052d4feda3e95afe3b`

Type:

```lean
Zero NNReal
```

Fully explicit type:

```lean
Zero.{0} NNReal
```

Definition body (one-level semantic boundary):

```lean
Nonneg.zero
```

### D024: `le_of_lt`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Defs.PartialOrder`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `f99397c9bb2aa3d3eef0c176d64280d585a988bde48f78096d9aff51e6edaaa5`

Type:

```lean
∀ {α : Type u_1} [inst : Preorder α] {a b : α}, inst.lt a b → inst.le a b
```

Fully explicit type:

```lean
∀ {α : Type u_1} [inst : Preorder.{u_1} α] {a b : α} (hab : @LT.lt.{u_1} α (@Preorder.toLT.{u_1} α inst) a b),
  @LE.le.{u_1} α (@Preorder.toLE.{u_1} α inst) a b
```

### D025: `Bool.fintype`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Fintype.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `a9c679c1e183f14495adf710deea6c35a4173bbf8152186440f4167fe646ea80`

Type:

```lean
Fintype Bool
```

Fully explicit type:

```lean
Fintype.{0} Bool
```

Definition body (one-level semantic boundary):

```lean
{
  elems :=
    { val := Multiset.instInsert.insert Bool.true (Multiset.instSingleton.singleton Bool.false),
      nodup := Bool.fintype._proof_1 },
  complete := ⋯ }
```

### D026: `Bool.true`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `constructor`
- Distance from target type: `2`
- Semantic SHA-256: `97e763ea95d8452117cf5762fd67acddd549677f08ccfa348c4bf23db7eaa9d8`

Type:

```lean
Bool
```

Fully explicit type:

```lean
Bool
```

### D027: `Fin.fintype`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Fintype.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `e7038d0981813ab904ddadd5c858e1d87d6d42413a72872c71b6e0413db6bb44`

Type:

```lean
(n : Nat) → Fintype (Fin n)
```

Fully explicit type:

```lean
(n : Nat) → Fintype.{0} (Fin n)
```

Definition body (one-level semantic boundary):

```lean
fun n => { elems := { val := Multiset.ofList (List.finRange n), nodup := ⋯ }, complete := ⋯ }
```

### D028: `Fin.val`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `74cc6296b3a13207507ec372ef420f5e52b6935895dd25bcc6331abde2a4b328`

Type:

```lean
{n : Nat} → Fin n → Nat
```

Fully explicit type:

```lean
{n : Nat} → (self : Fin n) → Nat
```

Definition body (one-level semantic boundary):

```lean
fun n self => self.1
```

### D029: `Finset.card`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Finset.Card`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `53f5c09b147215efcd8844f0936a32a05334a5f290114ef711ebb1615f4504e4`

Type:

```lean
{α : Type u_1} → Finset α → Nat
```

Fully explicit type:

```lean
{α : Type u_1} → (s : Finset.{u_1} α) → Nat
```

Definition body (one-level semantic boundary):

```lean
fun {α} s => s.val.card
```

### D030: `Finset.filter`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Finset.Filter`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `cc2bad5c5cc6aa2b196abe33b9083d127ab69155f1189766c3500bb83412c7df`

Type:

```lean
{α : Type u_1} → (p : α → Prop) → [DecidablePred p] → Finset α → Finset α
```

Fully explicit type:

```lean
{α : Type u_1} → (p : α → Prop) → [@DecidablePred.{u_1 + 1} α p] → (s : Finset.{u_1} α) → Finset.{u_1} α
```

Definition body (one-level semantic boundary):

```lean
fun {α} p [DecidablePred p] s => { val := Multiset.filter p s.val, nodup := ⋯ }
```

### D031: `Finset.univ`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Fintype.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `194413a784fbc0b27d0cb6b1ab67ed060210172bf16ba24045aa439e58f9a8c7`

Type:

```lean
{α : Type u_1} → [Fintype α] → Finset α
```

Fully explicit type:

```lean
{α : Type u_1} → [Fintype.{u_1} α] → Finset.{u_1} α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Fintype α] => inst.elems
```

### D032: `HAdd.hAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `e0bf2a92addd6ea713343e4ef69f67e4e1155781d08f46957b9f71412d865f59`

Type:

```lean
{α : Type u} → {β : Type v} → {γ : outParam (Type w)} → [self : HAdd α β γ] → α → β → γ
```

Fully explicit type:

```lean
{α : Type u} → {β : Type v} → {γ : outParam.{w + 2} (Type w)} → [self : HAdd.{u, v, w} α β γ] → α → β → γ
```

Definition body (one-level semantic boundary):

```lean
fun α β {γ} [self : HAdd α β γ] => self.1
```

### D033: `LE.le`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `2`
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

### D034: `PMF.binomial`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Binomial`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `2c8d756e6d870623a0ed6b6b27375b86b993bb037ed7de2dab669f88fdcc39d3`

Type:

```lean
(p : NNReal) → instPartialOrderNNReal.le p 1 → (n : Nat) → PMF (Fin (instHAdd.hAdd n 1))
```

Fully explicit type:

```lean
(p : NNReal) →
  (h :
      @LE.le.{0} NNReal (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal)) p
        (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))) →
    (n : Nat) →
      PMF.{0}
        (Fin
          (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat) n
            (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))))
```

Definition body (one-level semantic boundary):

```lean
fun p h n =>
  PMF.ofFintype
    (fun i =>
      ENNReal.ofNNReal
        (instHMul.hMul
          (instHMul.hMul (instHPow.hPow p i.val)
            (instHPow.hPow (instHSub.hSub 1 p) (instHSub.hSub (Fin.last n).val i.val)))
          (n.choose i.val).cast))
    ⋯
```

### D035: `PMF.ofFintype`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Constructions`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `8f2b5d575ffd7926f7ad8654bc3923c691cda311b9416d0557d8e14570ec6168`

Type:

```lean
{α : Type u_1} → [inst : Fintype α] → (f : α → ENNReal) → Eq (Finset.univ.sum fun a => f a) 1 → PMF α
```

Fully explicit type:

```lean
{α : Type u_1} →
  [inst : Fintype.{u_1} α] →
    (f : α → ENNReal) →
      (h :
          @Eq.{1} ENNReal
            (@Finset.sum.{u_1, 0} α ENNReal ENNReal.instAddCommMonoid (@Finset.univ.{u_1} α inst) fun (a : α) => f a)
            (@OfNat.ofNat.{0} ENNReal (nat_lit 1)
              (@One.toOfNat1.{0} ENNReal
                (@AddMonoidWithOne.toOne.{0} ENNReal
                  (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))))) →
        PMF.{u_1} α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [Fintype α] f h => PMF.ofFinset f Finset.univ h ⋯
```

### D036: `Pi.instFintype`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Fintype.Pi`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `38af89fa29e8604e3102e2493be25045731e11c8f462c08498d78926b091d1fa`

Type:

```lean
{α : Type u_3} →
  {β : α → Type u_4} → [DecidableEq α] → [Fintype α] → [(a : α) → Fintype (β a)] → Fintype ((a : α) → β a)
```

Fully explicit type:

```lean
{α : Type u_3} →
  {β : α → Type u_4} →
    [DecidableEq.{u_3 + 1} α] →
      [Fintype.{u_3} α] → [(a : α) → Fintype.{u_4} (β a)] → Fintype.{max u_3 u_4} ((a : α) → β a)
```

Definition body (one-level semantic boundary):

```lean
fun {α} {β} [DecidableEq α] [Fintype α] [(a : α) → Fintype (β a)] =>
  { elems := Fintype.piFinset fun x => Finset.univ, complete := ⋯ }
```

### D037: `Preorder.toLE`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Defs.PartialOrder`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `a2229e231e0928e24fffee5432201e35fadad80e7f6e4738e0d251c3c01a4676`

Type:

```lean
{α : Type u_2} → [self : Preorder α] → LE α
```

Fully explicit type:

```lean
{α : Type u_2} → [self : Preorder.{u_2} α] → LE.{u_2} α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : Preorder α] => self.1
```

### D038: `instAddNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `a1534bcd3e1888406ac787d30eeff8a284cb6688c23f5e8de09351dda91a280c`

Type:

```lean
Add Nat
```

Fully explicit type:

```lean
Add.{0} Nat
```

Definition body (one-level semantic boundary):

```lean
{ add := Nat.add }
```

### D039: `instDecidableEqBool`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `dedf43b35e221c78c811d0b7268b7be703d67b744ad16b23df01af14b2aa5899`

Type:

```lean
DecidableEq Bool
```

Fully explicit type:

```lean
DecidableEq.{1} Bool
```

Definition body (one-level semantic boundary):

```lean
Bool.decEq
```

### D040: `instDecidableEqFin`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `7f6d785554f797d18d5ae0b7475c25e8deca421e6ee688f036987ac99c66e1cd`

Type:

```lean
(n : Nat) → DecidableEq (Fin n)
```

Fully explicit type:

```lean
(n : Nat) → DecidableEq.{1} (Fin n)
```

Definition body (one-level semantic boundary):

```lean
fun n i j =>
  instDecidableEqFin.match_1 n i j (fun x => Decidable (Eq i j)) (decEq i.val j.val) (fun h => Decidable.isTrue ⋯)
    fun h => Decidable.isFalse ⋯
```

### D041: `instHAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `38066efd17aeeca52ec2890d9aafca2fa3cce8fda7f5843c1b8e5da130d93981`

Type:

```lean
{α : Type u_1} → [Add α] → HAdd α α α
```

Fully explicit type:

```lean
{α : Type u_1} → [Add.{u_1} α] → HAdd.{u_1, u_1, u_1} α α α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Add α] => { hAdd := fun a b => inst.add a b }
```

### D042: `AddCommMonoidWithOne.toAddMonoidWithOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `3`
- Semantic SHA-256: `07f48d3cfc3c7c30b6298df8531409d9844ab8c7e0ba94dea2a3fd29879320af`

Type:

```lean
{R : Type u_2} → [self : AddCommMonoidWithOne R] → AddMonoidWithOne R
```

Fully explicit type:

```lean
{R : Type u_2} → [self : AddCommMonoidWithOne.{u_2} R] → AddMonoidWithOne.{u_2} R
```

Definition body (one-level semantic boundary):

```lean
fun R [self : AddCommMonoidWithOne R] => self.1
```

### D043: `AddMonoidWithOne.toOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `3`
- Semantic SHA-256: `2ee638fd7292dbcf1e4adb85b14bbd0f304e8a260316e61621bf8eac03f03f6d`

Type:

```lean
{R : Type u_2} → [self : AddMonoidWithOne R] → One R
```

Fully explicit type:

```lean
{R : Type u_2} → [self : AddMonoidWithOne.{u_2} R] → One.{u_2} R
```

Definition body (one-level semantic boundary):

```lean
fun R [self : AddMonoidWithOne R] => self.3
```

### D044: `CommSemiring.toCommMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `3`
- Semantic SHA-256: `7c3695cad7d389c9461bb7db3449bf843fd6dec99bc600ff300ec7f323608806`

Type:

```lean
{R : Type u} → [self : CommSemiring R] → CommMonoid R
```

Fully explicit type:

```lean
{R : Type u} → [self : CommSemiring.{u} R] → CommMonoid.{u} R
```

Definition body (one-level semantic boundary):

```lean
fun R self =>
  { toMul := self.toMul, mul_assoc := ⋯, toOne := self.toOne, one_mul := ⋯, mul_one := ⋯, npow := self.npow,
    npow_zero := ⋯, npow_succ := ⋯, mul_comm := ⋯ }
```

### D045: `ENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `3`
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

### D046: `ENNReal.instAddCommMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `c856b17f6facb7a8852697a9fa35807b881aa5557bb4b679ab12ef4abdb6aa11`

Type:

```lean
AddCommMonoid ENNReal
```

Fully explicit type:

```lean
AddCommMonoid.{0} ENNReal
```

Definition body (one-level semantic boundary):

```lean
inferInstanceAs (AddCommMonoid (WithTop NNReal))
```

### D047: `ENNReal.instCommSemiring`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `3`
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

### D048: `ENNReal.instSub`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `9599a025438104bc6acfdbe59fefac770943f1a9798b19b78f83484cb4040bc0`

Type:

```lean
Sub ENNReal
```

Fully explicit type:

```lean
Sub.{0} ENNReal
```

Definition body (one-level semantic boundary):

```lean
inferInstanceAs (Sub (WithTop NNReal))
```

### D049: `ENNReal.ofNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `e9a7a03a1ff1a27277d98d3c565782e24ef8e1e6caf44b4e987e13cb00ef978f`

Type:

```lean
NNReal → ENNReal
```

Fully explicit type:

```lean
NNReal → ENNReal
```

Definition body (one-level semantic boundary):

```lean
WithTop.some
```

### D050: `Finset.prod`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.BigOperators.Group.Finset.Defs`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `e364cffe1f2457eedceca9fe0617d7a66084963ffb6e6ed760d1f3fe74eee841`

Type:

```lean
{ι : Type u_1} → {M : Type u_3} → [CommMonoid M] → Finset ι → (ι → M) → M
```

Fully explicit type:

```lean
{ι : Type u_1} → {M : Type u_3} → [CommMonoid.{u_3} M] → (s : Finset.{u_1} ι) → (f : ι → M) → M
```

Definition body (one-level semantic boundary):

```lean
fun {ι} {M} [CommMonoid M] s f => (Multiset.map f s.val).prod
```

### D051: `Finset.sum`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.BigOperators.Group.Finset.Defs`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `931ceac4e9efb5833f58970d10ced4621362e020ea1119492a8d379b7e692372`

Type:

```lean
{ι : Type u_1} → {M : Type u_3} → [AddCommMonoid M] → Finset ι → (ι → M) → M
```

Fully explicit type:

```lean
{ι : Type u_1} → {M : Type u_3} → [AddCommMonoid.{u_3} M] → (s : Finset.{u_1} ι) → (f : ι → M) → M
```

Definition body (one-level semantic boundary):

```lean
fun {ι} {M} [AddCommMonoid M] s f => (Multiset.map f s.val).sum
```

### D052: `HSub.hSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `3`
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

### D053: `instAddCommMonoidWithOneENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `31d9551885e3007e5d1368365622cfd7638ea41cc6d885234041621de873f55c`

Type:

```lean
AddCommMonoidWithOne ENNReal
```

Fully explicit type:

```lean
AddCommMonoidWithOne.{0} ENNReal
```

Definition body (one-level semantic boundary):

```lean
WithTop.addCommMonoidWithOne
```

### D054: `instHSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `3`
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

### D055: `ite`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `3029bae29d2d16b5aeb879ad3c12a1b3c4e78998083bf1ab4614942fafdece0e`

Type:

```lean
{α : Sort u} → (c : Prop) → [h : Decidable c] → α → α → α
```

Fully explicit type:

```lean
{α : Sort u} → (c : Prop) → [h : Decidable c] → (t e : α) → α
```

Definition body (one-level semantic boundary):

```lean
fun {α} c [h : Decidable c] t e => Decidable.casesOn h (fun x => e) fun x => t
```
