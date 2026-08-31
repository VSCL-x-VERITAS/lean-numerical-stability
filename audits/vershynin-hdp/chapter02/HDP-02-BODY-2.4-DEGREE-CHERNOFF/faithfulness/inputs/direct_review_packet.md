# Declaration dossier for HDP-02-BODY-2.4-DEGREE-CHERNOFF

This dossier describes the theorem statement only. Its proof is excluded.
Interpret every dependency from its supplied declaration; names are not definitions.

## Proof-free source declaration

```lean
theorem hdp_02_hbody_h2_d4_hdegree_hchernoff :
    (∀ (n : ℕ) (p : Set.Icc (0 : ℝ) 1) (v : Fin n),
      HasLaw
        ((NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p).degree v)
        (NumStability.HDP.Scalar.IndependentSums.Chernoff.graphBinomialLaw n p)
        (NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p).graphLaw) ∧
      ∃ c : ℝ, 0 < c ∧
        ∀ (n : ℕ) (p : Set.Icc (0 : ℝ) 1) (v : Fin n),
          (NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p).graphLaw.real
              {G | (1 / 10 : ℝ) * ((n - 1) * (p : ℝ)) ≤
                |((NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p).degree
                    v G : ℝ) - (n - 1) * (p : ℝ)|} ≤
            2 * Real.exp (-(c * ((n - 1) * (p : ℝ))))
```

## Elaborated target type

```lean
And
  (∀ (n : Nat) (p : (Set.Icc 0 1).Elem) (v : Fin n),
    ProbabilityTheory.HasLaw ((NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p).degree v)
      (NumStability.HDP.Scalar.IndependentSums.Chernoff.graphBinomialLaw n p)
      (NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p).graphLaw)
  (Exists fun c =>
    And (Real.instLT.lt 0 c)
      (∀ (n : Nat) (p : (Set.Icc 0 1).Elem) (v : Fin n),
        Real.instLE.le
          ((NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p).graphLaw.real
            (setOf fun G =>
              Real.instLE.le (instHMul.hMul (1 / 10) (instHMul.hMul (instHSub.hSub n.cast 1) p.val))
                (abs
                  (instHSub.hSub
                    ((NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p).degree v G).cast
                    (instHMul.hMul (instHSub.hSub n.cast 1) p.val)))))
          (instHMul.hMul 2
            (Real.exp (Real.instNeg.neg (instHMul.hMul c (instHMul.hMul (instHSub.hSub n.cast 1) p.val)))))))
```

## Fully explicit elaborated target type

