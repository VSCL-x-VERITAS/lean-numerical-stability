# Faithfulness audit: HDP-01-PROP-1.2.4-EXTENDED

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `e80692e7561dbe33551e9ab673e9cf3e26ea124b8a2537afeb5ec459bb282ea1`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The consequential disagreements are resolved in favor of equivalence. The probability-measure typeclass has exactly the source normalization, and the lower integral is the extended nonnegative Lebesgue integral needed because the source does not assume finite expectation. Pointwise source instances directly satisfy Lean's almost-everywhere premise. Conversely, the source proposition applied to max(X,0) proves the Lean conclusion for any measurable X at a positive threshold, since both the event and the extended expectation agree with the target expressions. Therefore both implications hold and the target is faithful-equivalent.

## Implications

- **Lean implies source:** `yes`. For a source nonnegative random variable, pointwise nonnegativity implies the Lean almost-everywhere premise. IsProbabilityMeasure means μ univ=1, Set.Ici gives the inclusive event {X≥t}, and the ENNReal lower integral represents the source's possibly infinite expectation. Thus the Lean conclusion yields the source inequality.
- **Source implies lean:** `yes`. Given the Lean data, let Y=max(X,0). It is measurable and pointwise nonnegative. Since t>0, {Y≥t}={X≥t}; moreover EY is the lower Lebesgue integral of ENNReal.ofReal∘X. Applying the source proposition to Y gives exactly the Lean conclusion. This argument works regardless of whether the source's bare nonnegativity phrase is read pointwise or almost surely.

## Findings

- **note / external-frontier-semantics-resolved:** The blind packet's opacity does not create a semantic mismatch or vacuity.
- **note / nonnegativity-convention:** The textual convention is ambiguous but causes no loss or gain in theorem content.
- **note / extended-expectation:** The target faithfully retains the source's infinite-expectation cases.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `unclear` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `unclear` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `unclear` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `unclear` |

## Dependency coverage

- Blind translator covered `32` dependencies (`0` hash-reused); unclear: `D012, D013, D014, D018, D022`.
- Direct judge covered `32` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

- The source does not explicitly say whether “non-negative random variable” is pointwise or almost-sure terminology; this lexical convention remains unspecified, but the max(X,0) argument proves that it does not affect either implication or the classification.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-EXTENDED/faithfulness/agent_outputs/adjudicator.json` (`5209764372a64497797d9b50eef72e53c488c18224524a70a0b1794cc5d434dd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-EXTENDED/faithfulness/agent_outputs/agent_runs.json` (`6b493082e146723c6621c76a57a5d6c0a3bf9bd6cd43a91fb19e6f15e3d60179`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-EXTENDED/faithfulness/agent_outputs/blind_translation.json` (`d3e9b6521fa2ca80814c172cf2e8fc95a66de07da2a336ef8b86228fe75b7b3b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-EXTENDED/faithfulness/agent_outputs/direct_judge.json` (`2548f685a16abc3c346297cf23b00ec787365d34b2defbde722d66df1271ad08`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-EXTENDED/faithfulness/agent_outputs/roundtrip_judge.json` (`01661569f7e9109a678e71535fef469dccc17b182ff00853b80ae0de2bc31e82`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-EXTENDED/faithfulness/agent_outputs/source_contract.json` (`464f30523a82d2c5c87e99b5992acd543b8b0722d3f7a37bcc0eea415c61b1ac`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-EXTENDED/faithfulness/decision.json` (`f92171ff36b06314ca0acbd44b6af2eaa36746fca3e1891b1a65ec110044300b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-EXTENDED/faithfulness/inputs/blind_dependency_inventory.json` (`b35a1626a6228c59f6617cb5464bebda726ac5f156ea92402e22ed20169fab91`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-EXTENDED/faithfulness/inputs/blind_dossier.md` (`ba61a1db93929bec6795c43d48c3316a996c5bca67df29c697806e734bc5e3e3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-EXTENDED/faithfulness/inputs/blind_review_packet.md` (`ba61a1db93929bec6795c43d48c3316a996c5bca67df29c697806e734bc5e3e3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-EXTENDED/faithfulness/inputs/declaration_dossier.md` (`bcfdcd3bb5cfe95db6d9cd884a1897c45a6b67269cac63d118ac2f0b34d05fd8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-EXTENDED/faithfulness/inputs/dependency_inventory.json` (`b35a1626a6228c59f6617cb5464bebda726ac5f156ea92402e22ed20169fab91`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-EXTENDED/faithfulness/inputs/direct_review_packet.md` (`b8be43d9a3142b117fce73aef0d9f8a77272c27b55f2ad0ace3e3f2e874b0a1e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-EXTENDED/faithfulness/inputs/source_locator.json` (`dd97fdcf79b74c0352c1c80daf16d7e70d3722176933858530fc33f397a02734`)
