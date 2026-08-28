# Declaration dossier for HDP-01-THM-LP-BANACH

This dossier describes the theorem statement only. Its proof is excluded.
Interpret every dependency from its supplied declaration; names are not definitions.

## Proof-free source declaration

```lean
theorem hdp_01_hthm_hlp_hbanach_spec
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ]
    (p : ENNReal) [Fact (1 ≤ p)] :
    Nonempty (NormedAddCommGroup (MeasureTheory.Lp ℝ p μ)) ∧
      Nonempty (NormedSpace ℝ (MeasureTheory.Lp ℝ p μ)) ∧
      (∀ f : MeasureTheory.Lp ℝ p μ,
        ‖f‖ = ENNReal.toReal (eLpNorm f p μ)) ∧
      IsComplete (Set.univ : Set (MeasureTheory.Lp ℝ p μ))
```

## Elaborated target type

```lean
∀ {Ω : Type u_1} [inst : MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
  (p : ENNReal) [inst_2 : Fact (ENNReal.instPartialOrder.le 1 p)],
  And (Nonempty (NormedAddCommGroup (Subtype fun x => SetLike.instMembership.mem (MeasureTheory.Lp Real p μ) x)))
    (And (Nonempty (NormedSpace Real (Subtype fun x => SetLike.instMembership.mem (MeasureTheory.Lp Real p μ) x)))
      (And
        (∀ (f : Subtype fun x => SetLike.instMembership.mem (MeasureTheory.Lp Real p μ) x),
          Eq (MeasureTheory.Lp.instNorm.norm f) (MeasureTheory.eLpNorm f.val.cast p μ).toReal)
        (IsComplete Set.univ)))
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
    (And
      (Nonempty.{max (u_1 + 1) 1}
        (@NormedSpace.{0, u_1} Real
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
          Real.normedField
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
            (@MeasureTheory.Lp.instNormedAddCommGroup.{u_1, 0} Ω Real inst p μ Real.normedAddCommGroup inst_2))))
      (And
        (∀
          (f :
            @Subtype.{u_1 + 1}
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
                (@MeasureTheory.Lp.{0, u_1} Ω Real inst Real.normedAddCommGroup p μ) x),
          @Eq.{1} Real
            (@Norm.norm.{u_1}
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
              (@MeasureTheory.Lp.instNorm.{u_1, 0} Ω Real inst p μ Real.normedAddCommGroup) f)
            (ENNReal.toReal
              (@MeasureTheory.eLpNorm.{u_1, 0} Ω Real
                (@ContinuousENorm.toENorm.{0} Real
                  (@UniformSpace.toTopologicalSpace.{0} Real
                    (@PseudoMetricSpace.toUniformSpace.{0} Real
                      (@SeminormedAddGroup.toPseudoMetricSpace.{0} Real
                        (@SeminormedAddCommGroup.toSeminormedAddGroup.{0} Real
                          (@NonUnitalSeminormedRing.toSeminormedAddCommGroup.{0} Real
                            (@NonUnitalSeminormedCommRing.toNonUnitalSeminormedRing.{0} Real
                              (@SeminormedCommRing.toNonUnitalSeminormedCommRing.{0} Real
                                (@NormedCommRing.toSeminormedCommRing.{0} Real Real.normedCommRing))))))))
                  (@SeminormedAddGroup.toContinuousENorm.{0} Real
                    (@SeminormedAddCommGroup.toSeminormedAddGroup.{0} Real
                      (@NonUnitalSeminormedRing.toSeminormedAddCommGroup.{0} Real
                        (@NonUnitalSeminormedCommRing.toNonUnitalSeminormedRing.{0} Real
                          (@SeminormedCommRing.toNonUnitalSeminormedCommRing.{0} Real
                            (@NormedCommRing.toSeminormedCommRing.{0} Real Real.normedCommRing)))))))
                inst
                (@MeasureTheory.AEEqFun.cast.{u_1, 0} Ω Real inst μ
                  (@UniformSpace.toTopologicalSpace.{0} Real
                    (@PseudoMetricSpace.toUniformSpace.{0} Real
                      (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                  (@Subtype.val.{u_1 + 1}
                    (@MeasureTheory.AEEqFun.{u_1, 0} Ω Real inst
                      (@UniformSpace.toTopologicalSpace.{0} Real
                        (@PseudoMetricSpace.toUniformSpace.{0} Real
                          (@SeminormedAddCommGroup.toPseudoMetricSpace.{0} Real
                            (@NormedAddCommGroup.toSeminormedAddCommGroup.{0} Real Real.normedAddCommGroup))))
                      μ)
                    (fun
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
                            (@MeasureTheory.Lp._proof_4.{0} Real Real.normedAddCommGroup)))
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
                              (@MeasureTheory.Lp._proof_4.{0} Real Real.normedAddCommGroup)))
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
                              (@MeasureTheory.Lp._proof_4.{0} Real Real.normedAddCommGroup))))
                        (@MeasureTheory.Lp.{0, u_1} Ω Real inst Real.normedAddCommGroup p μ) x)
                    f))
                p μ)))
        (@IsComplete.{u_1}
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
                (@MeasureTheory.Lp.instNormedAddCommGroup.{u_1, 0} Ω Real inst p μ Real.normedAddCommGroup inst_2))))
          (@Set.univ.{u_1}
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
                (@MeasureTheory.Lp.{0, u_1} Ω Real inst Real.normedAddCommGroup p μ) x)))))
```

## Local import graph

