# Blind Lean declaration dossier

Translate only the mathematical proposition below. Source identity, task metadata,
theorem name, source declaration, proof, and repository commentary are excluded.
Do not use tools or inspect filesystem content.

## Elaborated target type

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω)
  [inst_1 : MeasureTheory.IsProbabilityMeasure μ],
  And
    (∀ (x : LocalDef002 μ),
      Real.instLE.le 0 (LocalDef001 μ x))
    (And (Eq (LocalDef001 μ 0) 0)
      (And
        (∀ (x : LocalDef002 μ),
          Iff (Eq (LocalDef001 μ x) 0) (Eq x 0))
        (And
          (∀ (x y : LocalDef002 μ),
            Real.instLE.le (LocalDef001 μ (instHAdd.hAdd x y))
              (instHAdd.hAdd (LocalDef001 μ x)
                (LocalDef001 μ y)))
          (∀ (c : Real) (x : LocalDef002 μ),
            Eq (LocalDef001 μ (instHSMul.hSMul c x))
              (instHMul.hMul (abs c) (LocalDef001 μ x))))))
```

## Fully explicit elaborated target type

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace.{u_1} Ω] (μ : @MeasureTheory.Measure.{u_1} Ω inst)
  [inst_1 : @MeasureTheory.IsProbabilityMeasure.{u_1} Ω inst μ],
  And
    (∀ (x : @LocalDef002.{u_1} Ω inst μ inst_1),
      @LE.le.{0} Real Real.instLE (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
        (@LocalDef001.{u_1} Ω inst μ inst_1 x))
    (And
      (@Eq.{1} Real
        (@LocalDef001.{u_1} Ω inst μ inst_1
          (@OfNat.ofNat.{u_1} (@LocalDef002.{u_1} Ω inst μ inst_1) (nat_lit 0)
            (@Zero.toOfNat0.{u_1} (@LocalDef002.{u_1} Ω inst μ inst_1)
              (@NegZeroClass.toZero.{u_1} (@LocalDef002.{u_1} Ω inst μ inst_1)
                (@SubNegZeroMonoid.toNegZeroClass.{u_1}
                  (@LocalDef002.{u_1} Ω inst μ inst_1)
                  (@SubtractionMonoid.toSubNegZeroMonoid.{u_1}
                    (@LocalDef002.{u_1} Ω inst μ inst_1)
                    (@SubtractionCommMonoid.toSubtractionMonoid.{u_1}
                      (@LocalDef002.{u_1} Ω inst μ inst_1)
                      (@AddCommGroup.toDivisionAddCommMonoid.{u_1}
                        (@LocalDef002.{u_1} Ω inst μ inst_1)
                        (@LocalDef003.{u_1} Ω inst μ
                          inst_1)))))))))
        (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero)))
      (And
        (∀ (x : @LocalDef002.{u_1} Ω inst μ inst_1),
          Iff
            (@Eq.{1} Real (@LocalDef001.{u_1} Ω inst μ inst_1 x)
              (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero)))
            (@Eq.{u_1 + 1} (@LocalDef002.{u_1} Ω inst μ inst_1) x
              (@OfNat.ofNat.{u_1} (@LocalDef002.{u_1} Ω inst μ inst_1) (nat_lit 0)
                (@Zero.toOfNat0.{u_1} (@LocalDef002.{u_1} Ω inst μ inst_1)
                  (@NegZeroClass.toZero.{u_1} (@LocalDef002.{u_1} Ω inst μ inst_1)
                    (@SubNegZeroMonoid.toNegZeroClass.{u_1}
                      (@LocalDef002.{u_1} Ω inst μ inst_1)
                      (@SubtractionMonoid.toSubNegZeroMonoid.{u_1}
                        (@LocalDef002.{u_1} Ω inst μ inst_1)
                        (@SubtractionCommMonoid.toSubtractionMonoid.{u_1}
                          (@LocalDef002.{u_1} Ω inst μ inst_1)
                          (@AddCommGroup.toDivisionAddCommMonoid.{u_1}
                            (@LocalDef002.{u_1} Ω inst μ inst_1)
                            (@LocalDef003.{u_1} Ω inst μ
                              inst_1))))))))))
        (And
          (∀ (x y : @LocalDef002.{u_1} Ω inst μ inst_1),
            @LE.le.{0} Real Real.instLE
              (@LocalDef001.{u_1} Ω inst μ inst_1
                (@HAdd.hAdd.{u_1, u_1, u_1} (@LocalDef002.{u_1} Ω inst μ inst_1)
                  (@LocalDef002.{u_1} Ω inst μ inst_1)
                  (@LocalDef002.{u_1} Ω inst μ inst_1)
                  (@instHAdd.{u_1} (@LocalDef002.{u_1} Ω inst μ inst_1)
                    (@AddCommMagma.toAdd.{u_1} (@LocalDef002.{u_1} Ω inst μ inst_1)
                      (@AddCommSemigroup.toAddCommMagma.{u_1}
                        (@LocalDef002.{u_1} Ω inst μ inst_1)
                        (@AddCommMonoid.toAddCommSemigroup.{u_1}
                          (@LocalDef002.{u_1} Ω inst μ inst_1)
                          (@AddCommGroup.toAddCommMonoid.{u_1}
                            (@LocalDef002.{u_1} Ω inst μ inst_1)
                            (@LocalDef003.{u_1} Ω inst μ
                              inst_1))))))
                  x y))
              (@HAdd.hAdd.{0, 0, 0} Real Real Real (@instHAdd.{0} Real Real.instAdd)
                (@LocalDef001.{u_1} Ω inst μ inst_1 x)
                (@LocalDef001.{u_1} Ω inst μ inst_1 y)))
          (∀ (c : Real) (x : @LocalDef002.{u_1} Ω inst μ inst_1),
            @Eq.{1} Real
              (@LocalDef001.{u_1} Ω inst μ inst_1
                (@HSMul.hSMul.{0, u_1, u_1} Real
                  (@LocalDef002.{u_1} Ω inst μ inst_1)
                  (@LocalDef002.{u_1} Ω inst μ inst_1)
                  (@instHSMul.{0, u_1} Real (@LocalDef002.{u_1} Ω inst μ inst_1)
                    (@SMulZeroClass.toSMul.{0, u_1} Real
                      (@LocalDef002.{u_1} Ω inst μ inst_1)
                      (@AddZero.toZero.{u_1} (@LocalDef002.{u_1} Ω inst μ inst_1)
                        (@AddZeroClass.toAddZero.{u_1}
                          (@LocalDef002.{u_1} Ω inst μ inst_1)
                          (@AddMonoid.toAddZeroClass.{u_1}
                            (@LocalDef002.{u_1} Ω inst μ inst_1)
                            (@SubNegMonoid.toAddMonoid.{u_1}
                              (@LocalDef002.{u_1} Ω inst μ inst_1)
                              (@AddGroup.toSubNegMonoid.{u_1}
                                (@LocalDef002.{u_1} Ω inst μ inst_1)
                                (@AddCommGroup.toAddGroup.{u_1}
                                  (@LocalDef002.{u_1} Ω inst μ inst_1)
                                  (@LocalDef003.{u_1} Ω inst μ
                                    inst_1)))))))
                      (@DistribSMul.toSMulZeroClass.{0, u_1} Real
                        (@LocalDef002.{u_1} Ω inst μ inst_1)
                        (@AddMonoid.toAddZeroClass.{u_1}
                          (@LocalDef002.{u_1} Ω inst μ inst_1)
                          (@SubNegMonoid.toAddMonoid.{u_1}
                            (@LocalDef002.{u_1} Ω inst μ inst_1)
                            (@AddGroup.toSubNegMonoid.{u_1}
                              (@LocalDef002.{u_1} Ω inst μ inst_1)
                              (@AddCommGroup.toAddGroup.{u_1}
                                (@LocalDef002.{u_1} Ω inst μ inst_1)
                                (@LocalDef003.{u_1} Ω inst μ
                                  inst_1)))))
                        (@DistribMulAction.toDistribSMul.{0, u_1} Real
                          (@LocalDef002.{u_1} Ω inst μ inst_1) Real.instMonoid
                          (@SubNegMonoid.toAddMonoid.{u_1}
                            (@LocalDef002.{u_1} Ω inst μ inst_1)
                            (@AddGroup.toSubNegMonoid.{u_1}
                              (@LocalDef002.{u_1} Ω inst μ inst_1)
                              (@AddCommGroup.toAddGroup.{u_1}
                                (@LocalDef002.{u_1} Ω inst μ inst_1)
                                (@LocalDef003.{u_1} Ω inst μ
                                  inst_1))))
                          (@Module.toDistribMulAction.{0, u_1} Real
                            (@LocalDef002.{u_1} Ω inst μ inst_1) Real.semiring
                            (@AddCommGroup.toAddCommMonoid.{u_1}
                              (@LocalDef002.{u_1} Ω inst μ inst_1)
                              (@LocalDef003.{u_1} Ω inst μ inst_1))
                            (@LocalDef004.{u_1} Ω inst μ inst_1))))))
                  c x))
              (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
                (@abs.{0} Real Real.lattice Real.instAddGroup c)
                (@LocalDef001.{u_1} Ω inst μ inst_1 x))))))
```

## Complete semantic dependency inventory

Return exactly one coverage record for every dependency ID, in order.

### D001: `LocalDef001`

- Role: `local`
- Owner module: `LocalImport001`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `14327f09d57a7ca4addd4025fbaf4db948e51d22ed47329751c84e411e741761`

Type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace Ω] →
    (μ : MeasureTheory.Measure Ω) →
      [inst_1 : MeasureTheory.IsProbabilityMeasure μ] → LocalDef002 μ → Real
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} [MeasurableSpace Ω] μ [MeasureTheory.IsProbabilityMeasure μ] x =>
  (LocalDef007 μ x).toReal
```

### D002: `LocalDef002`

- Role: `local`
- Owner module: `LocalImport001`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `a45c385303444fb971348def6898784b9bd17063f598fb8207cfad0a7ad079ba`

Type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace Ω] → (μ : MeasureTheory.Measure Ω) → [MeasureTheory.IsProbabilityMeasure μ] → Type u_1
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} [MeasurableSpace Ω] μ [MeasureTheory.IsProbabilityMeasure μ] =>
  Submodule.hasQuotient.Quotient
    (Subtype fun x => SetLike.instMembership.mem (LocalDef005 μ) x)
    (LocalDef006 μ)
```

### D003: `LocalDef003`

- Role: `local`
- Owner module: `LocalImport001`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `356c909c1a66ebdea54436fc61d0c3a25d78f814b1f5b345f85977113c2129f2`

