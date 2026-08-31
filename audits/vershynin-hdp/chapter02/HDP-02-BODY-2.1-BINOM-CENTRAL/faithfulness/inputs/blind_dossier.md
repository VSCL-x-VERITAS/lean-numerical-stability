# Blind Lean declaration dossier

Translate only the mathematical proposition below. Source identity, task metadata,
theorem name, source declaration, proof, and repository commentary are excluded.
Do not use tools or inspect filesystem content.

## Elaborated target type

```lean
And
  (∀ (n : Nat),
    Eq (PMF.instFunLike.coe (PMF.binomial (1 / 2) ⋯ (instHMul.hMul 2 n)) ⟨n, ⋯⟩)
      (instHMul.hMul (instHPow.hPow (ENNReal.instInv.inv 2) (instHMul.hMul 2 n)) ((instHMul.hMul 2 n).choose n).cast))
  (And
    (∀ (n : Nat),
      instLTNat.lt 0 n →
        Eq
          (PMF.instFunLike.coe (LocalDef002 n)
            0)
          (PMF.instFunLike.coe (PMF.binomial (1 / 2) ⋯ (instHMul.hMul 2 n)) ⟨n, ⋯⟩))
    (Asymptotics.IsTheta Filter.atTop
      (fun n =>
        instHMul.hMul (instHPow.hPow (Real.instInv.inv 2) (instHMul.hMul 2 n)) ((instHMul.hMul 2 n).choose n).cast)
      fun n => instHDiv.hDiv 1 (instHMul.hMul 2 n.cast).sqrt))
```

## Fully explicit elaborated target type

