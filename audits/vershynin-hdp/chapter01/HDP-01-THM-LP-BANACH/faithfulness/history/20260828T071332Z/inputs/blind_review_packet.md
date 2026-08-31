# Blind Lean declaration dossier

Translate only the mathematical proposition below. Source identity, task metadata,
theorem name, source declaration, proof, and repository commentary are excluded.
Do not use tools or inspect filesystem content.

## Elaborated target type

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
  (p : ENNReal) [inst_2 : Fact (ENNReal.instPartialOrder.le 1 p)],
  And (Nonempty (NormedAddCommGroup (Subtype fun x => SetLike.instMembership.mem (MeasureTheory.Lp Real p μ) x)))
    (Nonempty (CompleteSpace (Subtype fun x => SetLike.instMembership.mem (MeasureTheory.Lp Real p μ) x)))
```

## Fully explicit elaborated target type

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace.{u_1} Ω] (μ : @MeasureTheory.Measure.{u_1} Ω inst)
  [@MeasureTheory.IsProbabilityMeasure.{u_1} Ω inst μ] (p : ENNReal)
  [inst_2 :
    Fact
      (@LE.le.{0} ENNReal (@Preorder.toLE.{0} ENNReal (@PartialOrder.toPreorder.{0} ENNReal ENNReal.instPartialOrder))
        (@OfNat.ofNat.{0} ENNReal (nat_lit 1)
          (@One.toOfNat1.{0} ENNReal
            (@AddMonoidWithOne.toOne.{0} ENNReal
              (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))))
        p)],
  And
    (Nonempty.{u_1 + 1}
      (NormedAddCommGroup.{u_1}
        (@Subtype.{u_1 + 1}
          (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
            (@UniformSpace.toTopologicalSpace.{0} Real
              (@PseudoMetricSpace.toUniformSpace.{0} Real
                (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                  (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
            μ)
          fun
            (x :
              @MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                (@UniformSpace.toTopologicalSpace.{0} Real
                  (@PseudoMetricSpace.toUniformSpace.{0} Real
                    (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                      (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                μ) =>
          @Membership.mem.{u_1, u_1}
            (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
              (@UniformSpace.toTopologicalSpace.{0} Real
                (@PseudoMetricSpace.toUniformSpace.{0} Real
                  (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                    (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
              μ)
            (@AddSubgroup.{u_1}
              (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                (@UniformSpace.toTopologicalSpace.{0} Real
                  (@PseudoMetricSpace.toUniformSpace.{0} Real
                    (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                      (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                μ)
              (@MeasureTheory.AEEqFun.instAddGroup.{u_1, 0} Ω Real inst μ
                (@UniformSpace.toTopologicalSpace.{0} Real
                  (@PseudoMetricSpace.toUniformSpace.{0} Real
                    (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                      (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                (@NormedAddGroup.toAddGroup.{0} Real
                  (@NormedAddCommGroup.toNormedAddGroup.{0} Real Real.normedAddCommGroup))
                (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{0} Real
                  (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
            (@SetLike.instMembership.{u_1, u_1}
              (@AddSubgroup.{u_1}
                (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                  (@UniformSpace.toTopologicalSpace.{0} Real
                    (@PseudoMetricSpace.toUniformSpace.{0} Real
                      (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                  μ)
                (@MeasureTheory.AEEqFun.instAddGroup.{u_1, 0} Ω Real inst μ
                  (@UniformSpace.toTopologicalSpace.{0} Real
                    (@PseudoMetricSpace.toUniformSpace.{0} Real
                      (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                  (@NormedAddGroup.toAddGroup.{0} Real
                    (@NormedAddCommGroup.toNormedAddGroup.{0} Real Real.normedAddCommGroup))
                  (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{0} Real
                    (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
              (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                (@UniformSpace.toTopologicalSpace.{0} Real
                  (@PseudoMetricSpace.toUniformSpace.{0} Real
                    (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                      (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                μ)
              (@AddSubgroup.instSetLike.{u_1}
                (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                  (@UniformSpace.toTopologicalSpace.{0} Real
                    (@PseudoMetricSpace.toUniformSpace.{0} Real
                      (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                  μ)
                (@MeasureTheory.AEEqFun.instAddGroup.{u_1, 0} Ω Real inst μ
                  (@UniformSpace.toTopologicalSpace.{0} Real
                    (@PseudoMetricSpace.toUniformSpace.{0} Real
                      (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                  (@NormedAddGroup.toAddGroup.{0} Real
                    (@NormedAddCommGroup.toNormedAddGroup.{0} Real Real.normedAddCommGroup))
                  (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{0} Real
                    (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup)))))
            (@MeasureTheory.Lp.{0, u_1} Ω Real inst Real.normedAddCommGroup p μ) x)))
    (Nonempty.{0}
      (@CompleteSpace.{u_1}
        (@Subtype.{u_1 + 1}
          (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
            (@UniformSpace.toTopologicalSpace.{0} Real
              (@PseudoMetricSpace.toUniformSpace.{0} Real
                (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                  (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
            μ)
          fun
            (x :
              @MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                (@UniformSpace.toTopologicalSpace.{0} Real
                  (@PseudoMetricSpace.toUniformSpace.{0} Real
                    (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                      (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                μ) =>
          @Membership.mem.{u_1, u_1}
            (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
              (@UniformSpace.toTopologicalSpace.{0} Real
                (@PseudoMetricSpace.toUniformSpace.{0} Real
                  (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                    (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
              μ)
            (@AddSubgroup.{u_1}
              (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                (@UniformSpace.toTopologicalSpace.{0} Real
                  (@PseudoMetricSpace.toUniformSpace.{0} Real
                    (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                      (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                μ)
              (@MeasureTheory.AEEqFun.instAddGroup.{u_1, 0} Ω Real inst μ
                (@UniformSpace.toTopologicalSpace.{0} Real
                  (@PseudoMetricSpace.toUniformSpace.{0} Real
                    (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                      (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                (@NormedAddGroup.toAddGroup.{0} Real
                  (@NormedAddCommGroup.toNormedAddGroup.{0} Real Real.normedAddCommGroup))
                (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{0} Real
                  (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
            (@SetLike.instMembership.{u_1, u_1}
              (@AddSubgroup.{u_1}
                (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                  (@UniformSpace.toTopologicalSpace.{0} Real
                    (@PseudoMetricSpace.toUniformSpace.{0} Real
                      (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                  μ)
                (@MeasureTheory.AEEqFun.instAddGroup.{u_1, 0} Ω Real inst μ
                  (@UniformSpace.toTopologicalSpace.{0} Real
                    (@PseudoMetricSpace.toUniformSpace.{0} Real
                      (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                  (@NormedAddGroup.toAddGroup.{0} Real
                    (@NormedAddCommGroup.toNormedAddGroup.{0} Real Real.normedAddCommGroup))
                  (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{0} Real
                    (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
              (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                (@UniformSpace.toTopologicalSpace.{0} Real
                  (@PseudoMetricSpace.toUniformSpace.{0} Real
                    (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                      (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                μ)
              (@AddSubgroup.instSetLike.{u_1}
                (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                  (@UniformSpace.toTopologicalSpace.{0} Real
                    (@PseudoMetricSpace.toUniformSpace.{0} Real
                      (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                  μ)
                (@MeasureTheory.AEEqFun.instAddGroup.{u_1, 0} Ω Real inst μ
                  (@UniformSpace.toTopologicalSpace.{0} Real
                    (@PseudoMetricSpace.toUniformSpace.{0} Real
                      (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                  (@NormedAddGroup.toAddGroup.{0} Real
                    (@NormedAddCommGroup.toNormedAddGroup.{0} Real Real.normedAddCommGroup))
                  (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{0} Real
                    (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup)))))
            (@MeasureTheory.Lp.{0, u_1} Ω Real inst Real.normedAddCommGroup p μ) x)
        (@PseudoMetricSpace.toUniformSpace.{u_1}
          (@Subtype.{u_1 + 1}
            (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
              (@UniformSpace.toTopologicalSpace.{0} Real
                (@PseudoMetricSpace.toUniformSpace.{0} Real
                  (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                    (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
              μ)
            fun
              (x :
                @MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                  (@UniformSpace.toTopologicalSpace.{0} Real
                    (@PseudoMetricSpace.toUniformSpace.{0} Real
                      (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                  μ) =>
            @Membership.mem.{u_1, u_1}
              (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                (@UniformSpace.toTopologicalSpace.{0} Real
                  (@PseudoMetricSpace.toUniformSpace.{0} Real
                    (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                      (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                μ)
              (@AddSubgroup.{u_1}
                (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                  (@UniformSpace.toTopologicalSpace.{0} Real
                    (@PseudoMetricSpace.toUniformSpace.{0} Real
                      (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                  μ)
                (@MeasureTheory.AEEqFun.instAddGroup.{u_1, 0} Ω Real inst μ
                  (@UniformSpace.toTopologicalSpace.{0} Real
                    (@PseudoMetricSpace.toUniformSpace.{0} Real
                      (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                  (@NormedAddGroup.toAddGroup.{0} Real
                    (@NormedAddCommGroup.toNormedAddGroup.{0} Real Real.normedAddCommGroup))
                  (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{0} Real
                    (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
              (@SetLike.instMembership.{u_1, u_1}
                (@AddSubgroup.{u_1}
                  (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                    (@UniformSpace.toTopologicalSpace.{0} Real
                      (@PseudoMetricSpace.toUniformSpace.{0} Real
                        (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                          (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                    μ)
                  (@MeasureTheory.AEEqFun.instAddGroup.{u_1, 0} Ω Real inst μ
                    (@UniformSpace.toTopologicalSpace.{0} Real
                      (@PseudoMetricSpace.toUniformSpace.{0} Real
                        (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                          (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                    (@NormedAddGroup.toAddGroup.{0} Real
                      (@NormedAddCommGroup.toNormedAddGroup.{0} Real Real.normedAddCommGroup))
                    (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{0} Real
                      (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                  (@UniformSpace.toTopologicalSpace.{0} Real
                    (@PseudoMetricSpace.toUniformSpace.{0} Real
                      (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                  μ)
                (@AddSubgroup.instSetLike.{u_1}
                  (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                    (@UniformSpace.toTopologicalSpace.{0} Real
                      (@PseudoMetricSpace.toUniformSpace.{0} Real
                        (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                          (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                    μ)
                  (@MeasureTheory.AEEqFun.instAddGroup.{u_1, 0} Ω Real inst μ
                    (@UniformSpace.toTopologicalSpace.{0} Real
                      (@PseudoMetricSpace.toUniformSpace.{0} Real
                        (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                          (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                    (@NormedAddGroup.toAddGroup.{0} Real
                      (@NormedAddCommGroup.toNormedAddGroup.{0} Real Real.normedAddCommGroup))
                    (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{0} Real
                      (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup)))))
              (@MeasureTheory.Lp.{0, u_1} Ω Real inst Real.normedAddCommGroup p μ) x)
          (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_1}
            (@Subtype.{u_1 + 1}
              (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                (@UniformSpace.toTopologicalSpace.{0} Real
                  (@PseudoMetricSpace.toUniformSpace.{0} Real
                    (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                      (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                μ)
              fun
                (x :
                  @MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                    (@UniformSpace.toTopologicalSpace.{0} Real
                      (@PseudoMetricSpace.toUniformSpace.{0} Real
                        (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                          (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                    μ) =>
              @Membership.mem.{u_1, u_1}
                (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                  (@UniformSpace.toTopologicalSpace.{0} Real
                    (@PseudoMetricSpace.toUniformSpace.{0} Real
                      (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                  μ)
                (@AddSubgroup.{u_1}
                  (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                    (@UniformSpace.toTopologicalSpace.{0} Real
                      (@PseudoMetricSpace.toUniformSpace.{0} Real
                        (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                          (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                    μ)
                  (@MeasureTheory.AEEqFun.instAddGroup.{u_1, 0} Ω Real inst μ
                    (@UniformSpace.toTopologicalSpace.{0} Real
                      (@PseudoMetricSpace.toUniformSpace.{0} Real
                        (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                          (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                    (@NormedAddGroup.toAddGroup.{0} Real
                      (@NormedAddCommGroup.toNormedAddGroup.{0} Real Real.normedAddCommGroup))
                    (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{0} Real
                      (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                (@SetLike.instMembership.{u_1, u_1}
                  (@AddSubgroup.{u_1}
                    (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                      (@UniformSpace.toTopologicalSpace.{0} Real
                        (@PseudoMetricSpace.toUniformSpace.{0} Real
                          (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                            (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                      μ)
                    (@MeasureTheory.AEEqFun.instAddGroup.{u_1, 0} Ω Real inst μ
                      (@UniformSpace.toTopologicalSpace.{0} Real
                        (@PseudoMetricSpace.toUniformSpace.{0} Real
                          (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                            (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                      (@NormedAddGroup.toAddGroup.{0} Real
                        (@NormedAddCommGroup.toNormedAddGroup.{0} Real Real.normedAddCommGroup))
                      (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{0} Real
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                  (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                    (@UniformSpace.toTopologicalSpace.{0} Real
                      (@PseudoMetricSpace.toUniformSpace.{0} Real
                        (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                          (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                    μ)
                  (@AddSubgroup.instSetLike.{u_1}
                    (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                      (@UniformSpace.toTopologicalSpace.{0} Real
                        (@PseudoMetricSpace.toUniformSpace.{0} Real
                          (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                            (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                      μ)
                    (@MeasureTheory.AEEqFun.instAddGroup.{u_1, 0} Ω Real inst μ
                      (@UniformSpace.toTopologicalSpace.{0} Real
                        (@PseudoMetricSpace.toUniformSpace.{0} Real
                          (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                            (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                      (@NormedAddGroup.toAddGroup.{0} Real
                        (@NormedAddCommGroup.toNormedAddGroup.{0} Real Real.normedAddCommGroup))
                      (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{0} Real
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup)))))
                (@MeasureTheory.Lp.{0, u_1} Ω Real inst Real.normedAddCommGroup p μ) x)
            (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_1}
              (@Subtype.{u_1 + 1}
                (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                  (@UniformSpace.toTopologicalSpace.{0} Real
                    (@PseudoMetricSpace.toUniformSpace.{0} Real
                      (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                  μ)
                fun
                  (x :
                    @MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                      (@UniformSpace.toTopologicalSpace.{0} Real
                        (@PseudoMetricSpace.toUniformSpace.{0} Real
                          (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                            (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                      μ) =>
                @Membership.mem.{u_1, u_1}
                  (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                    (@UniformSpace.toTopologicalSpace.{0} Real
                      (@PseudoMetricSpace.toUniformSpace.{0} Real
                        (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                          (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                    μ)
                  (@AddSubgroup.{u_1}
                    (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                      (@UniformSpace.toTopologicalSpace.{0} Real
                        (@PseudoMetricSpace.toUniformSpace.{0} Real
                          (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                            (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                      μ)
                    (@MeasureTheory.AEEqFun.instAddGroup.{u_1, 0} Ω Real inst μ
                      (@UniformSpace.toTopologicalSpace.{0} Real
                        (@PseudoMetricSpace.toUniformSpace.{0} Real
                          (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                            (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                      (@NormedAddGroup.toAddGroup.{0} Real
                        (@NormedAddCommGroup.toNormedAddGroup.{0} Real Real.normedAddCommGroup))
                      (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{0} Real
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                  (@SetLike.instMembership.{u_1, u_1}
                    (@AddSubgroup.{u_1}
                      (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                        (@UniformSpace.toTopologicalSpace.{0} Real
                          (@PseudoMetricSpace.toUniformSpace.{0} Real
                            (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                              (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                        μ)
                      (@MeasureTheory.AEEqFun.instAddGroup.{u_1, 0} Ω Real inst μ
                        (@UniformSpace.toTopologicalSpace.{0} Real
                          (@PseudoMetricSpace.toUniformSpace.{0} Real
                            (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                              (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                        (@NormedAddGroup.toAddGroup.{0} Real
                          (@NormedAddCommGroup.toNormedAddGroup.{0} Real Real.normedAddCommGroup))
                        (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{0} Real
                          (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                    (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                      (@UniformSpace.toTopologicalSpace.{0} Real
                        (@PseudoMetricSpace.toUniformSpace.{0} Real
                          (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                            (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                      μ)
                    (@AddSubgroup.instSetLike.{u_1}
                      (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                        (@UniformSpace.toTopologicalSpace.{0} Real
                          (@PseudoMetricSpace.toUniformSpace.{0} Real
                            (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                              (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                        μ)
                      (@MeasureTheory.AEEqFun.instAddGroup.{u_1, 0} Ω Real inst μ
                        (@UniformSpace.toTopologicalSpace.{0} Real
                          (@PseudoMetricSpace.toUniformSpace.{0} Real
                            (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                              (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                        (@NormedAddGroup.toAddGroup.{0} Real
                          (@NormedAddCommGroup.toNormedAddGroup.{0} Real Real.normedAddCommGroup))
                        (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{0} Real
                          (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup)))))
                  (@MeasureTheory.Lp.{0, u_1} Ω Real inst Real.normedAddCommGroup p μ) x)
              (@MeasureTheory.Lp.instNormedAddCommGroup.{u_1, 0} Ω Real inst p μ Real.normedAddCommGroup inst_2))))))
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

### D003: `AddSubgroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Subgroup.Defs`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `880cc5aadae4d35dc6859a60072dc41e0ebd854b9698ee53307ec4a0b7d59ccf`

Type:

```lean
(G : Type u_3) → [AddGroup G] → Type u_3
```

### D004: `AddSubgroup.instSetLike`

- Role: `external-frontier`
- Owner module: `Mathlib.Algebra.Group.Subgroup.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `ef0f5946a437048b4f9c336a17862d10e23728bb152111ade2030721954c1ec8`