Type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace Ω] →
    (μ : MeasureTheory.Measure Ω) →
      [inst_1 : MeasureTheory.IsProbabilityMeasure μ] → AddCommGroup (LocalDef002 μ)
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} [MeasurableSpace Ω] μ [MeasureTheory.IsProbabilityMeasure μ] =>
  id (Submodule.Quotient.addCommGroup (LocalDef006 μ))
```

### D004: `LocalDef004`

- Role: `local`
- Owner module: `LocalImport001`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `9940531e3e83534449cbc644301e882e1e19e227d0dcfa99aa58f29d625c5005`

Type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace Ω] →
    (μ : MeasureTheory.Measure Ω) →
      [inst_1 : MeasureTheory.IsProbabilityMeasure μ] → Module Real (LocalDef002 μ)
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} [MeasurableSpace Ω] μ [MeasureTheory.IsProbabilityMeasure μ] =>
  id (Submodule.Quotient.module (LocalDef006 μ))
```

### D005: `LocalDef005`

- Role: `local`
- Owner module: `LocalImport001`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `5bfda0b453d51c0c8d0e6597ecf4bf21099b2c55b4f666e0f272b8555158e91e`

Type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace Ω] →
    (μ : MeasureTheory.Measure Ω) → [MeasureTheory.IsProbabilityMeasure μ] → Submodule Real (Ω → Real)
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} [MeasurableSpace Ω] μ [MeasureTheory.IsProbabilityMeasure μ] =>
  {
    carrier :=
      setOf fun X =>
        And (Measurable X)
          (ENNReal.instPartialOrder.lt (LocalDef008 μ X) instTopENNReal.top),
    add_mem' := ⋯, zero_mem' := ⋯, smul_mem' := ⋯ }
```

### D006: `LocalDef006`

- Role: `local`
- Owner module: `LocalImport001`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `0878789b3bbab166084b0d7f37cf8029d4bc09326569d7b3f8fef2a00c254863`

Type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace Ω] →
    (μ : MeasureTheory.Measure Ω) →
      [inst_1 : MeasureTheory.IsProbabilityMeasure μ] →
        Submodule Real
          (Subtype fun x => SetLike.instMembership.mem (LocalDef005 μ) x)
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} [MeasurableSpace Ω] μ [MeasureTheory.IsProbabilityMeasure μ] =>
  { carrier := setOf fun X => (MeasureTheory.ae μ).EventuallyEq X.val fun x => 0, add_mem' := ⋯, zero_mem' := ⋯,
    smul_mem' := ⋯ }
```

### D007: `LocalDef007`

- Role: `local`
- Owner module: `LocalImport001`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `29ec8fa7d0c2f8e27593a1e258023ebe63561a0bef94077758540375041e1071`

Type:

```lean
{Ω : Type u_1} →
  [inst : MeasurableSpace Ω] →
    (μ : MeasureTheory.Measure Ω) →
      [inst_1 : MeasureTheory.IsProbabilityMeasure μ] → LocalDef002 μ → ENNReal
```

Definition body (one-level semantic boundary):

```lean
fun {Ω} [MeasurableSpace Ω] μ [MeasureTheory.IsProbabilityMeasure μ] =>
  Quotient.lift (fun X => LocalDef008 μ X.val) ⋯
```

### D008: `LocalDef008`

- Role: `local`
- Owner module: `AuditTarget`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `13e4fc681870d7011fb2cf1c0c82a423b181ab89c0d074bddbcadfb4d4acfce3`

Hash-verified prior declaration review:

- Reuse SHA-256: `537e1856aed892262d4c01aed750e324eb87e7302190f885be959cefc4d9c059`
- Reviewed meaning: The infimum in ENNReal of all t satisfying LocalDef002 mu X t.

Independently determine this declaration's effect on the current proposition.

### D009: `LocalDef009`

- Role: `local`
- Owner module: `LocalImport001`
- Declaration kind: `theorem`
- Distance from target type: `3`
- Semantic SHA-256: `738613160ac9002d9f47e7110a680a388ddba463793cd5383ba6933bef3c67c5`

Type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω) {X Y : Ω → Real},
  Set.instMembership.mem
      (setOf fun X =>
        And (Measurable X)
          (ENNReal.instPartialOrder.lt (LocalDef008 μ X) instTopENNReal.top))
      X →
    Set.instMembership.mem
        (setOf fun X =>
          And (Measurable X)
            (ENNReal.instPartialOrder.lt (LocalDef008 μ X) instTopENNReal.top))
        Y →
      And (Measurable (instHAdd.hAdd X Y))
        (ENNReal.instPartialOrder.lt (LocalDef008 μ (instHAdd.hAdd X Y))
          instTopENNReal.top)
```

### D010: `LocalDef010`

- Role: `local`
- Owner module: `LocalImport001`
- Declaration kind: `theorem`
- Distance from target type: `3`
- Semantic SHA-256: `ed55cd23c39d007ed53f24b4b1501cf04d742f2be509aa5882d0ea5af7048577`

Type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ],
  And (Measurable 0)
    (ENNReal.instPartialOrder.lt (LocalDef008 μ 0) instTopENNReal.top)
```

### D011: `LocalDef011`

- Role: `local`
- Owner module: `LocalImport001`
- Declaration kind: `theorem`
- Distance from target type: `3`
- Semantic SHA-256: `38a582b30a3f358aeba53a8979c920d67281644d4bbc8c01155a06eed345bdda`

Type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
  (c : Real) {X : Ω → Real},
  Set.instMembership.mem
      (setOf fun X =>
        And (Measurable X)
          (ENNReal.instPartialOrder.lt (LocalDef008 μ X) instTopENNReal.top))
      X →
    And (Measurable (instHSMul.hSMul c X))
      (ENNReal.instPartialOrder.lt (LocalDef008 μ (instHSMul.hSMul c X))
        instTopENNReal.top)
```

### D012: `LocalDef012`

- Role: `local`
- Owner module: `LocalImport001`
- Declaration kind: `theorem`
- Distance from target type: `3`
- Semantic SHA-256: `cf14dee9c99207617c461bec5706e2d9795d72679f8074aecdec9f97685c06b3`

Type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω)
  [inst_1 : MeasureTheory.IsProbabilityMeasure μ]
  {X Y : Subtype fun x => SetLike.instMembership.mem (LocalDef005 μ) x},
  Set.instMembership.mem (setOf fun X => (MeasureTheory.ae μ).EventuallyEq X.val fun x => 0) X →
    Set.instMembership.mem (setOf fun X => (MeasureTheory.ae μ).EventuallyEq X.val fun x => 0) Y →
      Set.instMembership.mem (setOf fun X => (MeasureTheory.ae μ).EventuallyEq X.val fun x => 0) (instHAdd.hAdd X Y)
```

### D013: `LocalDef013`

- Role: `local`
- Owner module: `LocalImport001`
- Declaration kind: `theorem`
- Distance from target type: `3`
- Semantic SHA-256: `f02478fb695f86c0d95e336903c2a6482f7148dfd00f0944aff1acfb90a63c24`

Type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω)
  [inst_1 : MeasureTheory.IsProbabilityMeasure μ],
  Set.instMembership.mem (setOf fun X => (MeasureTheory.ae μ).EventuallyEq X.val fun x => 0) 0
```

### D014: `LocalDef014`

- Role: `local`
- Owner module: `LocalImport001`
- Declaration kind: `theorem`
- Distance from target type: `3`
- Semantic SHA-256: `9371008c4af827706cc293725ee3f784e83360b47b8de5c4ebf2c7d6613f3a8a`

Type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω)
  [inst_1 : MeasureTheory.IsProbabilityMeasure μ] (c : Real)
  {X : Subtype fun x => SetLike.instMembership.mem (LocalDef005 μ) x},
  Set.instMembership.mem (setOf fun X => (MeasureTheory.ae μ).EventuallyEq X.val fun x => 0) X →
    Set.instMembership.mem (setOf fun X => (MeasureTheory.ae μ).EventuallyEq X.val fun x => 0) (instHSMul.hSMul c X)
```

### D015: `LocalDef015`

- Role: `local`
- Owner module: `LocalImport001`
- Declaration kind: `theorem`
- Distance from target type: `3`
- Semantic SHA-256: `342062f0aa24622312b6358f525b2a5f4632d848d94bf6c8ce916073df7bb539`

Type:

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω)
  [inst_1 : MeasureTheory.IsProbabilityMeasure μ]
  (X Y : Subtype fun x => SetLike.instMembership.mem (LocalDef005 μ) x),
  instHasEquivOfSetoid.Equiv X Y →
    Eq (LocalDef008 μ X.val)
      (LocalDef008 μ Y.val)
```

### D016: `LocalDef016`

- Role: `local`
- Owner module: `AuditTarget`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `9f73f8742fb196e7c43cf0d92dc187f592685c349468d2f7fdf9dfb9e033c93a`

Hash-verified prior declaration review:

- Reuse SHA-256: `2535a2e95b0f436ed498e71a6353eb7e9c265dde7dac6d5bbecd8834ef2888b1`
- Reviewed meaning: For an extended nonnegative scale t, X is measurable, t is neither 0 nor infinity, exp(X(omega)^2/(t.toReal)^2) is integrable, and its integral is at most 2.

Independently determine this declaration's effect on the current proposition.

### D017: `LocalDef017`

- Role: `local`
- Owner module: `AuditTarget`
- Declaration kind: `theorem`
- Distance from target type: `5`
- Semantic SHA-256: `fc6f0acac369fc53fff8674eb14f4192c56aa0842f4d959fbf8e54b19f362857`

Hash-verified prior declaration review:

- Reuse SHA-256: `f17c70eee0071643079e9aea1a13316e8fc3791b77e62001fcdabe271eed4527`
- Reviewed meaning: A proof that the natural numeral 1 + 1 is at least two, used to elaborate the real numeral 2.

Independently determine this declaration's effect on the current proposition.

### D018: `AddCommGroup.toAddCommMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `f727c3f01db957bd004eab61d742db6d02c6f9b2cdad465fa6f0ac214e09ccfd`

Type:

```lean
{G : Type u} → [self : AddCommGroup G] → AddCommMonoid G
```

Definition body (one-level semantic boundary):

```lean
fun G self => { toAddMonoid := self.toAddMonoid, add_comm := ⋯ }
```

### D019: `AddCommGroup.toAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `7f49725cf4bc16610110860af8f38e6d0fe472c7c1af93721407bad8c7375729`

Type:

```lean
{G : Type u} → [self : AddCommGroup G] → AddGroup G
```

Definition body (one-level semantic boundary):

```lean
fun G [self : AddCommGroup G] => self.1
```

### D020: `AddCommGroup.toDivisionAddCommMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `72951116f9ecb1048b235282fec669b8c3dfd809e3810c987dc6f18968d013d3`

Type:

```lean
{G : Type u_1} → [AddCommGroup G] → SubtractionCommMonoid G
```

