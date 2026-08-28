# Faithfulness audit: HDP-01-DEF-BINOMIAL

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `5141c7a000a216d6cac5371ec53bd96576f795b6c721553e8dcf0cb446c76689`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The target is a faithful law-level formalization of the pinned source sentence. The finite Boolean product PMF is not merely suggestive of iid trials: its point mass is explicitly the product of p at every success coordinate and 1-p at every failure coordinate, so it encodes identical Bernoulli(p) marginals and independence. Mapping this law through the number of true coordinates is exactly taking the distribution of the Bernoulli sum. The right side is the standard binomial PMF on counts 0 through N, embedded into Nat. The explicit strict hypotheses 0 < p, p < 1, and 0 < N now match the source's p ∈ (0,1) and positive-integer N exactly.

## Implications

- **Lean implies source:** `yes`. The explicit product weights give N identically parameterized independent Bernoulli trials, success counting is their zero-one sum, and equality to the standard binomial PMF is precisely S_N ∼ Binom(N,p), under the same strict p and positive N hypotheses.
- **Source implies lean:** `yes`. Applying the source assertion to the canonical iid Bernoulli(p) product model represented by D002/D005 yields exactly the PMF equality in the Lean target, with D001 and D003 providing matching representations of the sum and binomial law.

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

- Blind translator covered `55` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `55` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/agent_outputs/agent_runs.json` (`31a2a5754850ce046a12f6141b23c4f712bb587410b6951fb106fc65381c2957`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/agent_outputs/blind_translation.json` (`d08bd378973013bb077b2b6bdb61d8b5a945012cb61daa1f9b20746cb622bd42`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/agent_outputs/direct_judge.json` (`7881a59302b2277854badfe8d900b79c49ddc5cf3e8d9bc5c2f400a9c24c6ad6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/agent_outputs/roundtrip_judge.json` (`2dbe1aa6ff4091474a397d43b122336d31e82f19829d35df6713702d1ea1000c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/agent_outputs/source_contract.json` (`0cb9623c3ffa7a2ba0947a9c3b934c41e1cf503b408b3b240255ac5db55ff335`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/decision.json` (`c0cd8ed438cfdff7af7540b271c04bd62707285b1974c103bbbdc17f83a5e8dc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/history/20260828T153046Z/agent_outputs/agent_runs.json` (`f30a67f9e883fa243cc1b75e530ded917269bb7b404977f17a410dcb5bfa7150`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/history/20260828T153046Z/agent_outputs/blind_translation.json` (`34b25f89dec81328c3d22b122cea83d3fbacdcaeccfca5e80b8436047fd8d08a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/history/20260828T153046Z/agent_outputs/source_contract.json` (`b564c9665d70efc101cc09f8a97ef003577c8c04a5efc964a62353739835f39f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/history/20260828T153046Z/inputs/blind_dependency_inventory.json` (`87760cfa489be71594120116a3eb9ce8fea3a549d880f6bec4e56f3425c4e39b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/history/20260828T153046Z/inputs/blind_dossier.md` (`8f252385c9481bf73ddcc21bf7b9b2dcf4899b7ffe13b9412f61702595600357`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/history/20260828T153046Z/inputs/blind_review_packet.md` (`8f252385c9481bf73ddcc21bf7b9b2dcf4899b7ffe13b9412f61702595600357`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/history/20260828T153046Z/inputs/declaration_dossier.md` (`bccb80c9773d5dc132c81d19c75c9a2aef59ca6156a4bd7172708f89ed1b96f8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/history/20260828T153046Z/inputs/dependency_inventory.json` (`b0ac8240c4f2398a0b15fb3c269c8cba3ba022646873afb4a891505aae52a269`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/history/20260828T153046Z/inputs/direct_review_packet.md` (`19a67150f400ff12993378c35b10ac00ac3d7e7a13683b34db82447e259a442c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/history/20260828T153046Z/inputs/source_locator.json` (`e5d7ce4d6144e3388b01bea55c1e12b12f4b6e5d1cc0fbf949517ba8bcb4c09d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/inputs/blind_dependency_inventory.json` (`439456160f326da7150855c701eb0670998b0b781c0219993dad1131eba188a0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/inputs/blind_dossier.md` (`2f1c236a002b6e7b83da10d2d8eea3bddde0e15396cc9ea7a8b057ef6a0e0e90`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/inputs/blind_review_packet.md` (`2f1c236a002b6e7b83da10d2d8eea3bddde0e15396cc9ea7a8b057ef6a0e0e90`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/inputs/declaration_dossier.md` (`42f48508812614aebef84e959124184e92fc944f1c29d241429b47db8c1964e6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/inputs/dependency_inventory.json` (`62e85a582365efcbcb9c3d3c741ce79d2ef2c43989d1614e46a5cf5cfedba7bb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/inputs/direct_review_packet.md` (`c9b34517fbca83425d50a5ab2303b6860eff1493ae4fff8c5f59d342e5343601`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-BINOMIAL/faithfulness/inputs/source_locator.json` (`e5d7ce4d6144e3388b01bea55c1e12b12f4b6e5d1cc0fbf949517ba8bcb4c09d`)