Type:

```lean
{G : Type u_1} → [inst : AddGroup G] → SetLike (AddSubgroup G) G
```

Definition body (one-level semantic boundary):

```lean
fun {G} [AddGroup G] => { coe := fun s => s.carrier, coe_injective' := ⋯ }
```

### D005: `And`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `37ecdc009aa953e3d4924ef10e6a1fb591f6af993cd344fd5a6b5321466517c9`

Type:

```lean
Prop → Prop → Prop
```

### D006: `CompleteSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.UniformSpace.Cauchy`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `0551d9b48389890091faefdb29b280e798958c385ce1b812011819c3ac7d5a01`

Type:

```lean
(α : Type u) → [UniformSpace α] → Prop
```

### D007: `ENNReal`

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

Definition body (one-level semantic boundary):

```lean
inferInstanceAs (PartialOrder (WithTop NNReal))
```

### D009: `Fact`

- Role: `external-frontier`
- Owner module: `Mathlib.Logic.Basic`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `6c571c60d65ad46685be2efa27ec8408fc67008a640ae7ddc9194d8e58ac040f`

Type:

```lean
Prop → Prop
```

### D010: `LE.le`

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

### D011: `MeasurableSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.MeasurableSpace.Defs`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `6825e55082259c6be2028d5ee0624c796293eccdd78af118da4583180067d196`