```lean
And
  (∀ (n : Nat),
    @Eq.{1} ENNReal
      (@DFunLike.coe.{1, 1, 1}
        (PMF.{0}
          (Fin
            (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat)
              (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
                (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n)
              (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))))
        (Fin
          (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat)
            (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
              (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n)
            (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))))
        (fun
            (x :
              Fin
                (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat)
                  (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
                    (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n)
                  (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))) =>
          ENNReal)
        (@PMF.instFunLike.{0}
          (Fin
            (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat)
              (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
                (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n)
              (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))))
        (PMF.binomial
          (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal (@instHDiv.{0} NNReal NNReal.instDiv)
            (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
            (@OfNat.ofNat.{0} NNReal (nat_lit 2)
              (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                (@AddMonoidWithOne.toNatCast.{0} NNReal
                  (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                    (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                      (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                  (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))
          (@of_eq_true
            (@LE.le.{0} NNReal (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
              (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal (@instHDiv.{0} NNReal NNReal.instDiv)
                (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
                (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                  (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                    (@AddMonoidWithOne.toNatCast.{0} NNReal
                      (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                        (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                          (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                    (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                      (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))
              (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)))
            (@Eq.trans.{1} Prop
              (@LE.le.{0} NNReal
                (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
                (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal (@instHDiv.{0} NNReal NNReal.instDiv)
                  (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
                  (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                    (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                      (@AddMonoidWithOne.toNatCast.{0} NNReal
                        (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                          (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                            (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                      (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                        (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))
                (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)))
              (@LE.le.{0} NNReal
                (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
                (@OfNat.ofNat.{0} NNReal (nat_lit 0)
                  (@Zero.toOfNat0.{0} NNReal
                    (@MulZeroClass.toZero.{0} NNReal
                      (@NonUnitalNonAssocSemiring.toMulZeroClass.{0} NNReal
                        (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                          (@Semiring.toNonAssocSemiring.{0} NNReal
                            (@DivisionSemiring.toSemiring.{0} NNReal
                              (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                  (@One.toOfNat1.{0} NNReal
                    (@AddMonoidWithOne.toOne.{0} NNReal
                      (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                        (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                          (@Semiring.toNonAssocSemiring.{0} NNReal
                            (@DivisionSemiring.toSemiring.{0} NNReal
                              (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield)))))))))
              True
              (@Eq.trans.{1} Prop
                (@LE.le.{0} NNReal
                  (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
                  (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal (@instHDiv.{0} NNReal NNReal.instDiv)
                    (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
                    (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                      (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                        (@AddMonoidWithOne.toNatCast.{0} NNReal
                          (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                            (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                              (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                        (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                          (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))
                  (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)))
                (@LE.le.{0} NNReal
                  (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
                  (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal
                    (@instHDiv.{0} NNReal
                      (@DivInvMonoid.toDiv.{0} NNReal
                        (@GroupWithZero.toDivInvMonoid.{0} NNReal
                          (@DivisionSemiring.toGroupWithZero.{0} NNReal
                            (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield)))))
                    (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                      (@One.toOfNat1.{0} NNReal
                        (@AddMonoidWithOne.toOne.{0} NNReal
                          (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                            (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                              (@Semiring.toNonAssocSemiring.{0} NNReal
                                (@DivisionSemiring.toSemiring.{0} NNReal
                                  (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                    (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                      (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                        (@AddMonoidWithOne.toNatCast.{0} NNReal
                          (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                            (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                              (@Semiring.toNonAssocSemiring.{0} NNReal
                                (@DivisionSemiring.toSemiring.{0} NNReal
                                  (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))
                        (Mathlib.Meta.NormNum.instAtLeastTwo (nat_lit 0)))))
                  (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)))
                (@LE.le.{0} NNReal
                  (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
                  (@OfNat.ofNat.{0} NNReal (nat_lit 0)
                    (@Zero.toOfNat0.{0} NNReal
                      (@MulZeroClass.toZero.{0} NNReal
                        (@NonUnitalNonAssocSemiring.toMulZeroClass.{0} NNReal
                          (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                            (@Semiring.toNonAssocSemiring.{0} NNReal
                              (@DivisionSemiring.toSemiring.{0} NNReal
                                (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                  (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                    (@One.toOfNat1.{0} NNReal
                      (@AddMonoidWithOne.toOne.{0} NNReal
                        (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                          (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                            (@Semiring.toNonAssocSemiring.{0} NNReal
                              (@DivisionSemiring.toSemiring.{0} NNReal
                                (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield)))))))))
                (@congrFun'.{1, 1} NNReal Prop
                  (@LE.le.{0} NNReal
                    (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
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
                  (@LE.le.{0} NNReal
                    (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
                    (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal
                      (@instHDiv.{0} NNReal
                        (@DivInvMonoid.toDiv.{0} NNReal
                          (@GroupWithZero.toDivInvMonoid.{0} NNReal
                            (@DivisionSemiring.toGroupWithZero.{0} NNReal
                              (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield)))))
                      (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                        (@One.toOfNat1.{0} NNReal
                          (@AddMonoidWithOne.toOne.{0} NNReal
                            (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                              (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                (@Semiring.toNonAssocSemiring.{0} NNReal
                                  (@DivisionSemiring.toSemiring.{0} NNReal
                                    (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                      (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                        (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                          (@AddMonoidWithOne.toNatCast.{0} NNReal
                            (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                              (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                (@Semiring.toNonAssocSemiring.{0} NNReal
                                  (@DivisionSemiring.toSemiring.{0} NNReal
                                    (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))
                          (Mathlib.Meta.NormNum.instAtLeastTwo (nat_lit 0))))))
                  (@congrArg.{1, 1} NNReal (NNReal → Prop)
                    (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal (@instHDiv.{0} NNReal NNReal.instDiv)
                      (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
                      (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                        (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                          (@AddMonoidWithOne.toNatCast.{0} NNReal
                            (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                              (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                          (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                            (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))
                    (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal
                      (@instHDiv.{0} NNReal
                        (@DivInvMonoid.toDiv.{0} NNReal
                          (@GroupWithZero.toDivInvMonoid.{0} NNReal
                            (@DivisionSemiring.toGroupWithZero.{0} NNReal
                              (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield)))))
                      (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                        (@One.toOfNat1.{0} NNReal
                          (@AddMonoidWithOne.toOne.{0} NNReal
                            (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                              (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                (@Semiring.toNonAssocSemiring.{0} NNReal
                                  (@DivisionSemiring.toSemiring.{0} NNReal
                                    (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                      (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                        (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                          (@AddMonoidWithOne.toNatCast.{0} NNReal
                            (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                              (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                (@Semiring.toNonAssocSemiring.{0} NNReal
                                  (@DivisionSemiring.toSemiring.{0} NNReal
                                    (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))
                          (Mathlib.Meta.NormNum.instAtLeastTwo (nat_lit 0)))))
                    (@LE.le.{0} NNReal
                      (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal)))
                    (@Mathlib.Meta.NormNum.IsNNRat.to_eq.{0} NNReal
                      (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield) (nat_lit 1) (nat_lit 2)
                      (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal (@instHDiv.{0} NNReal NNReal.instDiv)
                        (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
                        (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                          (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                            (@AddMonoidWithOne.toNatCast.{0} NNReal
                              (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                  (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                            (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                              (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))
                      (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                        (@One.toOfNat1.{0} NNReal
                          (@AddMonoidWithOne.toOne.{0} NNReal
                            (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                              (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                (@Semiring.toNonAssocSemiring.{0} NNReal
                                  (@DivisionSemiring.toSemiring.{0} NNReal
                                    (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                      (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                        (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                          (@AddMonoidWithOne.toNatCast.{0} NNReal
                            (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                              (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                (@Semiring.toNonAssocSemiring.{0} NNReal
                                  (@DivisionSemiring.toSemiring.{0} NNReal
                                    (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))
                          (Mathlib.Meta.NormNum.instAtLeastTwo (nat_lit 0))))
                      (@Mathlib.Meta.NormNum.isNNRat_div.{0} NNReal
                        (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield)
                        (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
                        (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                          (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                            (@AddMonoidWithOne.toNatCast.{0} NNReal
                              (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                  (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                            (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                              (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))
                        (nat_lit 1) (nat_lit 2)
                        (@Mathlib.Meta.NormNum.isNNRat_mul.{0} NNReal
                          (@DivisionSemiring.toSemiring.{0} NNReal
                            (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))
                          (@HMul.hMul.{0, 0, 0} NNReal NNReal NNReal
                            (@instHMul.{0} NNReal
                              (@Distrib.toMul.{0} NNReal
                                (@NonUnitalNonAssocSemiring.toDistrib.{0} NNReal
                                  (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                                    (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))))
                          (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
                          (@Inv.inv.{0} NNReal
                            (@InvOneClass.toInv.{0} NNReal
                              (@DivInvOneMonoid.toInvOneClass.{0} NNReal
                                (@DivisionMonoid.toDivInvOneMonoid.{0} NNReal
                                  (@GroupWithZero.toDivisionMonoid.{0} NNReal
                                    (@DivisionSemiring.toGroupWithZero.{0} NNReal
                                      (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))
                            (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                              (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                                (@AddMonoidWithOne.toNatCast.{0} NNReal
                                  (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                    (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                      (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                                (@Nat.instAtLeastTwoHAddOfNat
                                  (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                                  (@Nat.instNeZeroSucc
                                    (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))
                          (nat_lit 1) (nat_lit 1) (nat_lit 1) (nat_lit 1) (nat_lit 2) (nat_lit 2) (nat_lit 1)
                          (@Eq.refl.{1} ((a a : NNReal) → NNReal)
                            (@HMul.hMul.{0, 0, 0} NNReal NNReal NNReal
                              (@instHMul.{0} NNReal
                                (@Distrib.toMul.{0} NNReal
                                  (@NonUnitalNonAssocSemiring.toDistrib.{0} NNReal
                                    (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                                      (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal)))))))
                          (@Mathlib.Meta.NormNum.IsNat.to_isNNRat.{0} NNReal
                            (@DivisionSemiring.toSemiring.{0} NNReal
                              (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))
                            (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)) (nat_lit 1)
                            (@Mathlib.Meta.NormNum.isNat_ofNat.{0} NNReal
                              (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                  (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal)))
                              (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)) (nat_lit 1)
                              (@Nat.cast_one.{0} NNReal
                                (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                  (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                    (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))))
                          (@Mathlib.Meta.NormNum.isNNRat_inv_pos.{0} NNReal
                            (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield)
                            (@IsStrictOrderedRing.toCharZero.{0} NNReal instSemiringNNReal instPartialOrderNNReal
                              NNReal.instIsStrictOrderedRing)
                            (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                              (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                                (@AddMonoidWithOne.toNatCast.{0} NNReal
                                  (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                    (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                      (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                                (@Nat.instAtLeastTwoHAddOfNat
                                  (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                                  (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))
                            (nat_lit 1) (nat_lit 1)
                            (@Mathlib.Meta.NormNum.IsNat.to_isNNRat.{0} NNReal
                              (@DivisionSemiring.toSemiring.{0} NNReal
                                (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))
                              (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                                (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                                  (@AddMonoidWithOne.toNatCast.{0} NNReal
                                    (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                      (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                        (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                                  (@Nat.instAtLeastTwoHAddOfNat
                                    (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                                    (@Nat.instNeZeroSucc
                                      (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))
                              (nat_lit 2)
                              (@Mathlib.Meta.NormNum.isNat_ofNat.{0} NNReal
                                (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                  (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                    (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal)))
                                (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                                  (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                                    (@AddMonoidWithOne.toNatCast.{0} NNReal
                                      (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                        (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                          (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                                    (@Nat.instAtLeastTwoHAddOfNat
                                      (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                                      (@Nat.instNeZeroSucc
                                        (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))
                                (nat_lit 2)
                                (@Eq.refl.{1} NNReal
                                  (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                                    (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                                      (@AddMonoidWithOne.toNatCast.{0} NNReal
                                        (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                          (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                            (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                                      (Mathlib.Meta.NormNum.instAtLeastTwo (nat_lit 0))))))))
                          (@Eq.refl.{1} Nat (Nat.mul (nat_lit 1) (nat_lit 1))) (@Eq.refl.{1} Nat (nat_lit 2))))
                      (@Nat.cast_one.{0} NNReal
                        (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                          (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                            (@Semiring.toNonAssocSemiring.{0} NNReal
                              (@DivisionSemiring.toSemiring.{0} NNReal
                                (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))
                      (@Eq.refl.{1} NNReal
                        (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                          (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                            (@AddMonoidWithOne.toNatCast.{0} NNReal
                              (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                  (@Semiring.toNonAssocSemiring.{0} NNReal
                                    (@DivisionSemiring.toSemiring.{0} NNReal
                                      (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))
                            (Mathlib.Meta.NormNum.instAtLeastTwo (nat_lit 0)))))))
                  (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)))
                (@half_le_self_iff._simp_1.{0} NNReal NNReal.instSemifield instPartialOrderNNReal
                  (@PosMulReflectLE.toPosMulReflectLT.{0} NNReal
                    (@NonUnitalNonAssocSemiring.toMulZeroClass.{0} NNReal
                      (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                        (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal)))
                    instPartialOrderNNReal
                    (@PosMulStrictMono.toPosMulReflectLE.{0} NNReal
                      (@MulZeroClass.toMul.{0} NNReal
                        (@NonUnitalNonAssocSemiring.toMulZeroClass.{0} NNReal
                          (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                            (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                      (@MulZeroClass.toZero.{0} NNReal
                        (@NonUnitalNonAssocSemiring.toMulZeroClass.{0} NNReal
                          (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                            (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                      NNReal.instLinearOrder
                      (@LinearOrderedCommMonoidWithZero.toPosMulStrictMono.{0} NNReal
                        (@LinearOrderedCommGroupWithZero.toLinearOrderedCommMonoidWithZero.{0} NNReal
                          NNReal.instLinearOrderedCommGroupWithZero))))
                  (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                    (@One.toOfNat1.{0} NNReal
                      (@AddMonoidWithOne.toOne.{0} NNReal
                        (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                          (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                            (@Semiring.toNonAssocSemiring.{0} NNReal
                              (@DivisionSemiring.toSemiring.{0} NNReal
                                (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                  NNReal.instIsStrictOrderedRing))
              (@eq_true
                (@LE.le.{0} NNReal
                  (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
                  (@OfNat.ofNat.{0} NNReal (nat_lit 0)
                    (@Zero.toOfNat0.{0} NNReal
                      (@MulZeroClass.toZero.{0} NNReal
                        (@NonUnitalNonAssocSemiring.toMulZeroClass.{0} NNReal
                          (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                            (@Semiring.toNonAssocSemiring.{0} NNReal
                              (@DivisionSemiring.toSemiring.{0} NNReal
                                (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                  (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                    (@One.toOfNat1.{0} NNReal
                      (@AddMonoidWithOne.toOne.{0} NNReal
                        (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                          (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                            (@Semiring.toNonAssocSemiring.{0} NNReal
                              (@DivisionSemiring.toSemiring.{0} NNReal
                                (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield)))))))))
                (@Mathlib.Meta.NormNum.isNat_le_true.{0} NNReal instSemiringNNReal instPartialOrderNNReal
                  NNReal.instIsOrderedRing
                  (@OfNat.ofNat.{0} NNReal (nat_lit 0)
                    (@Zero.toOfNat0.{0} NNReal
                      (@MulZeroClass.toZero.{0} NNReal
                        (@NonUnitalNonAssocSemiring.toMulZeroClass.{0} NNReal
                          (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                            (@Semiring.toNonAssocSemiring.{0} NNReal
                              (@DivisionSemiring.toSemiring.{0} NNReal
                                (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                  (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                    (@One.toOfNat1.{0} NNReal
                      (@AddMonoidWithOne.toOne.{0} NNReal
                        (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                          (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                            (@Semiring.toNonAssocSemiring.{0} NNReal
                              (@DivisionSemiring.toSemiring.{0} NNReal
                                (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                  (nat_lit 0) (nat_lit 1)
                  (@Mathlib.Meta.NormNum.isNat_ofNat.{0} NNReal
                    (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                      (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                        (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal)))
                    (@OfNat.ofNat.{0} NNReal (nat_lit 0)
                      (@Zero.toOfNat0.{0} NNReal
                        (@MulZeroClass.toZero.{0} NNReal
                          (@NonUnitalNonAssocSemiring.toMulZeroClass.{0} NNReal
                            (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                              (@Semiring.toNonAssocSemiring.{0} NNReal
                                (@DivisionSemiring.toSemiring.{0} NNReal
                                  (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                    (nat_lit 0)
                    (@Nat.cast_zero.{0} NNReal
                      (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                        (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                          (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal)))))
                  (@Mathlib.Meta.NormNum.isNat_ofNat.{0} NNReal
                    (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                      (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                        (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal)))
                    (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                      (@One.toOfNat1.{0} NNReal
                        (@AddMonoidWithOne.toOne.{0} NNReal
                          (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                            (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                              (@Semiring.toNonAssocSemiring.{0} NNReal
                                (@DivisionSemiring.toSemiring.{0} NNReal
                                  (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                    (nat_lit 1)
                    (@Nat.cast_one.{0} NNReal
                      (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                        (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                          (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal)))))
                  (@Eq.refl.{1} Bool Bool.true)))))
          (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
            (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n))
        (@Fin.mk
          (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat)
            (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
              (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n)
            (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))
          n
          (@Decidable.byContradiction
            (@LT.lt.{0} Nat instLTNat n
              (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat)
                (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
                  (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n)
                (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))))
            (Nat.decLt n
              (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat)
                (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
                  (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n)
                (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))))
            fun
              (a :
                Not
                  (@LT.lt.{0} Nat instLTNat n
                    (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat)
                      (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
                        (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n)
                      (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))))) =>
            LocalDef001 n a)))
      (@HMul.hMul.{0, 0, 0} ENNReal ENNReal ENNReal
        (@instHMul.{0} ENNReal
          (@Distrib.toMul.{0} ENNReal
            (@NonUnitalNonAssocSemiring.toDistrib.{0} ENNReal
              (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} ENNReal
                (@Semiring.toNonAssocSemiring.{0} ENNReal
                  (@CommSemiring.toSemiring.{0} ENNReal ENNReal.instCommSemiring))))))
        (@HPow.hPow.{0, 0, 0} ENNReal Nat ENNReal
          (@instHPow.{0, 0} ENNReal Nat
            (@Monoid.toNatPow.{0} ENNReal
              (@MonoidWithZero.toMonoid.{0} ENNReal
                (@Semiring.toMonoidWithZero.{0} ENNReal
                  (@CommSemiring.toSemiring.{0} ENNReal ENNReal.instCommSemiring)))))
          (@Inv.inv.{0} ENNReal ENNReal.instInv
            (@OfNat.ofNat.{0} ENNReal (nat_lit 2)
              (@instOfNatAtLeastTwo.{0} ENNReal (nat_lit 2)
                (@AddMonoidWithOne.toNatCast.{0} ENNReal
                  (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))
                (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                  (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))
          (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
            (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n))
        (@Nat.cast.{0} ENNReal
          (@AddMonoidWithOne.toNatCast.{0} ENNReal
            (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))
          (Nat.choose
            (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
              (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n)
            n))))
  (And
    (∀ (n : Nat),
      @LT.lt.{0} Nat instLTNat (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))) n →
        @Eq.{1} ENNReal
          (@DFunLike.coe.{1, 1, 1} (PMF.{0} Real) Real (fun (x : Real) => ENNReal) (@PMF.instFunLike.{0} Real)
            (LocalDef002 n)
            (@OfNat.ofNat.{0} Real (nat_lit 0) (@Zero.toOfNat0.{0} Real Real.instZero)))
          (@DFunLike.coe.{1, 1, 1}
            (PMF.{0}
              (Fin
                (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat)
                  (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
                    (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n)
                  (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))))
            (Fin
              (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat)
                (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
                  (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n)
                (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))))
            (fun
                (x :
                  Fin
                    (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat)
                      (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
                        (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n)
                      (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))) =>
              ENNReal)
            (@PMF.instFunLike.{0}
              (Fin
                (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat)
                  (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
                    (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n)
                  (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))))
            (PMF.binomial
              (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal (@instHDiv.{0} NNReal NNReal.instDiv)
                (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
                (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                  (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                    (@AddMonoidWithOne.toNatCast.{0} NNReal
                      (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                        (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                          (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                    (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                      (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))
              (@of_eq_true
                (@LE.le.{0} NNReal
                  (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
                  (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal (@instHDiv.{0} NNReal NNReal.instDiv)
                    (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
                    (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                      (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                        (@AddMonoidWithOne.toNatCast.{0} NNReal
                          (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                            (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                              (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                        (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                          (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))
                  (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)))
                (@Eq.trans.{1} Prop
                  (@LE.le.{0} NNReal
                    (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
                    (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal (@instHDiv.{0} NNReal NNReal.instDiv)
                      (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
                      (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                        (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                          (@AddMonoidWithOne.toNatCast.{0} NNReal
                            (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                              (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                          (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                            (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))
                    (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)))
                  (@LE.le.{0} NNReal
                    (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
                    (@OfNat.ofNat.{0} NNReal (nat_lit 0)
                      (@Zero.toOfNat0.{0} NNReal
                        (@MulZeroClass.toZero.{0} NNReal
                          (@NonUnitalNonAssocSemiring.toMulZeroClass.{0} NNReal
                            (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                              (@Semiring.toNonAssocSemiring.{0} NNReal
                                (@DivisionSemiring.toSemiring.{0} NNReal
                                  (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                    (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                      (@One.toOfNat1.{0} NNReal
                        (@AddMonoidWithOne.toOne.{0} NNReal
                          (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                            (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                              (@Semiring.toNonAssocSemiring.{0} NNReal
                                (@DivisionSemiring.toSemiring.{0} NNReal
                                  (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield)))))))))
                  True
                  (@Eq.trans.{1} Prop
                    (@LE.le.{0} NNReal
                      (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
                      (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal (@instHDiv.{0} NNReal NNReal.instDiv)
                        (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
                        (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                          (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                            (@AddMonoidWithOne.toNatCast.{0} NNReal
                              (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                  (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                            (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                              (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))
                      (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)))
                    (@LE.le.{0} NNReal
                      (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
                      (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal
                        (@instHDiv.{0} NNReal
                          (@DivInvMonoid.toDiv.{0} NNReal
                            (@GroupWithZero.toDivInvMonoid.{0} NNReal
                              (@DivisionSemiring.toGroupWithZero.{0} NNReal
                                (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield)))))
                        (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                          (@One.toOfNat1.{0} NNReal
                            (@AddMonoidWithOne.toOne.{0} NNReal
                              (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                  (@Semiring.toNonAssocSemiring.{0} NNReal
                                    (@DivisionSemiring.toSemiring.{0} NNReal
                                      (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                        (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                          (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                            (@AddMonoidWithOne.toNatCast.{0} NNReal
                              (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                  (@Semiring.toNonAssocSemiring.{0} NNReal
                                    (@DivisionSemiring.toSemiring.{0} NNReal
                                      (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))
                            (Mathlib.Meta.NormNum.instAtLeastTwo (nat_lit 0)))))
                      (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)))
                    (@LE.le.{0} NNReal
                      (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
                      (@OfNat.ofNat.{0} NNReal (nat_lit 0)
                        (@Zero.toOfNat0.{0} NNReal
                          (@MulZeroClass.toZero.{0} NNReal
                            (@NonUnitalNonAssocSemiring.toMulZeroClass.{0} NNReal
                              (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                                (@Semiring.toNonAssocSemiring.{0} NNReal
                                  (@DivisionSemiring.toSemiring.{0} NNReal
                                    (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                      (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                        (@One.toOfNat1.{0} NNReal
                          (@AddMonoidWithOne.toOne.{0} NNReal
                            (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                              (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                (@Semiring.toNonAssocSemiring.{0} NNReal
                                  (@DivisionSemiring.toSemiring.{0} NNReal
                                    (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield)))))))))
                    (@congrFun'.{1, 1} NNReal Prop
                      (@LE.le.{0} NNReal
                        (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
                        (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal (@instHDiv.{0} NNReal NNReal.instDiv)
                          (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
                          (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                            (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                              (@AddMonoidWithOne.toNatCast.{0} NNReal
                                (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                  (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                    (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                              (@Nat.instAtLeastTwoHAddOfNat
                                (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                                (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))))
                      (@LE.le.{0} NNReal
                        (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
                        (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal
                          (@instHDiv.{0} NNReal
                            (@DivInvMonoid.toDiv.{0} NNReal
                              (@GroupWithZero.toDivInvMonoid.{0} NNReal
                                (@DivisionSemiring.toGroupWithZero.{0} NNReal
                                  (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield)))))
                          (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                            (@One.toOfNat1.{0} NNReal
                              (@AddMonoidWithOne.toOne.{0} NNReal
                                (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                  (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                    (@Semiring.toNonAssocSemiring.{0} NNReal
                                      (@DivisionSemiring.toSemiring.{0} NNReal
                                        (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                          (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                            (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                              (@AddMonoidWithOne.toNatCast.{0} NNReal
                                (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                  (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                    (@Semiring.toNonAssocSemiring.{0} NNReal
                                      (@DivisionSemiring.toSemiring.{0} NNReal
                                        (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))
                              (Mathlib.Meta.NormNum.instAtLeastTwo (nat_lit 0))))))
                      (@congrArg.{1, 1} NNReal (NNReal → Prop)
                        (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal (@instHDiv.{0} NNReal NNReal.instDiv)
                          (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
                          (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                            (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                              (@AddMonoidWithOne.toNatCast.{0} NNReal
                                (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                  (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                    (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                              (@Nat.instAtLeastTwoHAddOfNat
                                (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                                (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))
                        (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal
                          (@instHDiv.{0} NNReal
                            (@DivInvMonoid.toDiv.{0} NNReal
                              (@GroupWithZero.toDivInvMonoid.{0} NNReal
                                (@DivisionSemiring.toGroupWithZero.{0} NNReal
                                  (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield)))))
                          (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                            (@One.toOfNat1.{0} NNReal
                              (@AddMonoidWithOne.toOne.{0} NNReal
                                (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                  (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                    (@Semiring.toNonAssocSemiring.{0} NNReal
                                      (@DivisionSemiring.toSemiring.{0} NNReal
                                        (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                          (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                            (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                              (@AddMonoidWithOne.toNatCast.{0} NNReal
                                (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                  (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                    (@Semiring.toNonAssocSemiring.{0} NNReal
                                      (@DivisionSemiring.toSemiring.{0} NNReal
                                        (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))
                              (Mathlib.Meta.NormNum.instAtLeastTwo (nat_lit 0)))))
                        (@LE.le.{0} NNReal
                          (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal)))
                        (@Mathlib.Meta.NormNum.IsNNRat.to_eq.{0} NNReal
                          (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield) (nat_lit 1) (nat_lit 2)
                          (@HDiv.hDiv.{0, 0, 0} NNReal NNReal NNReal (@instHDiv.{0} NNReal NNReal.instDiv)
                            (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
                            (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                              (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                                (@AddMonoidWithOne.toNatCast.{0} NNReal
                                  (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                    (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                      (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                                (@Nat.instAtLeastTwoHAddOfNat
                                  (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                                  (@Nat.instNeZeroSucc
                                    (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))
                          (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                            (@One.toOfNat1.{0} NNReal
                              (@AddMonoidWithOne.toOne.{0} NNReal
                                (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                  (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                    (@Semiring.toNonAssocSemiring.{0} NNReal
                                      (@DivisionSemiring.toSemiring.{0} NNReal
                                        (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                          (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                            (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                              (@AddMonoidWithOne.toNatCast.{0} NNReal
                                (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                  (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                    (@Semiring.toNonAssocSemiring.{0} NNReal
                                      (@DivisionSemiring.toSemiring.{0} NNReal
                                        (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))
                              (Mathlib.Meta.NormNum.instAtLeastTwo (nat_lit 0))))
                          (@Mathlib.Meta.NormNum.isNNRat_div.{0} NNReal
                            (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield)
                            (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
                            (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                              (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                                (@AddMonoidWithOne.toNatCast.{0} NNReal
                                  (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                    (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                      (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                                (@Nat.instAtLeastTwoHAddOfNat
                                  (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                                  (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))
                            (nat_lit 1) (nat_lit 2)
                            (@Mathlib.Meta.NormNum.isNNRat_mul.{0} NNReal
                              (@DivisionSemiring.toSemiring.{0} NNReal
                                (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))
                              (@HMul.hMul.{0, 0, 0} NNReal NNReal NNReal
                                (@instHMul.{0} NNReal
                                  (@Distrib.toMul.{0} NNReal
                                    (@NonUnitalNonAssocSemiring.toDistrib.{0} NNReal
                                      (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                                        (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))))
                              (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
                              (@Inv.inv.{0} NNReal
                                (@InvOneClass.toInv.{0} NNReal
                                  (@DivInvOneMonoid.toInvOneClass.{0} NNReal
                                    (@DivisionMonoid.toDivInvOneMonoid.{0} NNReal
                                      (@GroupWithZero.toDivisionMonoid.{0} NNReal
                                        (@DivisionSemiring.toGroupWithZero.{0} NNReal
                                          (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))
                                (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                                  (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                                    (@AddMonoidWithOne.toNatCast.{0} NNReal
                                      (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                        (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                          (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                                    (@Nat.instAtLeastTwoHAddOfNat
                                      (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                                      (@Nat.instNeZeroSucc
                                        (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))
                              (nat_lit 1) (nat_lit 1) (nat_lit 1) (nat_lit 1) (nat_lit 2) (nat_lit 2) (nat_lit 1)
                              (@Eq.refl.{1} ((a a : NNReal) → NNReal)
                                (@HMul.hMul.{0, 0, 0} NNReal NNReal NNReal
                                  (@instHMul.{0} NNReal
                                    (@Distrib.toMul.{0} NNReal
                                      (@NonUnitalNonAssocSemiring.toDistrib.{0} NNReal
                                        (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                                          (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal)))))))
                              (@Mathlib.Meta.NormNum.IsNat.to_isNNRat.{0} NNReal
                                (@DivisionSemiring.toSemiring.{0} NNReal
                                  (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))
                                (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
                                (nat_lit 1)
                                (@Mathlib.Meta.NormNum.isNat_ofNat.{0} NNReal
                                  (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                    (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                      (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal)))
                                  (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal))
                                  (nat_lit 1)
                                  (@Nat.cast_one.{0} NNReal
                                    (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                      (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                        (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))))
                              (@Mathlib.Meta.NormNum.isNNRat_inv_pos.{0} NNReal
                                (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield)
                                (@IsStrictOrderedRing.toCharZero.{0} NNReal instSemiringNNReal instPartialOrderNNReal
                                  NNReal.instIsStrictOrderedRing)
                                (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                                  (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                                    (@AddMonoidWithOne.toNatCast.{0} NNReal
                                      (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                        (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                          (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                                    (@Nat.instAtLeastTwoHAddOfNat
                                      (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                                      (@Nat.instNeZeroSucc
                                        (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))
                                (nat_lit 1) (nat_lit 1)
                                (@Mathlib.Meta.NormNum.IsNat.to_isNNRat.{0} NNReal
                                  (@DivisionSemiring.toSemiring.{0} NNReal
                                    (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))
                                  (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                                    (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                                      (@AddMonoidWithOne.toNatCast.{0} NNReal
                                        (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                          (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                            (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                                      (@Nat.instAtLeastTwoHAddOfNat
                                        (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                                        (@Nat.instNeZeroSucc
                                          (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))
                                  (nat_lit 2)
                                  (@Mathlib.Meta.NormNum.isNat_ofNat.{0} NNReal
                                    (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                      (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                        (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal)))
                                    (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                                      (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                                        (@AddMonoidWithOne.toNatCast.{0} NNReal
                                          (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                            (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                              (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                                        (@Nat.instAtLeastTwoHAddOfNat
                                          (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                                          (@Nat.instNeZeroSucc
                                            (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))
                                    (nat_lit 2)
                                    (@Eq.refl.{1} NNReal
                                      (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                                        (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                                          (@AddMonoidWithOne.toNatCast.{0} NNReal
                                            (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                              (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                                (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                                          (Mathlib.Meta.NormNum.instAtLeastTwo (nat_lit 0))))))))
                              (@Eq.refl.{1} Nat (Nat.mul (nat_lit 1) (nat_lit 1))) (@Eq.refl.{1} Nat (nat_lit 2))))
                          (@Nat.cast_one.{0} NNReal
                            (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                              (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                (@Semiring.toNonAssocSemiring.{0} NNReal
                                  (@DivisionSemiring.toSemiring.{0} NNReal
                                    (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))
                          (@Eq.refl.{1} NNReal
                            (@OfNat.ofNat.{0} NNReal (nat_lit 2)
                              (@instOfNatAtLeastTwo.{0} NNReal (nat_lit 2)
                                (@AddMonoidWithOne.toNatCast.{0} NNReal
                                  (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                    (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                      (@Semiring.toNonAssocSemiring.{0} NNReal
                                        (@DivisionSemiring.toSemiring.{0} NNReal
                                          (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))
                                (Mathlib.Meta.NormNum.instAtLeastTwo (nat_lit 0)))))))
                      (@OfNat.ofNat.{0} NNReal (nat_lit 1) (@One.toOfNat1.{0} NNReal instOneNNReal)))
                    (@half_le_self_iff._simp_1.{0} NNReal NNReal.instSemifield instPartialOrderNNReal
                      (@PosMulReflectLE.toPosMulReflectLT.{0} NNReal
                        (@NonUnitalNonAssocSemiring.toMulZeroClass.{0} NNReal
                          (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                            (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal)))
                        instPartialOrderNNReal
                        (@PosMulStrictMono.toPosMulReflectLE.{0} NNReal
                          (@MulZeroClass.toMul.{0} NNReal
                            (@NonUnitalNonAssocSemiring.toMulZeroClass.{0} NNReal
                              (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                                (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                          (@MulZeroClass.toZero.{0} NNReal
                            (@NonUnitalNonAssocSemiring.toMulZeroClass.{0} NNReal
                              (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                                (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal))))
                          NNReal.instLinearOrder
                          (@LinearOrderedCommMonoidWithZero.toPosMulStrictMono.{0} NNReal
                            (@LinearOrderedCommGroupWithZero.toLinearOrderedCommMonoidWithZero.{0} NNReal
                              NNReal.instLinearOrderedCommGroupWithZero))))
                      (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                        (@One.toOfNat1.{0} NNReal
                          (@AddMonoidWithOne.toOne.{0} NNReal
                            (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                              (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                (@Semiring.toNonAssocSemiring.{0} NNReal
                                  (@DivisionSemiring.toSemiring.{0} NNReal
                                    (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                      NNReal.instIsStrictOrderedRing))
                  (@eq_true
                    (@LE.le.{0} NNReal
                      (@Preorder.toLE.{0} NNReal (@PartialOrder.toPreorder.{0} NNReal instPartialOrderNNReal))
                      (@OfNat.ofNat.{0} NNReal (nat_lit 0)
                        (@Zero.toOfNat0.{0} NNReal
                          (@MulZeroClass.toZero.{0} NNReal
                            (@NonUnitalNonAssocSemiring.toMulZeroClass.{0} NNReal
                              (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                                (@Semiring.toNonAssocSemiring.{0} NNReal
                                  (@DivisionSemiring.toSemiring.{0} NNReal
                                    (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                      (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                        (@One.toOfNat1.{0} NNReal
                          (@AddMonoidWithOne.toOne.{0} NNReal
                            (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                              (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                (@Semiring.toNonAssocSemiring.{0} NNReal
                                  (@DivisionSemiring.toSemiring.{0} NNReal
                                    (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield)))))))))
                    (@Mathlib.Meta.NormNum.isNat_le_true.{0} NNReal instSemiringNNReal instPartialOrderNNReal
                      NNReal.instIsOrderedRing
                      (@OfNat.ofNat.{0} NNReal (nat_lit 0)
                        (@Zero.toOfNat0.{0} NNReal
                          (@MulZeroClass.toZero.{0} NNReal
                            (@NonUnitalNonAssocSemiring.toMulZeroClass.{0} NNReal
                              (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                                (@Semiring.toNonAssocSemiring.{0} NNReal
                                  (@DivisionSemiring.toSemiring.{0} NNReal
                                    (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                      (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                        (@One.toOfNat1.{0} NNReal
                          (@AddMonoidWithOne.toOne.{0} NNReal
                            (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                              (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                (@Semiring.toNonAssocSemiring.{0} NNReal
                                  (@DivisionSemiring.toSemiring.{0} NNReal
                                    (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                      (nat_lit 0) (nat_lit 1)
                      (@Mathlib.Meta.NormNum.isNat_ofNat.{0} NNReal
                        (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                          (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                            (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal)))
                        (@OfNat.ofNat.{0} NNReal (nat_lit 0)
                          (@Zero.toOfNat0.{0} NNReal
                            (@MulZeroClass.toZero.{0} NNReal
                              (@NonUnitalNonAssocSemiring.toMulZeroClass.{0} NNReal
                                (@NonAssocSemiring.toNonUnitalNonAssocSemiring.{0} NNReal
                                  (@Semiring.toNonAssocSemiring.{0} NNReal
                                    (@DivisionSemiring.toSemiring.{0} NNReal
                                      (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                        (nat_lit 0)
                        (@Nat.cast_zero.{0} NNReal
                          (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                            (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                              (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal)))))
                      (@Mathlib.Meta.NormNum.isNat_ofNat.{0} NNReal
                        (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                          (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                            (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal)))
                        (@OfNat.ofNat.{0} NNReal (nat_lit 1)
                          (@One.toOfNat1.{0} NNReal
                            (@AddMonoidWithOne.toOne.{0} NNReal
                              (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                                (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                                  (@Semiring.toNonAssocSemiring.{0} NNReal
                                    (@DivisionSemiring.toSemiring.{0} NNReal
                                      (@Semifield.toDivisionSemiring.{0} NNReal NNReal.instSemifield))))))))
                        (nat_lit 1)
                        (@Nat.cast_one.{0} NNReal
                          (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} NNReal
                            (@NonAssocSemiring.toAddCommMonoidWithOne.{0} NNReal
                              (@Semiring.toNonAssocSemiring.{0} NNReal instSemiringNNReal)))))
                      (@Eq.refl.{1} Bool Bool.true)))))
              (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
                (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n))
            (@Fin.mk
              (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat)
                (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
                  (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n)
                (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1))))
              n
              (@Decidable.byContradiction
                (@LT.lt.{0} Nat instLTNat n
                  (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat)
                    (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
                      (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n)
                    (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))))
                (Nat.decLt n
                  (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat)
                    (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
                      (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n)
                    (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))))
                fun
                  (a :
                    Not
                      (@LT.lt.{0} Nat instLTNat n
                        (@HAdd.hAdd.{0, 0, 0} Nat Nat Nat (@instHAdd.{0} Nat instAddNat)
                          (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
                            (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n)
                          (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))))) =>
                LocalDef001 n a))))
    (@Asymptotics.IsTheta.{0, 0, 0} Nat Real Real Real.norm Real.norm (@Filter.atTop.{0} Nat Nat.instPreorder)
      (fun (n : Nat) =>
        @HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
          (@HPow.hPow.{0, 0, 0} Real Nat Real (@instHPow.{0, 0} Real Nat (@Monoid.toNatPow.{0} Real Real.instMonoid))
            (@Inv.inv.{0} Real Real.instInv
              (@OfNat.ofNat.{0} Real (nat_lit 2)
                (@instOfNatAtLeastTwo.{0} Real (nat_lit 2) Real.instNatCast
                  (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                    (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0))))))))
            (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
              (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n))
          (@Nat.cast.{0} Real Real.instNatCast
            (Nat.choose
              (@HMul.hMul.{0, 0, 0} Nat Nat Nat (@instHMul.{0} Nat instMulNat)
                (@OfNat.ofNat.{0} Nat (nat_lit 2) (instOfNatNat (nat_lit 2))) n)
              n)))
      fun (n : Nat) =>
      @HDiv.hDiv.{0, 0, 0} Real Real Real (@instHDiv.{0} Real (@DivInvMonoid.toDiv.{0} Real Real.instDivInvMonoid))
        (@OfNat.ofNat.{0} Real (nat_lit 1) (@One.toOfNat1.{0} Real Real.instOne))
        (Real.sqrt
          (@HMul.hMul.{0, 0, 0} Real Real Real (@instHMul.{0} Real Real.instMul)
            (@OfNat.ofNat.{0} Real (nat_lit 2)
              (@instOfNatAtLeastTwo.{0} Real (nat_lit 2) Real.instNatCast
                (@Nat.instAtLeastTwoHAddOfNat (@OfNat.ofNat.{0} Nat (nat_lit 1) (instOfNatNat (nat_lit 1)))
                  (@Nat.instNeZeroSucc (@OfNat.ofNat.{0} Nat (nat_lit 0) (instOfNatNat (nat_lit 0)))))))
            (@Nat.cast.{0} Real Real.instNatCast n)))))
```

