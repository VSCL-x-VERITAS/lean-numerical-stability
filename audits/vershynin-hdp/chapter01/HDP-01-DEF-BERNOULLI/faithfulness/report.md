# Faithfulness audit: HDP-01-DEF-BERNOULLI

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `5141c7a000a216d6cac5371ec53bd96576f795b6c721553e8dcf0cb446c76689`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The Lean target faithfully formalizes the one-variable Bernoulli law for an explicitly strict parameter 0 < p < 1. It preserves the respective masses at 1 and 0, makes the two-point support explicit, and states the recalled expectation and variance through the associated real PMF. Its Nat and Real PMFs are pushforwards of the same Boolean Bernoulli PMF, so they encode one consistent law. It correctly omits independence and identical-distribution assertions because those belong to the source's surrounding sequence context, not to the definition of an individual Bernoulli law.

## Implications

- **Lean implies source:** `yes`. For every p with 0 < p < 1, the target gives the correct masses at 1 and 0, support on those two values, expectation p, and variance p(1-p), which entails all one-variable Bernoulli facts in the source. The source's surrounding i.i.d. context is not part of this one-variable definition.
- **Source implies lean:** `yes`. The source's statement that Xi takes values 1 and 0 with the respective probabilities p and 1-p yields the two PMF masses and zero mass elsewhere, while its recalled expectation and variance yield the two integral identities for the equivalent canonical numerical Bernoulli law.

## Findings

No findings were recorded.

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

- Blind translator covered `59` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `59` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/agent_outputs/agent_runs.json` (`e7f3a106476919ef25373312f0377ed55a78242c458c2a57fb5e962b1ee8743f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/agent_outputs/blind_translation.json` (`e0aad4e3717a09702964df4cb312a0cf0b9bbfd6d18645e8d8a5e1a9a1214cb7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/agent_outputs/direct_judge.json` (`7fc8b0759bb084808b363231a4be5b161b3a1bea53271bbf9e9df4a3e52a066f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/agent_outputs/roundtrip_judge.json` (`964164ec503ff4b468e2a8a1c8dcee9f96958ede9d11982ff015645b99d4fe33`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/agent_outputs/source_contract.json` (`c0d0b5e0045f6caf586a6a8c57a02097ec816530741347a7b2268da51cf7952a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/decision.json` (`356b3f138ec910aaa0e42340cd8c38e2fb7abb98c9c445a7649872a2436ac9c0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/history/20260828T153032Z/agent_outputs/agent_runs.json` (`0706a1a6f4b796e2ac6399d5157d115a03396cf1e2ba84a72183f1d7bc950f09`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/history/20260828T153032Z/agent_outputs/blind_translation.json` (`3ef0b138b21db854a00a551a144c8a24a9515845c7046f39f3ad24d8abf7f6f8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/history/20260828T153032Z/agent_outputs/source_contract.json` (`218be866080ed5a99ce72263923d2dfe7a63e0c273ce58e2703c03ffb2713c0c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/history/20260828T153032Z/inputs/blind_dependency_inventory.json` (`1c43025333092004fb92b65e70c17a757e5eb90264ed1eb83cbef79b26bcb746`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/history/20260828T153032Z/inputs/blind_dossier.md` (`955a16dc3c42de3824165e1f1c3b4a48429b558bc2542e3809dcc4ffe0cd4ea5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/history/20260828T153032Z/inputs/blind_review_packet.md` (`955a16dc3c42de3824165e1f1c3b4a48429b558bc2542e3809dcc4ffe0cd4ea5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/history/20260828T153032Z/inputs/declaration_dossier.md` (`1103c3ac05f358be7466a0488ec30e02ac51025620f2d9b518097450c20442ee`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/history/20260828T153032Z/inputs/dependency_inventory.json` (`d6c7f96929cdddd6ec12e7561a736f51669e935889269cd723989331fce4225c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/history/20260828T153032Z/inputs/direct_review_packet.md` (`778d1ceb4caa746e30c53555581ecde2f5fa2c9505a2a70ccaf97c1fd74f9845`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/history/20260828T153032Z/inputs/source_locator.json` (`a95cc35a700eb7e0960f1d3dfecb8f2cbac22a6a5dfc2dc99387bd4e3aa483fe`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/inputs/blind_dependency_inventory.json` (`40c214cea966e20186ac4ff2d1731746bb7748b1845096813878f10afc51e117`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/inputs/blind_dossier.md` (`eb77187fdd11e41bdfb0e8f437d739e95c8495cee2d0aee39013ca8e7438b4e8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/inputs/blind_review_packet.md` (`eb77187fdd11e41bdfb0e8f437d739e95c8495cee2d0aee39013ca8e7438b4e8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/inputs/declaration_dossier.md` (`eae077dfece24e112522f7fb210feafddb4dfe4e8a24e8905f224a3ef8e01347`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/inputs/dependency_inventory.json` (`6a01706015e223f7fa54bbff8cdd7f1aac400564e9167ba1ede57b095e41f4d8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/inputs/direct_review_packet.md` (`d93ed4554ea36ae31c56da8cf6f15bcaa24eb4c765bb53cc7991ebe308c11b76`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BERNOULLI/faithfulness/inputs/source_locator.json` (`a95cc35a700eb7e0960f1d3dfecb8f2cbac22a6a5dfc2dc99387bd4e3aa483fe`)
