# Declaration dossier for HDP-02-DEF-2.2.1

This dossier describes the theorem statement only. Its proof is excluded.
Interpret every dependency from its supplied declaration; names are not definitions.

## Proof-free source declaration

```lean
theorem hdp_02_hdef_h2_d2_d1_spec :
    hdp_02_hdef_h2_d2_d1.law (-1) = 1 / 2 ∧
      hdp_02_hdef_h2_d2_d1.law 1 = 1 / 2 ∧
      ∀ {p : ℝ≥0} (hp : p ≤ 1),
        PMF.map
            NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherValue
            (PMF.bernoulli p hp) = hdp_02_hdef_h2_d2_d1.law ↔
          p = (1 / 2 : ℝ≥0)
```

## Elaborated target type

```lean
And (Eq (PMF.instFunLike.coe NumStability.HDP.Contract.hdp_02_hdef_h2_d2_d1.law (-1)) (1 / 2))
  (And (Eq (PMF.instFunLike.coe NumStability.HDP.Contract.hdp_02_hdef_h2_d2_d1.law 1) (1 / 2))
    (∀ {p : NNReal} (hp : instPartialOrderNNReal.le p 1),
      Iff
        (Eq (PMF.map NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherValue (PMF.bernoulli p hp))
          NumStability.HDP.Contract.hdp_02_hdef_h2_d2_d1.law)
        (Eq p (1 / 2))))
```

## Fully explicit elaborated target type

```lean
And
  (@Eq.{1} ENNReal
    (@DFunLike.coe.{1, 1, 1} (PMF.{0} Real) Real (fun (x : Real) => ENNReal) (@PMF.instFunLike.{0} Real)
      (NumStability.HDP.Scalar.IndependentSums.Hoeffding.RademacherModelData.law
        NumStability.HDP.Contract.hdp_02_hdef_h2_d2_d1)
      (@Neg.neg.{0} Real Real.instNeg (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne))))
    (@HDiv.hDiv.{0, 0, 0} ENNReal ENNReal ENNReal
      (@instHDiv.{0} ENNReal (@DivInvMonoid.toDiv.{0} ENNReal ENNReal.instDivInvMonoid))
      (@OfNat.ofNat.{0} ENNReal (nat_lit 1)
        (@One.toOfNat1.{0} ENNReal
          (@AddMonoidWithOne.toOne.{0} ENNReal
            (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))))
      (@OfNat.ofNat.{0} ENNReal (nat_lit 2)
        (@instOfNatAtLeastTwo.{0} ENNReal (nat_lit 2)
          (@AddMonoidWithOne.toNatCast.{0} ENNReal
            (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))
          (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
            (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))))
  (And
    (@Eq.{1} ENNReal
      (@DFunLike.coe.{1, 1, 1} (PMF.{0} Real) Real (fun (x : Real) => ENNReal) (@PMF.instFunLike.{0} Real)
        (NumStability.HDP.Scalar.IndependentSums.Hoeffding.RademacherModelData.law
          NumStability.HDP.Contract.hdp_02_hdef_h2_d2_d1)
        (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))
      (@HDiv.hDiv.{0, 0, 0} ENNReal ENNReal ENNReal
        (@instHDiv.{0} ENNReal (@DivInvMonoid.toDiv.{0} ENNReal ENNReal.instDivInvMonoid))
        (@OfNat.ofNat.{0} ENNReal (nat_lit 1)
          (@One.toOfNat1.{0} ENNReal
            (@AddMonoidWithOne.toOne.{0} ENNReal
              (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))))
        (@OfNat.ofNat.{0} ENNReal (nat_lit 2)
          (@instOfNatAtLeastTwo.{0} ENNReal (nat_lit 2)
            (@AddMonoidWithOne.toNatCast.{0} ENNReal
              (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))
            (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
              (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))))
    (∀ {p : NNReal}
      (hp :
        @LE.le.{0} NNReal (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal)) p
          (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))),
      Iff
        (@Eq.{1} (PMF.{0} Real)
          (@PMF.map.{0, 0} Bool Real NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherValue
            (PMF.bernoulli p hp))
          (NumStability.HDP.Scalar.IndependentSums.Hoeffding.RademacherModelData.law
            NumStability.HDP.Contract.hdp_02_hdef_h2_d2_d1))
        (@Eq.{1} NNReal p
          (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal (@instHDiv.{0} NNReal NNReal.instDiv)
            (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
            (@OfNat.ofNat.{0} NNReal (nat_lit 2)
              (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                (@AddMonoidWithOne.toNatCast.{0} NNReal
                  (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                    (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                      (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                  (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))))))
```

## Local import graph