- `AuditTarget` imports: `NumStability.HDP.Scalar.Preliminaries`
- `NumStability.HDP.Scalar.Preliminaries` imports: `Mathlib.Probability.Moments.Variance`, `Mathlib.Probability.CDF`, `Mathlib.MeasureTheory.Function.LpSpace.Basic`, `Mathlib.MeasureTheory.Function.LpSpace.Complete`, `Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm`, `Mathlib.MeasureTheory.Function.LpSeminorm.Indicator`, `Mathlib.Probability.UniformOn`, `Mathlib.Analysis.Convex.Integral`, `Mathlib.Analysis.Convex.Continuous`, `Mathlib.MeasureTheory.Integral.Bochner.Set`, `Mathlib.MeasureTheory.Integral.Lebesgue.Markov`, `Mathlib.MeasureTheory.Integral.Layercake`, `Mathlib.MeasureTheory.Measure.Lebesgue.Integral`, `Mathlib.Probability.Distributions.Cauchy`, `Mathlib.Analysis.SpecialFunctions.NonIntegrable`, `Mathlib.Analysis.SpecialFunctions.Pow.Integral`, `Mathlib.Tactic`

## Semantic dependency inventory

`local` declarations are followed recursively through types and bodies. `external-frontier` declarations mark the one-level library trust boundary.

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

Fully explicit type:

```lean
{R : Type u_2} → [self : AddCommMonoidWithOne.{u_2} R] → AddMonoidWithOne.{u_2} R
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

Fully explicit type:

```lean
{R : Type u_2} → [self : AddMonoidWithOne.{u_2} R] → One.{u_2} R
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

Fully explicit type:

```lean
(G : Type u_3) → [AddGroup.{u_3} G] → Type u_3
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

Fully explicit type:

```lean
{G : Type u_1} → [inst : AddGroup.{u_1} G] → SetLike.{u_1, u_1} (@AddSubgroup.{u_1} G inst) G
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

Fully explicit type:

```lean
(a b : Prop) → Prop
```

### D006: `ContinuousENorm.toENorm`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `31fb1ad5ceaae342dc2fe1c1f2eba1b18e67d9d01a5451201d210b585bde97c0`

Type:

```lean
{E : Type u_8} → {inst : TopologicalSpace E} → [self : ContinuousENorm E] → ENorm E
```

Fully explicit type:

```lean
{E : Type u_8} → {inst : TopologicalSpace.{u_8} E} → [self : @ContinuousENorm.{u_8} E inst] → ENorm.{u_8} E
```

Definition body (one-level semantic boundary):

```lean
fun E {inst} [self : ContinuousENorm E] => self.1
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

Fully explicit type:

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

Fully explicit type:

```lean
PartialOrder.{0} ENNReal
```

Definition body (one-level semantic boundary):

```lean
inferInstanceAs (PartialOrder (WithTop NNReal))
```

### D009: `ENNReal.toReal`

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

### D010: `Eq`

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

### D011: `Fact`

- Role: `external-frontier`
- Owner module: `Mathlib.Logic.Basic`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `6c571c60d65ad46685be2efa27ec8408fc67008a640ae7ddc9194d8e58ac040f`

Type:

```lean
Prop → Prop
```

Fully explicit type:

```lean
(p : Prop) → Prop
```

### D012: `IsComplete`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.UniformSpace.Cauchy`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `9d0785cdef8b5e70f20d1cffb6da68aab38e0324eadbe8abacdb007f8f1747f6`

Type:

```lean
{α : Type u} → [uniformSpace : UniformSpace α] → Set α → Prop
```

Fully explicit type:

```lean
{α : Type u} → [uniformSpace : UniformSpace.{u} α] → (s : Set.{u} α) → Prop
```

Definition body (one-level semantic boundary):

```lean
fun {α} [UniformSpace α] s =>
  ∀ (f : Filter α),
    Cauchy f →
      Filter.instPartialOrder.le f (Filter.principal s) →
        Exists fun x => And (Set.instMembership.mem s x) (Filter.instPartialOrder.le f (nhds x))
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

### D014: `MeasurableSpace`

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

### D015: `MeasureTheory.AEEqFun`

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

Fully explicit type:

```lean
(α : Type u_1) →
  (β : Type u_2) →
    [inst : MeasurableSpace.{u_1} α] →
      [TopologicalSpace.{u_2} β] → (μ : @MeasureTheory.Measure.{u_1} α inst) → Type (max u_1 u_2)
```

Definition body (one-level semantic boundary):

```lean
fun α β [MeasurableSpace α] [TopologicalSpace β] μ => Quotient (MeasureTheory.Measure.aeEqSetoid β μ)
```

### D016: `MeasureTheory.AEEqFun.cast`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.AEEqFun`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `47f8b3469b914314d78fa6c02f35722a915b0ae5c64f6641ae6c8885cfaf00b4`

Type:

```lean
{α : Type u_1} →
  {β : Type u_2} →
    [inst : MeasurableSpace α] →
      {μ : MeasureTheory.Measure α} → [inst_1 : TopologicalSpace β] → MeasureTheory.AEEqFun α β μ → α → β
```

Fully explicit type:

```lean
{α : Type u_1} →
  {β : Type u_2} →
    [inst : MeasurableSpace.{u_1} α] →
      {μ : @MeasureTheory.Measure.{u_1} α inst} →
        [inst_1 : TopologicalSpace.{u_2} β] → (f : @MeasureTheory.AEEqFun.{u_1, u_2} α β inst inst_1 μ) → α → β
```

