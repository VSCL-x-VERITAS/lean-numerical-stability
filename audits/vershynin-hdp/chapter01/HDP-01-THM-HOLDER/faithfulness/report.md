# Faithfulness audit: HDP-01-THM-HOLDER

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `a8d60be2f7bed4bf3b2b248774300d968e860dd26b1dcec08478949a39053037`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The PDF and target match in probability context, real variables, Lp membership, absolute expectation, finite moment roots, and the printed endpoint. Primary Mathlib evidence proves that HolderConjugate has exactly the printed finite domain, makes ofReal harmless, and supplies p=q=2. The reverse endpoint follows by symmetry. Both implications hold, so the target is faithful-equivalent.

## Implications

- **Lean implies source:** `yes`. HolderConjugate exactly enforces p,q>1 and reciprocal sum one, so ofReal preserves both. The formula and printed endpoint match directly.
- **Source implies lean:** `yes`. The source entails the finite and (1,infinity) clauses, and entails (infinity,1) after swapping X and Y.

## Findings

- **note / resolved-exponent-domain:** All prior finite-domain uncertainty is removed.
- **note / safe-ofReal-coercion:** No negative-exponent truncation occurs.
- **note / derived-reverse-endpoint:** The extra conjunct is redundant, not genuine strength.
- **note / nonvacuity:** The interior branch is nonvacuous.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `unclear` | `unclear` |
| `C03` | `pass` | `pass` |
| `C04` | `unclear` | `unclear` |
| `C05` | `pass` | `pass` |
| `C06` | `unclear` | `unclear` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `unclear` | `unclear` |
| `C11` | `unclear` | `unclear` |
| `C12` | `unclear` | `unclear` |

## Dependency coverage

- Blind translator covered `52` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `52` dependencies (`0` hash-reused); failing or unclear: `D008, D031`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-HOLDER/faithfulness/agent_outputs/adjudicator.json` (`a0ad6709fb78b5b43121db6007de6c007c45411ab9271bcd35c536d0e56ec523`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-HOLDER/faithfulness/agent_outputs/agent_runs.json` (`bbf39b7b0421388e832084f4b3cf44e48c438dec332bbcfa2d4c7ef5b1ef12ce`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-HOLDER/faithfulness/agent_outputs/blind_translation.json` (`19b381b5cbbbde4d4ce3a4b85e9788b3c2ea103671c65c611ae3bf6e36ae51c8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-HOLDER/faithfulness/agent_outputs/direct_judge.json` (`092739c31051fec456bdf889416ba4f235ed502c716c3bfba85eccbd1d3bbb82`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-HOLDER/faithfulness/agent_outputs/roundtrip_judge.json` (`935f103671dcf72b004f588d2be7c66f0bdaf44da9c4eb5952c7dbe644c26835`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-HOLDER/faithfulness/agent_outputs/source_contract.json` (`0ca80f1e49aa54a9030ac5294a51d04e09da6920d7bc351b270c6eb556c5f206`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-HOLDER/faithfulness/decision.json` (`97ea851815112dcf8837923515987f922e18794f7e8ef3c9ffcb6769321ccd60`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-HOLDER/faithfulness/inputs/blind_dependency_inventory.json` (`7366f89d1eb8dacf7873363447a7169ca153b37e539b830cd5a1f2dc9f0d548b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-HOLDER/faithfulness/inputs/blind_dossier.md` (`02f524dcba5f9a016353507e278a4c2cebed05669dd834fb35a3c62f571d14b6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-HOLDER/faithfulness/inputs/blind_review_packet.md` (`02f524dcba5f9a016353507e278a4c2cebed05669dd834fb35a3c62f571d14b6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-HOLDER/faithfulness/inputs/declaration_dossier.md` (`6a67062912e70783820a26712c53b9d643772e7c58ffbd82de118698d0448f90`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-HOLDER/faithfulness/inputs/dependency_inventory.json` (`bcc9ac04a9fc6db09e6bc4fea054a91a11f4cd86b94548beac022adc802ad1e9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-HOLDER/faithfulness/inputs/direct_review_packet.md` (`e47a0fb5085c96f46f6b229dec918f54d6d7f11e7204a6d86968b0e3a7f9b0ec`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-HOLDER/faithfulness/inputs/source_locator.json` (`f537d28a9a46484e3457ebd6e1341f0f4cefb99ae15ac3e5d41d5febf66b6b69`)