```lean
And
  (∀ (n : Nat)
    (p :
      @Set.Elem.{0} Real
        (@Set.Icc.{0} Real Real.instPreorder (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
          (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne))))
    (v : Fin n),
    @ProbabilityTheory.HasLaw.{0, 0} (SimpleGraph.{0} (Fin n)) Nat (@SimpleGraph.instMeasurableSpace.{0} (Fin n))
      Nat.instMeasurableSpace
      (@NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData.degree n p
        (NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p) v)
      (NumStability.HDP.Scalar.IndependentSums.Chernoff.graphBinomialLaw n p)
      (@NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData.graphLaw n p
        (NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p)))
  (@Exists.{1} Real fun (c : Real) =>
    And (@LT.lt.{0} Real Real.instLT (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero)) c)
      (∀ (n : Nat)
        (p :
          @Set.Elem.{0} Real
            (@Set.Icc.{0} Real Real.instPreorder
              (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
              (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne))))
        (v : Fin n),
        @LE.le.{0} Real Real.instLE
          (@MeasureTheory.Measure.real.{0} (SimpleGraph.{0} (Fin n)) (@SimpleGraph.instMeasurableSpace.{0} (Fin n))
            (@NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData.graphLaw n p
              (NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p))
            (@setOf.{0} (SimpleGraph.{0} (Fin n)) fun (G : SimpleGraph.{0} (Fin n)) =>
              @LE.le.{0} Real Real.instLE
                (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
                  (@HDiv.hDiv.{0, 0, 0} Real Real Real
                    (@instHDiv.{0} Real (@DivInvMonoid.toDiv.{0} Real Real.instDivInvMonoid))
                    (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne))
                    (@OfNat.ofNat.{0} Real (nat_lit 10)
                      (@instOfNatAtLeastTwo.{0} Real (nat_lit 10) Real.instNatCast
                        (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 9) (instOfNatNat (nat_lit 9)))
                          (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 8) (instOfNatNat (nat_lit 8))))))))
                  (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
                    (@HSub.hSub.{0, 0, 0} Real Real Real (@instHSub.{0} Real Real.instSub)
                      (@Nat.cast.{0} Real Real.instNatCast n)
                      (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))
                    (@Subtype.val.{1} Real
                      (fun (x : Real) =>
                        @Membership.mem.{0, 0} Real (Set.{0} Real) (@Set.instMembership.{0} Real)
                          (@Set.Icc.{0} Real Real.instPreorder
                            (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
                            (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))
                          x)
                      p)))
                (@abs.{0} Real Real.lattice Real.instAddGroup
                  (@HSub.hSub.{0, 0, 0} Real Real Real (@instHSub.{0} Real Real.instSub)
                    (@Nat.cast.{0} Real Real.instNatCast
                      (@NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData.degree n p
                        (NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p) v G))
                    (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
                      (@HSub.hSub.{0, 0, 0} Real Real Real (@instHSub.{0} Real Real.instSub)
                        (@Nat.cast.{0} Real Real.instNatCast n)
                        (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))
                      (@Subtype.val.{1} Real
                        (fun (x : Real) =>
                          @Membership.mem.{0, 0} Real (Set.{0} Real) (@Set.instMembership.{0} Real)
                            (@Set.Icc.{0} Real Real.instPreorder
                              (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
                              (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))
                            x)
                        p))))))
          (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
            (@OfNat.ofNat.{0} Real (nat_lit 2)
              (@instOfNatAtLeastTwo.{0} Real (nat_lit 2) Real.instNatCast
                (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                  (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))
            (Real.exp
              (@Neg.neg.{0} Real Real.instNeg
                (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul) c
                  (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
                    (@HSub.hSub.{0, 0, 0} Real Real Real (@instHSub.{0} Real Real.instSub)
                      (@Nat.cast.{0} Real Real.instNatCast n)
                      (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))
                    (@Subtype.val.{1} Real
                      (fun (x : Real) =>
                        @Membership.mem.{0, 0} Real (Set.{0} Real) (@Set.instMembership.{0} Real)
                          (@Set.Icc.{0} Real Real.instPreorder
                            (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
                            (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))
                          x)
                      p))))))))
```

## Local import graph