Definition body (one-level semantic boundary):

```lean
fun {α} {β} [MeasurableSpace α] {μ} [TopologicalSpace β] f =>
  if h : Exists fun b => Eq f (MeasureTheory.AEEqFun.mk (Function.const α b) ⋯) then
    Function.const α (Classical.choose h)
  else MeasureTheory.AEStronglyMeasurable.mk (Quotient.out f).val ⋯
```

### D017: `MeasureTheory.AEEqFun.instAddGroup`

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

Fully explicit type:

```lean
{α : Type u_1} →
  {γ : Type u_3} →
    [inst : MeasurableSpace.{u_1} α] →
      {μ : @MeasureTheory.Measure.{u_1} α inst} →
        [inst_1 : TopologicalSpace.{u_3} γ] →
          [inst_2 : AddGroup.{u_3} γ] →
            [@IsTopologicalAddGroup.{u_3} γ inst_1 inst_2] →
              AddGroup.{max u_3 u_1} (@MeasureTheory.AEEqFun.{u_1, u_3} α γ inst inst_1 μ)
```

Definition body (one-level semantic boundary):

```lean
fun {α} {γ} [MeasurableSpace α] {μ} [TopologicalSpace γ] [AddGroup γ] [IsTopologicalAddGroup γ] =>
  Function.Injective.addGroup MeasureTheory.AEEqFun.toGerm ⋯ ⋯ ⋯ ⋯ ⋯ ⋯ ⋯
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

### D019: `MeasureTheory.Lp`

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

Fully explicit type:

```lean
{α : Type u_7} →
  (E : Type u_6) →
    {m : MeasurableSpace.{u_7} α} →
      [inst : NormedAddCommGroup.{u_6} E] →
        (p : ENNReal) →
          (μ : autoParam.{u_7 + 1} (@MeasureTheory.Measure.{u_7} α m) MeasureTheory.Lp._auto_1) →
            @AddSubgroup.{max u_6 u_7}
              (@MeasureTheory.AEEqFun.{u_7, u_6} α E m
                (@UniformSpace.toTopologicalSpace.{u_6} E
                  (@PseudoMetricSpace.toUniformSpace.{u_6} E
                    (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_6} E
                      (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_6} E inst))))
                μ)
              (@MeasureTheory.AEEqFun.instAddGroup.{u_7, u_6} α E m μ
                (@UniformSpace.toTopologicalSpace.{u_6} E
                  (@PseudoMetricSpace.toUniformSpace.{u_6} E
                    (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_6} E
                      (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_6} E inst))))
                (@NormedAddGroup.toAddGroup.{u_6} E (@NormedAddCommGroup.toNormedAddGroup.{u_6} E inst))
                (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{u_6} E
                  (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_6} E inst)))
