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