- `AuditTarget` imports: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- `NumStability.HDP.Scalar.Preliminaries` imports: `Mathlib.Probability.Moments.Variance`, `Mathlib.Probability.CDF`, `Mathlib.MeasureTheory.Function.LpSpace.Basic`, `Mathlib.MeasureTheory.Function.LpSpace.Complete`, `Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm`, `Mathlib.MeasureTheory.Function.LpSeminorm.Indicator`, `Mathlib.Probability.UniformOn`, `Mathlib.Analysis.Convex.Integral`, `Mathlib.Analysis.Convex.Continuous`, `Mathlib.MeasureTheory.Integral.Bochner.Set`, `Mathlib.MeasureTheory.Integral.Lebesgue.Markov`, `Mathlib.MeasureTheory.Integral.Layercake`, `Mathlib.MeasureTheory.Measure.Lebesgue.Integral`, `Mathlib.Probability.Distributions.Cauchy`, `Mathlib.Analysis.SpecialFunctions.NonIntegrable`, `Mathlib.Analysis.SpecialFunctions.Pow.Integral`, `Mathlib.Tactic`
- `NumStability.HDP.Scalar.IndependentSums.Hoeffding` imports: `Mathlib.Probability.Independence.Integration`, `Mathlib.Probability.Moments.Basic`, `Mathlib.Probability.Moments.SubGaussian`, `Mathlib.Probability.ProbabilityMassFunction.Constructions`, `Mathlib.Probability.ProbabilityMassFunction.Integrals`, `Mathlib.Analysis.SpecialFunctions.Trigonometric.Series`, `Mathlib.Analysis.SpecialFunctions.ImproperIntegrals`, `Mathlib.Tactic`, `NumStability.HDP.Scalar.Preliminaries`

## Semantic dependency inventory

`local` declarations are followed recursively through types and bodies. `external-frontier` declarations mark the one-level library trust boundary.

### D001: `NumStability.HDP.Contract.hdp_02_hdef_h2_d2_d1`

- Role: `local`
- Owner module: `AuditTarget`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `960de5d33289e9bcbb37132b76ff355acf31e631d958731eda3662875ae0306a`

Type:

```lean
NumStability.HDP.Scalar.IndependentSums.Hoeffding.RademacherModelData
```

Fully explicit type:

```lean
NumStability.HDP.Scalar.IndependentSums.Hoeffding.RademacherModelData
```

Definition body (one-level semantic boundary):

```lean
NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherModel
```

### D002: `NumStability.HDP.Scalar.IndependentSums.Hoeffding.RademacherModelData.law`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `ef417ef6f68a9025842d6b0534e855c85be5b980014aadfb9e64b6d9dd4af9d2`

Type:

```lean
NumStability.HDP.Scalar.IndependentSums.Hoeffding.RademacherModelData → PMF Real
```

Fully explicit type:

```lean
(self : NumStability.HDP.Scalar.IndependentSums.Hoeffding.RademacherModelData) → PMF.{0} Real
```

Definition body (one-level semantic boundary):

```lean
fun self => self.1
```

### D003: `NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherValue`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `d88ba3cc7510bd103ae4a674123ef0770dc74f06cda4a5c3e372989f4d64253d`

Type:

```lean
Bool → Real
```

Fully explicit type:

```lean
Bool → Real
```

Definition body (one-level semantic boundary):

```lean
fun b => ite (Eq b Bool.true) 1 (-1)
```

### D004: `NumStability.HDP.Scalar.IndependentSums.Hoeffding.RademacherModelData`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- Declaration kind: `inductive`
- Distance from target type: `2`
- Semantic SHA-256: `c960aacb1e8f1c66555b9551798e70390718e86d28c3abfcb5724da595960b64`

Type:

```lean
Type
```

Fully explicit type:

```lean
Type
```

### D005: `NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherModel`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `7c0cbec3d870f473ef5f7e108ddc3db4dda87a1b959daf5d3332d6178c65513c`

Type:

```lean
NumStability.HDP.Scalar.IndependentSums.Hoeffding.RademacherModelData
```

Fully explicit type:

```lean
NumStability.HDP.Scalar.IndependentSums.Hoeffding.RademacherModelData
```

Definition body (one-level semantic boundary):

```lean
{ law := NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF,
  mass_one := NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF_mass_one,
  mass_neg_one := NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF_mass_neg_one,
  affine_bernoulli_iff := ⋯, mean := NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF_mean,
  variance := NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF_variance,
  abs_mean := NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF_abs }
```

### D006: `NumStability.HDP.Scalar.IndependentSums.Hoeffding.RademacherModelData.mk`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- Declaration kind: `constructor`
- Distance from target type: `3`
- Semantic SHA-256: `aca5203d8f9ec006a3d11db22e819a2dff6f0b93b2a6984487856d010ec0cd6f`