Definition body (one-level semantic boundary):

```lean
fun {G} [inst : AddCommGroup G] =>
  let __src := inst;
  let __src_1 := AddGroup.toSubtractionMonoid;
  { toSubNegMonoid := __src.toSubNegMonoid, neg_neg := ⋯, neg_add_rev := ⋯, neg_eq_of_add := ⋯, add_comm := ⋯ }
```

### D021: `AddCommMagma.toAdd`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `78a12fabc3611bc39705a2dcf3fa82ed1f226d804e888d57546b885fefae4453`

Type:

```lean
{G : Type u} → [self : AddCommMagma G] → Add G
```

Definition body (one-level semantic boundary):

```lean
fun G [self : AddCommMagma G] => self.1
```

### D022: `AddCommMonoid.toAddCommSemigroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `dc7cae9f3611bf7a48fc6ba815db5cffeba3ac95ae33d26bec77b827bd041f26`

Type:

```lean
{M : Type u} → [self : AddCommMonoid M] → AddCommSemigroup M
```

Definition body (one-level semantic boundary):

```lean
fun M self => { toAddSemigroup := self.toAddSemigroup, add_comm := ⋯ }
```

### D023: `AddCommSemigroup.toAddCommMagma`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `78f90c6bc01ad86e28d84a9011670656947204c6d8963785407a1b8eb54844ab`

Type:

```lean
{G : Type u} → [self : AddCommSemigroup G] → AddCommMagma G
```

Definition body (one-level semantic boundary):

```lean
fun G self => { toAdd := self.toAdd, add_comm := ⋯ }
```

### D024: `AddGroup.toSubNegMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `8c0fca6ee264d934b25c679f16be6b83bb2a2f7c58a8ac0afab0c146219e16a1`

Type:

```lean
{A : Type u} → [self : AddGroup A] → SubNegMonoid A
```

Definition body (one-level semantic boundary):

```lean
fun A [self : AddGroup A] => self.1
```

### D025: `AddMonoid.toAddZeroClass`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `4b5cfcaa0e3b1157089b486d5bfd51b9d15b881ea9cad302a6c8f701cae9ef1a`

Type:

```lean
{M : Type u} → [self : AddMonoid M] → AddZeroClass M
```

Definition body (one-level semantic boundary):

```lean
fun M self => { toZero := self.toZero, toAdd := self.toAdd, zero_add := ⋯, add_zero := ⋯ }
```

### D026: `AddZero.toZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `aa06299f9d38f11e9dad40701d7541d8eba2a4ac673c643f4c5f5ce1369490cc`

Type:

```lean
{M : Type u_2} → [self : AddZero M] → Zero M
```

Definition body (one-level semantic boundary):

```lean
fun M [self : AddZero M] => self.1
```

### D027: `AddZeroClass.toAddZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `8f64c653a96443ff67b52a5edb3fc264d279905b936c7303e9dd2469af000213`

Type:

```lean
{M : Type u} → [self : AddZeroClass M] → AddZero M
```

Definition body (one-level semantic boundary):

```lean
fun M [self : AddZeroClass M] => self.1
```

### D028: `And`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `37ecdc009aa953e3d4924ef10e6a1fb591f6af993cd344fd5a6b5321466517c9`

Hash-verified prior declaration review:

- Reuse SHA-256: `4421d815a610da7ba551c4f477b9e9690c626fe3b4748223d6dd6376ed5618c3`
- Reviewed meaning: Logical conjunction.

Independently determine this declaration's effect on the current proposition.

### D029: `DistribMulAction.toDistribSMul`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.GroupWithZero.Action.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `17a3c7e66a4c2897891d468da70a58e73aa0b8e044ea0cc90d8d6e9e51c08f02`

Type:

```lean
{M : Type u_1} → {A : Type u_7} → [inst : Monoid M] → [inst_1 : AddMonoid A] → [DistribMulAction M A] → DistribSMul M A
```

Definition body (one-level semantic boundary):

```lean
fun {M} {A} [Monoid M] [AddMonoid A] [inst_2 : DistribMulAction M A] =>
  let __src := inst_2;
  { toSMul := __src.toSMul, smul_zero := ⋯, smul_add := ⋯ }
```

### D030: `DistribSMul.toSMulZeroClass`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.GroupWithZero.Action.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `f640928ea31b161891006aaf9950d636ac5e1fbda413a7712f36546c938b3fdf`

Type:

```lean
{M : Type u_12} → {A : Type u_13} → {inst : AddZeroClass A} → [self : DistribSMul M A] → SMulZeroClass M A
```

Definition body (one-level semantic boundary):

```lean
fun M A {inst} [self : DistribSMul M A] => self.1
```

### D031: `Eq`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `63e9afa87e04d13393a2fe09e8e76489d96be3982734b4b40a52fc6ebea863d7`

Hash-verified prior declaration review:

- Reuse SHA-256: `2d09f24ccd94a6cc730bf6e932349a66299bfbc79dc00d1ccf941fe4f251b9f3`
- Reviewed meaning: Propositional equality.

Independently determine this declaration's effect on the current proposition.

### D032: `HAdd.hAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `e0bf2a92addd6ea713343e4ef69f67e4e1155781d08f46957b9f71412d865f59`

Hash-verified prior declaration review:

- Reuse SHA-256: `85209e484f35edb05e792c0b84bcbf405dc96b36aabadcc9408c9c38d1b7762a`
- Reviewed meaning: Heterogeneous addition notation supplied by an HAdd instance.

Independently determine this declaration's effect on the current proposition.

### D033: `HMul.hMul`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `4e00447a4a8ef4c2ce13e307c56a1fbcd7fa8c732fe039a452b42477a50df2c6`

Hash-verified prior declaration review:

- Reuse SHA-256: `0e9c75c71795468c8c4b94a2b596b8d7248daa35dd625591d73c0b2a8ab542d6`
- Reviewed meaning: Heterogeneous multiplication notation supplied by an HMul instance.

Independently determine this declaration's effect on the current proposition.

### D034: `HSMul.hSMul`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `f1757307432fadbd23925bbf0a318b8da57d17711478e1073a19ce64c21d55f4`

Type:

```lean
{α : Type u} → {β : Type v} → {γ : outParam (Type w)} → [self : HSMul α β γ] → α → β → γ
```

Definition body (one-level semantic boundary):

```lean
fun α β {γ} [self : HSMul α β γ] => self.1
```

### D035: `Iff`

- Role: `external-frontier`
- Owner module: `Init.Core`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `b9f48489cd9ca513eeae7e3e4fb154f354b93867eda8b67d1630275c4cb4f30b`

Hash-verified prior declaration review:

- Reuse SHA-256: `a841b911d088b9447554d00320800de44a8c9eacba0f1cbd42f4bd79372b692f`
- Reviewed meaning: Logical equivalence.

Independently determine this declaration's effect on the current proposition.

### D036: `LE.le`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `54a32f2661f788eb2b860006c4d1e8031e126febafe1c8d03ce50529b773dc48`

Hash-verified prior declaration review:

- Reuse SHA-256: `7bba557fa9e689993df132543c28262dc3da904a57e5b1dbe48a6885004c4d5d`
- Reviewed meaning: The non-strict order operation supplied by an LE instance.

Independently determine this declaration's effect on the current proposition.

### D037: `MeasurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.MeasurableSpace.Defs`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `6825e55082259c6be2028d5ee0624c796293eccdd78af118da4583180067d196`

Hash-verified prior declaration review:

- Reuse SHA-256: `2f378a27053afed42ed3ccaae28bee58b3011bb29106b6394825a81bf352272d`
- Reviewed meaning: A sigma-algebra structure specifying the measurable sets of a type.

Independently determine this declaration's effect on the current proposition.

### D038: `MeasureTheory.IsProbabilityMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Typeclasses.Probability`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `f88b269cb95d165125e7553fd22f97d6e5f9b1b9bcdec7f6738a781dc674bf89`

Hash-verified prior declaration review:

- Reuse SHA-256: `76a42811f5eb30df9ace42fae5b2fb1e8e33bba3041c09c61d88a550c23fb68b`
- Reviewed meaning: The assertion/typeclass that the measure has total mass one.

Independently determine this declaration's effect on the current proposition.

### D039: `MeasureTheory.Measure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `ba8c23c70f3135407096406cee0b4d7d9f02d088e8b1d1a1e105071821a3a51b`

Hash-verified prior declaration review:

- Reuse SHA-256: `fcdedb2b4ff37ac7940b8972153892bfc85adab3edc4c691ce689360fcb8e51d`
- Reviewed meaning: A measure on a measurable space.

Independently determine this declaration's effect on the current proposition.

### D040: `Module.toDistribMulAction`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Module.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `88cb31241158a61c2eaae8459f700e8db39d9fca998e95d4fa73b87b68be8c60`

Type:

```lean
{R : Type u} →
  {M : Type v} → {inst : Semiring R} → {inst_1 : AddCommMonoid M} → [self : Module R M] → DistribMulAction R M
```

Definition body (one-level semantic boundary):

```lean
fun R M {inst} {inst_1} [self : Module R M] => self.1
```

### D041: `NegZeroClass.toZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `881414a459dbdc250afc9bc468e98b17f776dfd31f2aa5eb9acee71a8d1543f7`

Type:

```lean
{G : Type u_2} → [self : NegZeroClass G] → Zero G
```

Definition body (one-level semantic boundary):

```lean
fun G [self : NegZeroClass G] => self.1
```

### D042: `OfNat.ofNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6a6a0720d091cfeb582747fe67b977e948f09706c0beae1f2f21830aa5821ead`

Hash-verified prior declaration review:

- Reuse SHA-256: `5344ba425b7ae5868717ac91ebb9877d11d96d6df01ca423c5653d98b45b262c`
- Reviewed meaning: Interpretation of a natural numeral in another type.

Independently determine this declaration's effect on the current proposition.

### D043: `Real`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `38529f0578472feffc4c79d5d0755fa10fc3edafb232ab5e442336d13630ee90`

Hash-verified prior declaration review:

- Reuse SHA-256: `4eb4699751a8bbc1d649b978ec53d5a32dfc56548efec7f53933f53216c31ba5`
- Reviewed meaning: The real numbers.

Independently determine this declaration's effect on the current proposition.

### D044: `Real.instAdd`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f99208c181266311bec9c890b688378f329076f9e6be38fe93d9cedf4d7f50ce`

Type:

```lean
Add Real
```

Definition body (one-level semantic boundary):

```lean
{ add := Real.add✝ }
```

### D045: `Real.instAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f0de8cbc2c873a19be749cd9b2d3cc9a6edb9ebc92020a1877714a50c23d9dc0`

Hash-verified prior declaration review:

- Reuse SHA-256: `6c6b3aed14b0b911372ee985febb608fbf60c402b5d2b1f11b462cb96d6a35af`
- Reviewed meaning: The usual additive group structure on Real.

