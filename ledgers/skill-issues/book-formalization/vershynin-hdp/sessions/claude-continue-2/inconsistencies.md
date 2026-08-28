# Inconsistencies — session claude-continue-2

Record skill, harness, prompt, gate, tool, or agent-process inconsistencies encountered in this scope. Use stable IDs; never delete history—mark superseded or closed entries.

| ID | Observed at | Surfaces compared | Inconsistency | Evidence | Risk | Status | Owner/next action |
|---|---|---|---|---|---|---|---|
| VHDP-S-CC2-I001 | 2026-08-28 | `gates/ch01.json` vs `gates/ch02.json` organization loops | Two gates in the same Lean worktree claimed different repository-wide organization state: Chapter 1 recorded `309/0/1/0`, while Chapter 2 recorded `0/0/0/0` and called the loop closed. | Direct JSON comparison and `tools/architecture/check_layout.py`; Chapter 2 had no organization report. | A per-unit gate could falsely close a shared repository condition. | closed | Chapter 2 now matches `309/0/1/0`; cross-gate organization preflight is part of generated prompts and Claude stop enforcement. |