Type:

```lean
(law : PMF Real) →
  Eq (PMF.instFunLike.coe law 1) (1 / 2) →
    Eq (PMF.instFunLike.coe law (-1)) (1 / 2) →
      (∀ {p : NNReal} (hp : instPartialOrderNNReal.le p 1),
          Iff (Eq (PMF.map NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherValue (PMF.bernoulli p hp)) law)
            (Eq p (1 / 2))) →
        Eq (MeasureTheory.integral law.toMeasure fun x => x) 0 →
          Eq (MeasureTheory.integral law.toMeasure fun x => instHPow.hPow (instHSub.hSub x 0) 2) 1 →
            Eq (MeasureTheory.integral law.toMeasure fun x => abs x) 1 →
              NumStability.HDP.Scalar.IndependentSums.Hoeffding.RademacherModelData
```

Fully explicit type:

```lean
(law : PMF.{0} Real) →
  (mass_one :
      @Eq.{1} ENNReal
        (@DFunLike.coe.{1, 1, 1} (PMF.{0} Real) Real (fun (x : Real) => ENNReal) (@PMF.instFunLike.{0} Real) law
          (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))
        (@HDiv.hDiv.{0, 0, 0} ENNReal ENNReal ENNReal
          (@instHDiv.{0} ENNReal (@DivInvMonoid.toDiv.{0} ENNReal ENNReal.instDivInvMonoid))
          (@OfNat.ofNat.{0} ENNReal (nat_lit 1)
            (@One.toOfNat1.{0} ENNReal
              (@AddMonoidWithOne.toOne.{0} ENNReal
                (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))))
          (@OfNat.ofNat.{0} ENNReal (nat_lit 2)
            (@instOfNatAtLeastTwo.{0} ENNReal (nat_lit 2)
              (@AddMonoidWithOne.toNatCast.{0} ENNReal
                (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))
              (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))) →
    (mass_neg_one :
        @Eq.{1} ENNReal
          (@DFunLike.coe.{1, 1, 1} (PMF.{0} Real) Real (fun (x : Real) => ENNReal) (@PMF.instFunLike.{0} Real) law
            (@Neg.neg.{0} Real Real.instNeg (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne))))
          (@HDiv.hDiv.{0, 0, 0} ENNReal ENNReal ENNReal
            (@instHDiv.{0} ENNReal (@DivInvMonoid.toDiv.{0} ENNReal ENNReal.instDivInvMonoid))
            (@OfNat.ofNat.{0} ENNReal (nat_lit 1)
              (@One.toOfNat1.{0} ENNReal
                (@AddMonoidWithOne.toOne.{0} ENNReal
                  (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))))
            (@OfNat.ofNat.{0} ENNReal (nat_lit 2)
              (@instOfNatAtLeastTwo.{0} ENNReal (nat_lit 2)
                (@AddMonoidWithOne.toNatCast.{0} ENNReal
                  (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))
                (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                  (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))) →
      (affine_bernoulli_iff :
          ∀ {p : NNReal}
            (hp :
              @LE.le.{0} NNReal (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
                p (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))),
            Iff
              (@Eq.{1} (PMF.{0} Real)
                (@PMF.map.{0, 0} Bool Real NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherValue
                  (PMF.bernoulli p hp))
                law)
              (@Eq.{1} NNReal p
                (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal (@instHDiv.{0} NNReal NNReal.instDiv)
                  (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
                  (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                    (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                      (@AddMonoidWithOne.toNatCast.{0} NNReal
                        (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                          (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                            (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                      (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                        (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))))) →
        (mean :
            @Eq.{1} Real
              (@MeasureTheory.integral.{0, 0} Real Real Real.normedAddCommGroup
                (@InnerProductSpace.toNormedSpace.{0, 0} Real Real Real.instRCLike
                  (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup)
                  (@RCLike.toInnerProductSpaceReal.{0} Real Real.instRCLike))
                Real.measurableSpace (@PMF.toMeasure.{0} Real Real.measurableSpace law) fun (x : Real) => x)
              (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))) →
          (variance :
              @Eq.{1} Real
                (@MeasureTheory.integral.{0, 0} Real Real Real.normedAddCommGroup
                  (@InnerProductSpace.toNormedSpace.{0, 0} Real Real Real.instRCLike
                    (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup)
                    (@RCLike.toInnerProductSpaceReal.{0} Real Real.instRCLike))
                  Real.measurableSpace (@PMF.toMeasure.{0} Real Real.measurableSpace law) fun (x : Real) =>
                  @HPow.hPow.{0, 0, 0} Real Nat Real
                    (@instHPow.{0, 0} Real Nat (@Monoid.toNatPow.{0} Real Real.instMonoid))
                    (@HSub.hSub.{0, 0, 0} Real Real Real (@instHSub.{0} Real Real.instSub) x
                      (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero)))
                    (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))))
                (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne))) →
            (abs_mean :
                @Eq.{1} Real
                  (@MeasureTheory.integral.{0, 0} Real Real Real.normedAddCommGroup
                    (@InnerProductSpace.toNormedSpace.{0, 0} Real Real Real.instRCLike
                      (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup)
                      (@RCLike.toInnerProductSpaceReal.{0} Real Real.instRCLike))
                    Real.measurableSpace (@PMF.toMeasure.{0} Real Real.measurableSpace law) fun (x : Real) =>
                    @abs.{0} Real Real.lattice Real.instAddGroup x)
                  (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne))) →
              NumStability.HDP.Scalar.IndependentSums.Hoeffding.RademacherModelData
```

