# MEMORY SPEC — repository memory layer

> Layer: `core/` (project-agnostic, English). The memory files themselves are
> written in the repo's human-layer language (recorded in the repo hook).

## 1. Purpose

Repository memory carries context across sessions, chats, tools and people.
It lives inside the repository and is versioned like everything else. Memory
is short entries plus links — never duplicated content ("link, don't
duplicate").

## 2. Standard structure (memory/)

| File / dir | Role |
|---|---|
| `README.md` | map of the memory layer (one screen) |
| `activeContext.md` | where we are now; open forks; newest date on top |
| `decisionLog.md` | decisions, D-series; judged by the human operator |
| `session-starters/` | task briefs written by the orchestrator for workers |
| `session-notes/` | session handovers (verification matrix mandatory) |

## 3. Decision-log discipline

- Format: D-NNN - date - decision - status.
- Status is assigned by the human operator (accepted / open / declined).
  Agents may append entries marked as proposed; a proposed entry binds
  no one until judged.
- A rule change without a decision entry is a defect (memory gate,
  see `core/50-gates/GATES-MAP.md`).

## 4. Lean profile

A repository may truncate the structure (for example, no starters directory
while a single human works alone). Every truncation is a recorded decision in
`decisionLog.md`. Restoring the full profile needs no decision.

## 5. Hygiene

- Newest first in `activeContext.md`; keep it about one screen.
- Session notes are named `<date>-<session-id>-<topic>.md`.
- Memory files obey codification: human-layer language, no absolute paths,
  no pictograms, LF / UTF-8 / no BOM.
