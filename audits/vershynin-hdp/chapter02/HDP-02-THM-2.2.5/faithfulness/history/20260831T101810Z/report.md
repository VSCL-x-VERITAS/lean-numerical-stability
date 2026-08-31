# Faithfulness audit: HDP-02-THM-2.2.5

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `bcc472f5e51688f0f7346e76d6ac26be993d03a7d659b249d5c78dc19c017b5a`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

Primary-source and Lean evidence agree on every substantive component of the two-sided Hoeffding theorem. The source's unrestricted coefficient vector and its preceding normalization argument indicate that the zero vector is an intended trivial branch even though the displayed real quotient does not spell out a denominator convention. Lean selects a totalized quotient whose right-hand side is 2 at zero energy, rather than the customary limiting value 0, but t > 0 makes the weighted-sum tail event empty and its probability exactly zero. Thus the boundary presentation differs without changing the proposition's truth or either implication. The arbitrary finite-type indexing is equivalent to numbered coordinates when nonempty, and its empty instance is the same trivial zero-event branch. Both implications are yes, so the consistent classification is faithful-equivalent and accepted.

## Implications

- **Lean implies source:** `yes`. For positive coefficient energy, the propositions coincide after expanding the Euclidean squared norm as the finite sum of squares. For zero energy, all coefficients vanish, so strict positivity of t makes the two-sided tail event empty and its probability zero; this supplies the source's intended trivial branch despite the printed denominator. Lean also covers every source case if the printed quotient is instead read as implicitly excluding zero norm.
- **Source implies lean:** `yes`. For positive energy, the source conclusion is exactly the Lean conclusion. When the energy is zero, Lean's total division makes the exponent zero and the right-hand side 2, while the positive-threshold event is empty and has probability zero. The Lean-only empty-index instance has the same zero-event proof, so it adds no unproved substantive case.

## Findings

- **minor / zero-denominator presentation:** The numerical right-hand-side expression differs at the degenerate boundary, but both implication directions hold because the bounded probability is exactly zero there; acceptance and equivalence are unchanged.
- **note / empty finite index extension:** The extra case has zero weighted sum, an empty positive-threshold event, and a true bound. It is neither reduced applicability nor genuine nonvacuous strength.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `pass` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `unclear` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `fail` |
| `C11` | `unclear` | `unclear` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `76` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `76` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.5/faithfulness/agent_outputs/adjudicator.json` (`70a0992f1abe1cd0417a6c52ade7b1559f6d94557a079de274a6e5b8a07b79cc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.5/faithfulness/agent_outputs/agent_runs.json` (`c7425dbf9bb89af6725071d1828a0b6b0231a98360efcbc13730a37a52426f79`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.5/faithfulness/agent_outputs/blind_translation.json` (`d095a9afecaf1c34955a5168b2d45787fd35a1f2dac38f81e326060e49e1bd19`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.5/faithfulness/agent_outputs/direct_judge.json` (`bc2390592087b19f0e8e8e868e45e5430ac77d576682ed5e106a703adad9532f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.5/faithfulness/agent_outputs/roundtrip_judge.json` (`31a9c5310f088c524643f25e25640063e35091e237d29eeece989cd3b37cb314`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.5/faithfulness/agent_outputs/source_contract.json` (`2d67ce4b8ad953beed5ec2ddcef803602795eec5102dd465de768aec47819a6c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.5/faithfulness/decision.json` (`4f53d0dee8223fd3d496fc3e4b40619c1ac6139adc7ce5d9bef907a6183694e7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.5/faithfulness/inputs/blind_dependency_inventory.json` (`adf5a169005c70d7aa8263eca7f0c0177c6d824cef03cbb8480d0ad065218e47`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.5/faithfulness/inputs/blind_dossier.md` (`d4e00b30ff8e4a6aa1eaf8b414aa79ae8fe4ecc45a9011ddc74ae4ff399cac2e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.5/faithfulness/inputs/blind_review_packet.md` (`d4e00b30ff8e4a6aa1eaf8b414aa79ae8fe4ecc45a9011ddc74ae4ff399cac2e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.5/faithfulness/inputs/declaration_dossier.md` (`4a357956c88bed86d4c4305cfa511f1b12d44168b370fe1e30105e721984a0fa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.5/faithfulness/inputs/dependency_inventory.json` (`232f1d91408af013c475e7079ed46b53f182985c1b53952bbd91374718d67556`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.5/faithfulness/inputs/direct_review_packet.md` (`890e1d720e69b1adb2908a3a4fe2380e524ba7a00a9567b38bedd036f30e9a4b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.5/faithfulness/inputs/source_locator.json` (`f3774d59662ebc80497db33688034c630e9a6b2aa403e60febda7bcf37c69205`)