### D007: `NumStability.HDP.Scalar.IndependentSums.Hoeffding.affineBernoulliIsRademacherIff`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- Declaration kind: `theorem`
- Distance from target type: `3`
- Semantic SHA-256: `ee7be819923cb76d87b26fa56bb4184020a897d307fdc057041f41fd41c8be23`

Type:

```lean
∀ {p : NNReal} (hp : instPartialOrderNNReal.le p 1),
  Iff
    (Eq (PMF.map NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherValue (PMF.bernoulli p hp))
      NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF)
    (Eq p (1 / 2))
```

Fully explicit type:

```lean
∀ {p : NNReal}
  (hp :
    @LE.le.{0} NNReal (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal)) p
      (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))),
  Iff
    (@Eq.{1} (PMF.{0} Real)
      (@PMF.map.{0, 0} Bool Real NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherValue (PMF.bernoulli p hp))
      NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF)
    (@Eq.{1} NNReal p
      (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal (@instHDiv.{0} NNReal NNReal.instDiv)
        (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
        (@OfNat.ofNat.{0} NNReal (nat_lit 2)
          (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
            (@AddMonoidWithOne.toNatCast.{0} NNReal
              (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                  (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
            (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
              (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))))
```

### D008: `NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- Declaration kind: `def`
- Distance from target type: `3`
- Semantic SHA-256: `8c185cd40c5c7f8b9df2953d0401a56cccc8f2849b59a772d5332dae0cd55f09`

Type:

```lean
PMF Real
```

Fully explicit type:

```lean
PMF.{0} Real
```

Definition body (one-level semantic boundary):

```lean
PMF.map NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherValue
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.fairBernoulliPMF
```

### D009: `NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF_abs`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- Declaration kind: `theorem`
- Distance from target type: `3`
- Semantic SHA-256: `070cda8322f741149d722d0455e5509e9198074f960a6972f6215b553bb02c2f`

Type:

```lean
Eq (MeasureTheory.integral NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF.toMeasure fun x => abs x) 1
```

Fully explicit type:

```lean
@Eq.{1} Real
  (@MeasureTheory.integral.{0, 0} Real Real Real.normedAddCommGroup
    (@InnerProductSpace.toNormedSpace.{0, 0} Real Real Real.instRCLike
      (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup)
      (@RCLike.toInnerProductSpaceReal.{0} Real Real.instRCLike))
    Real.measurableSpace
    (@PMF.toMeasure.{0} Real Real.measurableSpace NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF)
    fun (x : Real) => @abs.{0} Real Real.lattice Real.instAddGroup x)
  (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne))
```

### D010: `NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF_mass_neg_one`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- Declaration kind: `theorem`
- Distance from target type: `3`
- Semantic SHA-256: `1862c9a38b1ef91eddf916a62a2c34ece6627e190c988c41c9df9db8c1944f75`

Type:

```lean
Eq (PMF.instFunLike.coe NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF (-1)) (1 / 2)
```

Fully explicit type:

```lean
@Eq.{1} ENNReal
  (@DFunLike.coe.{1, 1, 1} (PMF.{0} Real) Real (fun (x : Real) => ENNReal) (@PMF.instFunLike.{0} Real)
    NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF
    (@Neg.neg.{0} Real Real.instNeg (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne))))
  (@HDiv.hDiv.{0, 0, 0} ENNReal ENNReal ENNReal
    (@instHDiv.{0} ENNReal (@DivInvMonoid.toDiv.{0} ENNReal ENNReal.instDivInvMonoid))
    (@OfNat.ofNat.{0} ENNReal (nat_lit 1)
      (@One.toOfNat1.{0} ENNReal
        (@AddMonoidWithOne.toOne.{0} ENNReal
          (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))))
    (@OfNat.ofNat.{0} ENNReal (nat_lit 2)
      (@instOfNatAtLeastTwo.{0} ENNReal (nat_lit 2)
        (@AddMonoidWithOne.toNatCast.{0} ENNReal
          (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))
        (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
          (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))
```

