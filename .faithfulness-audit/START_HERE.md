# Start Here

This is the entry point for a researcher or coding agent receiving this
archive. The package is self-contained: keep the complete directory together.
Do not copy only the skill file.

## Prompt to give the agent

Attach or place the ZIP in the Lean repository, then send this prompt:

> Read `START_HERE.md` inside the attached
> `formalization-faithfulness-audit-kit.zip` and follow it as the entry point.
> Install and configure the complete audit package in this Lean repository for
> my source book or paper. Do not modify source documents, Lean theorem
> statements, imported definitions, or proofs. Verify the untouched package
> first, inspect the repository to infer its layout, run setup validation, and
> report what you configured and any information still required. Do not run a
> faithfulness audit until I explicitly request one.

The same text is available in `PROMPT_FOR_AGENT.txt` for easy forwarding.

## Instructions for the receiving agent

Read the following files in this order:

1. `START_HERE.md` for setup and operating boundaries.
2. `README.md` for package structure and commands.
3. `METHODOLOGY.md` for the canonical evidence and classification policy.
4. `REFERENCES.md` for the method's origin, attribution, and extensions.
5. `skill/formalization-faithfulness-audit/SKILL.md` for audit orchestration.
6. `audit.config.example.json` and `audit-task.example.json` before creating
   repository-specific configuration.

The role prompts, JSON schemas, semantic checklists, scripts, report template,
and tests are executable parts of the protocol. Do not replace them with a
summary or silently omit them.

## Setup procedure

Perform these steps from the target Lean repository root.

1. Extract the archive without editing it. Verify its distributed contents:

   ```bash
   cd formalization-faithfulness-audit-kit
   shasum -a 256 -c SHA256SUMS
   cd ..
   ```

2. Move or copy the complete extracted directory to
   `.faithfulness-audit` at the repository root. Do not leave a second active
   copy that could make framework discovery ambiguous.

3. Copy `.faithfulness-audit/audit.config.example.json` to
   `.faithfulness-audit/audit.config.json`.

4. Inspect the repository before editing the configuration. Locate its
   `lean-toolchain`, Lake manifest or lakefile, Lean source roots, target
   declarations, immutable source documents, and desired audit-output paths.
   Do not assume a particular book, task naming convention, or directory
   structure.

5. Configure repository-relative paths. Retain `checks/core.json`; add the
   numerical-analysis or floating-point profile only when relevant.

6. For Codex, install the repository-owned skill:

   ```bash
   python3 .faithfulness-audit/scripts/install_skill.py
   ```

   In another agent environment, treat the included `SKILL.md` as the
   orchestration specification and preserve the same role-isolation and input
   boundaries.

7. Create one `audit-task.json` per selected Lean declaration using
   `audit-task.example.json`. The user must identify, or approve, the selected
   source result. Record the exact source file, SHA-256, edition or version,
   page or theorem locator, target declaration, and audit-output directory.
   Never invent an uncertain source location.

8. Validate setup:

   ```bash
   python3 .faithfulness-audit/scripts/check_setup.py
   ```

9. Report the installed location, discovered task IDs, selected checklist
   profiles, source hashes, and any unresolved information. For a setup-only
   request, stop here.

## Running an audit later

After setup succeeds, the researcher can request a task directly:

```text
Use $formalization-faithfulness-audit to audit CH03-THM07.
```

For a non-Codex agent:

```text
Read .faithfulness-audit/START_HERE.md and follow the included skill and
methodology to run a fresh faithfulness audit for CH03-THM07.
```

Replace `CH03-THM07` with the configured task ID. A request naming a source
group may run the batch protocol described in the skill.

## Non-negotiable audit boundaries

- Audit statements; do not repair or rewrite them during an audit.
- Treat the exact source document and elaborated Lean environment as primary
  evidence. Context notes are not authoritative.
- Keep source extraction independent from Lean material.
- Keep blind translation free of source identity, source text, target source,
  proof text, repository context, prior judgments, and inherited conversation.
- Run each role in a fresh stateless agent or clean session.
- Let only the orchestrator write audit artifacts; validate role JSON before
  another role consumes it.
- Inspect every local declaration that contributes semantic meaning to the
  target, including relevant imported definitions.
- Decide both implication directions. Extra hypotheses and restricted domains
  reduce applicability; they do not automatically make a theorem stronger.
- Record actual model and runtime provenance when exposed. Never guess it.
- Preserve prior runs as history, and rerun when a controlled statement,
  source, relevant definition, prompt, schema, checklist, or script changes.
- Commit or push only with explicit authorization.

`METHODOLOGY.md` is authoritative if a shorter operational instruction appears
ambiguous. Stop and report a blocker rather than weakening isolation or
provenance requirements silently.
