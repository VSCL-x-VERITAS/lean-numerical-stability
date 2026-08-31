# Faithfulness audit: HDP-02-BODY-2.2-WLOG-NORM

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `d89f66048dedf93ec9e645484546738f48231d292396606a131e6ecdf8ba72bd`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The repaired Lean proposition faithfully formalizes the algebra behind the source's first proof step. For nonzero coefficients it divides both coefficients and threshold by ‖a‖₂, proves the new coefficient vector has unit norm, and proves exact equality of the corresponding tail events. For the zero vector it supplies the separate trivial-event case that the source prose leaves implicit. Because the lemma holds for arbitrary real-valued families and arbitrary finite index types, whereas the source states the reduction only in its Bernoulli probability context, Lean implies the source use but the source sentence does not imply the full Lean generality. The appropriate classification is faithful-stronger.

## Implications

- **Lean implies source:** `yes`. Instantiating ι with the source's N coordinates and X with its Bernoulli variables, the positive branch produces unit-normalized coefficients and an identical tail event after scaling t; equality of events preserves probability and yields the source's WLOG reduction. The zero branch supplies the exceptional case omitted from the prose.
- **Source implies lean:** `no`. The source WLOG sentence is stated only inside the independent symmetric-Bernoulli, N-coordinate probability theorem and does not itself assert the Lean theorem's exact set equality for arbitrary outcome types, arbitrary real-valued families, arbitrary finite index types, or the explicit zero-vector branch.

## Findings