### D011: `NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF_mass_one`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- Declaration kind: `theorem`
- Distance from target type: `3`
- Semantic SHA-256: `fd3cfee58f8f1d925c13691683af74b4e3313333b6edf02a01e37b2a07f49227`

Type:

```lean
Eq (PMF.instFunLike.coe NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF 1) (1 / 2)
```

Fully explicit type:

```lean
@Eq.{1} ENNReal
  (@DFunLike.coe.{1, 1, 1} (PMF.{0} Real) Real (fun (x : Real) => ENNReal) (@PMF.instFunLike.{0} Real)
    NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF
    (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne)))
  (@HDiv.hDiv.{0, 0, 0} ENNReal ENNReal ENNReal
    (@instHDiv.{0} ENNReal (@DivInvMonoid.toDiv.{0} ENNReal ENNReal.instDivInvMonoid))
    (@OfNat.ofNat.{0} ENNReal (nat_lit 1)
      (@One.toOfNat1.{0} ENNReal
        (@AddMonoidWithOne.toOne.{0} ENNReal
          (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))))
    (@OfNat.ofNat.{0} ENNReal (nat_lit 2)
      (@instOfNatAtLeastTwo.{0} ENNReal (nat_lit 2)
        (@AddMonoidWithOne.toNatCast.{0} ENNReal
          (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))
        (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
          (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))
```

### D012: `NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF_mean`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- Declaration kind: `theorem`
- Distance from target type: `3`
- Semantic SHA-256: `5728a9ba6bba39f163b4d16f5c56545c252b6ce3fcc3ccfa6a8f173a96780859`

Type:

```lean
Eq (MeasureTheory.integral NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF.toMeasure fun x => x) 0
```

Fully explicit type:

```lean
@Eq.{1} Real
  (@MeasureTheory.integral.{0, 0} Real Real Real.normedAddCommGroup
    (@InnerProductSpace.toNormedSpace.{0, 0} Real Real Real.instRCLike
      (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup)
      (@RCLike.toInnerProductSpaceReal.{0} Real Real.instRCLike))
    Real.measurableSpace
    (@PMF.toMeasure.{0} Real Real.measurableSpace NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF)
    fun (x : Real) => x)
  (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero))
```

### D013: `NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF_variance`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- Declaration kind: `theorem`
- Distance from target type: `3`
- Semantic SHA-256: `4df8ff97d35870645dfe6c25d12c1eab7a56f40712f5725c3ab33a56d991928d`

Type:

```lean
Eq
  (MeasureTheory.integral NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF.toMeasure fun x =>
    instHPow.hPow (instHSub.hSub x 0) 2)
  1
```

Fully explicit type:

```lean
@Eq.{1} Real
  (@MeasureTheory.integral.{0, 0} Real Real Real.normedAddCommGroup
    (@InnerProductSpace.toNormedSpace.{0, 0} Real Real Real.instRCLike
      (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup)
      (@RCLike.toInnerProductSpaceReal.{0} Real Real.instRCLike))
    Real.measurableSpace
    (@PMF.toMeasure.{0} Real Real.measurableSpace NumStability.HDP.Scalar.IndependentSums.Hoeffding.rademacherPMF)
    fun (x : Real) =>
    @HPow.hPow.{0, 0, 0} Real Nat Real (@instHPow.{0, 0} Real Nat (@Monoid.toNatPow.{0} Real Real.instMonoid))
      (@HSub.hSub.{0, 0, 0} Real Real Real (@instHSub.{0} Real Real.instSub) x
        (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero)))
      (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))))
  (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne))
```

### D014: `NumStability.HDP.Scalar.IndependentSums.Hoeffding.fairBernoulliPMF`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `b14818e70aebdac5c9e5ea27f71c3d9e026e8b8695a96e4acfe16e214944dd5c`

Type:

```lean
PMF Bool
```

Fully explicit type:

```lean
PMF.{0} Bool
```

Definition body (one-level semantic boundary):

```lean
PMF.bernoulli (1 / 2) NumStability.HDP.Scalar.IndependentSums.Hoeffding.fairBernoulliPMF._proof_2
```