## Complete semantic dependency inventory

Return exactly one coverage record for every dependency ID, in order.

### D001: `LocalDef001`

- Role: `local`
- Owner module: `LocalImport001`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `564ce969332b91d10fea8385adc5f365d8efe8affa12a16bf69ef07c0f8d781f`

Type:

```lean
∀ (n : Nat), Not (instLTNat.lt n (instHAdd.hAdd (instHMul.hMul 2 n) 1)) → False
```

### D002: `LocalDef002`

- Role: `local`
- Owner module: `LocalImport002`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `107834e58805f137911598590aafa9dc52e6ccd7ffb336c53fb56c88a7b3a315`

Type:

```lean
Nat → PMF Real
```

Definition body (one-level semantic boundary):

```lean
fun n =>
  PMF.map (fun k => (fun x => instHDiv.hDiv x (instHDiv.hDiv n.cast 2).sqrt) (instHSub.hSub k.val.cast n.cast))
    (PMF.binomial (1 / 2) LocalDef004
      (instHMul.hMul 2 n))
```

### D003: `LocalDef003`

- Role: `local`
- Owner module: `LocalImport002`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `7d69fae24541874c00ac57c605b53602e61e3a1a9c85edf2667ea799f591a058`

Type:

```lean
(instHAdd.hAdd 1 1).AtLeastTwo
```