Type:

```lean
Type u_7 → Type u_7
```

### D012: `MeasureTheory.AEEqFun`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.AEEqFun`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `6617e69bba6f9e44b27a7929a11353f104ce0c7b079a276babaa71beeb73cdac`

Type:

```lean
(α : Type u_1) →
  (β : Type u_2) → [inst : MeasurableSpace α] → [TopologicalSpace β] → MeasureTheory.Measure α → Type (max u_1 u_2)
```

Definition body (one-level semantic boundary):

```lean
fun α β [MeasurableSpace α] [TopologicalSpace β] μ => Quotient (MeasureTheory.Measure.aeEqSetoid β μ)
```

### D013: `MeasureTheory.AEEqFun.instAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.AEEqFun`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8215aa068cde3e7db93e8268e18564d63eece2fd00f92d0d99b42f4005aecb8c`

Type:

```lean
{α : Type u_1} →
  {γ : Type u_3} →
    [inst : MeasurableSpace α] →
      {μ : MeasureTheory.Measure α} →
        [inst_1 : TopologicalSpace γ] →
          [inst_2 : AddGroup γ] → [IsTopologicalAddGroup γ] → AddGroup (MeasureTheory.AEEqFun α γ μ)
```

Definition body (one-level semantic boundary):

```lean
fun {α} {γ} [MeasurableSpace α] {μ} [TopologicalSpace γ] [AddGroup γ] [IsTopologicalAddGroup γ] =>
  Function.Injective.addGroup MeasureTheory.AEEqFun.toGerm ⋯ ⋯ ⋯ ⋯ ⋯ ⋯ ⋯
```