- `AuditTarget` imports: `NumStability.HDP.Scalar.IndependentSums.Chernoff`
- `NumStability.HDP.Scalar.Preliminaries` imports: `Mathlib.Probability.Moments.Variance`, `Mathlib.Probability.CDF`, `Mathlib.MeasureTheory.Function.LpSpace.Basic`, `Mathlib.MeasureTheory.Function.LpSpace.Complete`, `Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm`, `Mathlib.MeasureTheory.Function.LpSeminorm.Indicator`, `Mathlib.Probability.UniformOn`, `Mathlib.Analysis.Convex.Integral`, `Mathlib.Analysis.Convex.Continuous`, `Mathlib.MeasureTheory.Integral.Bochner.Set`, `Mathlib.MeasureTheory.Integral.Lebesgue.Markov`, `Mathlib.MeasureTheory.Integral.Layercake`, `Mathlib.MeasureTheory.Measure.Lebesgue.Integral`, `Mathlib.Probability.Distributions.Cauchy`, `Mathlib.Analysis.SpecialFunctions.NonIntegrable`, `Mathlib.Analysis.SpecialFunctions.Pow.Integral`, `Mathlib.Tactic`
- `NumStability.HDP.Scalar.IndependentSums.Hoeffding` imports: `Mathlib.Probability.Independence.Integration`, `Mathlib.Probability.Moments.Basic`, `Mathlib.Probability.Moments.SubGaussian`, `Mathlib.Probability.ProbabilityMassFunction.Constructions`, `Mathlib.Probability.ProbabilityMassFunction.Integrals`, `Mathlib.Analysis.SpecialFunctions.Trigonometric.Series`, `Mathlib.Analysis.SpecialFunctions.ImproperIntegrals`, `Mathlib.Tactic`, `NumStability.HDP.Scalar.Preliminaries`
- `NumStability.HDP.Scalar.IndependentSums.GraphDegreeLaw` imports: `Mathlib.Probability.Combinatorics.BinomialRandomGraph.Defs`, `Mathlib.Combinatorics.SimpleGraph.Finite`, `Mathlib.Probability.HasLaw`, `Mathlib.Probability.ProbabilityMassFunction.Binomial`, `Mathlib.Tactic`
- `NumStability.HDP.Scalar.IndependentSums.Chernoff` imports: `Mathlib.Probability.Combinatorics.BinomialRandomGraph.Defs`, `Mathlib.Combinatorics.SimpleGraph.Finite`, `Mathlib.Probability.ProbabilityMassFunction.Integrals`, `Mathlib.Probability.HasLaw`, `Mathlib.Probability.Independence.Integration`, `Mathlib.Probability.Distributions.Poisson`, `Mathlib.MeasureTheory.Integral.Lebesgue.Countable`, `Mathlib.Analysis.Asymptotics.AsymptoticEquivalent`, `Mathlib.Analysis.SpecialFunctions.Stirling`, `Mathlib.Analysis.Complex.ExponentialBounds`, `Mathlib.Tactic`, `NumStability.HDP.Scalar.IndependentSums.Hoeffding`, `NumStability.HDP.Scalar.IndependentSums.GraphDegreeLaw`

## Semantic dependency inventory

`local` declarations are followed recursively through types and bodies. `external-frontier` declarations mark the one-level library trust boundary.

### D001: `NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData.degree`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Chernoff`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `18208c688dd0e650b49fcf1e2a566fabab9bbdf7c6f622433ae7b8388a7d8934`

Type:

```lean
{n : Nat} →
  {p : (Set.Icc 0 1).Elem} →
    NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData n p → Fin n → SimpleGraph (Fin n) → Nat
```

Fully explicit type:

```lean
{n : Nat} →
  {p :
      @Set.Elem.{0} Real
        (@Set.Icc.{0} Real Real.instPreorder (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
          (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))} →
    (self : NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData n p) →
      Fin n → SimpleGraph.{0} (Fin n) → Nat
```

Definition body (one-level semantic boundary):

```lean
fun n p self => self.2
```

### D002: `NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData.graphLaw`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Chernoff`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `5aab30157ea453be8d27b91764e4832d22b6024b0fc27176504cfeb63c3617de`

Type:

```lean
{n : Nat} →
  {p : (Set.Icc 0 1).Elem} →
    NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData n p →
      MeasureTheory.Measure (SimpleGraph (Fin n))
```

Fully explicit type:

```lean
{n : Nat} →
  {p :
      @Set.Elem.{0} Real
        (@Set.Icc.{0} Real Real.instPreorder (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
          (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))} →
    (self : NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData n p) →
      @MeasureTheory.Measure.{0} (SimpleGraph.{0} (Fin n)) (@SimpleGraph.instMeasurableSpace.{0} (Fin n))
```

Definition body (one-level semantic boundary):

```lean
fun n p self => self.1
```

### D003: `NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Chernoff`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `89accc6373784447d3dcd081264b197c6b48ad76deb30f5d604aae5d8f652625`

Type:

```lean
(n : Nat) → (p : (Set.Icc 0 1).Elem) → NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData n p
```

Fully explicit type:

```lean
(n : Nat) →
  (p :
      @Set.Elem.{0} Real
        (@Set.Icc.{0} Real Real.instPreorder (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
          (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))) →
    NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData n p
```