### D015: `NumStability.HDP.Scalar.IndependentSums.Hoeffding.fairBernoulliPMF._proof_1`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- Declaration kind: `theorem`
- Distance from target type: `5`
- Semantic SHA-256: `75a4aea7a385e7e8816c5be3a4a7a68e18119e6cc978c9f3f0eec2a8b01df2f5`

Type:

```lean
(instHAdd.hAdd 1 1).AtLeastTwo
```

Fully explicit type:

```lean
Nat.AtLeastTwo
  (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat)
    (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
    (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))
```

### D016: `NumStability.HDP.Scalar.IndependentSums.Hoeffding.fairBernoulliPMF._proof_2`

- Role: `local`
- Owner module: `NumStability.HDP.Scalar.IndependentSums.Hoeffding`
- Declaration kind: `theorem`
- Distance from target type: `5`
- Semantic SHA-256: `0fc148c3c64ed465884d43136a114c0fcee7f4edd1860a2809a6f8b3f9788ccf`

Type:

```lean
instPartialOrderNNReal.le (1 / 2) 1
```

Fully explicit type:

```lean
@LE.le.{0} NNReal (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
  (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal (@instHDiv.{0} NNReal NNReal.instDiv)
    (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
    (@OfNat.ofNat.{0} NNReal (nat_lit 2)
      (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
        (@AddMonoidWithOne.toNatCast.{0} NNReal
          (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
            (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
              (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
        NumStability.HDP.Scalar.IndependentSums.Hoeffding.fairBernoulliPMF._proof_1)))
  (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
```

### D017: `AddCommMonoidWithOne.toAddMonoidWithOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
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

### D018: `AddMonoidWithOne.toNatCast`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6b956e88ee642e7533983b76ff8087f4537eea04f025165ce1fa45dc80e795a2`

Type:

```lean
{R : Type u_2} → [self : AddMonoidWithOne R] → NatCast R
```

Fully explicit type:

```lean
{R : Type u_2} → [self : AddMonoidWithOne.{u_2} R] → NatCast.{u_2} R
```

Definition body (one-level semantic boundary):

```lean
fun R [self : AddMonoidWithOne R] => self.1
```

### D019: `AddMonoidWithOne.toOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
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

### D020: `And`

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

### D021: `Bool`

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

### D022: `DFunLike.coe`

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

### D023: `DivInvMonoid.toDiv`

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

### D024: `ENNReal`

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

### D025: `ENNReal.instDivInvMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `a16707eecceb752981c37888bf52111ce739b7c4b8b1a1b4309bd98646350cad`

Type:

```lean
DivInvMonoid ENNReal
```

Fully explicit type:

```lean
DivInvMonoid.{0} ENNReal
```

Definition body (one-level semantic boundary):

```lean
{ toMonoid := ENNReal.instCommSemiring.toMonoidWithZero.toMonoid, toInv := ENNReal.instInv, div := DivInvMonoid.div',
  div_eq_mul_inv := ENNReal.instDivInvMonoid._proof_1, zpow := zpowRec, zpow_zero' := ENNReal.instDivInvMonoid._proof_2,
  zpow_succ' := ENNReal.instDivInvMonoid._proof_3, zpow_neg' := ENNReal.instDivInvMonoid._proof_4 }
```

### D026: `Eq`

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

### D027: `HDiv.hDiv`

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

### D028: `Iff`

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

### D029: `LE.le`

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

### D030: `NNReal`

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

### D031: `NNReal.instDiv`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `db7c02aebe99430b40db2791a53ab6674123591ebf2c7ce532fb26b074337486`

Type:

```lean
Div NNReal
```

Fully explicit type:

```lean
Div.{0} NNReal
```

Definition body (one-level semantic boundary):

```lean
{ div := fun x y => ⟨instHDiv.hDiv x.toReal y.toReal, ⋯⟩ }
```

### D032: `Nat`

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

### D033: `Nat.instAtLeastTwoHAddOfNat`

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

### D034: `Nat.instNeZeroSucc`

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

### D035: `Neg.neg`

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

### D036: `NonAssocSemiring.toAddCommMonoidWithOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6e4c898b19286580a5053df0525278998daaf3b1687c7526ed8df20324dc7aa0`

Type:

```lean
{α : Type u} → [self : NonAssocSemiring α] → AddCommMonoidWithOne α
```

Fully explicit type:

```lean
{α : Type u} → [self : NonAssocSemiring.{u} α] → AddCommMonoidWithOne.{u} α
```

Definition body (one-level semantic boundary):

```lean
fun α self =>
  { toNatCast := self.toNatCast, toAddMonoid := self.toAddMonoid, toOne := self.toOne, natCast_zero := ⋯,
    natCast_succ := ⋯, add_comm := ⋯ }
```

### D037: `OfNat.ofNat`

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