```

Definition body (one-level semantic boundary):

```lean
fun {α} E {m} [NormedAddCommGroup E] p μ =>
  { carrier := setOf fun f => ENNReal.instPartialOrder.lt (MeasureTheory.eLpNorm f.cast p μ) instTopENNReal.top,
    add_mem' := ⋯, zero_mem' := ⋯, neg_mem' := ⋯ }
```

### D020: `MeasureTheory.Lp._proof_4`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.LpSpace.Basic`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `abd7a97196acf3da2244da0c3bcfe067ccbd55770191492c32dd36b2807c3c5a`

Type:

```lean
∀ (E : Type u_1) [inst : NormedAddCommGroup E], IsTopologicalAddGroup E
```

Fully explicit type:

```lean
∀ (E : Type u_1) [inst : NormedAddCommGroup.{u_1} E],
  @IsTopologicalAddGroup.{u_1} E
    (@UniformSpace.toTopologicalSpace.{u_1} E
      (@PseudoMetricSpace.toUniformSpace.{u_1} E
        (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_1} E
          (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_1} E inst))))
    (@SeminormedAddGroup.toAddGroup.{u_1} E
      (@SeminormedAddCommGroup.toSeminormedAddGroup.{u_1} E
        (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_1} E inst)))
```

### D021: `MeasureTheory.Lp.instNorm`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.LpSpace.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `9a3017a2d8f94d9a46a9dab57b07fdb2e05aacaadf3fb2db4d2a4dd0de506f71`

Type:

```lean
{α : Type u_1} →
  {E : Type u_4} →
    {m : MeasurableSpace α} →
      {p : ENNReal} →
        {μ : MeasureTheory.Measure α} →
          [inst : NormedAddCommGroup E] → Norm (Subtype fun x => SetLike.instMembership.mem (MeasureTheory.Lp E p μ) x)
```

Fully explicit type:

```lean
{α : Type u_1} →
  {E : Type u_4} →
    {m : MeasurableSpace.{u_1} α} →
      {p : ENNReal} →
        {μ : @MeasureTheory.Measure.{u_1} α m} →
          [inst : NormedAddCommGroup.{u_4} E] →
            Norm.{max u_1 u_4}
              (@Subtype.{(max u_1 u_4) + 1}
                (@MeasureTheory.AEEqFun.{u_1, u_4} α E m
                  (@UniformSpace.toTopologicalSpace.{u_4} E
                    (@PseudoMetricSpace.toUniformSpace.{u_4} E
                      (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                  μ)
                fun
                  (x :
                    @MeasureTheory.AEEqFun.{u_1, u_4} α E m
                      (@UniformSpace.toTopologicalSpace.{u_4} E
                        (@PseudoMetricSpace.toUniformSpace.{u_4} E
                          (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                            (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                      μ) =>
                @Membership.mem.{max u_1 u_4, max u_1 u_4}
                  (@MeasureTheory.AEEqFun.{u_1, u_4} α E m
                    (@UniformSpace.toTopologicalSpace.{u_4} E
                      (@PseudoMetricSpace.toUniformSpace.{u_4} E
                        (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                          (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                    μ)
                  (@AddSubgroup.{max u_4 u_1}
                    (@MeasureTheory.AEEqFun.{u_1, u_4} α E m
                      (@UniformSpace.toTopologicalSpace.{u_4} E
                        (@PseudoMetricSpace.toUniformSpace.{u_4} E
                          (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                            (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                      μ)
                    (@MeasureTheory.AEEqFun.instAddGroup.{u_1, u_4} α E m μ
                      (@UniformSpace.toTopologicalSpace.{u_4} E
                        (@PseudoMetricSpace.toUniformSpace.{u_4} E
                          (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                            (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                      (@NormedAddGroup.toAddGroup.{u_4} E (@NormedAddCommGroup.toNormedAddGroup.{u_4} E inst))
                      (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{u_4} E
                        (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                  (@SetLike.instMembership.{max u_1 u_4, max u_1 u_4}
                    (@AddSubgroup.{max u_4 u_1}
                      (@MeasureTheory.AEEqFun.{u_1, u_4} α E m
                        (@UniformSpace.toTopologicalSpace.{u_4} E
                          (@PseudoMetricSpace.toUniformSpace.{u_4} E
                            (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                              (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                        μ)
                      (@MeasureTheory.AEEqFun.instAddGroup.{u_1, u_4} α E m μ
                        (@UniformSpace.toTopologicalSpace.{u_4} E
                          (@PseudoMetricSpace.toUniformSpace.{u_4} E
                            (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                              (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                        (@NormedAddGroup.toAddGroup.{u_4} E (@NormedAddCommGroup.toNormedAddGroup.{u_4} E inst))
                        (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{u_4} E
                          (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                    (@MeasureTheory.AEEqFun.{u_1, u_4} α E m
                      (@UniformSpace.toTopologicalSpace.{u_4} E
                        (@PseudoMetricSpace.toUniformSpace.{u_4} E
                          (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                            (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                      μ)
                    (@AddSubgroup.instSetLike.{max u_1 u_4}
                      (@MeasureTheory.AEEqFun.{u_1, u_4} α E m
                        (@UniformSpace.toTopologicalSpace.{u_4} E
                          (@PseudoMetricSpace.toUniformSpace.{u_4} E
                            (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                              (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                        μ)
                      (@MeasureTheory.AEEqFun.instAddGroup.{u_1, u_4} α E m μ
                        (@UniformSpace.toTopologicalSpace.{u_4} E
                          (@PseudoMetricSpace.toUniformSpace.{u_4} E
                            (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                              (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                        (@NormedAddGroup.toAddGroup.{u_4} E (@NormedAddCommGroup.toNormedAddGroup.{u_4} E inst))
                        (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{u_4} E
                          (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst)))))
                  (@MeasureTheory.Lp.{u_4, u_1} α E m inst p μ) x)
```

Definition body (one-level semantic boundary):

```lean
fun {α} {E} {m} {p} {μ} [NormedAddCommGroup E] => { norm := fun f => (MeasureTheory.eLpNorm f.val.cast p μ).toReal }
```

### D022: `MeasureTheory.Lp.instNormedAddCommGroup`

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

Fully explicit type:

```lean
{α : Type u_1} →
  {E : Type u_4} →
    {m : MeasurableSpace.{u_1} α} →
      {p : ENNReal} →
        {μ : @MeasureTheory.Measure.{u_1} α m} →
          [inst : NormedAddCommGroup.{u_4} E] →
            [hp :
                Fact
                  (@LE.le.{0} ENNReal
                    (@Preorder.toLE.{0} ENNReal (@PartialOrder.toPreorder.{0} ENNReal ENNReal.instPartialOrder))
                    (@OfNat.ofNat.{0} ENNReal (nat_lit 1)
                      (@One.toOfNat1.{0} ENNReal
                        (@AddMonoidWithOne.toOne.{0} ENNReal
                          (@AddCommMonoidWithOne.toAddMonoidWithOne.{0} ENNReal instAddCommMonoidWithOneENNReal))))
                    p)] →
              NormedAddCommGroup.{max u_1 u_4}
                (@Subtype.{(max u_1 u_4) + 1}
                  (@MeasureTheory.AEEqFun.{u_1, u_4} α E m
                    (@UniformSpace.toTopologicalSpace.{u_4} E
                      (@PseudoMetricSpace.toUniformSpace.{u_4} E
                        (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                          (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                    μ)
                  fun
                    (x :
                      @MeasureTheory.AEEqFun.{u_1, u_4} α E m
                        (@UniformSpace.toTopologicalSpace.{u_4} E
                          (@PseudoMetricSpace.toUniformSpace.{u_4} E
                            (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                              (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                        μ) =>
                  @Membership.mem.{max u_1 u_4, max u_1 u_4}
                    (@MeasureTheory.AEEqFun.{u_1, u_4} α E m
                      (@UniformSpace.toTopologicalSpace.{u_4} E
                        (@PseudoMetricSpace.toUniformSpace.{u_4} E
                          (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                            (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                      μ)
                    (@AddSubgroup.{max u_4 u_1}
                      (@MeasureTheory.AEEqFun.{u_1, u_4} α E m
                        (@UniformSpace.toTopologicalSpace.{u_4} E
                          (@PseudoMetricSpace.toUniformSpace.{u_4} E
                            (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                              (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                        μ)
                      (@MeasureTheory.AEEqFun.instAddGroup.{u_1, u_4} α E m μ
                        (@UniformSpace.toTopologicalSpace.{u_4} E
                          (@PseudoMetricSpace.toUniformSpace.{u_4} E
                            (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                              (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                        (@NormedAddGroup.toAddGroup.{u_4} E (@NormedAddCommGroup.toNormedAddGroup.{u_4} E inst))
                        (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{u_4} E
                          (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                    (@SetLike.instMembership.{max u_1 u_4, max u_1 u_4}
                      (@AddSubgroup.{max u_4 u_1}
                        (@MeasureTheory.AEEqFun.{u_1, u_4} α E m
                          (@UniformSpace.toTopologicalSpace.{u_4} E
                            (@PseudoMetricSpace.toUniformSpace.{u_4} E
                              (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                                (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                          μ)
                        (@MeasureTheory.AEEqFun.instAddGroup.{u_1, u_4} α E m μ
                          (@UniformSpace.toTopologicalSpace.{u_4} E
                            (@PseudoMetricSpace.toUniformSpace.{u_4} E
                              (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                                (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                          (@NormedAddGroup.toAddGroup.{u_4} E (@NormedAddCommGroup.toNormedAddGroup.{u_4} E inst))
                          (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{u_4} E
                            (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                      (@MeasureTheory.AEEqFun.{u_1, u_4} α E m
                        (@UniformSpace.toTopologicalSpace.{u_4} E
                          (@PseudoMetricSpace.toUniformSpace.{u_4} E
                            (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                              (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                        μ)
                      (@AddSubgroup.instSetLike.{max u_1 u_4}
                        (@MeasureTheory.AEEqFun.{u_1, u_4} α E m
                          (@UniformSpace.toTopologicalSpace.{u_4} E
                            (@PseudoMetricSpace.toUniformSpace.{u_4} E
                              (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                                (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                          μ)
                        (@MeasureTheory.AEEqFun.instAddGroup.{u_1, u_4} α E m μ
                          (@UniformSpace.toTopologicalSpace.{u_4} E
                            (@PseudoMetricSpace.toUniformSpace.{u_4} E
                              (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_4} E
                                (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst))))
                          (@NormedAddGroup.toAddGroup.{u_4} E (@NormedAddCommGroup.toNormedAddGroup.{u_4} E inst))
                          (@SeminormedAddCommGroup.toIsTopologicalAddGroup.{u_4} E
                            (@NormedAddCommGroup.toSeminormedAddCommGroup.{u_4} E inst)))))
                    (@MeasureTheory.Lp.{u_4, u_1} α E m inst p μ) x)
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

### D023: `MeasureTheory.Measure`

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

### D024: `MeasureTheory.eLpNorm`

- Role: `external-frontier`
- Owner module: `Mathlib.MeasureTheory.Function.LpSeminorm.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `cd89c551c2b7ab3c3a7ffb47ae58cc4ac9c477fb18ba256b1b0639c96fa7fce0`

Type:

```lean
{α : Type u_1} →
  {ε : Type u_2} →
    [ENorm ε] →
      {x : MeasurableSpace α} →
        (α → ε) → ENNReal → autoParam (MeasureTheory.Measure α) MeasureTheory.eLpNorm._auto_1 → ENNReal
```

Fully explicit type:

```lean
{α : Type u_1} →
  {ε : Type u_2} →
    [ENorm.{u_2} ε] →
      {x : MeasurableSpace.{u_1} α} →
        (f : α → ε) →
          (p : ENNReal) →
            (μ : autoParam.{u_1 + 1} (@MeasureTheory.Measure.{u_1} α x) MeasureTheory.eLpNorm._auto_1) → ENNReal
```

Definition body (one-level semantic boundary):

```lean
fun {α} {ε} [ENorm ε] {x} f p μ =>
  ite (Eq p 0) 0 (ite (Eq p instTopENNReal.top) (MeasureTheory.eLpNormEssSup f μ) (MeasureTheory.eLpNorm' f p.toReal μ))
```

### D025: `Membership.mem`

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

### D026: `NonUnitalSeminormedCommRing.toNonUnitalSeminormedRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `c697ff5e735ebe18733e51950717037e73ba73e94ac2e99953bfb521708cabd2`

Type:

```lean
{α : Type u_5} → [self : NonUnitalSeminormedCommRing α] → NonUnitalSeminormedRing α
```

Fully explicit type:

```lean
{α : Type u_5} → [self : NonUnitalSeminormedCommRing.{u_5} α] → NonUnitalSeminormedRing.{u_5} α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : NonUnitalSeminormedCommRing α] => self.1
```

### D027: `NonUnitalSeminormedRing.toSeminormedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `db7996fa414ad67340b9d6991cd145ac2a5d251a870097d20f2f63e371fb101d`

Type:

```lean
{α : Type u_2} → [NonUnitalSeminormedRing α] → SeminormedAddCommGroup α
```

Fully explicit type:

```lean
{α : Type u_2} → [NonUnitalSeminormedRing.{u_2} α] → SeminormedAddCommGroup.{u_2} α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [inst : NonUnitalSeminormedRing α] =>
  have __src := inst;
  { toNorm := __src.toNorm, toAddCommGroup := __src.toAddCommGroup, toPseudoMetricSpace := __src.toPseudoMetricSpace,
    dist_eq := ⋯ }
```

### D028: `Nonempty`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `37c79de378d44cb9dc334502b161bb140da0544579086aded2cf83ff99c462c7`

Type:

```lean
Sort u → Prop
```

Fully explicit type:

```lean
(α : Sort u) → Prop
```

### D029: `Norm.norm`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `25f5aa97df9bb1faeacd7e5e6446ecbd367452a7105f098063355423713fe15a`

Type:

```lean
{E : Type u_8} → [self : Norm E] → E → Real
```

Fully explicit type:

```lean
{E : Type u_8} → [self : Norm.{u_8} E] → E → Real
```

Definition body (one-level semantic boundary):

```lean
fun E [self : Norm E] => self.1
```

### D030: `NormedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `7289fc1f1aac42f488a1fe69c897c4d418a0fa8699118dd0f273085d7d95b741`

Type:

```lean
Type u_8 → Type u_8
```

Fully explicit type:

```lean
(E : Type u_8) → Type u_8
```

### D031: `NormedAddCommGroup.toNormedAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `cdc7999c66248f7b0f68477de30ff4d9ea7a7f0df0bc6f092bc024f699d646fe`

Type:

```lean
{E : Type u_5} → [NormedAddCommGroup E] → NormedAddGroup E
```

Fully explicit type:

```lean
{E : Type u_5} → [NormedAddCommGroup.{u_5} E] → NormedAddGroup.{u_5} E
```

Definition body (one-level semantic boundary):

```lean
fun {E} [inst : NormedAddCommGroup E] =>
  have __src := inst;
  { toNorm := __src.toNorm, toAddGroup := __src.toAddGroup, toMetricSpace := __src.toMetricSpace, dist_eq := ⋯ }
```

### D032: `NormedAddCommGroup.toSeminormedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D033: `NormedAddGroup.toAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `06ba17aab699c28aaa8877d0b107536ebd2aefd8bf59143b2357c84bb820d89e`

Type:

```lean
{E : Type u_8} → [self : NormedAddGroup E] → AddGroup E
```

Fully explicit type:

```lean
{E : Type u_8} → [self : NormedAddGroup.{u_8} E] → AddGroup.{u_8} E
```

Definition body (one-level semantic boundary):

```lean
fun E [self : NormedAddGroup E] => self.2
```

### D034: `NormedCommRing.toSeminormedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `ad504b2606febc5a066d58ac540c9826bd1b7fce734d59a7fef63c7c27112fe3`

Type:

```lean
{α : Type u_2} → [β : NormedCommRing α] → SeminormedCommRing α
```

Fully explicit type:

```lean
{α : Type u_2} → [β : NormedCommRing.{u_2} α] → SeminormedCommRing.{u_2} α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [β : NormedCommRing α] =>
  { toNorm := β.toNorm, toRing := β.toRing, toPseudoMetricSpace := β.toPseudoMetricSpace, dist_eq := ⋯,
    norm_mul_le := ⋯, mul_comm := ⋯ }
```

### D035: `NormedSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Module.Basic`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `6b6b5b2582dac5d94b5d2a99eac51e4b8bee1f8e652cdec27b52f9c5d5ca5960`

Type:

```lean
(𝕜 : Type u_6) → (E : Type u_7) → [NormedField 𝕜] → [SeminormedAddCommGroup E] → Type (max u_6 u_7)
```

Fully explicit type:

```lean
(𝕜 : Type u_6) → (E : Type u_7) → [NormedField.{u_6} 𝕜] → [SeminormedAddCommGroup.{u_7} E] → Type (max u_6 u_7)
```

### D036: `OfNat.ofNat`

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

### D037: `One.toOfNat1`

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

### D038: `PartialOrder.toPreorder`

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

### D039: `Preorder.toLE`

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

### D040: `PseudoMetricSpace.toUniformSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.MetricSpace.Pseudo.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `a6831039b3ad5e37bd0e7692fd995a699d8bef791976e20262da929990521799`

Type:

```lean
{α : Type u} → [self : PseudoMetricSpace α] → UniformSpace α
```

Fully explicit type:

```lean
{α : Type u} → [self : PseudoMetricSpace.{u} α] → UniformSpace.{u} α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : PseudoMetricSpace α] => self.7
```

### D041: `Real`

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

### D042: `Real.normedAddCommGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Real`
- Declaration kind: `def`
- Distance from target type: `1`
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

### D043: `Real.normedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `69cccc1e864661e103785f4a2712b9ad164d845c03b7737801c37e5ac852bad7`

Type:

```lean
NormedCommRing Real
```

Fully explicit type:

```lean
NormedCommRing.{0} Real
```

Definition body (one-level semantic boundary):

```lean
let __src := Real.normedAddCommGroup;
let __src_1 := Real.commRing;
{ toNorm := __src.toNorm, toAddMonoid := __src.toAddMonoid, add_comm := Real.normedCommRing._proof_1,
  toMul := __src_1.toMul, left_distrib := Real.normedCommRing._proof_2, right_distrib := Real.normedCommRing._proof_3,
  zero_mul := Real.normedCommRing._proof_4, mul_zero := Real.normedCommRing._proof_5,
  mul_assoc := Real.normedCommRing._proof_6, toOne := __src_1.toOne, one_mul := Real.normedCommRing._proof_7,
  mul_one := Real.normedCommRing._proof_8, toNatCast := __src_1.toNatCast, natCast_zero := Real.normedCommRing._proof_9,
  natCast_succ := Real.normedCommRing._proof_10, npow := __src_1.npow, npow_zero := Real.normedCommRing._proof_11,
  npow_succ := Real.normedCommRing._proof_12, toNeg := __src.toNeg, toSub := __src.toSub,
  sub_eq_add_neg := Real.normedCommRing._proof_13, zsmul := __src.zsmul, zsmul_zero' := Real.normedCommRing._proof_14,
  zsmul_succ' := Real.normedCommRing._proof_15, zsmul_neg' := Real.normedCommRing._proof_16,
  neg_add_cancel := Real.normedCommRing._proof_17, toIntCast := __src_1.toIntCast,
  intCast_ofNat := Real.normedCommRing._proof_18, intCast_negSucc := Real.normedCommRing._proof_19,
  toMetricSpace := __src.toMetricSpace, dist_eq := ⋯, norm_mul_le := Real.normedCommRing._proof_20, mul_comm := ⋯ }
```

### D044: `Real.normedField`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Field.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `3249555a2824aa1e4e9c966b630ef876ae52df63ed09d0838da173aa28c0f77b`

Type:

```lean
NormedField Real
```

Fully explicit type:

```lean
NormedField.{0} Real
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

### D045: `SeminormedAddCommGroup.toIsTopologicalAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Uniform`
- Declaration kind: `theorem`
- Distance from target type: `1`
- Semantic SHA-256: `57ac324cd1f48e09b911b5d7b20ab6fe80f7a2aa45a806902a33ba5d8ae4a031`

Type:

```lean
∀ {E : Type u_2} [inst : SeminormedAddCommGroup E], IsTopologicalAddGroup E
```

Fully explicit type:

```lean
∀ {E : Type u_2} [inst : SeminormedAddCommGroup.{u_2} E],
  @IsTopologicalAddGroup.{u_2} E
    (@UniformSpace.toTopologicalSpace.{u_2} E
      (@PseudoMetricSpace.toUniformSpace.{u_2} E (@SeminormedAddCommGroup.toPseudoMetricSpace.{u_2} E inst)))
    (@SeminormedAddGroup.toAddGroup.{u_2} E (@SeminormedAddCommGroup.toSeminormedAddGroup.{u_2} E inst))
```

### D046: `SeminormedAddCommGroup.toPseudoMetricSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `3f8499f7dfc2e8115a48b4ac0bec5328dd7223a18dd71fc0061e711fbd543126`

Type:

```lean
{E : Type u_8} → [self : SeminormedAddCommGroup E] → PseudoMetricSpace E
```

Fully explicit type:

```lean
{E : Type u_8} → [self : SeminormedAddCommGroup.{u_8} E] → PseudoMetricSpace.{u_8} E
```

Definition body (one-level semantic boundary):

```lean
fun E [self : SeminormedAddCommGroup E] => self.3
```

### D047: `SeminormedAddCommGroup.toSeminormedAddGroup`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `8cf35215f509cdee10a3a95158cbaadd3c5fb584bc0d1f4fad6ecfc69b1bd205`

Type:

```lean
{E : Type u_5} → [SeminormedAddCommGroup E] → SeminormedAddGroup E
```

Fully explicit type:

```lean
{E : Type u_5} → [SeminormedAddCommGroup.{u_5} E] → SeminormedAddGroup.{u_5} E
```

Definition body (one-level semantic boundary):

```lean
fun {E} [inst : SeminormedAddCommGroup E] =>
  have __src := inst;
  { toNorm := __src.toNorm, toAddGroup := __src.toAddGroup, toPseudoMetricSpace := __src.toPseudoMetricSpace,
    dist_eq := ⋯ }
```

### D048: `SeminormedAddGroup.toContinuousENorm`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Continuity`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `17a83cbf3059dd0bbaefd43c93ce329f1d6b760d440889322b3582a18b23a141`

Type:

```lean
{E : Type u_4} → [inst : SeminormedAddGroup E] → ContinuousENorm E
```

Fully explicit type:

```lean
{E : Type u_4} →
  [inst : SeminormedAddGroup.{u_4} E] →
    @ContinuousENorm.{u_4} E
      (@UniformSpace.toTopologicalSpace.{u_4} E
        (@PseudoMetricSpace.toUniformSpace.{u_4} E (@SeminormedAddGroup.toPseudoMetricSpace.{u_4} E inst)))
```

Definition body (one-level semantic boundary):

```lean
fun {E} [SeminormedAddGroup E] => { toENorm := NNNorm.toENorm, continuous_enorm := ⋯ }
```

### D049: `SeminormedAddGroup.toPseudoMetricSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Group.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `d4043bb9912319b688406ba77c3a5b0fdd8f53ab605cf1962721b51314c66d3f`

Type:

```lean
{E : Type u_8} → [self : SeminormedAddGroup E] → PseudoMetricSpace E
```

Fully explicit type:

```lean
{E : Type u_8} → [self : SeminormedAddGroup.{u_8} E] → PseudoMetricSpace.{u_8} E
```

Definition body (one-level semantic boundary):

```lean
fun E [self : SeminormedAddGroup E] => self.3
```

### D050: `SeminormedCommRing.toNonUnitalSeminormedCommRing`

- Role: `external-frontier`
- Owner module: `Mathlib.Analysis.Normed.Ring.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `a29f0377c9baf2265c34aaf85b852e7c4260b34d2dc04574484c335ebc09a6e9`

Type:

```lean
{α : Type u_2} → [β : SeminormedCommRing α] → NonUnitalSeminormedCommRing α
```

Fully explicit type:

```lean
{α : Type u_2} → [β : SeminormedCommRing.{u_2} α] → NonUnitalSeminormedCommRing.{u_2} α
```

Definition body (one-level semantic boundary):

```lean
fun {α} [β : SeminormedCommRing α] =>
  { toNorm := β.toNorm, toAddMonoid := β.toAddMonoid, toNeg := β.toNeg, toSub := β.toSub, sub_eq_add_neg := ⋯,
    zsmul := β.zsmul, zsmul_zero' := ⋯, zsmul_succ' := ⋯, zsmul_neg' := ⋯, neg_add_cancel := ⋯, add_comm := ⋯,
    toMul := β.toMul, left_distrib := ⋯, right_distrib := ⋯, zero_mul := ⋯, mul_zero := ⋯, mul_assoc := ⋯,
    toPseudoMetricSpace := β.toPseudoMetricSpace, dist_eq := ⋯, norm_mul_le := ⋯, mul_comm := ⋯ }
```

### D051: `Set.univ`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.Set.Defs`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `4a477fd0b844ae25dae2fe8488226265a7c6b23c8087f3feda3f6197172b13e7`

Type:

```lean
{α : Type u} → Set α
```

Fully explicit type:

```lean
{α : Type u} → Set.{u} α
```

Definition body (one-level semantic boundary):

```lean
fun {α} => setOf fun _a => True
```

### D052: `SetLike.instMembership`

- Role: `external-frontier`
- Owner module: `Mathlib.Data.SetLike.Basic`
- Declaration kind: `def`
- Distance from target type: `1`
- Semantic SHA-256: `47a75450bbb51c4e8fdd9e8881cc3fa741dfb5f1f186d952055686e285c081e4`

Type:

```lean
{A : Type u_1} → {B : Type u_2} → [i : SetLike A B] → Membership B A
```

Fully explicit type:

```lean
{A : Type u_1} → {B : Type u_2} → [i : SetLike.{u_1, u_2} A B] → Membership.{u_2, u_1} B A
```

Definition body (one-level semantic boundary):

```lean
fun {A} {B} [i : SetLike A B] => { mem := fun p x => Set.instMembership.mem (i.coe p) x }
```

### D053: `Subtype`

- Role: `external-frontier`
- Owner module: `Init.Prelude`
- Declaration kind: `inductive`
- Distance from target type: `1`
- Semantic SHA-256: `3b0bb8433bd0c981dbdb4d6256bf74c50e9883207dae8d309dcb705135cf932c`

Type:

```lean
{α : Sort u} → (α → Prop) → Sort (max 1 u)
```

Fully explicit type:

```lean
{α : Sort u} → (p : α → Prop) → Sort (max 1 u)
```

### D054: `Subtype.val`

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

### D055: `UniformSpace.toTopologicalSpace`

- Role: `external-frontier`
- Owner module: `Mathlib.Topology.UniformSpace.Defs`
- Declaration kind: `abbrev`
- Distance from target type: `1`
- Semantic SHA-256: `4d18df801a98905221e0935ec2ddacda684a1430b8d198ebc23fad0643bce2a8`

Type:

```lean
{α : Type u} → [self : UniformSpace α] → TopologicalSpace α
```

Fully explicit type:

```lean
{α : Type u} → [self : UniformSpace.{u} α] → TopologicalSpace.{u} α
```

Definition body (one-level semantic boundary):

```lean
fun α [self : UniformSpace α] => self.1
```

### D056: `instAddCommMonoidWithOneENNReal`

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

## Complete local imported sources

### `NumStability.HDP.Scalar.Preliminaries`

Path: `lean-numerical-stability/NumStability/HDP/Scalar/Preliminaries.lean`
SHA-256: `bf31c4ccc4bfa157c6f850e8f3fed8b2043a24ca2bc09297c7683f4850e38d45`

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

def hdp_01_hdef_hindicator
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (E : Set Ω) (hE : MeasurableSet E) :
    NumStability.HDP.Scalar.Preliminaries.expectation μ
        (NumStability.HDP.Scalar.Preliminaries.indicatorFunction E) = μ.real E :=
  NumStability.HDP.Scalar.Preliminaries.indicatorExpectation μ E hE

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

theorem hdp_01_hlem_hlayer_hcake_hpointwise {x : ℝ} (hx : 0 ≤ x) :
    x = (∫ t in Set.Ioc 0 x, (1 : ℝ) ∂volume) ∧
      ENNReal.ofReal x =
        ∫⁻ t in Set.Ioi 0,
          (Set.Iio x).indicator (fun _ => (1 : ENNReal)) t ∂volume :=
  NumStability.HDP.Scalar.Preliminaries.layerCakePointwise hx

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

/-! Stable Chapter 1 alias for the corrected signed-tail statement and its
    standard-Cauchy obstruction in Exercise 1.2.2. -/
theorem hdp_01_hex_h1_d2_d2
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
          Probability.cauchyMeasure 0 1 {x | t < x}) = ⊤) ∧
        ((∫⁻ t in Set.Iio 0,
          Probability.cauchyMeasure 0 1 {x | x < t}) = ⊤)
    ) := by
  exact NumStability.HDP.Scalar.Preliminaries.exercise122CorrectedWithCauchy hX

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
              μ {ω | t < |X ω|} * ENNReal.ofReal (t ^ (p - 1))).toReal) :=
  NumStability.HDP.Scalar.Preliminaries.momentTailFormula hX hp

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