Independently determine this declaration's effect on the current proposition.

### D046: `Real.instLE`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `144d825fc543455e17044e843560e0415f8e4e9da60afb52f34edb809b7c34d3`

Hash-verified prior declaration review:

- Reuse SHA-256: `8cdefa2452132a512c10a6aa1f792948b9dc467e8c8b7db93cf8ad3df1cc84d5`
- Reviewed meaning: The usual non-strict order on the real numbers.

Independently determine this declaration's effect on the current proposition.

### D047: `Real.instMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `37978679365b30167654c1ef9ecb0fa938325c2047191daa7208aee389c0b4b8`

Hash-verified prior declaration review:

- Reuse SHA-256: `eae1ac1f865aa09f65e078607f7a63f22246f8e0ead0d35a3ec8f3d84f6499e6`
- Reviewed meaning: The multiplicative monoid structure on the real numbers.

Independently determine this declaration's effect on the current proposition.

### D048: `Real.instMul`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `459ccbe28a1d29ccd2b329ea29e1a84b329b8064b8a8ecc52764b69b23e229ed`

Hash-verified prior declaration review:

- Reuse SHA-256: `35f005356d1be0c02bcac8ae9eaa6ce72739d9fec066d185ff13da78bd061648`
- Reviewed meaning: The usual multiplication on Real.

Independently determine this declaration's effect on the current proposition.

### D049: `Real.instZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `860eaaa75b06ac6fccbf4f27e9e162807e8851d04bb42d2411332c6368b14882`

Hash-verified prior declaration review:

- Reuse SHA-256: `025d7ecc650c08d9f3df603efce256df2cd319782ce4e8ed9c76b0ed0dd0b77b`
- Reviewed meaning: The usual zero element of the real numbers.

Independently determine this declaration's effect on the current proposition.

### D050: `Real.lattice`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5bccf78d647cf08233ff548c19523f80b1d1bf11b5a76aa50396199e2c0c7510`

Hash-verified prior declaration review:

- Reuse SHA-256: `a960675c863fbcc56ef8e338467f868d1e6297e475901d49a5689e01823a89ee`
- Reviewed meaning: The lattice order structure on Real.

Independently determine this declaration's effect on the current proposition.

### D051: `Real.semiring`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `c0106cafec59cbaa840a6e4c7ee72e629b4456feb6db98c6bf8c3085fcac475c`

Type:

```lean
Semiring Real
```

Definition body (one-level semantic boundary):

```lean
inferInstance
```

### D052: `SMulZeroClass.toSMul`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.GroupWithZero.Action.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `a8cadadddb0c9fd4a7bcb7c57401fafb43a1f330afa35fdacacb6d0e82d0bcf6`

Type:

```lean
{M : Type u_12} → {A : Type u_13} → {inst : Zero A} → [self : SMulZeroClass M A] → SMul M A
```

Definition body (one-level semantic boundary):

```lean
fun M A {inst} [self : SMulZeroClass M A] => self.1
```

### D053: `SubNegMonoid.toAddMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `9e6f6ef922e3c39bdc8dcf74fa873f2e393c916c08aa49739c9dcafb3f96877b`

Type:

```lean
{G : Type u} → [self : SubNegMonoid G] → AddMonoid G
```

Definition body (one-level semantic boundary):

```lean
fun G [self : SubNegMonoid G] => self.1
```

### D054: `SubNegZeroMonoid.toNegZeroClass`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `0ca9c4737492ec2a9a5ab16ab065d00204507f2caf80997692c360afbf962577`

Type:

```lean
{G : Type u_2} → [self : SubNegZeroMonoid G] → NegZeroClass G
```

Definition body (one-level semantic boundary):

```lean
fun G self => { toZero := self.toZero, toNeg := self.toNeg, neg_zero := ⋯ }
```

### D055: `SubtractionCommMonoid.toSubtractionMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `e56d8d718ddbe8a62b0e5b703adfd59bd19f46dac79c341b3d3742ed6ee462c9`

Type:

```lean
{G : Type u} → [self : SubtractionCommMonoid G] → SubtractionMonoid G
```

Definition body (one-level semantic boundary):

```lean
fun G [self : SubtractionCommMonoid G] => self.1
```

### D056: `SubtractionMonoid.toSubNegZeroMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `700a470249543a704f0b5910309b7d1f4c918e3b645f806242c291c98eff4e28`

Type:

```lean
{α : Type u_1} → [SubtractionMonoid α] → SubNegZeroMonoid α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : SubtractionMonoid α] =>
  let __src := inst.toSubNegMonoid;
  { toSubNegMonoid := __src, neg_zero := ⋯ }
```

### D057: `Zero.toOfNat0`

- Role: `external-frontier`
- Owner module: `Init.Data.Zero`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f7ebe8a983de002c1ee751fd3c144a7c1933b3bb95c87c5001a3cabf5709031a`

Hash-verified prior declaration review:

- Reuse SHA-256: `6f45b8e08eb244a553e4aa8fe7d5c482ac0211ae0bdead474533ba786e35f634`
- Reviewed meaning: The standard construction interpreting numeral 0 from a Zero instance.

Independently determine this declaration's effect on the current proposition.

### D058: `abs`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Order.Group.Unbundled.Abs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8ec55bade8dee4d49822a9bdbd84db24c019b8d568452329d9766390229a9c1b`

Hash-verified prior declaration review:

- Reuse SHA-256: `dc40461336d8e7e2d85562564cb46d0985fda5a916f77bbb3e956ddc96fcc0a1`
- Reviewed meaning: The usual absolute value in an ordered additive group; here, real absolute value.

Independently determine this declaration's effect on the current proposition.

### D059: `instHAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `38066efd17aeeca52ec2890d9aafca2fa3cce8fda7f5843c1b8e5da130d93981`

Hash-verified prior declaration review:

- Reuse SHA-256: `844d4906de9e2122fc34f03eaf40377dde5ac3a7fb0c7b323555878a68a292ad`
- Reviewed meaning: The homogeneous HAdd instance induced by ordinary addition.

Independently determine this declaration's effect on the current proposition.

### D060: `instHMul`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `1fd375514ac68e29e7941c94ba308ea936395db23d0fee63a5c69dcccd3b2bdc`

Hash-verified prior declaration review:

- Reuse SHA-256: `d64e93294328a9cbe9983aebb9f296604962e3d9ce8e36662ce5359497808c1d`
- Reviewed meaning: The homogeneous HMul instance induced by ordinary multiplication.

Independently determine this declaration's effect on the current proposition.

### D061: `instHSMul`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `04ea7c06812eccb8531b763b7aa28fd8f968befff069e74166ff1b406f7512e3`

Type:

```lean
{α : Type u_1} → {β : Type u_2} → [SMul α β] → HSMul α β β
```

Definition body (one-level semantic boundary):

```lean
fun {α} {β} [inst : SMul α β] => { hSMul := inst.smul }
```

### D062: `AddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `inductive`
- Distance from target type: `2`
- Semantic SHA-256: `087ff419a44ee7e835bedcf1beda5a1fee5971b4ef4f17124a5a63cd2b0beb30`

Type:

```lean
Type u → Type u
```

### D063: `ENNReal.toReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `1aa070f54e8aff7a6558c977220472990963777ddc5f04c5284f49422c06b41f`

Hash-verified prior declaration review:

- Reuse SHA-256: `b41426d17da689c3b03f28aa353adaf8009e6d5ad52c12ea92ee822a7c842631`
- Reviewed meaning: Conversion of an extended nonnegative real to a real via its nonnegative-real part; infinity converts according to the library's toReal convention.

Independently determine this declaration's effect on the current proposition.

### D064: `HasQuotient.Quotient`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Quotient`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `91e0466a7f0d9b6d0c9abff8741d9198539e42cbc1fc9fde180f4dd55e1b9aa1`

Type:

```lean
(A : outParam (Type u)) → {B : Type v} → [self : HasQuotient A B] → B → Type (max u v)
```

Definition body (one-level semantic boundary):

```lean
fun {A} B [self : HasQuotient A B] => self.1
```

### D065: `InnerProductSpace.toNormedSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.InnerProductSpace.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `683435a8d27d50ec1482d74d23f541d52d05ff0411c60f88d16c32132aca9f3e`

Hash-verified prior declaration review:

- Reuse SHA-256: `6a8870abf7670854b3174cff33981840ddc4c90b1a47dc3c01264be45763c34b`
- Reviewed meaning: The standard projection from an inner-product space to its normed-space structure.

Independently determine this declaration's effect on the current proposition.

### D066: `Membership.mem`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `941ea3346e809f919727c21bfcdeea342714a6b83f1cf871d648aa2cb14d6e9e`

Type:

```lean
{α : outParam (Type u)} → {γ : Type v} → [self : Membership α γ] → γ → α → Prop
```

Definition body (one-level semantic boundary):

```lean
fun {α} γ [self : Membership α γ] => self.1
```

### D067: `Module`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Module.Defs`
- Declaration kind: `inductive`
- Distance from target type: `2`
- Semantic SHA-256: `132ed119db2ae117b4c85e91594e4fcde0e02a8fde0fb2ee5c57a7a9263c219c`

Type:

```lean
(R : Type u) → (M : Type v) → [Semiring R] → [AddCommMonoid M] → Type (max u v)
```

### D068: `NonUnitalSeminormedCommRing.toNonUnitalSeminormedRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `c697ff5e735ebe18733e51950717037e73ba73e94ac2e99953bfb521708cabd2`

Hash-verified prior declaration review:

- Reuse SHA-256: `240d5c415db47f5a74afcac8c7cf2314df43ab33bb6323defc1289fb0c5642ef`
- Reviewed meaning: The standard projection forgetting commutativity from a nonunital seminormed commutative ring.

Independently determine this declaration's effect on the current proposition.

### D069: `NonUnitalSeminormedRing.toSeminormedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `db7996fa414ad67340b9d6991cd145ac2a5d251a870097d20f2f63e371fb101d`

Hash-verified prior declaration review:

- Reuse SHA-256: `ae57b08bec42b5cc4312849e3b2cbf4babb4aef8211dcc1a5319d6eb37b79315`
- Reviewed meaning: The standard additive seminormed-group structure derived from a nonunital seminormed ring.

Independently determine this declaration's effect on the current proposition.

### D070: `NormedCommRing.toSeminormedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `ad504b2606febc5a066d58ac540c9826bd1b7fce734d59a7fef63c7c27112fe3`

Hash-verified prior declaration review:

- Reuse SHA-256: `285e6d81b2e3f3886c4e1d294c4e84c53ed8829716ca9f29fd5dbe72d3d3a5c7`
- Reviewed meaning: The standard projection from a normed commutative ring to a seminormed commutative ring.