Definition body (one-level semantic boundary):

```lean
fun n p => { graphLaw := SimpleGraph.binomialRandom (Fin n) p, degree := fun v G => G.degree v }
```

### D004: `NumStability.HDP.Scalar.IndependentSums.Chernoff.graphBinomialLaw`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.GraphDegreeLaw`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `cff5bc16d998d863f9e745143f0eacd0724ebf0682803b73fd306e4ccfaf7b17`

Type:

```lean
Nat → (Set.Icc 0 1).Elem → MeasureTheory.Measure Nat
```

Fully explicit type:

```lean
(n : Nat) →
  (p :
      @Set.Elem.{0} Real
        (@Set.Icc.{0} Real Real.instPreorder (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
          (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))) →
    @MeasureTheory.Measure.{0} Nat Nat.instMeasurableSpace
```

Definition body (one-level semantic boundary):

```lean
fun n p => (PMF.map (fun i => i.val) (PMF.binomial (unitInterval.toNNReal p) ⋯ (instHSub.hSub n 1))).toMeasure
```

### D005: `NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Chernoff`
- Declaration kind: `inductive`
- Distance from target type: `2`
- Semantic SHA-256: `578d1aed125505ca062adacfcd7a5ffbd1e047e1fbf2e82d5c6b29454460559f`

Type:

```lean
Nat → (Set.Icc 0 1).Elem → Type
```

Fully explicit type:

```lean
(n : Nat) →
  (p :
      @Set.Elem.{0} Real
        (@Set.Icc.{0} Real Real.instPreorder (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
          (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))) →
    Type
```

### D006: `NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData.mk`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Chernoff`
- Declaration kind: `constructor`
- Distance from target type: `2`
- Semantic SHA-256: `3c50fa3a2c0b228b433c11798f2f1561a07c63e50e6e5c862d05b22b541bf4a0`

Type:

```lean
{n : Nat} →
  {p : (Set.Icc 0 1).Elem} →
    MeasureTheory.Measure (SimpleGraph (Fin n)) →
      (Fin n → SimpleGraph (Fin n) → Nat) → NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData n p
```

Fully explicit type:

```lean
{n : Nat} →
  {p :
      @Set.Elem.{0} Real
        (@Set.Icc.{0} Real Real.instPreorder (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
          (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))} →
    (graphLaw : @MeasureTheory.Measure.{0} (SimpleGraph.{0} (Fin n)) (@SimpleGraph.instMeasurableSpace.{0} (Fin n))) →
      (degree : Fin n → SimpleGraph.{0} (Fin n) → Nat) →
        NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData n p
```

### D007: `NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel._proof_1`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Chernoff`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `d164441942be509603bbc71e69ee9b346370aa21399f4a6aafedc9888f9f6ebb`

Type:

```lean
∀ (n : Nat) (v : Fin n) (G : SimpleGraph (Fin n)), Finite (Subtype fun x => Set.instMembership.mem (G.neighborSet v) x)
```

Fully explicit type:

```lean
∀ (n : Nat) (v : Fin n) (G : SimpleGraph.{0} (Fin n)),
  Finite.{1}
    (@Subtype.{1} (Fin n) fun (x : Fin n) =>
      @Membership.mem.{0, 0} (Fin n) (Set.{0} (Fin n)) (@Set.instMembership.{0} (Fin n))
        (@SimpleGraph.neighborSet.{0} (Fin n) G v) x)
```

### D008: `NumStability.HDP.Scalar.IndependentSums.Chernoff.graphBinomialLaw._proof_1`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.GraphDegreeLaw`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `8eb97a01637a35b1d54f59c8a2983e7a2a1e27dca7b5c671c5cf2a0ce08a72f1`

Type:

```lean
∀ (p : (Set.Icc 0 1).Elem), instPartialOrderNNReal.le (unitInterval.toNNReal p) 1
```

Fully explicit type:

```lean
∀
  (p :
    @Set.Elem.{0} Real
      (@Set.Icc.{0} Real Real.instPreorder (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
        (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))),
  @LE.le.{0} NNReal (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
    (unitInterval.toNNReal p) (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
```

### D009: `And`

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

### D010: `DivInvMonoid.toDiv`

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

### D011: `Exists`

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

### D012: `Fin`

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

### D013: `HDiv.hDiv`

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

### D014: `HMul.hMul`

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

### D015: `HSub.hSub`

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

### D016: `LE.le`

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

### D017: `LT.lt`

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

### D018: `MeasureTheory.Measure.real`

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

### D019: `Membership.mem`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `941ea3346e809f919727c21bfcdeea342714a6b83f1cf871d648aa2cb14d6e9e`

Type:

```lean
{α : outParam (Type u)} → {γ : Type v} → [self : Membership α γ] → γ → α → Prop
```

Fully explicit type:

```lean
{α : outParam.{u + 2} (Type u)} → {γ : Type v} → [self : Membership.{u, v} α γ] → γ → α → Prop
```

Definition body (one-level semantic boundary):

```lean
fun {α} γ [self : Membership α γ] => self.1
```

### D020: `Nat`

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

### D021: `Nat.cast`

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

### D022: `Nat.instAtLeastTwoHAddOfNat`

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

### D023: `Nat.instMeasurableSpace`

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

### D024: `Nat.instNeZeroSucc`

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

### D025: `Neg.neg`

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

### D026: `OfNat.ofNat`

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

### D027: `One.toOfNat1`

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

### D028: `ProbabilityTheory.HasLaw`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.HasLaw`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `b66448329d53bdea7204a60f6d944b6a9eb06e2e4257d8be3c0b23a303d6159a`

Type:

```lean
{Ω : Type u_1} →
  {𝓧 : Type u_2} →
    {mΩ : MeasurableSpace Ω} →
      {m𝓧 : MeasurableSpace 𝓧} →
        (Ω → 𝓧) → MeasureTheory.Measure 𝓧 → autoParam (MeasureTheory.Measure Ω) ProbabilityTheory.HasLaw._auto_1 → Prop
```

Fully explicit type:

```lean
{Ω : Type u_1} →
  {𝓧 : Type u_2} →
    {mΩ : MeasurableSpace.{u_1} Ω} →
      {m𝓧 : MeasurableSpace.{u_2} 𝓧} →
        (X : Ω → 𝓧) →
          (μ : @MeasureTheory.Measure.{u_2} 𝓧 m𝓧) →
            (P : autoParam.{u_1 + 1} (@MeasureTheory.Measure.{u_1} Ω mΩ) ProbabilityTheory.HasLaw._auto_1) → Prop
```

### D029: `Real`

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

### D030: `Real.exp`

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

### D031: `Real.instAddGroup`

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

### D032: `Real.instDivInvMonoid`

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

### D033: `Real.instLE`

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

### D035: `Real.instMul`

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

### D036: `Real.instNatCast`

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

### D037: `Real.instNeg`

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

### D038: `Real.instOne`

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

### D039: `Real.instPreorder`

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

### D040: `Real.instSub`

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

### D041: `Real.instZero`

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

### D042: `Real.lattice`

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

### D043: `Set`

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

### D044: `Set.Elem`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Set.CoeSort`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `2fa7a863ddf7e954e2026c0d7547ac9d781f4a5cb94968d0c9ed2c720b524fdb`

Type:

```lean
{α : Type u} → Set α → Type u
```

Fully explicit type:

```lean
{α : Type u} → (s : Set.{u} α) → Type u
```

Definition body (one-level semantic boundary):

```lean
fun {α} s => Subtype fun x => Set.instMembership.mem s x
```

### D045: `Set.Icc`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Interval.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5d4d1d0cca151d5f96eb45776025e642f79e9040e66fffcf889bd1224442ecc8`

Type:

```lean
{α : Type u_1} → [Preorder α] → α → α → Set α
```

Fully explicit type:

