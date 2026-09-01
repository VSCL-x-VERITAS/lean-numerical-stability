# Faithfulness audit: HDP-01-LEM-1.2.1

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `85e084c9eeaf740214bc5cb04059b9f276ea8f19d60b3c610b92b11d13ca113e`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The target preserves the probability setting, strict upper-tail event, positive-threshold Lebesgue integral, and possible infinity. ENNReal equality captures simultaneous finiteness, the real conjunct is redundant, and Ioi 0 is endpoint-equivalent. The source's pointwise/a.s. ambiguity is removed semantically by X↦max(X,0), so both implications hold and the result is faithful-equivalent.

## Implications

- **Lean implies source:** `yes`. Under a pointwise reading the ENNReal equality is exactly the source. Under an a.s. reading, Y=max(X,0) is pointwise nonnegative, agrees with X a.e., has the same ofReal integrand and the same strict positive-threshold events; applying Lean to Y transfers to X.
- **Source implies lean:** `yes`. Every pointwise-nonnegative X is source-admissible under either convention. The source extended identity gives the first conjunct; in the integrable finite case conversion to real values gives the redundant guarded real equality.

## Findings

- **note / nonnegativity-representative-convention:** The wording convention is unresolvable but semantically harmless after replacement by max(X,0).
- **note / extended-value-semantics:** The finite and jointly infinite cases are both represented.
- **note / redundant-real-specialization:** It follows from the finite extended equality and adds no strength.
- **note / integration-endpoint:** They differ only by the Lebesgue-null singleton {0}.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `pass` |
| `C04` | `unclear` | `unclear` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `unclear` | `unclear` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `47` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `47` dependencies (`0` hash-reused); failing or unclear: `D008`.

## Remaining uncertainties

- The source never explicitly says whether ‘non-negative random variable’ is pointwise or almost surely nonnegative. This documentary ambiguity does not leave either implication uncertain because max(X,0) preserves the expectation and positive-tail content.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1/faithfulness/agent_outputs/adjudicator.json` (`7c5efd35f40fe3d9baf6ca49b7689947405a697502669d4b6c0ca9b8947f4763`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1/faithfulness/agent_outputs/agent_runs.json` (`e1a35cfe8adb0d6a09b7e1bc5558df1d7bc3e2bb447f23a1729d4bfbaf268e33`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1/faithfulness/agent_outputs/blind_translation.json` (`cd4b199a26a976f16ad74e5ce4e16a132e7c4ce3e4c04700f66309d2064a313f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1/faithfulness/agent_outputs/direct_judge.json` (`5bb6ad1ad80213c7574022bd7d4f5f71ab515943e4e45a5aad733939905688f5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1/faithfulness/agent_outputs/roundtrip_judge.json` (`a9050a752fc3f850e65fcf660e7c1b3546d10c92280a6c1c9d82495b972d7fc8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1/faithfulness/agent_outputs/source_contract.json` (`534a00d2a6db14f7a01ab8b4a3ad64abee5d72d70034baba055d91b4a5c1de78`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1/faithfulness/decision.json` (`f525447461f8a5db38bbfe8a70f0649ad6b2f973957dcb7ad96370139c4ce057`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1/faithfulness/inputs/blind_dependency_inventory.json` (`ea9a0d60ef3e76eace5cd882c5767ac47ac5ef4ac01eb8bbb2fd8a0130a0fb4d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1/faithfulness/inputs/blind_dossier.md` (`6d8c5cbfa69a56ff9b7545a4207011f2bcd1c2ab742b94431de92e59b59c3c77`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1/faithfulness/inputs/blind_review_packet.md` (`6d8c5cbfa69a56ff9b7545a4207011f2bcd1c2ab742b94431de92e59b59c3c77`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1/faithfulness/inputs/declaration_dossier.md` (`9dba568568c1ed4147e660256341bb671791bfc6722b6c127b74078028be9c68`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1/faithfulness/inputs/dependency_inventory.json` (`eaee919d178b5676178cda5e5d7565ffe3990c06c2247384f65646d02ccbe318`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1/faithfulness/inputs/direct_review_packet.md` (`c2e98bbd795123a04542cf6fe114edd5fcce6d6500a04f49e36809d67f5a9f35`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1/faithfulness/inputs/source_locator.json` (`47b8fe859b9544f3c0224594f0ab368f5c30086388e5303462ce930c2f367f0a`)
