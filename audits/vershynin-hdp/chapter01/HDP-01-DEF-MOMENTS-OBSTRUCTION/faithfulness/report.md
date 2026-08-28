# Faithfulness audit: HDP-01-DEF-MOMENTS-OBSTRUCTION

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `6d0fbbff91afca3059288b0716655402c180543da59f120f823a62c170426063`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The Lean proposition faithfully witnesses one decisive defect in the unrestricted ordinary-moment notation: a standard real half-power cannot be assigned to every real pointwise value while obeying the square law. Its domains, quantifiers, equality, exponent 2, and Real power instance all match that counterexample, and the claim is nonvacuous because negative real inputs exist. The artifact is nevertheless not equivalent to the printed source statement: the source prints two moment definitions and leaves the signed noninteger-power convention open, whereas Lean adds the exact no-global-square-root theorem and omits expectation, the absolute-moment definition, and integrability. Therefore Lean implies the intended obstruction, the source statement does not imply this exact Lean assertion, and the consistent classification is faithful-stronger and accepted for the DISCREPANCY row only.

## Implications

- **Lean implies source:** `yes`. Read strictly in its configured DISCREPANCY-row role, the Lean theorem establishes a concrete obstruction to the source's unrestricted signed-real expression X^p. The source allows p = 1/2 and does not exclude negative values of X. If ordinary real half-power were total on those pointwise values and satisfied the defining square law, x mapped to x^(1/2) would be a function Real -> Real whose square equals x for every real x, exactly what Lean rules out. Because the failure is pointwise, it arises before expectation and is witnessed by a constant negative random variable. This implication supports the obstruction only; it does not say that Lean encodes the printed moment definitions.
- **Source implies lean:** `no`. The cited source passage supplies the notations E(X^p) and E(|X|^p) for p > 0 and thereby exposes an underdetermined negative-base/noninteger-exponent case, but it neither imposes the equation (x^(1/2))^2 = x nor asserts that no total right inverse to real squaring exists. Moving from that underdetermination to the exact closed nonexistence theorem adds a specific, nonvacuous algebraic claim. The source therefore does not imply the Lean proposition at the statement-faithfulness level used by this audit.

## Findings

- **note / discrepancy-witness-scope:** The artifact is accepted as the designated counterexample witness for unrestricted real half-power semantics. It must not be described as a Lean statement of either moment definition, and it does not address the source's separate expectation/integrability ambiguity.
- **minor / added-algebraic-specificity:** The extra exact assertion is genuine nonvacuous strength, so faithful-stronger is the consistent accepted classification rather than faithful-equivalent.
- **note / counterexample-specialization:** Fixing p = 1/2 is sufficient for a counterexample to the unrestricted scope and does not restrict away the problematic domain; it is not reduced applicability in this discrepancy-witness role.

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
| `C10` | `pass` | `not-applicable` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `11` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `11` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/agent_outputs/adjudicator.json` (`31ac772cf906cfc0d18329a864f779f45a150a2c22a1db74dca761a1941d47d8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/agent_outputs/agent_runs.json` (`9706eebb48e31bac06cfb79915dbb4f18214f79a5400decb5963260e6fb4da6e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/agent_outputs/blind_translation.json` (`20e61db6ba350f983bbcb6c95185e7f1de4ae3f3a873247f5465478a60c01024`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/agent_outputs/direct_judge.json` (`7861783bcb499960d0defb1fb225884b611967825ee9b865c52952cf02377dcf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/agent_outputs/roundtrip_judge.json` (`a5adb3aba4c6ca813c8c6680819340b00b9edf3a02ede90849becb937081e797`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/agent_outputs/source_contract.json` (`bf45d8d8bb9ee8d76f1f424e25205fed6a28144ec12eed24ce5738a520bc2a87`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/decision.json` (`da13824d7e20b304b0a3860f07a0d456919925db1ed829602e56c5b1cf7d0dff`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/history/20260828T060818Z/agent_outputs/agent_runs.json` (`1e4b57a1488d2acc271ea93f27f16de0b10c5f7684b4dafd1437e610305361ac`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/history/20260828T060818Z/agent_outputs/blind_translation.json` (`410eaec6787e0238efff53083328b99615d143bad976ce4a53e86d94113dd476`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/history/20260828T060818Z/agent_outputs/direct_judge.json` (`ec2f273ce2a63c13646f70245b3974c8d39952aafd1479be3ef9b33daa3b11e6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/history/20260828T060818Z/agent_outputs/roundtrip_judge.json` (`0a11180873222806e8782d2e7fa5d99d93b2879ce714998be93926165c354522`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/history/20260828T060818Z/agent_outputs/source_contract.json` (`829fa7500c58f95e37c04c1e1144d99d0921e3050dea41fea3d41038400fb06d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/history/20260828T060818Z/inputs/blind_dependency_inventory.json` (`75ffb12ec195574be08ffcf09cb8e82cceaf498f0a6488f7c5bab1226e7fd763`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/history/20260828T060818Z/inputs/blind_dossier.md` (`0f32717e2e5976fd728392b4c2e6c53962afbf48018bf3825e520a3d35cea80d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/history/20260828T060818Z/inputs/blind_review_packet.md` (`0f32717e2e5976fd728392b4c2e6c53962afbf48018bf3825e520a3d35cea80d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/history/20260828T060818Z/inputs/declaration_dossier.md` (`660bf06450590f68859276081133cccbe40e4b4e82e91b76d09be63266e6ec35`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/history/20260828T060818Z/inputs/dependency_inventory.json` (`75ffb12ec195574be08ffcf09cb8e82cceaf498f0a6488f7c5bab1226e7fd763`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/history/20260828T060818Z/inputs/direct_review_packet.md` (`f40f60625518becba562f6293e06089e84a09ecf2e97d5ef88737878d1d7bdda`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/history/20260828T060818Z/inputs/source_locator.json` (`4fb6251ccacb2dccf0a401547078e9ce9a33966508efb325243368ec21c8198b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/inputs/blind_dependency_inventory.json` (`75ffb12ec195574be08ffcf09cb8e82cceaf498f0a6488f7c5bab1226e7fd763`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/inputs/blind_dossier.md` (`0f32717e2e5976fd728392b4c2e6c53962afbf48018bf3825e520a3d35cea80d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/inputs/blind_review_packet.md` (`0f32717e2e5976fd728392b4c2e6c53962afbf48018bf3825e520a3d35cea80d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/inputs/declaration_dossier.md` (`f6d80693476cefa9c7db180a3a623b0a626e5a68752c01e10ad2be7522069148`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/inputs/dependency_inventory.json` (`75ffb12ec195574be08ffcf09cb8e82cceaf498f0a6488f7c5bab1226e7fd763`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/inputs/direct_review_packet.md` (`f40f60625518becba562f6293e06089e84a09ecf2e97d5ef88737878d1d7bdda`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-OBSTRUCTION/faithfulness/inputs/source_locator.json` (`4fb6251ccacb2dccf0a401547078e9ce9a33966508efb325243368ec21c8198b`)