### D038: `One.toOfNat1`

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

### D039: `PMF`

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

### D040: `PMF.bernoulli`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Constructions`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `bba28f3661de43e15fcaea9407d11973130e7602dc95b0d69470efe600d7b74f`

Type:

```lean
(p : NNReal) → instPartialOrderNNReal.le p 1 → PMF Bool
```

Fully explicit type:

```lean
(p : NNReal) →
  (h :
      @LE.le.{0} NNReal (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal)) p
        (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))) →
    PMF.{0} Bool
```

Definition body (one-level semantic boundary):

```lean
fun p h => PMF.ofFintype (fun b => bif b then ENNReal.ofNNReal p else instHSub.hSub 1 (ENNReal.ofNNReal p)) ⋯
```

### D041: `PMF.instFunLike`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `05711a7766dde315ec447925cc78ccc1619a791b609dbf4bb5ef3709cffaca0d`

Type:

```lean
{α : Type u_1} → FunLike (PMF α) α ENNReal
```

Fully explicit type:

```lean
{α : Type u_1} → FunLike.{u_1 + 1, u_1 + 1, 1} (PMF.{u_1} α) α ENNReal
```

Definition body (one-level semantic boundary):

```lean
fun {α} => { coe := fun p a => p.val a, coe_injective' := ⋯ }
```

### D042: `PMF.map`

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

### D043: `PartialOrder.toPreorder`

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

### D044: `Preorder.toLE`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Defs.PartialOrder`
- Declaration kind: `abbrev`
- Distance from target type: `1`
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

### D045: `Real`

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

### D046: `Real.instNeg`

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

### D047: `Real.instOne`

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

### D048: `Semiring.toNonAssocSemiring`

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

### D049: `instAddCommMonoidWithOneENNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D050: `instHDiv`

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

### D051: `instOfNatAtLeastTwo`

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

### D052: `instOfNatNat`

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

### D053: `instOneNNReal`

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

### D054: `instPartialOrderNNReal`

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

### D055: `instSemiringNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `3e4e8247feefdb8229f2843910b9a5df0fb872cbeba12353f5c00b1549c1f2b5`

Type:

```lean
Semiring NNReal
```

Fully explicit type:

```lean
Semiring.{0} NNReal
```

Definition body (one-level semantic boundary):

```lean
Nonneg.semiring
```

### D056: `Bool.true`

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

### D057: `instDecidableEqBool`

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

### D058: `ite`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `2`
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

### D059: `HPow.hPow`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `4`
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

### D060: `HSub.hSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `4`
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

### D061: `InnerProductSpace.toNormedSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.InnerProductSpace.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `4`
- Semantic SHA-256: `683435a8d27d50ec1482d74d23f541d52d05ff0411c60f88d16c32132aca9f3e`

Type:

```lean
{𝕜 : Type u_4} →
  {E : Type u_5} →
    {inst : RCLike 𝕜} → {inst_1 : SeminormedAddCommGroup E} → [self : InnerProductSpace 𝕜 E] → NormedSpace 𝕜 E
```

Fully explicit type:

```lean
{𝕜 : Type u_4} →
  {E : Type u_5} →
    {inst : RCLike.{u_4} 𝕜} →
      {inst_1 : SeminormedAddCommGroup.{u_5} E} →
        [self : @InnerProductSpace.{u_4, u_5} 𝕜 E inst inst_1] →
          @NormedSpace.{u_4, u_5} 𝕜 E
            (@DenselyNormedField.toNormedField.{u_4} 𝕜 (@RCLike.toDenselyNormedField.{u_4} 𝕜 inst)) inst_1
```

Definition body (one-level semantic boundary):

```lean
fun 𝕜 E {inst} {inst_1} [self : InnerProductSpace 𝕜 E] => self.1
```

### D062: `MeasureTheory.integral`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Integral.Bochner.Basic`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `428563f3d6b771605a3267457bf33b62ec2efa91a42b57b96121b85c0269a9ab`

Type:

```lean
{α : Type u_6} →
  {G : Type u_7} →
    [inst : NormedAddCommGroup G] →
      [NormedSpace Real G] → {x : MeasurableSpace α} → MeasureTheory.Measure α → (α → G) → G
```

Fully explicit type:

```lean
{α : Type u_6} →
  {G : Type u_7} →
    [inst : NormedAddCommGroup.{u_7} G] →
      [@NormedSpace.{0, u_7} Real G Real.normedField (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_7} G inst)] →
        {x : MeasurableSpace.{u_6} α} → (μ : @MeasureTheory.Measure.{u_6} α x) → (f : α → G) → G
```

Definition body (one-level semantic boundary):

```lean
MeasureTheory.wrapped✝.1
```