### D004: `LocalDef004`

- Role: `local`
- Owner module: `LocalImport002`
- Declaration kind: `theorem`
- Distance from target type: `2`
- Semantic SHA-256: `9e1e585b48b115a03500a5cb3352e5b38bb2c5f816322932d7413fb8b48f632f`

Type:

```lean
instPartialOrderNNReal.le (1 / 2) 1
```

### D005: `AddCommMonoidWithOne.toAddMonoidWithOne`

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

### D006: `AddMonoidWithOne.toNatCast`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6b956e88ee642e7533983b76ff8087f4537eea04f025165ce1fa45dc80e795a2`

Type:

```lean
{R : Type u_2} → [self : AddMonoidWithOne R] → NatCast R
```

Definition body (one-level semantic boundary):

```lean
fun R [self : AddMonoidWithOne R] => self.1
```

### D007: `AddMonoidWithOne.toOne`

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

### D008: `And`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `37ecdc009aa953e3d4924ef10e6a1fb591f6af993cd344fd5a6b5321466517c9`

Type:

```lean
Prop → Prop → Prop
```

### D009: `Asymptotics.IsTheta`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Asymptotics.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `73670c2485eac78fa50ecb4694cff6944fbba667a65692e99e0ea5bf68773051`

Type:

```lean
{α : Type u_1} → {E : Type u_3} → {F : Type u_4} → [Norm E] → [Norm F] → Filter α → (α → E) → (α → F) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun {α} {E} {F} [Norm E] [Norm F] l f g => And (Asymptotics.IsBigO l f g) (Asymptotics.IsBigO l g f)
```