Independently determine this declaration's effect on the current proposition.

### D071: `NormedSpace.toModule`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Module.Basic`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `5ced27e2d9cc2259d662cced299ca3071b9598822fc551dad5a5d6dd0f3a9df4`

Type:

```lean
{𝕜 : Type u_6} →
  {E : Type u_7} → {inst : NormedField 𝕜} → {inst_1 : SeminormedAddCommGroup E} → [self : NormedSpace 𝕜 E] → Module 𝕜 E
```

Definition body (one-level semantic boundary):

```lean
fun 𝕜 E {inst} {inst_1} [self : NormedSpace 𝕜 E] => self.1
```

### D072: `Pi.Function.module`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Module.Pi`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `921742a1effe7c5d653ed6512c1187064090ee805009644177b1646ce2ee15b1`

Type:

```lean
(I : Type u) →
  (α : Type u_1) → (β : Type u_2) → [inst : Semiring α] → [inst_1 : AddCommMonoid β] → [Module α β] → Module α (I → β)
```

Definition body (one-level semantic boundary):

```lean
fun I α β [Semiring α] [AddCommMonoid β] [Module α β] => Pi.module I (fun a => β) α
```

### D073: `Pi.addCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Pi.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `1ff5ab7097969c98627adc1250432bd9fa32995632035a4346ce1d770c552153`

Type:

```lean
{I : Type u} → {f : I → Type v₁} → [(i : I) → AddCommGroup (f i)] → AddCommGroup ((i : I) → f i)
```

Definition body (one-level semantic boundary):

```lean
fun {I} {f} [(i : I) → AddCommGroup (f i)] =>
  let __src := Pi.addGroup;
  have __src_1 := Pi.addCommMonoid;
  { toAddGroup := __src, add_comm := ⋯ }
```

### D074: `Pi.addCommMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Pi.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `9b57724ac626ed82a5e3b9060068391fe112af839994c2304c9990493e8e9fbc`

Type:

```lean
{I : Type u} → {f : I → Type v₁} → [(i : I) → AddCommMonoid (f i)] → AddCommMonoid ((i : I) → f i)
```

Definition body (one-level semantic boundary):

```lean
fun {I} {f} [(i : I) → AddCommMonoid (f i)] =>
  let __src := Pi.addMonoid;
  have __src_1 := Pi.addCommSemigroup;
  { toAddMonoid := __src, add_comm := ⋯ }
```

### D075: `RCLike.toInnerProductSpaceReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.InnerProductSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `f602276baee30d3dbe02bd6b756a9097f750d59a7f91ca7635dcfc935fd22981`

Hash-verified prior declaration review:

- Reuse SHA-256: `f313fc3f0cc5ab21ae93e792eed8aca9b1e6642b0daf2344152d9cbb0093f1ef`
- Reviewed meaning: The canonical real inner-product-space structure on an RCLike scalar type.

Independently determine this declaration's effect on the current proposition.

### D076: `Real.instAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `b34bb82f0825ba57903ab69349a17976c5b261082b1e5dd3b28e8c2a96ee46cc`

Type:

```lean
AddCommGroup Real
```

Definition body (one-level semantic boundary):

```lean
inferInstance
```

### D077: `Real.instAddCommMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `11a549e6c9caa007a4627570dd86aea756ada755f141da0356b8766788f2eef7`

Type:

```lean
AddCommMonoid Real
```

Definition body (one-level semantic boundary):

```lean
inferInstance
```

### D078: `Real.instRCLike`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.RCLike.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `d2fdb97b9d861fcf61e6dbea9993dfa0ca6aa16609742f215c35b3f7ddd16b8e`

Hash-verified prior declaration review:

- Reuse SHA-256: `09eb4c9bdb059c7a6eafd243362caae2b7e137c540bff1e078851b7cf7e4d8dc`
- Reviewed meaning: The standard RCLike structure on the real numbers.

Independently determine this declaration's effect on the current proposition.

### D079: `Real.instRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `3ab5d2d0076694ed1c8a64f946e9fb3ea8227cbc632e9ed0a942bd0bdcbe0e84`

Type:

```lean
Ring Real
```

Definition body (one-level semantic boundary):

```lean
inferInstance
```

### D080: `Real.normedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `69cccc1e864661e103785f4a2712b9ad164d845c03b7737801c37e5ac852bad7`

Hash-verified prior declaration review:

- Reuse SHA-256: `b31c59dce3507582d779767277f203d55d5c663c9ecead5a118ce85e59d21344`
- Reviewed meaning: The usual normed commutative ring structure on Real.

Independently determine this declaration's effect on the current proposition.

### D081: `Real.normedField`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Field.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `3249555a2824aa1e4e9c966b630ef876ae52df63ed09d0838da173aa28c0f77b`

Type:

```lean
NormedField Real
```

Definition body (one-level semantic boundary):

```lean
let __src := Real.normedAddCommGroup;
let __src_1 := Real.instField;
{ toNorm := __src.toNorm, toAddMonoid := __src.toAddMonoid, add_comm := Real.normedField._proof_1,
  toMul := __src_1.toMul, left_distrib := Real.normedField._proof_2, right_distrib := Real.normedField._proof_3,
  zero_mul := Real.normedField._proof_4, mul_zero := Real.normedField._proof_5, mul_assoc := Real.normedField._proof_6,
  toOne := __src_1.toOne, one_mul := Real.normedField._proof_7, mul_one := Real.normedField._proof_8,
  toNatCast := __src_1.toNatCast, natCast_zero := Real.normedField._proof_9, natCast_succ := Real.normedField._proof_10,
  npow := __src_1.npow, npow_zero := Real.normedField._proof_11, npow_succ := Real.normedField._proof_12,
  toNeg := __src.toNeg, toSub := __src.toSub, sub_eq_add_neg := Real.normedField._proof_13, zsmul := __src.zsmul,
  zsmul_zero' := Real.normedField._proof_14, zsmul_succ' := Real.normedField._proof_15,
  zsmul_neg' := Real.normedField._proof_16, neg_add_cancel := Real.normedField._proof_17,
  toIntCast := __src_1.toIntCast, intCast_ofNat := Real.normedField._proof_18,
  intCast_negSucc := Real.normedField._proof_19, mul_comm := Real.normedField._proof_20, toInv := __src_1.toInv,
  toDiv := __src_1.toDiv, div_eq_mul_inv := ⋯, zpow := __src_1.zpow, zpow_zero' := ⋯, zpow_succ' := ⋯, zpow_neg' := ⋯,
  toNontrivial := ⋯, toNNRatCast := __src_1.toNNRatCast, toRatCast := __src_1.toRatCast, mul_inv_cancel := ⋯,
  inv_zero := ⋯, nnratCast_def := ⋯, nnqsmul := __src_1.nnqsmul, nnqsmul_def := ⋯, ratCast_def := ⋯,
  qsmul := __src_1.qsmul, qsmul_def := ⋯, toMetricSpace := __src.toMetricSpace, dist_eq := ⋯, norm_mul := ⋯ }
```

### D082: `SeminormedCommRing.toNonUnitalSeminormedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `a29f0377c9baf2265c34aaf85b852e7c4260b34d2dc04574484c335ebc09a6e9`

Hash-verified prior declaration review:

- Reuse SHA-256: `fb9af7f12997cc557abf4e5e376b64159d916944bd39cd05f12f8b0c10a9c28c`
- Reviewed meaning: The standard projection from a seminormed commutative ring to its nonunital structure.

Independently determine this declaration's effect on the current proposition.

### D083: `SetLike.instMembership`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.SetLike.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `47a75450bbb51c4e8fdd9e8881cc3fa741dfb5f1f186d952055686e285c081e4`

Type:

```lean
{A : Type u_1} → {B : Type u_2} → [i : SetLike A B] → Membership B A
```

Definition body (one-level semantic boundary):

```lean
fun {A} {B} [i : SetLike A B] => { mem := fun p x => Set.instMembership.mem (i.coe p) x }
```

### D084: `Submodule`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Module.Submodule.Defs`
- Declaration kind: `inductive`
- Distance from target type: `2`
- Semantic SHA-256: `dc34d51ab2952b775b09278f439d1d0393daf90ed359c8f26aeec99b295179db`

Type:

```lean
(R : Type u) → (M : Type v) → [inst : Semiring R] → [inst_1 : AddCommMonoid M] → [Module R M] → Type v
```

### D085: `Submodule.Quotient.addCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.LinearAlgebra.Quotient.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `95124648fbfc3cb39d16d995869e39638e200b65f81d12a2b2c9a0b2f36d3eb7`

Type:

```lean
{R : Type u_1} →
  {M : Type u_2} →
    [inst : Ring R] →
      [inst_1 : AddCommGroup M] →
        [inst_2 : Module R M] → (p : Submodule R M) → AddCommGroup (Submodule.hasQuotient.Quotient M p)
```

Definition body (one-level semantic boundary):

```lean
fun {R} {M} [Ring R] [AddCommGroup M] [Module R M] p => QuotientAddGroup.Quotient.addCommGroup p.toAddSubgroup
```

### D086: `Submodule.Quotient.module`

- Role: `external-frontier`
- Owner module: `Mathlib.LinearAlgebra.Quotient.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `cebc5b042e325916616f8332fcd7673049d2fc62b4d2e59fb44af798c2b3e5aa`

Type:

```lean
{R : Type u_1} →
  {M : Type u_2} →
    [inst : Ring R] →
      [inst_1 : AddCommGroup M] →
        [inst_2 : Module R M] → (P : Submodule R M) → Module R (Submodule.hasQuotient.Quotient M P)
```

Definition body (one-level semantic boundary):

```lean
fun {R} {M} [Ring R] [AddCommGroup M] [Module R M] P => Submodule.Quotient.module' P
```

### D087: `Submodule.addCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Module.Submodule.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `b9eb029cf9b69adff09187a8ad4bafffe508134cb17afbbbec6e7264ba083e85`

Type:

```lean
{R : Type u} →
  {M : Type v} →
    [inst : Ring R] →
      [inst_1 : AddCommGroup M] →
        {module_M : Module R M} → (p : Submodule R M) → AddCommGroup (Subtype fun x => SetLike.instMembership.mem p x)
```

Definition body (one-level semantic boundary):

```lean
fun {R} {M} [Ring R] [AddCommGroup M] {module_M} p => p.toAddSubgroup.toAddCommGroup
```

### D088: `Submodule.addCommMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Module.Submodule.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `193d1d3edddd3ff52c0d8122320a1bcff40bce66a60878cdc5b3f2c1143617bb`

Type:

```lean
{R : Type u} →
  {M : Type v} →
    [inst : Semiring R] →
      [inst_1 : AddCommMonoid M] →
        {module_M : Module R M} → (p : Submodule R M) → AddCommMonoid (Subtype fun x => SetLike.instMembership.mem p x)
```