```lean
{α : Type u_1} → [Preorder.{u_1} α] → (a b : α) → Set.{u_1} α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Preorder α] a b => setOf fun x => And (inst.le a x) (inst.le x b)
```

### D046: `Set.instMembership`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5858be77d319c5a0e238602f16818ed6fb2e2b52a81ff7edb07bc219d652f201`

Type:

```lean
{α : Type u} → Membership α (Set α)
```

Fully explicit type:

```lean
{α : Type u} → Membership.{u, u} α (Set.{u} α)
```

Definition body (one-level semantic boundary):

```lean
fun {α} => { mem := Set.Mem }
```

### D047: `SimpleGraph`

- Role: `external-frontier`
- Owner module: `Mathlib.Combinatorics.SimpleGraph.Basic`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `92c46e19c8ae5bf29037355fa37f1cf9366755f85b12432f800f3f3435c27fa6`

Type:

```lean
Type u → Type u
```

Fully explicit type:

```lean
(V : Type u) → Type u
```

### D048: `SimpleGraph.instMeasurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Constructions.SimpleGraph`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `668769081f9d3ecc495649c7f45cb42c94814ab770e8c2edff7f16f9903000c7`

Type:

```lean
{V : Type u_1} → MeasurableSpace (SimpleGraph V)
```

Fully explicit type:

```lean
{V : Type u_1} → MeasurableSpace.{u_1} (SimpleGraph.{u_1} V)
```

Definition body (one-level semantic boundary):

```lean
fun {V} => MeasurableSpace.comap SimpleGraph.Adj inferInstance
```

### D049: `Subtype.val`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `69c61ab82498e5563eaf5f0313ea7f2164c284c3dc742024a30332372a46663d`

Type:

```lean
{α : Sort u} → {p : α → Prop} → Subtype p → α
```

Fully explicit type:

```lean
{α : Sort u} → {p : α → Prop} → (self : @Subtype.{u} α p) → α
```

Definition body (one-level semantic boundary):

```lean
fun α p self => self.1
```

### D050: `Zero.toOfNat0`

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

### D051: `abs`

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

### D052: `instHDiv`

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

### D053: `instHMul`

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

### D054: `instHSub`

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

### D055: `instOfNatAtLeastTwo`

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

### D056: `instOfNatNat`

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

### D057: `setOf`

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

### D058: `Fin.val`

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

### D059: `Fintype.ofFinite`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Fintype.EquivFin`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `b1750c9a619b9b950014bf300edca8639934bfa9ec4fa4b387b3c0c752a0461b`

Type:

```lean
(α : Type u_4) → [Finite α] → Fintype α
```

Fully explicit type:

```lean
(α : Type u_4) → [Finite.{u_4 + 1} α] → Fintype.{u_4} α
```

Definition body (one-level semantic boundary):

```lean
fun α [Finite α] => ⋯.some
```

### D060: `HAdd.hAdd`

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

### D061: `MeasureTheory.Measure`

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

### D062: `PMF.binomial`

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

### D063: `PMF.map`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Constructions`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D064: `PMF.toMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `8ced32cd3241e2bc9f46b87ddce71f2df9ec2334668bbaee227f0214d496a02d`

Type:

```lean
{α : Type u_1} → [inst : MeasurableSpace α] → PMF α → MeasureTheory.Measure α
```

Fully explicit type:

```lean
{α : Type u_1} → [inst : MeasurableSpace.{u_1} α] → (p : PMF.{u_1} α) → @MeasureTheory.Measure.{u_1} α inst
```

Definition body (one-level semantic boundary):

```lean
fun {α} [MeasurableSpace α] p => p.toOuterMeasure.toMeasure ⋯
```

### D065: `SimpleGraph.binomialRandom`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.Combinatorics.BinomialRandomGraph.Defs`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `5d550211974c376aa5ced20f62a15496d1439400a62440076cc623e2f858ed99`

Type:

```lean
(V : Type u_1) → unitInterval.Elem → MeasureTheory.Measure (SimpleGraph V)
```

Fully explicit type:

```lean
(V : Type u_1) →
  (p : @Set.Elem.{0} Real unitInterval) →
    @MeasureTheory.Measure.{u_1} (SimpleGraph.{u_1} V) (@SimpleGraph.instMeasurableSpace.{u_1} V)
```

Definition body (one-level semantic boundary):

```lean
fun V p =>
  MeasureTheory.Measure.comap SimpleGraph.edgeSet (ProbabilityTheory.setBernoulli (Set.instCompl.compl Sym2.diagSet) p)
```

### D066: `SimpleGraph.degree`

- Role: `external-frontier`
- Owner module: `Mathlib.Combinatorics.SimpleGraph.Finite`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `ee55c1bc28f6cb2d8b2c398e9cf28ec1279efeec7656bd4e3a76ed825b3bc910`

Type:

```lean
{V : Type u_1} → (G : SimpleGraph V) → (v : V) → [Fintype (G.neighborSet v).Elem] → Nat
```

Fully explicit type:

```lean
{V : Type u_1} →
  (G : SimpleGraph.{u_1} V) → (v : V) → [Fintype.{u_1} (@Set.Elem.{u_1} V (@SimpleGraph.neighborSet.{u_1} V G v))] → Nat
```

Definition body (one-level semantic boundary):

```lean
fun {V} G v [Fintype (G.neighborSet v).Elem] => (G.neighborFinset v).card
```

### D067: `SimpleGraph.neighborSet`

- Role: `external-frontier`
- Owner module: `Mathlib.Combinatorics.SimpleGraph.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `bf7238776e298f4c2764a44b104e97d7022a104357e30eff3633803645f8249b`

Type:

```lean
{V : Type u} → SimpleGraph V → V → Set V
```

Fully explicit type:

```lean
{V : Type u} → (G : SimpleGraph.{u} V) → (v : V) → Set.{u} V
```

Definition body (one-level semantic boundary):

```lean
fun {V} G v => setOf fun w => G.Adj v w
```

### D068: `instAddNat`

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

### D069: `instHAdd`

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

### D070: `instSubNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `5b0e20a4d2b3e0a67bd35de1b5c84cc60d6dc867658112d84cad483055804868`

Type:

```lean
Sub Nat
```

Fully explicit type:

```lean
Sub.{0} Nat
```

Definition body (one-level semantic boundary):

```lean
{ sub := Nat.sub }
```

### D071: `unitInterval.toNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.UnitInterval`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `60c99596717c55660a648a47b197bc6f18dc2de1667ecd83dfd83aa02192189f`

Type:

```lean
unitInterval.Elem → NNReal
```

Fully explicit type:

```lean
@Set.Elem.{0} Real unitInterval → NNReal
```

Definition body (one-level semantic boundary):

```lean
fun i => ⟨i.val, ⋯⟩
```

### D072: `Finite`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Finite.Defs`
- Declaration kind: `inductive`
- Distance from target type: `3`
- Semantic SHA-256: `537db26f6ac8c8862510b4e62d2075a1b3bc15b0d8f9ac538484e1258a3070a4`

Type:

```lean
Sort u_3 → Prop
```

Fully explicit type:

```lean
(α : Sort u_3) → Prop
```

### D073: `NNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `3`
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

### D074: `PartialOrder.toPreorder`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Defs.PartialOrder`
- Declaration kind: `abbrev`
- Distance from target type: `3`
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

### D075: `Preorder.toLE`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Defs.PartialOrder`
- Declaration kind: `abbrev`
- Distance from target type: `3`
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

### D076: `Subtype`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `3`
- Semantic SHA-256: `3b0bb8433bd0c981dbdb4d6256bf74c50e9883207dae8d309dcb705135cf932c`

Type:

```lean
{α : Sort u} → (α → Prop) → Sort (max 1 u)
```

Fully explicit type:

```lean
{α : Sort u} → (p : α → Prop) → Sort (max 1 u)
```

### D077: `instOneNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `3`
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

### D078: `instPartialOrderNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `3`
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