### D010: `Bool`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `e95da6be35714acbe5505fa5c6ba913c979305a6d87f38e35096664b551ce829`

Type:

```lean
Type
```

### D011: `Bool.true`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `constructor`
- Distance from target type: `1`
- Semantic SHA-256: `97e763ea95d8452117cf5762fd67acddd549677f08ccfa348c4bf23db7eaa9d8`

Type:

```lean
Bool
```

### D012: `CommSemiring.toSemiring`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `bcda2e78d6b7602d359ab954baf5c3bd0f6b2503b3ec9a72e1a21a48b9d18d89`

Type:

```lean
{R : Type u} → [self : CommSemiring R] → Semiring R
```

Definition body (one-level semantic boundary):

```lean
fun R [self : CommSemiring R] => self.1
```

### D013: `DFunLike.coe`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.FunLike.Basic`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `9db5c150b3c86d10b50e19602d0c0af9e5012dfe5f13b0d7b57925729f2478f0`

Type:

```lean
{F : Sort u_1} → {α : outParam (Sort u_2)} → {β : outParam (α → Sort u_3)} → [self : DFunLike F α β] → F → (a : α) → β a
```

Definition body (one-level semantic boundary):

```lean
fun F {α} {β} [self : DFunLike F α β] => self.1
```

### D014: `Decidable.byContradiction`

- Role: `external-frontier`
- Owner module: `Init.Core`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `92a6e6abc3b45d747ee564b6255c4bcb89b679a91755b840fcf37328b44d4360`

Type:

```lean
∀ {p : Prop} [dec : Decidable p], (Not p → False) → p
```

### D015: `Distrib.toMul`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `1d05ddf657021fb5615c5054f46b4863aec4ca856ca48fbb75add25e1f0fe06f`

Type:

```lean
{R : Type u_1} → [self : Distrib R] → Mul R
```

Definition body (one-level semantic boundary):

```lean
fun R [self : Distrib R] => self.1
```

### D016: `DivInvMonoid.toDiv`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `cf21e4a4c962ee0db8a97bd649d849a798a693692bf09312f7855ddcbeb125ea`

Type:

```lean
{G : Type u} → [self : DivInvMonoid G] → Div G
```

Definition body (one-level semantic boundary):

```lean
fun G [self : DivInvMonoid G] => self.3
```

### D017: `DivInvOneMonoid.toInvOneClass`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `aaec1d49b9a8972888606591fea3cba48579d726afcf8e6d1f3a8583925c6e10`

Type:

```lean
{G : Type u_2} → [self : DivInvOneMonoid G] → InvOneClass G
```

Definition body (one-level semantic boundary):

```lean
fun G self => { toOne := self.toOne, toInv := self.toInv, inv_one := ⋯ }
```

### D018: `DivisionMonoid.toDivInvOneMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f603f01beb2a1986a93577920871186532559b8a6298e034b733b2980a08f5f3`

Type:

```lean
{α : Type u_1} → [DivisionMonoid α] → DivInvOneMonoid α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : DivisionMonoid α] =>
  let __src := inst.toDivInvMonoid;
  { toDivInvMonoid := __src, inv_one := ⋯ }
```

### D019: `DivisionSemiring.toGroupWithZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Field.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `a52dad8e67c4d0be4eb4eefa94c723afe9203f4246d76d8dff8eff9c866e5e6d`

Type:

```lean
{K : Type u_2} → [self : DivisionSemiring K] → GroupWithZero K
```

Definition body (one-level semantic boundary):

```lean
fun K self =>
  { toMul := self.toMul, mul_assoc := ⋯, toOne := self.toOne, one_mul := ⋯, mul_one := ⋯, npow := self.npow,
    npow_zero := ⋯, npow_succ := ⋯, toZero := self.toZero, zero_mul := ⋯, mul_zero := ⋯, toInv := self.toInv,
    toDiv := self.toDiv, div_eq_mul_inv := ⋯, zpow := self.zpow, zpow_zero' := ⋯, zpow_succ' := ⋯, zpow_neg' := ⋯,
    toNontrivial := ⋯, inv_zero := ⋯, mul_inv_cancel := ⋯ }
```

### D020: `DivisionSemiring.toSemiring`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Field.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `587c80a71f9aa5749b5d6c35c97cdae1067fa669257c865951843b747c511934`

Type:

```lean
{K : Type u_2} → [self : DivisionSemiring K] → Semiring K
```

Definition body (one-level semantic boundary):

```lean
fun K [self : DivisionSemiring K] => self.1
```

### D021: `ENNReal`

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

### D022: `ENNReal.instCommSemiring`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `0641453ddd31d2b679655d5c2b4fc302ecf7b88a815424716c8ac4e525cf14b8`

Type:

```lean
CommSemiring ENNReal
```

Definition body (one-level semantic boundary):

```lean
inferInstanceAs (CommSemiring (WithTop NNReal))
```

### D023: `ENNReal.instInv`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.ENNReal.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8e565e604918ebd1133a3f923cfd0a09c0c0d627ddb4d721194db0d2dfcff63f`

Type:

```lean
Inv ENNReal
```

Definition body (one-level semantic boundary):

```lean
{
  inv := fun a =>
    ConditionallyCompleteLattice.toConditionallyCompletePartialOrder.toConditionallyCompletePartialOrderInf.sInf
      (setOf fun b => ENNReal.instPartialOrder.le 1 (instHMul.hMul a b)) }
```

### D024: `Eq`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `63e9afa87e04d13393a2fe09e8e76489d96be3982734b4b40a52fc6ebea863d7`

Type:

```lean
{α : Sort u_1} → α → α → Prop
```

### D025: `Eq.refl`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `constructor`
- Distance from target type: `1`
- Semantic SHA-256: `62d4020b7012db70e44624c7d64dd267524e7e75e4b869680e0c95d2231c85d1`

Type:

```lean
∀ {α : Sort u_1} (a : α), Eq a a
```

### D026: `Eq.trans`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `b3ec77e4c762590cf19d2ffe139a49b822c21a89ea0cfc80e65389ec5d602168`

Type:

```lean
∀ {α : Sort u} {a b c : α}, Eq a b → Eq b c → Eq a c
```

### D027: `Filter.atTop`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Filter.AtTopBot.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f743a11da6fe9e156755f41ec35f4d61b87ca4af4575ede456b477a74caa45f3`

Type:

```lean
{α : Type u_3} → [Preorder α] → Filter α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [Preorder α] => iInf fun a => Filter.principal (Set.Ici a)
```

### D028: `Fin`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `59788903be5da78a88e4dc3844df38effdaabdfa82bb364602790d2271da7fda`

Type:

```lean
Nat → Type
```

### D029: `Fin.mk`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `constructor`
- Distance from target type: `1`
- Semantic SHA-256: `2fb605c17aa879bf453f735ede02a7306496f461d34549bf61cb6c85662ce182`

Type:

```lean
{n : Nat} → (val : Nat) → instLTNat.lt val n → Fin n
```

### D030: `GroupWithZero.toDivInvMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.GroupWithZero.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6a595375c8f1e40964d5f3eb28600b475a2aa8e42b16600c8200f3ad399bc2ef`

Type:

```lean
{G₀ : Type u} → [self : GroupWithZero G₀] → DivInvMonoid G₀
```

Definition body (one-level semantic boundary):

```lean
fun G₀ self =>
  { toMonoid := self.toMonoid, toInv := self.toInv, toDiv := self.toDiv, div_eq_mul_inv := ⋯, zpow := self.zpow,
    zpow_zero' := ⋯, zpow_succ' := ⋯, zpow_neg' := ⋯ }
```

### D031: `GroupWithZero.toDivisionMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.GroupWithZero.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `09901b57fb077f82ae3b5c274242e645c427a8ba9b744ee8da5f62ad569f6654`

Type:

```lean
{G₀ : Type u_2} → [GroupWithZero G₀] → DivisionMonoid G₀
```

Definition body (one-level semantic boundary):

```lean
fun {G₀} [inst : GroupWithZero G₀] =>
  let __src := inst;
  { toMonoid := __src.toMonoid, toInv := inst.toDivInvMonoid.toInv, toDiv := __src.toDiv, div_eq_mul_inv := ⋯,
    zpow := __src.zpow, zpow_zero' := ⋯, zpow_succ' := ⋯, zpow_neg' := ⋯, inv_inv := ⋯, mul_inv_rev := ⋯,
    inv_eq_of_mul := ⋯ }
```

### D032: `HAdd.hAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `e0bf2a92addd6ea713343e4ef69f67e4e1155781d08f46957b9f71412d865f59`

Type:

```lean
{α : Type u} → {β : Type v} → {γ : outParam (Type w)} → [self : HAdd α β γ] → α → β → γ
```

Definition body (one-level semantic boundary):

```lean
fun α β {γ} [self : HAdd α β γ] => self.1
```

### D033: `HDiv.hDiv`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `10d75d9f08ad8c923109392866fba5fb3645de144bc824cefdd353658fe9f06b`

Type:

```lean
{α : Type u} → {β : Type v} → {γ : outParam (Type w)} → [self : HDiv α β γ] → α → β → γ
```

Definition body (one-level semantic boundary):

```lean
fun α β {γ} [self : HDiv α β γ] => self.1
```

### D034: `HMul.hMul`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `4e00447a4a8ef4c2ce13e307c56a1fbcd7fa8c732fe039a452b42477a50df2c6`

Type:

```lean
{α : Type u} → {β : Type v} → {γ : outParam (Type w)} → [self : HMul α β γ] → α → β → γ
```

Definition body (one-level semantic boundary):