### D014: `MeasureTheory.IsProbabilityMeasure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.Typeclasses.Probability`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `f88b269cb95d165125e7553fd22f97d6e5f9b1b9bcdec7f6738a781dc674bf89`

Type:

```lean
{α : Type u_1} → {m0 : MeasurableSpace α} → MeasureTheory.Measure α → Prop
```

### D015: `MeasureTheory.Lp`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.LpSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `ebd6f92d8ed643d08a2bb3129053a166b2fcf4faeda5ac59171621ccd257723a`

Type:

```lean
{α : Type u_7} →
  (E : Type u_6) →
    {m : MeasurableSpace α} →
      [inst : NormedAddCommGroup E] →
        ENNReal →
          (μ : autoParam (MeasureTheory.Measure α) MeasureTheory.Lp._auto_1) → AddSubgroup (MeasureTheory.AEEqFun α E μ)
```

Definition body (one-level semantic boundary):

```lean
fun {α} E {m} [NormedAddCommGroup E] p μ =>
  { carrier := setOf fun f => ENNReal.instPartialOrder.lt (MeasureTheory.eLpNorm f.cast p μ) instTopENNReal.top,
    add_mem' := ⋯, zero_mem' := ⋯, neg_mem' := ⋯ }
```

### D016: `MeasureTheory.Lp.instNormedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.LpSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `93513d1d6692d54ef3ac6f37f9b4bfb7e6117e99d2dbdffe3c402a1ca7a67150`

