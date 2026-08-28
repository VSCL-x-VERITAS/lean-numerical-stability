# Faithfulness audit: HDP-01-EQ-1.1

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `906fa83381587ec6e590d6ea94b47779939a8b7214fb1457c89ece4607582f90`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The hash-pinned source identifies Equation (1.1) with two displayed formulas: the L2 inner product is E(XY), and its norm is sqrt(E|X|²). The Lean target has exactly these two representative-level conclusions over an arbitrary probability space with X,Y satisfying MemLp at exponent 2. Unfolding l2InnerProduct makes the first equality definitional; unfolding l2Norm reduces the second to the ordinary real identity x²=|x|². The L2 hypotheses rule out any discrepancy from Mathlib's totalized integral. Although the source's surrounding prose invokes the conventional a.e.-quotient Hilbert space and the target does not build that structure, the numbered equation itself is faithfully represented by the two formulas. Neither implication relies on extra or narrower hypotheses, so the reduced-applicability rule does not alter the equivalent classification.

## Implications

- **Lean implies source:** `yes`. On every target probability space and for every MemLp pair, the first equality unfolds directly to E(XY), while the second follows from the definition of l2Norm and the pointwise real identity X² = |X|². MemLp supplies the intended L2 representative domain and makes the totalized integrals coincide with finite expectations. Thus the two formulas of Equation (1.1) hold.
- **Source implies lean:** `yes`. Under the source context of real-valued X,Y in L2 on a probability space, the displayed identities translate directly to the target's two conjuncts. The source's representative notation and conventional a.e. identification are compatible with MemLp. The target asks only for the numbered equation's formulas, not the separately stated global construction of L2 as a Hilbert space.

## Findings

- **note / selected-source scope:** This is not a faithfulness defect for the selected numbered equation. It would matter only if the benchmark instead selected the preceding global Hilbert-space assertion as an additional conclusion.
- **note / representatives versus quotient:** The representative formulas faithfully render Equation (1.1); the missing quotient structure does not alter either displayed value.
- **note / totalized integral semantics:** Totalization has no effect on the theorem's intended domain and does not weaken either equality.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `pass` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `49` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `49` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.1/faithfulness/agent_outputs/agent_runs.json` (`1f593027b4dc1225edf69994d920e3b06df8d17b43e6bad380cca9b4f1560c3c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.1/faithfulness/agent_outputs/blind_translation.json` (`44aef09cbe9850ff0715cd8603138a4c76a0c80613877958142cdd60795c4449`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.1/faithfulness/agent_outputs/direct_judge.json` (`f9097949e39e5934188a38733593c3aaf34f2f804b3b632c7414364208650958`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.1/faithfulness/agent_outputs/roundtrip_judge.json` (`c89b59e2f908dcf934d5020e02b709e837e3b08bcfb6fbcf445858609857298a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.1/faithfulness/agent_outputs/source_contract.json` (`48d5ca964700b23ae540c7d5f8f7cb7ddac9e491537b2005627f613cf9d1f782`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.1/faithfulness/decision.json` (`93e71f301d5ce3f6abb784b4bc793aefe9f61fc0737e0ede7608aed0148b2ef6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.1/faithfulness/inputs/blind_dependency_inventory.json` (`dba4e4d97579291fe56eafb0bf7b9c496593dc94746222a30bbbaa6502824231`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.1/faithfulness/inputs/blind_dossier.md` (`c5be65e7f5f2863fece17e41370074cc135127bfa5548eb0ef61d5e34bc9bddd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.1/faithfulness/inputs/blind_review_packet.md` (`c5be65e7f5f2863fece17e41370074cc135127bfa5548eb0ef61d5e34bc9bddd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.1/faithfulness/inputs/declaration_dossier.md` (`8c86c371175d8d40cea8074459b1a5e1cf6be9066894b075d4802b47e5b61944`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.1/faithfulness/inputs/dependency_inventory.json` (`201dc1d4ecfa1f8f5d1eebc32539e9240c99ebd053f959214fc75349ede87efa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.1/faithfulness/inputs/direct_review_packet.md` (`5dc235cd8d9dac84524329492627019dca135e27ca5551cb2d606d2c460c86cf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.1/faithfulness/inputs/source_locator.json` (`c1e028b7605331930d4c4cb730493f70b2ed23e74973b69f7b818e65fdc8014d`)