### D063: `Monoid.toNatPow`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `4`
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

### D064: `NormedAddCommGroup.toSeminormedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `7327759e5e9417c54393e7566584cd72d79c77b4ca018ea408c5d024667587be`

Type:

```lean
{E : Type u_5} → [NormedAddCommGroup E] → SeminormedAddCommGroup E
```

Fully explicit type:

```lean
{E : Type u_5} → [NormedAddCommGroup.{u_5} E] → SeminormedAddCommGroup.{u_5} E
```

Definition body (one-level semantic boundary):

```lean
fun {E} [inst : NormedAddCommGroup E] =>
  have __src := inst;
  { toNorm := __src.toNorm, toAddCommGroup := __src.toAddCommGroup, toPseudoMetricSpace := __src.toPseudoMetricSpace,
    dist_eq := ⋯ }
```

### D065: `PMF.toMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Basic`
- Declaration kind: `def`
- Distance from target type: `4`
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

### D066: `RCLike.toInnerProductSpaceReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.InnerProductSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `f602276baee30d3dbe02bd6b756a9097f750d59a7f91ca7635dcfc935fd22981`

Type:

```lean
{𝕜 : Type u_1} → [inst : RCLike 𝕜] → InnerProductSpace Real 𝕜
```

Fully explicit type:

```lean
{𝕜 : Type u_1} →
  [inst : RCLike.{u_1} 𝕜] →
    @InnerProductSpace.{0, u_1} Real 𝕜 Real.instRCLike
      (@NonUnitalSeminormedRing.toSeminormedAddCommGroup.{u_1} 𝕜
        (@NonUnitalSeminormedCommRing.toNonUnitalSeminormedRing.{u_1} 𝕜
          (@SeminormedCommRing.toNonUnitalSeminormedCommRing.{u_1} 𝕜
            (@NormedCommRing.toSeminormedCommRing.{u_1} 𝕜
              (@NormedField.toNormedCommRing.{u_1} 𝕜
                (@DenselyNormedField.toNormedField.{u_1} 𝕜 (@RCLike.toDenselyNormedField.{u_1} 𝕜 inst)))))))
```

Definition body (one-level semantic boundary):

```lean
fun {𝕜} [RCLike 𝕜] =>
  let __spread.0 := Inner.rclikeToReal 𝕜 𝕜;
  { toNormedSpace := NormedAlgebra.toNormedSpace 𝕜, toInner := __spread.0, norm_sq_eq_re_inner := ⋯,
    conj_inner_symm := ⋯, add_left := ⋯, smul_left := ⋯ }
```

### D067: `Real.instAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `4`
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

### D068: `Real.instMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `4`
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

### D069: `Real.instRCLike`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.RCLike.Basic`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `d2fdb97b9d861fcf61e6dbea9993dfa0ca6aa16609742f215c35b3f7ddd16b8e`

Type:

```lean
RCLike Real
```

Fully explicit type:

```lean
RCLike.{0} Real
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

### D070: `Real.instSub`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `4`
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

### D071: `Real.instZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `4`
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

### D072: `Real.lattice`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `4`
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

### D073: `Real.measurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Constructions.BorelSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `4`
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

### D074: `Real.normedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Real`
- Declaration kind: `def`
- Distance from target type: `4`
- Semantic SHA-256: `9ff0d896c635e2a38531d689d24ee70cfffa41565354ce15f6ff59b51650bd93`

Type:

```lean
NormedAddCommGroup Real
```

Fully explicit type:

```lean
NormedAddCommGroup.{0} Real
```

Definition body (one-level semantic boundary):

```lean
{ toNorm := Real.norm, toAddCommGroup := Real.instAddCommGroup, toMetricSpace := Real.metricSpace, dist_eq := ⋯ }
```

### D075: `Zero.toOfNat0`

- Role: `external-frontier`
- Owner module: `Init.Data.Zero`
- Declaration kind: `def`
- Distance from target type: `4`
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

### D076: `abs`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Order.Group.Unbundled.Abs`
- Declaration kind: `def`
- Distance from target type: `4`
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

### D077: `instHPow`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `4`
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

### D078: `instHSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `4`
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

### D079: `HAdd.hAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `6`
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

### D080: `Nat.AtLeastTwo`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Init`
- Declaration kind: `inductive`
- Distance from target type: `6`
- Semantic SHA-256: `318e11b8f9340f2f451d638786dd4fca470dece62824f4adc3bd18b5289aa911`

Type:

```lean
Nat → Prop
```

Fully explicit type:

```lean
(n : Nat) → Prop
```

### D081: `instAddNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `6`
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

### D082: `instHAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `6`
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