```lean
fun α β {γ} [self : HMul α β γ] => self.1
```

### D035: `HPow.hPow`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6196b8cbb884c4f39841ba74b23d75f3c753fe0d044cc402bd6e4e3bd59d5cb8`

Type:

```lean
{α : Type u} → {β : Type v} → {γ : outParam (Type w)} → [self : HPow α β γ] → α → β → γ
```

Definition body (one-level semantic boundary):

```lean
fun α β {γ} [self : HPow α β γ] => self.1
```

### D036: `Inv.inv`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `c3aea3c6e2edd31a7b2cf071814315808ef7d84fd01d8c9b719313846ebca438`

Type:

```lean
{α : Type u} → [self : Inv α] → α → α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : Inv α] => self.1
```

### D037: `InvOneClass.toInv`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `93f337c8416c0ef00fb264e597e83153fa50df5053878acbd62dadd64e647bc2`

Type:

```lean
{G : Type u_2} → [self : InvOneClass G] → Inv G
```

Definition body (one-level semantic boundary):

```lean
fun G [self : InvOneClass G] => self.2
```

### D038: `IsStrictOrderedRing.toCharZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Order.Ring.Defs`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `f2b8646fbe5d856f35ea950eb3719351d77ba74adf54e64ca17a256b1e6e2c8e`

Type:

```lean
∀ {R : Type u} [inst : Semiring R] [inst_1 : PartialOrder R] [IsStrictOrderedRing R], CharZero R
```

### D039: `LE.le`

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

### D040: `LT.lt`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `fd5699899f1a49c91982cb363d3a71557ab1b53ee772cd777c9ee7717abc2009`

Type:

```lean
{α : Type u} → [self : LT α] → α → α → Prop
```

Definition body (one-level semantic boundary):

```lean
fun α [self : LT α] => self.1
```

### D041: `LinearOrderedCommGroupWithZero.toLinearOrderedCommMonoidWithZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Order.GroupWithZero.Canonical`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `8c49e61915846190e12db1fb529ede37cb8a9cbe39fcf38aac6e262347ff5121`

Type:

```lean
{α : Type u_3} → [self : LinearOrderedCommGroupWithZero α] → LinearOrderedCommMonoidWithZero α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : LinearOrderedCommGroupWithZero α] => self.1
```

### D042: `LinearOrderedCommMonoidWithZero.toPosMulStrictMono`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Order.GroupWithZero.Canonical`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `eb3e538a4d8efbe4f768bd0aa29d6cfffc4143ace636e89e303f9443d56f00f9`

Type:

```lean
∀ {α : Type u_3} [self : LinearOrderedCommMonoidWithZero α], PosMulStrictMono α
```

### D043: `Mathlib.Meta.NormNum.IsNNRat.to_eq`

- Role: `external-frontier`
- Owner module: `Mathlib.Tactic.NormNum.Result`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `5bda98ee42c22c390ef0ce66a4417f2f0ee73f6c5fde4213d23f10173226a8e2`

Type:

```lean
∀ {α : Type u_1} [inst : DivisionSemiring α] {n d : Nat} {a n' d' : α},
  Mathlib.Meta.NormNum.IsNNRat a n d → Eq n.cast n' → Eq d.cast d' → Eq a (instHDiv.hDiv n' d')
```

### D044: `Mathlib.Meta.NormNum.IsNat.to_isNNRat`

- Role: `external-frontier`
- Owner module: `Mathlib.Tactic.NormNum.Result`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `2c24a2be55ab73810d01d2350658fa492907b9bea99ef3b8d4c370019cc762e1`

Type:

```lean
∀ {α : Type u_1} [inst : Semiring α] {a : α} {n : Nat},
  Mathlib.Meta.NormNum.IsNat a n → Mathlib.Meta.NormNum.IsNNRat a n 1
```

### D045: `Mathlib.Meta.NormNum.instAtLeastTwo`

- Role: `external-frontier`
- Owner module: `Mathlib.Tactic.NormNum.Result`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `0f6b188dfe62ded4240dc15098b44e90c892835e0a2fa013b5a68411d8753309`

Type:

```lean
∀ (n : Nat), (instHAdd.hAdd n 2).AtLeastTwo
```

### D046: `Mathlib.Meta.NormNum.isNNRat_div`

- Role: `external-frontier`
- Owner module: `Mathlib.Tactic.NormNum.Basic`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `cf87b9f09152f613274f1aac1fd82c23be292831f00ec01af41c97f17db4dd94`

Type:

```lean
∀ {α : Type u} [inst : DivisionSemiring α] {a b : α} {cn cd : Nat},
  Mathlib.Meta.NormNum.IsNNRat (instHMul.hMul a (DivisionMonoid.toDivInvOneMonoid.toInvOneClass.inv b)) cn cd →
    Mathlib.Meta.NormNum.IsNNRat (instHDiv.hDiv a b) cn cd
```

### D047: `Mathlib.Meta.NormNum.isNNRat_inv_pos`

- Role: `external-frontier`
- Owner module: `Mathlib.Tactic.NormNum.Inv`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `83c66441046cca27038b57ade957953cef285f67a26b370aee6b13730e8e94e7`

Type:

```lean
∀ {α : Type u_1} [inst : DivisionSemiring α] [CharZero α] {a : α} {n d : Nat},
  Mathlib.Meta.NormNum.IsNNRat a n.succ d →
    Mathlib.Meta.NormNum.IsNNRat (DivisionMonoid.toDivInvOneMonoid.toInvOneClass.inv a) d n.succ
```

### D048: `Mathlib.Meta.NormNum.isNNRat_mul`

- Role: `external-frontier`
- Owner module: `Mathlib.Tactic.NormNum.Basic`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `7b86772e7a821d1da2a4345534b7603a63ae7b25c52168c36537b6df7e6b1b9c`

Type:

```lean
∀ {α : Type u_1} [inst : Semiring α] {f : α → α → α} {a b : α} {na nb nc da db dc k : Nat},
  Eq f instHMul.hMul →
    Mathlib.Meta.NormNum.IsNNRat a na da →
      Mathlib.Meta.NormNum.IsNNRat b nb db →
        Eq (na.mul nb) (k.mul nc) → Eq (da.mul db) (k.mul dc) → Mathlib.Meta.NormNum.IsNNRat (f a b) nc dc
```

### D049: `Mathlib.Meta.NormNum.isNat_le_true`

- Role: `external-frontier`
- Owner module: `Mathlib.Tactic.NormNum.Ineq`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `f3cf07ea55e05675ca1631013dbb44f1d485fb302f29dc2dfea0263bd317872e`

Type:

```lean
∀ {α : Type u_1} [inst : Semiring α] [inst_1 : PartialOrder α] [IsOrderedRing α] {a b : α} {a' b' : Nat},
  Mathlib.Meta.NormNum.IsNat a a' → Mathlib.Meta.NormNum.IsNat b b' → Eq (a'.ble b') Bool.true → inst_1.le a b
```

### D050: `Mathlib.Meta.NormNum.isNat_ofNat`

- Role: `external-frontier`
- Owner module: `Mathlib.Tactic.NormNum.Basic`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `c1f1109f4aed0e99ffe3ed347f201b27bd47ec0dcfbefd512599322d19d2f0f3`

Type:

```lean
∀ (α : Type u) [inst : AddMonoidWithOne α] {a : α} {n : Nat}, Eq n.cast a → Mathlib.Meta.NormNum.IsNat a n
```

### D051: `Monoid.toNatPow`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5b7373fe2de26535c1cdbf1b953ce34faf30f68aac8abd83ade2e78e6ec65b8a`

Type:

```lean
{M : Type u_2} → [Monoid M] → Pow M Nat
```

Definition body (one-level semantic boundary):

```lean
fun {M} [inst : Monoid M] => { pow := fun x n => inst.npow n x }
```

### D052: `MonoidWithZero.toMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.GroupWithZero.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `c0f91ccdc0415c148969849b7a83ce67d87cf4c402704186fa19f6313928d90f`

Type:

```lean
{M₀ : Type u} → [self : MonoidWithZero M₀] → Monoid M₀
```

Definition body (one-level semantic boundary):

```lean
fun M₀ [self : MonoidWithZero M₀] => self.1
```

### D053: `MulZeroClass.toMul`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.GroupWithZero.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `d1dfefedfc07f45cc2998e473dfa449e8c6a00f67ca9805a03cfab7e51fded55`

Type:

```lean
{M₀ : Type u} → [self : MulZeroClass M₀] → Mul M₀
```

Definition body (one-level semantic boundary):

```lean
fun M₀ [self : MulZeroClass M₀] => self.1
```

### D054: `MulZeroClass.toZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.GroupWithZero.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `a3f3ff8a43fb45098d9029196fe0a081ace6a8cc0c485317c7c17e719ec29c60`

Type:

```lean
{M₀ : Type u} → [self : MulZeroClass M₀] → Zero M₀
```

Definition body (one-level semantic boundary):

```lean
fun M₀ [self : MulZeroClass M₀] => self.2
```

### D055: `NNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `490ebc1f72b3ced8506e1bcbd0016d4c351adf097644509fd1dd17a93c4e950f`

Type:

```lean
Type
```

Definition body (one-level semantic boundary):

```lean
Subtype fun r => Real.instLE.le 0 r
```

### D056: `NNReal.instDiv`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `db7c02aebe99430b40db2791a53ab6674123591ebf2c7ce532fb26b074337486`

Type:

```lean
Div NNReal
```

Definition body (one-level semantic boundary):

```lean
{ div := fun x y => ⟨instHDiv.hDiv x.toReal y.toReal, ⋯⟩ }
```

### D057: `NNReal.instIsOrderedRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `bfa8c9affa219bf8c31d84eeb4c5b19560ec409113a479e576a0dfb70d5fe0bc`

Type:

```lean
IsOrderedRing NNReal
```

### D058: `NNReal.instIsStrictOrderedRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `e70d43d954cdcde791655644229fa9a71e32d1092cc5575c3b24fe532f92476f`

Type:

```lean
IsStrictOrderedRing NNReal
```

### D059: `NNReal.instLinearOrder`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8b0e1aca84236ea247672769396e0e1cb720420c2205c5e34b564383a0c92c98`

Type:

```lean
LinearOrder NNReal
```

Definition body (one-level semantic boundary):

```lean
Subtype.instLinearOrder fun r => Real.instLE.le 0 r
```

### D060: `NNReal.instLinearOrderedCommGroupWithZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f64074d8189a20e7270b5e271f21ab8565b3072f4d6c42f6e8e43871d4f69495`

Type:

```lean
LinearOrderedCommGroupWithZero NNReal
```

Definition body (one-level semantic boundary):

```lean
Nonneg.linearOrderedCommGroupWithZero
```

### D061: `NNReal.instSemifield`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f2efce710ae52b1b02da5b43823642eeba2536124316c9c1559f881c59540881`

Type:

```lean
Semifield NNReal
```

Definition body (one-level semantic boundary):