Definition body (one-level semantic boundary):

```lean
fun {R} {M} [Semiring R] [AddCommMonoid M] {module_M} p => p.toAddCommMonoid
```

### D089: `Submodule.hasQuotient`

- Role: `external-frontier`
- Owner module: `Mathlib.LinearAlgebra.Quotient.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `d3ea4bcdc59d1413b015ae3aa3e5a1e62b3b702a3934eb5d80774b7316f76209`

Type:

```lean
{R : Type u_1} →
  {M : Type u_2} → [inst : Ring R] → [inst_1 : AddCommGroup M] → [inst_2 : Module R M] → HasQuotient M (Submodule R M)
```

Definition body (one-level semantic boundary):

```lean
fun {R} {M} [Ring R] [AddCommGroup M] [Module R M] => { Quotient := fun p => Quotient p.quotientRel }
```

### D090: `Submodule.module`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Module.Submodule.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `38e6e6b7d41f06bf87b86f95ffa63b70e1bfd4613b44041645c6a708b21c5ded`

Type:

```lean
{R : Type u} →
  {M : Type v} →
    [inst : Semiring R] →
      [inst_1 : AddCommMonoid M] →
        {module_M : Module R M} → (p : Submodule R M) → Module R (Subtype fun x => SetLike.instMembership.mem p x)
```

Definition body (one-level semantic boundary):

```lean
fun {R} {M} [Semiring R] [AddCommMonoid M] {module_M} p => p.module'
```

### D091: `Submodule.setLike`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Module.Submodule.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `eb9ef22942558eec688655f5d38b6e84772742d6fe6ccb549666f024240be8a7`

Type:

```lean
{R : Type u} →
  {M : Type v} → [inst : Semiring R] → [inst_1 : AddCommMonoid M] → [inst_2 : Module R M] → SetLike (Submodule R M) M
