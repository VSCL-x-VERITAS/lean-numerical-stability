# Faithfulness audit: HDP-01-EQ-TAIL-CDF

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `539d167487f817c5b1a7d7a5c05e3fd8f2674588cc6c8a471414c70320caed7b`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The target is the complement identity for the probability law ν=map X μ, not a literal preimage-event assertion retaining extra representative information. The source applies to the identity random variable on every real probability law, including ν, and measurable source variables are Lean-admissible. Both implications hold, so the classification is faithful-equivalent.

## Implications

- **Lean implies source:** `yes`. A source real random variable is measurable and hence AEMeasurable; the mapped-law masses on Ioi and Iic have exactly the strict-upper and inclusive-lower source meanings.
- **Source implies lean:** `yes`. For any Lean instance its mapped distribution is a probability measure on Borel Real. Applying the source identity to the measurable identity random variable on that law yields exactly the target equality.

## Findings

- **note / representational-domain-broadening:** This broadens representatives but not the semantic theorem; the identity variable on the mapped law proves every instance.

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

- Blind translator covered `26` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `26` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-TAIL-CDF/faithfulness/agent_outputs/adjudicator.json` (`5ffdbfcebc58f5f2f83c333ed9fec4d12f1805c40109b36a7cd9ffc6b0ff6b07`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-TAIL-CDF/faithfulness/agent_outputs/agent_runs.json` (`b6c9d141a600e022b31455bbb9a28bf890c76290614773a1a87cafc71ecb4682`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-TAIL-CDF/faithfulness/agent_outputs/blind_translation.json` (`b1f2f0c1aed5d7d0461428aa87464a160b4b17d7bb89831697f66eeb4e6d270d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-TAIL-CDF/faithfulness/agent_outputs/direct_judge.json` (`4037db3405a11d4f35d745f85b890367c1af38fa36fea2a04a485211879110ac`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-TAIL-CDF/faithfulness/agent_outputs/roundtrip_judge.json` (`44ece7d6e77412a95fed0caec55244189e17ce9475cb9798297e66e18932d9b0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-TAIL-CDF/faithfulness/agent_outputs/source_contract.json` (`4ca602d9a157177fd75db2c4e1313aba1b10bd6cca5c77323a3e6d6337dbaa20`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-TAIL-CDF/faithfulness/decision.json` (`bbe2f5bd9af6b1e05ca4fdf654ca9323adfdaad85b20436c633cbf648a85b631`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-TAIL-CDF/faithfulness/inputs/blind_dependency_inventory.json` (`2cf586ba47b4758853d2d64415aca4cf6269d4f602b3c07b78edcacd87990709`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-TAIL-CDF/faithfulness/inputs/blind_dossier.md` (`5be611db408759e0c6af00218dce951690208fa9222fdaea27defa1f367d01f9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-TAIL-CDF/faithfulness/inputs/blind_review_packet.md` (`5be611db408759e0c6af00218dce951690208fa9222fdaea27defa1f367d01f9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-TAIL-CDF/faithfulness/inputs/declaration_dossier.md` (`2ae1c8beffd45892aa8df6cd3e1b557fddb1d4c593e2b658a59911235dfd4f1b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-TAIL-CDF/faithfulness/inputs/dependency_inventory.json` (`025c26220b4e210e93e5e5cb6e3281a93aeef77c171d51062f6193a504162fbf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-TAIL-CDF/faithfulness/inputs/direct_review_packet.md` (`9ee4efe296e82639196c44811fc3499cdab67d44fb40b4b71781289d07d42aad`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-TAIL-CDF/faithfulness/inputs/source_locator.json` (`2532ae9d335a5f4d268721b3dc5ea3d377cd85282d176963f20b382bdde99e57`)