Type:

```lean
{α : Type u_1} →
  {E : Type u_4} →
    {m : MeasurableSpace α} →
      {p : ENNReal} →
        {μ : MeasureTheory.Measure α} →
          [inst : NormedAddCommGroup E] →
            [hp : Fact (ENNReal.instPartialOrder.le 1 p)] →
              NormedAddCommGroup (Subtype fun x => SetLike.instMembership.mem (MeasureTheory.Lp E p μ) x)
```

Definition body (one-level semantic boundary):

```lean
fun {α} {E} {m} {p} {μ} [NormedAddCommGroup E] [Fact (ENNReal.instPartialOrder.le 1 p)] =>
  let __src :=
    { toFun := MeasureTheory.Lp.instNorm.norm, map_zero' := ⋯, add_le' := ⋯, neg' := ⋯,
        eq_zero_of_map_eq_zero' := ⋯ }.toNormedAddCommGroup;
  { toNorm := __src.toNorm, toAddCommGroup := __src.toAddCommGroup, toDist := __src.toDist, dist_self := ⋯,
    dist_comm := ⋯, dist_triangle := ⋯, edist := MeasureTheory.Lp.instEDist.edist, edist_dist := ⋯,
    toUniformSpace := __src.toUniformSpace, uniformity_dist := ⋯, toBornology := __src.toBornology, cobounded_sets := ⋯,
    eq_of_dist_eq_zero := ⋯, dist_eq := ⋯ }
```