```

Definition body (one-level semantic boundary):

```lean
fun {R} {M} [Semiring R] [AddCommMonoid M] [Module R M] => { coe := fun s => s.carrier, coe_injective' := ⋯ }
```

### D092: `Subtype`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `2`
- Semantic SHA-256: `3b0bb8433bd0c981dbdb4d6256bf74c50e9883207dae8d309dcb705135cf932c`

Type:

```lean
{α : Sort u} → (α → Prop) → Sort (max 1 u)
```

### D093: `id`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `dbf7c9f75c53aa3b4f811b7fd8038f2d2ab775571e37341e9514361b972c4868`

Type:

```lean
{α : Sort u} → α → α
```

Definition body (one-level semantic boundary):

```lean
fun {α} a => a
```

### D094: `AddCommMonoid.toAddMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `3`
- Semantic SHA-256: `98c22aec54da8e2278fb6c5ae1daeffb76abd7bad320de72096bec6a7046bc17`

Type:

```lean
{M : Type u} → [self : AddCommMonoid M] → AddMonoid M
```

Definition body (one-level semantic boundary):

```lean
fun M [self : AddCommMonoid M] => self.1
```

### D095: `AddSubmonoid.mk`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Submonoid.Defs`
- Declaration kind: `constructor`
- Distance from target type: `3`
- Semantic SHA-256: `029094d2c1b33f7004c39bc68e51ae7cc5630e6caf206cb18d7860d9a945cf9f`

Type:

```lean
{M : Type u_3} →
  [inst : AddZeroClass M] →
    (toAddSubsemigroup : AddSubsemigroup M) → Set.instMembership.mem toAddSubsemigroup.carrier 0 → AddSubmonoid M
```

### D096: `AddSubsemigroup.mk`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Subsemigroup.Defs`
- Declaration kind: `constructor`
- Distance from target type: `3`
- Semantic SHA-256: `6bcab16592637f3ad99a5376ebb4104d8c715e250ceca67f865101d72cf48cb1`

Type:

```lean
{M : Type u_3} →
  [inst : Add M] →
    (carrier : Set M) →
      (∀ {a b : M},
          Set.instMembership.mem carrier a →
            Set.instMembership.mem carrier b → Set.instMembership.mem carrier (instHAdd.hAdd a b)) →
        AddSubsemigroup M
```

### D097: `AddZero.toAdd`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `3`
- Semantic SHA-256: `aaf8ee0ca0ca4a6b33fb0806d024e8a202ba2d3af3b4f4f8214dfc947d3bf16a`

Type:

```lean
{M : Type u_2} → [self : AddZero M] → Add M
```

Definition body (one-level semantic boundary):

```lean
fun M [self : AddZero M] => self.2
```

### D098: `ENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `5b8f4d61311ebccecf6a54ceca44191d394e0108c8596129a77f03c15a7e457f`

Hash-verified prior declaration review:

- Reuse SHA-256: `9e35e9b9b1fe518666d350bcfbef9743d73c2f6c2e77381ec36b7eced744ac87`
- Reviewed meaning: The extended nonnegative real numbers, modeled as nonnegative reals with a top element infinity.

Independently determine this declaration's effect on the current proposition.

### D099: `ENNReal.instPartialOrder`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `f07a664eb470c37e8c5abcad62d27fe4145f686c6a6a132fa775fdf14e92b68e`

Hash-verified prior declaration review:

- Reuse SHA-256: `6322261a09bfcc05028eb2189f5bfea419c2b0424279a91fd25075815fc5125a`
- Reviewed meaning: The standard partial-order instance on ENNReal.

Independently determine this declaration's effect on the current proposition.

### D100: `Filter.EventuallyEq`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Filter.Defs`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `a64eed0ce113cb3b5abad121d51643cada6205912b9713f6eeeed16df555b011`

Type:

```lean
{α : Type u_1} → {β : Type u_2} → Filter α → (α → β) → (α → β) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun {α} {β} l f g => Filter.Eventually (fun x => Eq (f x) (g x)) l
```

### D101: `LT.lt`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `3`
- Semantic SHA-256: `fd5699899f1a49c91982cb363d3a71557ab1b53ee772cd777c9ee7717abc2009`

Hash-verified prior declaration review:

- Reuse SHA-256: `e78495fd41b83fce62fbd7f4fd8635216add755e08ec38544d0e0f04fd6159fb`
- Reviewed meaning: The strict-order operation supplied by an LT instance.

Independently determine this declaration's effect on the current proposition.

### D102: `Measurable`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.MeasurableSpace.Defs`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `6d56983cd98232a62c5c1b4a0368519a8b381777b32b6e8301ade2ccd7f4c3a4`

Hash-verified prior declaration review:

- Reuse SHA-256: `199b2ed8cb6d8f63d3bf74c2a7755c3517c9cb3682f6d7eea2244d03e3eb6513`
- Reviewed meaning: A function is measurable when preimages of measurable sets are measurable.

Independently determine this declaration's effect on the current proposition.

### D103: `MeasureTheory.Measure.instFunLike`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `def`
- Distance from target type: `3`
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

### D104: `MeasureTheory.Measure.instOuterMeasureClass`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `theorem`
- Distance from target type: `3`
- Semantic SHA-256: `12c72524345059262ce157fe3d4314569e2e86487366f251af8f57723dda88b7`

Type:

```lean
∀ {α : Type u_1} [inst : MeasurableSpace α], MeasureTheory.OuterMeasureClass (MeasureTheory.Measure α) α
```

### D105: `MeasureTheory.ae`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.OuterMeasure.AE`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `a2cf721ae5d77711462e063686e22be219128cc7ab3b90958a7ce538754e0fd5`

Type:

```lean
{α : Type u_1} →
  {F : Type u_3} → [inst : FunLike F (Set α) ENNReal] → [MeasureTheory.OuterMeasureClass F α] → F → Filter α
```

Definition body (one-level semantic boundary):

```lean
fun {α} {F} [inst : FunLike F (Set α) ENNReal] [MeasureTheory.OuterMeasureClass F α] μ =>
  Filter.ofCountableUnion (fun x => Eq (inst.coe μ x) 0) ⋯ ⋯
```

### D106: `PartialOrder.toPreorder`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Defs.PartialOrder`
- Declaration kind: `abbrev`
- Distance from target type: `3`
- Semantic SHA-256: `079686fa1ec6d596bcdb475c56a12b7f5a0594bf346c64220c2c992e0f0aae3b`

Hash-verified prior declaration review:

- Reuse SHA-256: `806a3386c9302dd487c6db4148fb2dd7fe34ec77fe9520cbdcc905624938a47b`
- Reviewed meaning: The standard projection from a partial order to a preorder.

Independently determine this declaration's effect on the current proposition.

### D107: `Preorder.toLT`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Defs.PartialOrder`
- Declaration kind: `abbrev`
- Distance from target type: `3`
- Semantic SHA-256: `8fcf5a8f5a8899408a8cdc310bc44f6f7b84a21905a114103fbc65083f779a43`

Hash-verified prior declaration review:

- Reuse SHA-256: `882083f13df94e3db895c491c12d36a7f2ae331fb0101eb5b203767e6417b9f3`
- Reviewed meaning: The projection of the strict-order operation from a preorder.

Independently determine this declaration's effect on the current proposition.

### D108: `Quotient.lift`

- Role: `external-frontier`
- Owner module: `Init.Core`
- Declaration kind: `abbrev`
- Distance from target type: `3`
- Semantic SHA-256: `c4def20ff4c8db07c900a3b8be9fcb7288eb560aebfd3ac54a5fb8610b74752f`

Type:

```lean
{α : Sort u} →
  {β : Sort v} →
    {s : Setoid α} → (f : α → β) → (∀ (a b : α), instHasEquivOfSetoid.Equiv a b → Eq (f a) (f b)) → Quotient s → β
```

Definition body (one-level semantic boundary):

```lean
fun {α} {β} {s} f => Quot.lift f
```

### D109: `Real.measurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Constructions.BorelSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `51b107725c4edbe40e50ff5651a2c7ee5a10037e341c2764964a6d6cc26d82a1`

Hash-verified prior declaration review:

- Reuse SHA-256: `281d6b2b552a71fbbd9f053e949483f5a49465b6a7086215cbac1ed9e284bd4f`
- Reviewed meaning: The Borel measurable-space structure on the real numbers.

Independently determine this declaration's effect on the current proposition.

### D110: `Submodule.mk`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Module.Submodule.Defs`
- Declaration kind: `constructor`
- Distance from target type: `3`
- Semantic SHA-256: `955d9798d39620305be807148fff4e08f84525b0b7a07381405fbf39c6d1a638`

Type:

```lean
{R : Type u} →
  {M : Type v} →
    [inst : Semiring R] →
      [inst_1 : AddCommMonoid M] →
        [inst_2 : Module R M] →
          (toAddSubmonoid : AddSubmonoid M) →
            (∀ (c : R) {x : M},
                Set.instMembership.mem toAddSubmonoid.carrier x →
                  Set.instMembership.mem toAddSubmonoid.carrier (instHSMul.hSMul c x)) →
              Submodule R M
```

### D111: `Submodule.quotientRel`

- Role: `external-frontier`
- Owner module: `Mathlib.LinearAlgebra.Quotient.Defs`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `464e49fd12ce654f881f3cce6f93d60a56fb47a5b5480544652ac59c999b31c7`

Type:

```lean
{R : Type u_1} →
  {M : Type u_2} → [inst : Ring R] → [inst_1 : AddCommGroup M] → [inst_2 : Module R M] → Submodule R M → Setoid M
```

Definition body (one-level semantic boundary):

```lean
fun {R} {M} [Ring R] [AddCommGroup M] [Module R M] p => QuotientAddGroup.leftRel p.toAddSubgroup
```

### D112: `Subtype.val`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `3`
- Semantic SHA-256: `69c61ab82498e5563eaf5f0313ea7f2164c284c3dc742024a30332372a46663d`

Type:

```lean
{α : Sort u} → {p : α → Prop} → Subtype p → α
```

Definition body (one-level semantic boundary):

```lean
fun α p self => self.1
```

### D113: `Top.top`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Notation`
- Declaration kind: `abbrev`
- Distance from target type: `3`
- Semantic SHA-256: `32c978930b5eb9164add86b32aeacdc99d2d10df09b4b1989d12a6e346774504`

Hash-verified prior declaration review:

- Reuse SHA-256: `57a7c2e8c5cb8f9b5ab50bfd34ee8e42d72e07a4f9e208358a34f3339f5305f4`
- Reviewed meaning: The greatest element of a type with a Top instance.

Independently determine this declaration's effect on the current proposition.

### D114: `instTopENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `fc363bb86fd9c29e754e22d842cff17acbad13559cb0e03d31f4863045cd3c07`

Hash-verified prior declaration review:

- Reuse SHA-256: `8295c8a1d44f23f6d52da533e2cfc81b385e799ea93720b7cd61102075426487`
- Reviewed meaning: The top element infinity of ENNReal.

Independently determine this declaration's effect on the current proposition.

### D115: `setOf`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `cee4433aebd78c308ec85f62ccd30489c00ec9cc23a98f4d2139c17f840f4988`

Hash-verified prior declaration review:

- Reuse SHA-256: `c4b1a99bf4c3df5a0b87dd00f1c7b4d635525c85de2b31bd18081a2366f31c78`
- Reviewed meaning: Set-builder formation from a predicate.

Independently determine this declaration's effect on the current proposition.

### D116: `CompleteLinearOrder.toConditionallyCompleteLinearOrderBot`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.ConditionallyCompleteLattice.Basic`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `2aa802d0a9c75bf33917e1e0dc266a90886d32f434f1d43521c53f0f2c3449d0`

Hash-verified prior declaration review:

- Reuse SHA-256: `2c1cd0da1ea59131394f6b1ea0bdb3f55c26a7a5921e6f5181bb7e04e0641957`
- Reviewed meaning: The standard coercion from a complete linear order to a conditionally complete linear order with bottom.

Independently determine this declaration's effect on the current proposition.

### D117: `ConditionallyCompleteLattice.toConditionallyCompletePartialOrder`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.ConditionallyCompleteLattice.Basic`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `41576e47c21e72ff272622fb2a65e2858beda94a321ffdbc1128f58d338ee803`

Hash-verified prior declaration review:

- Reuse SHA-256: `7d64149d8073c6c84841201db490a014c66ffb305bb329845e6e50058ffe24b6`
- Reviewed meaning: The standard coercion from a conditionally complete lattice to its conditionally complete partial-order structure.

Independently determine this declaration's effect on the current proposition.

### D118: `ConditionallyCompleteLinearOrder.toConditionallyCompleteLattice`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.ConditionallyCompleteLattice.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `4`
- Semantic SHA-256: `e1dad077d30ec2d5da19d9c26f0e709993b8eda004ce89d1f4086cf5f98094d5`

Hash-verified prior declaration review:

- Reuse SHA-256: `5fdd1954e8bb6cfb9d2c03fb68d2dd923de4930b79f0f4544104b611a61d32cf`
- Reviewed meaning: The standard projection of a conditionally complete linear order to a conditionally complete lattice.

Independently determine this declaration's effect on the current proposition.

### D119: `ConditionallyCompleteLinearOrderBot.toConditionallyCompleteLinearOrder`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.ConditionallyCompleteLattice.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `4`
- Semantic SHA-256: `b25be2d55c4d466d6295ab5ff23a5cc915072a7d1cbc04c476d877743ce32dd9`

Hash-verified prior declaration review:

- Reuse SHA-256: `409cf7304e970e086e7e8e22f90790b2461c49454180fabd1fe34c522ee48b90`
- Reviewed meaning: The standard projection forgetting the bottom field of a conditionally complete linear order with bottom.

Independently determine this declaration's effect on the current proposition.

### D120: `ConditionallyCompletePartialOrder.toConditionallyCompletePartialOrderInf`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.ConditionallyCompletePartialOrder.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `4`
- Semantic SHA-256: `50e56dbfc6cb715ad5708fddc559a96fd43e4d11b7a8a33061c6cf440f5fc10c`

Hash-verified prior declaration review:

- Reuse SHA-256: `8be4f474c38d4cf7a710cc9329880fd1f67396e397b8a60e290ac9fefb2a0062`
- Reviewed meaning: The standard projection retaining the partial order and infimum operation from a conditionally complete partial order.

Independently determine this declaration's effect on the current proposition.

### D121: `ConditionallyCompletePartialOrderInf.toInfSet`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.ConditionallyCompletePartialOrder.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `4`
- Semantic SHA-256: `182c2ddbb044a41025806b24afd62f570b4197b3450b566022615ea4646e06cd`

Hash-verified prior declaration review:

- Reuse SHA-256: `8048edefc3f6edd5533a697b8020dfb9fcabbbf61c3ed82962d7f682945fbd68`
- Reviewed meaning: The projection to the set-infimum operation of a conditionally complete partial order with infima.

Independently determine this declaration's effect on the current proposition.

### D122: `ENNReal.instCompleteLinearOrder`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `2436cc4a7fc332a26b2b8879178b290fffb6ceaad2c2210667170bdf3119d835`

Hash-verified prior declaration review:

- Reuse SHA-256: `98069b5c478e41fe072fc12a81d58f8374d3cb23e3a16bef2446b98be384a56a`
- Reviewed meaning: The standard complete linear order on ENNReal.

Independently determine this declaration's effect on the current proposition.

### D123: `HasEquiv.Equiv`

- Role: `external-frontier`
- Owner module: `Init.Core`
- Declaration kind: `abbrev`
- Distance from target type: `4`
- Semantic SHA-256: `8698319a594e8e5900568852d935ed323298212d967f1076860baaf5ba9b5b77`

Type:

```lean
{α : Sort u} → [self : HasEquiv α] → α → α → Sort v
```

Definition body (one-level semantic boundary):

```lean
fun α [self : HasEquiv α] => self.1
```

### D124: `InfSet.sInf`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.SetNotation`
- Declaration kind: `abbrev`
- Distance from target type: `4`
- Semantic SHA-256: `76c82ed45915e35439b105eb3ec239e1937b2a2eafff41b96f451468dd90c61d`

Hash-verified prior declaration review:

- Reuse SHA-256: `96b7196393a4d0b5a7ece218456860b75e0c0d02011458b377b7f49d1e61a70f`
- Reviewed meaning: The infimum of a set in a type carrying an InfSet structure.

Independently determine this declaration's effect on the current proposition.

### D125: `MonoidWithZero.toMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.GroupWithZero.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `4`
- Semantic SHA-256: `c0f91ccdc0415c148969849b7a83ce67d87cf4c402704186fa19f6313928d90f`

Type:

```lean
{M₀ : Type u} → [self : MonoidWithZero M₀] → Monoid M₀
```

Definition body (one-level semantic boundary):

```lean
fun M₀ [self : MonoidWithZero M₀] => self.1
```

### D126: `Semiring.toMonoidWithZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `4`
- Semantic SHA-256: `bf0d463c55fbfcd762eb28ad6f1672fe482a72dfed67d13a797c09f1f0431e64`

Type:

```lean
{α : Type u} → [self : Semiring α] → MonoidWithZero α
```

Definition body (one-level semantic boundary):

```lean
fun α self =>
  { toMul := self.toMul, mul_assoc := ⋯, toOne := self.toOne, one_mul := ⋯, mul_one := ⋯, npow := self.npow,
    npow_zero := ⋯, npow_succ := ⋯, toZero := self.toZero, zero_mul := ⋯, mul_zero := ⋯ }
```

### D127: `Set`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `a6e551515032966c16e4f42e4548ff1854c2dce05ffe51e98b66943caecc78ec`

Type:

```lean
Type u → Type u
```

Definition body (one-level semantic boundary):

```lean
fun α => α → Prop
```

### D128: `Set.instMembership`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `5858be77d319c5a0e238602f16818ed6fb2e2b52a81ff7edb07bc219d652f201`

Type:

```lean
{α : Type u} → Membership α (Set α)
```

Definition body (one-level semantic boundary):

```lean
fun {α} => { mem := Set.Mem }
```

### D129: `instHasEquivOfSetoid`

- Role: `external-frontier`
- Owner module: `Init.Core`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `b9783051e37fe94133d83fff9c55ee151de7fc6ff645e820b10d0225b59c5898`

Type:

```lean
{α : Sort u} → [Setoid α] → HasEquiv α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Setoid α] => { Equiv := inst.r }
```

### D130: `DivInvMonoid.toDiv`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `5`
- Semantic SHA-256: `cf21e4a4c962ee0db8a97bd649d849a798a693692bf09312f7855ddcbeb125ea`

Hash-verified prior declaration review:

- Reuse SHA-256: `9c0674f712bb2b402481ff2dc5da5140a09fc131abd923b13fa6fd9e619f62f3`
- Reviewed meaning: The projection of division from a division-inverse monoid.

Independently determine this declaration's effect on the current proposition.

### D131: `HDiv.hDiv`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `5`
- Semantic SHA-256: `10d75d9f08ad8c923109392866fba5fb3645de144bc824cefdd353658fe9f06b`

Hash-verified prior declaration review:

- Reuse SHA-256: `9dc0532d6e88c54a22342f1c7f8df0f0e939eb5b56c2aae0db42b5fbef4da424`
- Reviewed meaning: Heterogeneous division notation supplied by an HDiv instance.

Independently determine this declaration's effect on the current proposition.

### D132: `HPow.hPow`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `5`
- Semantic SHA-256: `6196b8cbb884c4f39841ba74b23d75f3c753fe0d044cc402bd6e4e3bd59d5cb8`

Hash-verified prior declaration review:

- Reuse SHA-256: `2b11148c16e48ed570a4eac640ad67754cc1cc4b66a36e96f273fd7ef0526019`
- Reviewed meaning: Heterogeneous exponentiation notation supplied by an HPow instance.

Independently determine this declaration's effect on the current proposition.

### D133: `MeasureTheory.Integrable`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.L1Space.Integrable`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `51e5158e8f2f2a375463d510858200b96afa04fb8f33126da2c5d1c572a76165`

Hash-verified prior declaration review:

- Reuse SHA-256: `446e7a5f0398b34a1693324921bc646d6a42a2e6374a61f7de30a24b58b98a1e`
- Reviewed meaning: Bochner integrability: almost-everywhere strong measurability together with finite integral norm.

Independently determine this declaration's effect on the current proposition.

### D134: `MeasureTheory.integral`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Integral.Bochner.Basic`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `428563f3d6b771605a3267457bf33b62ec2efa91a42b57b96121b85c0269a9ab`

Hash-verified prior declaration review:

- Reuse SHA-256: `f327597390a18becb25bc9555c7b0b9f03c101762326c2b8d83830fa54a29cc3`
- Reviewed meaning: The Bochner integral with respect to the specified measure.

Independently determine this declaration's effect on the current proposition.

### D135: `Monoid.toNatPow`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `5b7373fe2de26535c1cdbf1b953ce34faf30f68aac8abd83ade2e78e6ec65b8a`

Hash-verified prior declaration review:

- Reuse SHA-256: `d6571754a6df1d17864081c6b270fb644cc1108ef1d11c8daa831f19a147ab82`
- Reviewed meaning: The natural-number power operation induced by a monoid.

Independently determine this declaration's effect on the current proposition.

### D136: `Nat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `5`
- Semantic SHA-256: `2e1c25ca42e1e377a41827f0d2f09ae02cfb28ab155c30e277f1000f5e79b32c`

Hash-verified prior declaration review:

- Reuse SHA-256: `37763eb42cfffebbe264251a39f704a997848d586fc2fba9b3b27f1c6bd44d8a`
- Reviewed meaning: The natural numbers.

Independently determine this declaration's effect on the current proposition.

### D137: `Ne`

- Role: `external-frontier`
- Owner module: `Init.Core`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `635adc1f9e4a981a5c01b21338fdf89e637bd4ef0aa6911bda4dc03acfe9fba6`

Hash-verified prior declaration review:

- Reuse SHA-256: `04c627dabad0ac0a07f18da91f44433a99cc49ce90cd858466f3c82d8fede04d`
- Reviewed meaning: Inequality, defined as negated equality.

Independently determine this declaration's effect on the current proposition.

### D138: `NormedAddCommGroup.toSeminormedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `7327759e5e9417c54393e7566584cd72d79c77b4ca018ea408c5d024667587be`

Hash-verified prior declaration review:

- Reuse SHA-256: `0c8cdc5eac181c06160e7abb4fce670021423a884c58f27d43801795d750c586`
- Reviewed meaning: The standard projection from a normed additive commutative group to a seminormed one.

Independently determine this declaration's effect on the current proposition.

### D139: `PseudoMetricSpace.toUniformSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.MetricSpace.Pseudo.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `5`
- Semantic SHA-256: `a6831039b3ad5e37bd0e7692fd995a699d8bef791976e20262da929990521799`

Hash-verified prior declaration review:

- Reuse SHA-256: `8017cefec2eebd2fff637165763508b2828576629d6b3d560d60d9f7bb2df132`
- Reviewed meaning: The standard uniform-space structure induced by a pseudometric space.

Independently determine this declaration's effect on the current proposition.

### D140: `Real.exp`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Complex.Exponential`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `69806b1af98b09fabed435ccc47a9f2f0840f9c5c140fb62cccc81a80761a984`

Hash-verified prior declaration review:

- Reuse SHA-256: `2f65425f2b772773b678c517242a1128c73d4f7d751f3d439e26aca15d4a297b`
- Reviewed meaning: The real exponential function.

Independently determine this declaration's effect on the current proposition.

### D141: `Real.instDivInvMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `166f2abb65bf1271e5e8d70fdb78c55672c7e366b30439e83b517f803cdefac3`

Hash-verified prior declaration review:

- Reuse SHA-256: `45edb935ae4e4b9398ff26b0b9b806c01c67d2cffdec68cd36e1bee52884d7aa`
- Reviewed meaning: The usual division and inversion structure on the real numbers.

Independently determine this declaration's effect on the current proposition.

### D142: `Real.instNatCast`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `5fc7a7becbc71d472fa1a28bd92d79b4c6ea4fdc643db7380031a2b890ca7e15`

Hash-verified prior declaration review:

- Reuse SHA-256: `2ce1cecaf23154fe3fe31904c790b4fdd3dc25434f9473ba3482cecb0297dca3`
- Reviewed meaning: The canonical embedding of natural numbers into the real numbers.

Independently determine this declaration's effect on the current proposition.

### D143: `Real.normedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Real`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `9ff0d896c635e2a38531d689d24ee70cfffa41565354ce15f6ff59b51650bd93`

Hash-verified prior declaration review:

- Reuse SHA-256: `8a55daffd9b98f4d5bcdc7e1f03956ab3bb824969de400d484fbf8007521fb6e`
- Reviewed meaning: The usual normed additive commutative group structure on Real.

Independently determine this declaration's effect on the current proposition.

### D144: `Real.pseudoMetricSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.MetricSpace.Pseudo.Defs`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `9c0d1d56a04dd3ae3fce36b5fb3c2f4fe632c2bdaed84b5667c1a60a03491a3e`

Hash-verified prior declaration review:

- Reuse SHA-256: `b0053320b343661fab2846c13639f23b0ee23fecc2360c4ff7e57e7b72f59373`
- Reviewed meaning: The usual pseudometric, in fact metric, structure on the real numbers induced by absolute-value distance.

Independently determine this declaration's effect on the current proposition.

### D145: `SeminormedAddCommGroup.toSeminormedAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `8cf35215f509cdee10a3a95158cbaadd3c5fb584bc0d1f4fad6ecfc69b1bd205`

Hash-verified prior declaration review:

- Reuse SHA-256: `8bb37656ed4cd9018f3386331e9928ba18fe4b658b0b9cc0d45ad90fc35f9aaa`
- Reviewed meaning: The standard projection from a seminormed additive commutative group to a seminormed additive group.

Independently determine this declaration's effect on the current proposition.

### D146: `SeminormedAddGroup.toContinuousENorm`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Continuity`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `17a83cbf3059dd0bbaefd43c93ce329f1d6b760d440889322b3582a18b23a141`

Hash-verified prior declaration review:

- Reuse SHA-256: `fb8a2b3d34cbfac41c1044b059544d8fa77cab2e7e451951bd18e1db77d5bfd8`
- Reviewed meaning: The continuous extended-norm structure induced by a seminormed additive group.

Independently determine this declaration's effect on the current proposition.

### D147: `UniformSpace.toTopologicalSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.UniformSpace.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `5`
- Semantic SHA-256: `4d18df801a98905221e0935ec2ddacda684a1430b8d198ebc23fad0643bce2a8`

Hash-verified prior declaration review:

- Reuse SHA-256: `fa0781a5ba5c5ce2cfae9ebd464ec31a300c765f1fd54fe418631a3fb68710d8`
- Reviewed meaning: The topology induced by a uniform space.

Independently determine this declaration's effect on the current proposition.

### D148: `instHDiv`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `ea3478ce3daf37e2cbdcd4bfaf7b5142fd7d274b56d75d2fae007c15e1b89871`

Hash-verified prior declaration review:

- Reuse SHA-256: `14f93bff3e2af631033be8510ed7b1426ad5cb73e8d2d8dfc5685649e70a01d9`
- Reviewed meaning: The homogeneous HDiv instance induced by an ordinary Div instance.

Independently determine this declaration's effect on the current proposition.

### D149: `instHPow`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `eb300d353d84392c776cad5e356479f878030744a43f9a1584942a89d16350b4`

Hash-verified prior declaration review:

- Reuse SHA-256: `52cd77c62e634cdf22ca72fdc8976c53f9ce3c6a3df5cec0921887d4ed6c84bc`
- Reviewed meaning: The homogeneous HPow instance induced by a Pow instance.

Independently determine this declaration's effect on the current proposition.

### D150: `instOfNatAtLeastTwo`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `37355febc51d6fa8ff12fc8e7b429771db340390d46411d7608c566bdffd358d`

Hash-verified prior declaration review:

- Reuse SHA-256: `b649c53eed37fa4705d1b2ee60a35f240c06178c229c1dc4c1013a792971234d`
- Reviewed meaning: The standard numeral instance for natural numerals known to be at least two in a type with NatCast.

Independently determine this declaration's effect on the current proposition.

### D151: `instOfNatNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `7018dea92aae8c272f3a065f25e2bedb9732a0b602c3d54b166fa0cf2ce1ea92`

Hash-verified prior declaration review:

- Reuse SHA-256: `4d73963d804b9c7e876d43f2c5a7fb2e41edb8b82a17926169250ee36dcff168`
- Reviewed meaning: The canonical interpretation of a natural numeral as itself.

Independently determine this declaration's effect on the current proposition.

### D152: `instZeroENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `5`
- Semantic SHA-256: `6e5878abb65d5809d3258e569c8ff0f08b39804b377a07fec18d700b4e3fea86`

Hash-verified prior declaration review:

- Reuse SHA-256: `738ee53c6c6ee08772c158341078f11c5f43cc07ff1155b63a7d95faab1965f4`
- Reviewed meaning: The zero element of ENNReal.

Independently determine this declaration's effect on the current proposition.

### D153: `Nat.AtLeastTwo`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Init`
- Declaration kind: `inductive`
- Distance from target type: `6`
- Semantic SHA-256: `318e11b8f9340f2f451d638786dd4fca470dece62824f4adc3bd18b5289aa911`

Hash-verified prior declaration review:

- Reuse SHA-256: `bd05ee7931ae6e21ab288ffd76f0f7bf5688e3a828073e6be7adde2389a4fefb`
- Reviewed meaning: A proposition witnessing that a natural number is at least two.

Independently determine this declaration's effect on the current proposition.

### D154: `instAddNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `6`
- Semantic SHA-256: `a1534bcd3e1888406ac787d30eeff8a284cb6688c23f5e8de09351dda91a280c`

Hash-verified prior declaration review:

- Reuse SHA-256: `b5fe071e905fd4cfd9fef5e9700aaf6f69e10bed248c3387f5b83cf97ccf968f`
- Reviewed meaning: The standard addition operation on natural numbers.

Independently determine this declaration's effect on the current proposition.