```lean
{ toCommSemiring := instCommSemiringNNReal, toInv := NNReal.instInv, toDiv := NNReal.instDiv,
  div_eq_mul_inv := NNReal.instSemifield._proof_9,
  zpow :=
    (Function.Injective.commGroupWithZero NNReal.toReal NNReal.instSemifield._proof_1 NNReal.instSemifield._proof_2
        NNReal.instSemifield._proof_3 NNReal.instSemifield._proof_4 NNReal.instSemifield._proof_5
        NNReal.instSemifield._proof_6 NNReal.instSemifield._proof_7 NNReal.instSemifield._proof_8).zpow,
  zpow_zero' := NNReal.instSemifield._proof_10, zpow_succ' := NNReal.instSemifield._proof_11,
  zpow_neg' := NNReal.instSemifield._proof_12, toNontrivial := NNReal.instSemifield._proof_13,
  inv_zero := NNReal.instSemifield._proof_14, mul_inv_cancel := NNReal.instSemifield._proof_15,
  toNNRatCast := NNReal.instNNRatCast, nnratCast_def := NNReal.instSemifield._proof_21,
  nnqsmul :=
    (Function.Injective.divisionSemiring NNReal.toReal NNReal.instSemifield._proof_1 NNReal.instSemifield._proof_2
        NNReal.instSemifield._proof_3 NNReal.instSemifield._proof_16 NNReal.instSemifield._proof_4
        NNReal.instSemifield._proof_5 NNReal.instSemifield._proof_6 NNReal.instSemifield._proof_17
        NNReal.instSemifield._proof_18 NNReal.instSemifield._proof_7 NNReal.instSemifield._proof_8
        NNReal.instSemifield._proof_19 NNReal.instSemifield._proof_20).nnqsmul,
  nnqsmul_def := NNReal.instSemifield._proof_22 }
```

### D062: `Nat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `2e1c25ca42e1e377a41827f0d2f09ae02cfb28ab155c30e277f1000f5e79b32c`

Type:

```lean
Type
```

### D063: `Nat.cast`

- Role: `external-frontier`
- Owner module: `Init.Data.Cast`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `6e24327ea908b1837083bb15aef27d593e950a2ff8ade81d8aa94bfe33b64450`

Type:

```lean
{R : Type u} → [NatCast R] → Nat → R
```

Definition body (one-level semantic boundary):

```lean
fun {R} [inst : NatCast R] => inst.natCast
```

### D064: `Nat.cast_one`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `125b9073ec4971913f52b82f315751c09213b99c866dc93dedf17d4ec6677723`

Type:

```lean
∀ {R : Type u_1} [inst : AddMonoidWithOne R], Eq (Nat.cast 1) 1
```

### D065: `Nat.cast_zero`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `3af7fca35abed5304a46d9b4befd6275be6b05c02abd6302ab2a6064699c86bf`

Type:

```lean
∀ {R : Type u_1} [inst : AddMonoidWithOne R], Eq (Nat.cast 0) 0
```

### D066: `Nat.choose`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Choose.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `1b27a7a5245e7a56440b921d088ec65068d40d36ba00814f20e890c0b14fbf9e`

Type:

```lean
Nat → Nat → Nat
```

Definition body (one-level semantic boundary):

```lean
fun x x_1 =>
  Nat.brecOn (motive := fun x => Nat → Nat) x
    (fun x f x_2 =>
      Nat.choose.match_1 (fun x x_3 => Nat.below (motive := fun x => Nat → Nat) x → Nat) x x_2 (fun x x_3 => 1)
        (fun n x => 0) (fun n k x => instHAdd.hAdd (x.1 k) (x.1 (instHAdd.hAdd k 1))) f)
    x_1
```

### D067: `Nat.decLt`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `652ffb54717682f55eafca6c2b47fca31dfea599c9898709ba2f56fbc9113d99`

Type:

```lean
(n m : Nat) → Decidable (instLTNat.lt n m)
```

Definition body (one-level semantic boundary):

```lean
fun n m => n.succ.decLe m
```

### D068: `Nat.instAtLeastTwoHAddOfNat`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Init`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `309ef94c4b7cfbe2e668952e6915279353921d5d48b6123a30f90dd932dac3e6`

Type:

```lean
∀ (n : Nat) [NeZero n], (instHAdd.hAdd n 1).AtLeastTwo
```

### D069: `Nat.instNeZeroSucc`

- Role: `external-frontier`
- Owner module: `Init.Data.Nat.Basic`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `a0735a528184c05594c4c79312c1225bb4dcffcdf0df7eb1a50c5733047c85ad`

Type:

```lean
∀ {n : Nat}, NeZero (instHAdd.hAdd n 1)
```

### D070: `Nat.instPreorder`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5ea89e9915200c8782bc933f9184e28eb38f4c9610b00cf1310cc6e6435642d8`

Type:

```lean
Preorder Nat
```

Definition body (one-level semantic boundary):

```lean
inferInstance
```

### D071: `Nat.mul`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `bd6b10050f6a0108f9b526bb7effc9bf923f7a8cc3fa7543d1f6a7343412333c`

Type:

```lean
Nat → Nat → Nat
```

Definition body (one-level semantic boundary):

```lean
fun x x_1 =>
  Nat.brecOn (motive := fun x => Nat → Nat) x_1
    (fun x f x_2 =>
      Nat.mul.match_1 (fun x x_3 => Nat.below (motive := fun x => Nat → Nat) x_3 → Nat) x_2 x (fun x x_3 => 0)
        (fun a b x => (x.1 a).add a) f)
    x
```

### D072: `NonAssocSemiring.toAddCommMonoidWithOne`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `6e4c898b19286580a5053df0525278998daaf3b1687c7526ed8df20324dc7aa0`

Type:

```lean
{α : Type u} → [self : NonAssocSemiring α] → AddCommMonoidWithOne α
```

Definition body (one-level semantic boundary):

```lean
fun α self =>
  { toNatCast := self.toNatCast, toAddMonoid := self.toAddMonoid, toOne := self.toOne, natCast_zero := ⋯,
    natCast_succ := ⋯, add_comm := ⋯ }
```

### D073: `NonAssocSemiring.toNonUnitalNonAssocSemiring`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `1674e66231d0f66dfe9fae191c7ae33207a78635bcf5490a9cfbb402d16f9bc0`

Type:

```lean
{α : Type u} → [self : NonAssocSemiring α] → NonUnitalNonAssocSemiring α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : NonAssocSemiring α] => self.1
```

### D074: `NonUnitalNonAssocSemiring.toDistrib`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `5b49ec28e539eea6192ab07a9aee6da537ed1b5e017f2b9ef44d3a0ae51d79c6`

Type:

```lean
{α : Type u} → [self : NonUnitalNonAssocSemiring α] → Distrib α
```

Definition body (one-level semantic boundary):

```lean
fun α self => { toMul := self.toMul, toAdd := self.toAdd, left_distrib := ⋯, right_distrib := ⋯ }
```

### D075: `NonUnitalNonAssocSemiring.toMulZeroClass`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `87ddc8012963f013675a2d3b6dbd069bd2e6eeeafa9e7aff6d92bfbf7d848152`

Type:

```lean
{α : Type u} → [self : NonUnitalNonAssocSemiring α] → MulZeroClass α
```

Definition body (one-level semantic boundary):

```lean
fun α self => { toMul := self.toMul, toZero := self.toZero, zero_mul := ⋯, mul_zero := ⋯ }
```

### D076: `Not`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `0bfdacbe07f6cbb8995b354e36299fd742f29398c188d7cc23dedcdc47f57a9a`

Type:

```lean
Prop → Prop
```

Definition body (one-level semantic boundary):

```lean
fun a => a → False
```

### D077: `OfNat.ofNat`

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

### D078: `One.toOfNat1`

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

### D079: `PMF`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5cdd3cb545c2651a0d9472303e779ab9bdd063a0c7b1e1e553a96f7f194b1a15`

Type:

```lean
Type u → Type u
```

Definition body (one-level semantic boundary):

```lean
fun α => Subtype fun f => HasSum f 1
```

### D080: `PMF.binomial`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Binomial`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `2c8d756e6d870623a0ed6b6b27375b86b993bb037ed7de2dab669f88fdcc39d3`

Type:

```lean
(p : NNReal) → instPartialOrderNNReal.le p 1 → (n : Nat) → PMF (Fin (instHAdd.hAdd n 1))
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

### D081: `PMF.instFunLike`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `05711a7766dde315ec447925cc78ccc1619a791b609dbf4bb5ef3709cffaca0d`

Type:

```lean
{α : Type u_1} → FunLike (PMF α) α ENNReal
```

Definition body (one-level semantic boundary):

```lean
fun {α} => { coe := fun p a => p.val a, coe_injective' := ⋯ }
```

### D082: `PartialOrder.toPreorder`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Defs.PartialOrder`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `079686fa1ec6d596bcdb475c56a12b7f5a0594bf346c64220c2c992e0f0aae3b`

Type:

```lean
{α : Type u_2} → [self : PartialOrder α] → Preorder α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : PartialOrder α] => self.1
```

### D083: `PosMulReflectLE.toPosMulReflectLT`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Order.GroupWithZero.Unbundled.Basic`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `c714a4be399604ce94e4fb121aebdd9e4a63f8d4b17c3c3bd4aaae16c06126dc`

Type:

```lean
∀ {α : Type u_1} [inst : MulZeroClass α] [inst_1 : PartialOrder α] [PosMulReflectLE α], PosMulReflectLT α
```

### D084: `PosMulStrictMono.toPosMulReflectLE`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Order.GroupWithZero.Unbundled.Defs`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `fbe88999c6bb86a4af667c884d8c1dea614fbaaadcd4e5a7e353dab9361ddbec`

Type:

```lean
∀ {α : Type u_1} [inst : Mul α] [inst_1 : Zero α] [inst_2 : LinearOrder α] [PosMulStrictMono α], PosMulReflectLE α
```

### D085: `Preorder.toLE`

- Role: `external-frontier`
- Owner module: `Mathlib.Order.Defs.PartialOrder`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `a2229e231e0928e24fffee5432201e35fadad80e7f6e4738e0d251c3c01a4676`

Type:

```lean
{α : Type u_2} → [self : Preorder α] → LE α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : Preorder α] => self.1
```

### D086: `Real`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `38529f0578472feffc4c79d5d0755fa10fc3edafb232ab5e442336d13630ee90`

Type:

```lean
Type
```

### D087: `Real.instDivInvMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `166f2abb65bf1271e5e8d70fdb78c55672c7e366b30439e83b517f803cdefac3`

Type:

```lean
DivInvMonoid Real
```

Definition body (one-level semantic boundary):

```lean
{ toMonoid := Real.instMonoid, toInv := Real.instInv, div := DivInvMonoid.div',
  div_eq_mul_inv := Real.instDivInvMonoid._proof_1, zpow := zpowRec, zpow_zero' := Real.instDivInvMonoid._proof_2,
  zpow_succ' := Real.instDivInvMonoid._proof_3, zpow_neg' := Real.instDivInvMonoid._proof_4 }
```

### D088: `Real.instInv`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8996fd673a1e2289aaf761085a60a161bdafebda8cdd48d1efb3c89da1382980`

Type:

```lean
Inv Real
```

Definition body (one-level semantic boundary):

```lean
{ inv := Real.inv'✝ }
```

### D089: `Real.instMonoid`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `37978679365b30167654c1ef9ecb0fa938325c2047191daa7208aee389c0b4b8`

Type:

```lean
Monoid Real
```

Definition body (one-level semantic boundary):

```lean
inferInstance
```

### D090: `Real.instMul`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `459ccbe28a1d29ccd2b329ea29e1a84b329b8064b8a8ecc52764b69b23e229ed`

Type:

```lean
Mul Real
```

Definition body (one-level semantic boundary):

```lean
{ mul := Real.mul✝ }
```

### D091: `Real.instNatCast`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `5fc7a7becbc71d472fa1a28bd92d79b4c6ea4fdc643db7380031a2b890ca7e15`

Type:

```lean
NatCast Real
```

Definition body (one-level semantic boundary):

```lean
{ natCast := fun n => { cauchy := n.cast } }
```

### D092: `Real.instOne`

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

### D093: `Real.instZero`

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

### D094: `Real.norm`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Real`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `e6d33c73e5cb8fae7d8c501ead6aad9e275f7969a4d8b80f94b9f3b5001bfe3a`

Type:

```lean
Norm Real
```

Definition body (one-level semantic boundary):

```lean
{ norm := fun r => abs r }
```

### D095: `Real.sqrt`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Sqrt`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `67f9248ae1acb851b5392be301057ebb8b8ef2fb20f76d2d53a2d07ec8f30553`

Type:

```lean
Real → Real
```

Definition body (one-level semantic boundary):

```lean
fun x => ((instFunLikeOrderIso NNReal NNReal).coe NNReal.sqrt x.toNNReal).toReal
```

### D096: `Semifield.toDivisionSemiring`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Field.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `a1b771abeff9bbbdcce988134973a1a367c44a340bcd29acb0cc44b8d6a2e55c`

Type:

```lean
{K : Type u_2} → [self : Semifield K] → DivisionSemiring K
```

Definition body (one-level semantic boundary):

```lean
fun K self =>
  { toSemiring := self.toSemiring, toInv := self.toInv, toDiv := self.toDiv, div_eq_mul_inv := ⋯, zpow := self.zpow,
    zpow_zero' := ⋯, zpow_succ' := ⋯, zpow_neg' := ⋯, toNontrivial := ⋯, inv_zero := ⋯, mul_inv_cancel := ⋯,
    toNNRatCast := self.toNNRatCast, nnratCast_def := ⋯, nnqsmul := self.nnqsmul, nnqsmul_def := ⋯ }
```

### D097: `Semiring.toMonoidWithZero`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
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

### D098: `Semiring.toNonAssocSemiring`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Ring.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `33076e5ce1b65d0dacdacdea942f424abbe54f3ff639c158f37c0f533984f227`

Type:

```lean
{α : Type u} → [self : Semiring α] → NonAssocSemiring α
```

Definition body (one-level semantic boundary):

```lean
fun α self =>
  { toNonUnitalNonAssocSemiring := self.toNonUnitalNonAssocSemiring, toOne := self.toOne, one_mul := ⋯, mul_one := ⋯,
    toNatCast := self.toNatCast, natCast_zero := ⋯, natCast_succ := ⋯ }
```

### D099: `True`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `151888ac453f6815e1022e38f8b589caefb03395ffd196a9f58c1de8920fa6e1`

Type:

```lean
Prop
```

### D100: `Zero.toOfNat0`

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

### D101: `congrArg`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `6c5d6e47fc74ac759773919ff0f898f10bbde756c9dc79f4cb3fe1e553faea80`

Type:

```lean
∀ {α : Sort u} {β : Sort v} {a₁ a₂ : α} (f : α → β), Eq a₁ a₂ → Eq (f a₁) (f a₂)
```

### D102: `congrFun'`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `e580a00193311ae42019fe2b62303654840079352c4cf3e793473ab7212ac9ad`

Type:

```lean
∀ {α : Sort u} {β : Sort v} {f g : α → β}, Eq f g → ∀ (a : α), Eq (f a) (g a)
```

### D103: `eq_true`

- Role: `external-frontier`
- Owner module: `Init.SimpLemmas`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `0f1fdf5f1085d2b517dd1381d7a9c93d6606abf049b78b028e5572120b21bf1e`

Type:

```lean
∀ {p : Prop}, p → Eq p True
```

### D104: `half_le_self_iff._simp_1`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Order.Field.Basic`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `d91531d43bcf77c23cbf1a2ffc40e40089949bc79df2b9731405e605585fac81`

Type:

```lean
∀ {α : Type u_2} [inst : Semifield α] [inst_1 : PartialOrder α] [PosMulReflectLT α] {a : α} [IsStrictOrderedRing α],
  Eq (inst_1.le (instHDiv.hDiv a 2) a) (inst_1.le 0 a)
```

### D105: `instAddCommMonoidWithOneENNReal`

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

### D106: `instAddNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `a1534bcd3e1888406ac787d30eeff8a284cb6688c23f5e8de09351dda91a280c`

Type:

```lean
Add Nat
```

Definition body (one-level semantic boundary):

```lean
{ add := Nat.add }
```

### D107: `instHAdd`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `38066efd17aeeca52ec2890d9aafca2fa3cce8fda7f5843c1b8e5da130d93981`

Type:

```lean
{α : Type u_1} → [Add α] → HAdd α α α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Add α] => { hAdd := fun a b => inst.add a b }
```

### D108: `instHDiv`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `ea3478ce3daf37e2cbdcd4bfaf7b5142fd7d274b56d75d2fae007c15e1b89871`

Type:

```lean
{α : Type u_1} → [Div α] → HDiv α α α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Div α] => { hDiv := fun a b => inst.div a b }
```

### D109: `instHMul`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `1fd375514ac68e29e7941c94ba308ea936395db23d0fee63a5c69dcccd3b2bdc`

Type:

```lean
{α : Type u_1} → [Mul α] → HMul α α α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Mul α] => { hMul := fun a b => inst.mul a b }
```

### D110: `instHPow`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `eb300d353d84392c776cad5e356479f878030744a43f9a1584942a89d16350b4`

Type:

```lean
{α : Type u_1} → {β : Type u_2} → [Pow α β] → HPow α β α
```

Definition body (one-level semantic boundary):

```lean
fun {α} {β} [inst : Pow α β] => { hPow := fun a b => inst.pow a b }
```

### D111: `instLTNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `4054f2341fdda887b2040c624c0867866ab56eabf3441d6ffc9451c94ae1663c`

Type:

```lean
LT Nat
```

Definition body (one-level semantic boundary):

```lean
{ lt := Nat.lt }
```

### D112: `instMulNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `15abc50804fa78aecc5a807f82f13a6b67bcdff9061558426471fc4b606841aa`

Type:

```lean
Mul Nat
```

Definition body (one-level semantic boundary):

```lean
{ mul := Nat.mul }
```

### D113: `instOfNatAtLeastTwo`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Cast.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `37355febc51d6fa8ff12fc8e7b429771db340390d46411d7608c566bdffd358d`

Type:

```lean
{R : Type u_1} → {n : Nat} → [NatCast R] → [n.AtLeastTwo] → OfNat R n
```

Definition body (one-level semantic boundary):

```lean
fun {R} {n} [NatCast R] [n.AtLeastTwo] => { ofNat := n.cast }
```

### D114: `instOfNatNat`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `7018dea92aae8c272f3a065f25e2bedb9732a0b602c3d54b166fa0cf2ce1ea92`

Type:

```lean
(n : Nat) → OfNat Nat n
```

Definition body (one-level semantic boundary):

```lean
fun n => { ofNat := n }
```

### D115: `instOneNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `be1ba7c9e9b4395e59c17c7a89b726801d594c6c78763ffff9bb49c61ecf93a2`

Type:

```lean
One NNReal
```

Definition body (one-level semantic boundary):

```lean
Nonneg.one
```

### D116: `instPartialOrderNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `f4a763f4ba425a9513216d6fa2ff1928b1eb5120c77749230299df64cb590bb5`

Type:

```lean
PartialOrder NNReal
```

Definition body (one-level semantic boundary):

```lean
Subtype.partialOrder fun r => Real.instLE.le 0 r
```

### D117: `instSemiringNNReal`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.NNReal.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `3e4e8247feefdb8229f2843910b9a5df0fb872cbeba12353f5c00b1549c1f2b5`

Type:

```lean
Semiring NNReal
```

Definition body (one-level semantic boundary):

```lean
Nonneg.semiring
```

### D118: `of_eq_true`

- Role: `external-frontier`
- Owner module: `Init.SimpLemmas`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `6111576b41c62c494716c58bbd370bce6bd03cda7b8c7b277e8f8b1e5eaaf99a`

Type:

```lean
∀ {p : Prop}, Eq p True → p
```

### D119: `False`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `2`
- Semantic SHA-256: `b90548e7f6af2c6059b569a5ba67e708283fa28519d6848931908f7e6468c39b`

Type:

```lean
Prop
```

### D120: `Fin.val`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `74cc6296b3a13207507ec372ef420f5e52b6935895dd25bcc6331abde2a4b328`

Type:

```lean
{n : Nat} → Fin n → Nat
```

Definition body (one-level semantic boundary):

```lean
fun n self => self.1
```

### D121: `HSub.hSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `2`
- Semantic SHA-256: `98025b38d523c0eadea77ba4961a20b2a913b23c079c4bfeba24a7bfaa24a4bc`

Type:

```lean
{α : Type u} → {β : Type v} → {γ : outParam (Type w)} → [self : HSub α β γ] → α → β → γ
```

Definition body (one-level semantic boundary):

```lean
fun α β {γ} [self : HSub α β γ] => self.1
```

### D122: `PMF.map`

- Role: `external-frontier`
- Owner module: `Mathlib.Probability.ProbabilityMassFunction.Constructions`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `bf06e1738c76887901adc4a0d90d5a668ae2745ad47d1faeee70fb3db7bbf391`

Type:

```lean
{α : Type u_1} → {β : Type u_2} → (α → β) → PMF α → PMF β
```

Definition body (one-level semantic boundary):

```lean
fun {α} {β} f p => p.bind (Function.comp PMF.pure f)
```

### D123: `Real.instSub`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Real.Basic`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `926d9e8fcca2819a885d446e168b20c7c8aac2e542d59ed2b48e32c9a4659a36`

Type:

```lean
Sub Real
```

Definition body (one-level semantic boundary):

```lean
{ sub := fun a b => instHAdd.hAdd a (Real.instNeg.neg b) }
```

### D124: `instHSub`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `def`
- Distance from target type: `2`
- Semantic SHA-256: `aa782f2b5af3d068f4c5340de4b32b193fece2c659a45582cc3024a19b550c87`

Type:

```lean
{α : Type u_1} → [Sub α] → HSub α α α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : Sub α] => { hSub := fun a b => inst.sub a b }
```

### D125: `Nat.AtLeastTwo`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Nat.Init`
- Declaration kind: `inductive`
- Distance from target type: `3`
- Semantic SHA-256: `318e11b8f9340f2f451d638786dd4fca470dece62824f4adc3bd18b5289aa911`

Type:

```lean
Nat → Prop
```