### D017: `MeasureTheory.Measure`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Measure.MeasureSpaceDef`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `ba8c23c70f3135407096406cee0b4d7d9f02d088e8b1d1a1e105071821a3a51b`

Type:

```lean
(α : Type u_6) → [MeasurableSpace α] → Type u_6
```

### D018: `Membership.mem`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `941ea3346e809f919727c21bfcdeea342714a6b83f1cf871d648aa2cb14d6e9e`

Type:

```lean
{α : outParam (Type u)} → {γ : Type v} → [self : Membership α γ] → γ → α → Prop
```

Definition body (one-level semantic boundary):

```lean
fun {α} γ [self : Membership α γ] => self.1
```

### D019: `Nonempty`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `37c79de378d44cb9dc334502b161bb140da0544579086aded2cf83ff99c462c7`

Type:

```lean
Sort u → Prop
```

### D020: `NormedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `7289fc1f1aac42f488a1fe69c897c4d418a0fa8699118dd0f273085d7d95b741`

Type:

```lean
Type u_8 → Type u_8
```

### D021: `NormedAddCommGroup.toNormedAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `cdc7999c66248f7b0f68477de30ff4d9ea7a7f0df0bc6f092bc024f699d646fe`

Type:

```lean
{E : Type u_5} → [NormedAddCommGroup E] → NormedAddGroup E
```