- **note / sound-generalization:** The target is strictly stronger in applicability while specializing directly to the source setting.
- **note / explicit-zero-vector-repair:** The target closes an implicit boundary-case gap without changing the intended nonzero normalization argument.
- **note / deterministic scope generalization:** The translation genuinely strengthens the source-scoped reduction while retaining the source as a direct specialization.
- **note / zero-vector clarification:** The translation resolves an explicit source ambiguity and prevents division by zero; it does not weaken the positive-norm normalization.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `fail` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `fail` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `34` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `34` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/agent_outputs/agent_runs.json` (`1c2987dcc058106e3d2e583161ada10c9176d7ede6ab8f4b4d10391749b781f4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/agent_outputs/blind_translation.json` (`716be69a4b172eadcfa2d78bd2be228cdf70e47c3c96602ea401b92298797489`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/agent_outputs/direct_judge.json` (`dc17e0a92386ad417798fde08d2831018ec7ce00fc11d651267aa6a3b04c205e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/agent_outputs/roundtrip_judge.json` (`e6f906c88ef63ecd60d5982e10ad116908a398ebb151af88bbe714bfc5dd6a56`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/agent_outputs/source_contract.json` (`76797abfae7131224181453b978403cf31ce33ef3defee988dd704dd6b4d6ac7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/decision.json` (`e14236c90d84527926984440e71648b13fea5246dd51965d0180be4c0fb8168c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260830T063159Z/agent_outputs/agent_runs.json` (`9031f951ddc017943e9cfd7af81d7fc23169a3dda0f2c932ad549b817de508ba`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260830T063159Z/agent_outputs/batch_source_contract.json` (`9fe87feff3ad7c8127feaa3e2d1171338e237ef408572779c1ea689710d83e2b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260830T063159Z/agent_outputs/blind_translation.json` (`85b3fc66e19d748badd06c37964560a7fd969e1dc99d7e75ca34d76c8375a628`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260830T063159Z/agent_outputs/direct_judge.json` (`5c4c1ed6f600db658a8c2dba4ff042a694e9bee95d8a3f60c9885ab9ca2908a1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260830T063159Z/agent_outputs/source_contract.json` (`ab9f4aace05b376da301ad4295c45c63db980e4d6341204ddb5d7a49c41849a8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260830T063159Z/inputs/batch_source_locator.json` (`a4c66c1c05727dc568f61aa132878ea144a6c4d5d5e4498694287723a816134b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260830T063159Z/inputs/blind_dependency_inventory.json` (`c105415309c3ba4985d4ad9244aeb395679789ab8e9bac3d91cb2c4fa7ab6605`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260830T063159Z/inputs/blind_dossier.md` (`c21accce746a34a03088d2fe2406227045f3e4b038341ccc7b87daf5495055b9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260830T063159Z/inputs/blind_review_packet.md` (`c21accce746a34a03088d2fe2406227045f3e4b038341ccc7b87daf5495055b9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260830T063159Z/inputs/declaration_dossier.md` (`4f39659edf66dc0b87d0efb2e0523861de6cc99e976e8748bcb2ff9ac2cd8c12`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260830T063159Z/inputs/dependency_inventory.json` (`c105415309c3ba4985d4ad9244aeb395679789ab8e9bac3d91cb2c4fa7ab6605`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260830T063159Z/inputs/direct_review_packet.md` (`d1f7c4a0c8df1451b4eadd5c7a8017cafd4f5e6686a053f653dac4c121082cca`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260830T063159Z/inputs/source_locator.json` (`c499132272b387de172b4b6ced57421bacbc370fb41df7e997ca89d42850947f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260831T082812Z/agent_outputs/agent_runs.json` (`27693d8fdac9d4faf1c19c02b37715509008a6811f65efcec9abdc090481960e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260831T082812Z/agent_outputs/blind_translation.json` (`716be69a4b172eadcfa2d78bd2be228cdf70e47c3c96602ea401b92298797489`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260831T082812Z/agent_outputs/direct_judge.json` (`dc17e0a92386ad417798fde08d2831018ec7ce00fc11d651267aa6a3b04c205e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260831T082812Z/agent_outputs/roundtrip_judge.json` (`e6f906c88ef63ecd60d5982e10ad116908a398ebb151af88bbe714bfc5dd6a56`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260831T082812Z/agent_outputs/source_contract.json` (`76797abfae7131224181453b978403cf31ce33ef3defee988dd704dd6b4d6ac7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260831T082812Z/decision.json` (`6c6fd13c5d3b842bc5002516366a78994201293c4c1b1c6c087207cba8a23cab`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260831T082812Z/inputs/blind_dependency_inventory.json` (`943519c9c72d3db6421d65dadf23506a5863d9b0b1000ed6d86a06209689ecef`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260831T082812Z/inputs/blind_dossier.md` (`20246e28c78af39f0bf2e9a2eb27cc296294a29d9308c3fc5e9d87ee07e8d618`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260831T082812Z/inputs/blind_review_packet.md` (`20246e28c78af39f0bf2e9a2eb27cc296294a29d9308c3fc5e9d87ee07e8d618`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260831T082812Z/inputs/declaration_dossier.md` (`58e05686c85ef3631bd979d484868ce88006f73b710c53e6359b2233457c97ae`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260831T082812Z/inputs/dependency_inventory.json` (`943519c9c72d3db6421d65dadf23506a5863d9b0b1000ed6d86a06209689ecef`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260831T082812Z/inputs/direct_review_packet.md` (`9384b0faadac4be8bc2bb58033a1b6d5dd8c76c0d5612721d4f6766faa49d839`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/history/20260831T082812Z/inputs/source_locator.json` (`c499132272b387de172b4b6ced57421bacbc370fb41df7e997ca89d42850947f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/inputs/blind_dependency_inventory.json` (`943519c9c72d3db6421d65dadf23506a5863d9b0b1000ed6d86a06209689ecef`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/inputs/blind_dossier.md` (`20246e28c78af39f0bf2e9a2eb27cc296294a29d9308c3fc5e9d87ee07e8d618`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/inputs/blind_review_packet.md` (`20246e28c78af39f0bf2e9a2eb27cc296294a29d9308c3fc5e9d87ee07e8d618`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/inputs/declaration_dossier.md` (`ccde44481e29504e198207803a220384d1efbf0d203a71971258f5cad668f320`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/inputs/dependency_inventory.json` (`943519c9c72d3db6421d65dadf23506a5863d9b0b1000ed6d86a06209689ecef`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/inputs/direct_review_packet.md` (`9384b0faadac4be8bc2bb58033a1b6d5dd8c76c0d5612721d4f6766faa49d839`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-WLOG-NORM/faithfulness/inputs/source_locator.json` (`c499132272b387de172b4b6ced57421bacbc370fb41df7e997ca89d42850947f`)