Definition body (one-level semantic boundary):

```lean
fun {E} [inst : NormedAddCommGroup E] =>
  have __src := inst;
  { toNorm := __src.toNorm, toAddGroup := __src.toAddGroup, toMetricSpace := __src.toMetricSpace, dist_eq := ⋯ }
```

### D022: `NormedAddCommGroup.toSeminormedAddCommGroup`

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

### D023: `NormedAddGroup.toAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `06ba17aab699c28aaa8877d0b107536ebd2aefd8bf59143b2357c84bb820d89e`

Type:

```lean
{E : Type u_8} → [self : NormedAddGroup E] → AddGroup E
```

Definition body (one-level semantic boundary):

```lean
fun E [self : NormedAddGroup E] => self.2
```

### D024: `OfNat.ofNat`

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

### D025: `One.toOfNat1`

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

### D026: `PartialOrder.toPreorder`

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

### D027: `Preorder.toLE`

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

### D028: `PseudoMetricSpace.toUniformSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.MetricSpace.Pseudo.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `a6831039b3ad5e37bd0e7692fd995a699d8bef791976e20262da929990521799`

Type:

```lean
{α : Type u} → [self : PseudoMetricSpace α] → UniformSpace α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : PseudoMetricSpace α] => self.7
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

### D030: `Real.normedAddCommGroup`

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

### D031: `SeminormedAddCommGroup.toIsTopologicalAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Uniform`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `57ac324cd1f48e09b911b5d7b20ab6fe80f7a2aa45a806902a33ba5d8ae4a031`

Type:

```lean
∀ {E : Type u_2} [inst : SeminormedAddCommGroup E], IsTopologicalAddGroup E
```

### D032: `SeminormedAddCommGroup.toPseudoMetricSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `3f8499f7dfc2e8115a48b4ac0bec5328dd7223a18dd71fc0061e711fbd543126`

Type:

```lean
{E : Type u_8} → [self : SeminormedAddCommGroup E] → PseudoMetricSpace E
```

Definition body (one-level semantic boundary):

```lean
fun E [self : SeminormedAddCommGroup E] => self.3
```

### D033: `SetLike.instMembership`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.SetLike.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `47a75450bbb51c4e8fdd9e8881cc3fa741dfb5f1f186d952055686e285c081e4`

Type:

```lean
{A : Type u_1} → {B : Type u_2} → [i : SetLike A B] → Membership B A
```

Definition body (one-level semantic boundary):

```lean
fun {A} {B} [i : SetLike A B] => { mem := fun p x => Set.instMembership.mem (i.coe p) x }
```

### D034: `Subtype`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `3b0bb8433bd0c981dbdb4d6256bf74c50e9883207dae8d309dcb705135cf932c`

Type:

```lean
{α : Sort u} → (α → Prop) → Sort (max 1 u)
```

### D035: `UniformSpace.toTopologicalSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.UniformSpace.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `4d18df801a98905221e0935ec2ddacda684a1430b8d198ebc23fad0643bce2a8`

Type:

```lean
{α : Type u} → [self : UniformSpace α] → TopologicalSpace α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : UniformSpace α] => self.1
```

### D036: `instAddCommMonoidWithOneENNReal`

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
