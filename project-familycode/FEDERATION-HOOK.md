# Federation Hook — familycode

> **Status:** pre-analysis; substantive work blocked by the project's own
> decision `DEC-001` (mandatory documentation-control stage, awaiting owner
> inputs). This governance frame is delivered as the candidate inputs for
> that stage.
> **Hook version:** v0.1 - 2026-07-13 - Operator: project owner (familycode).

## What this repo is

FamilyCode: a technology-independent concept of a comprehensive intelligent
family support system. A documentation-first project: the repository is the
durable project memory; models, analyses and decisions live in `docs/`.

This repository is a member of a governance frame: rules descend from the
frame home (the rules_and_ops package); this hook is the entry marker and
holds only local facts. Human-layer language of this repo: Russian
(machine layer: English).

## Read-first order (fail-closed)

Any agent entering this repo reads, in order, BEFORE acting:

1. This hook (you are here).
2. `AGENTS.md` — hard rules digest and map.
3. `PROJECT_CONTEXT.md` — project context bootstrap (canonical documents,
   current model packages, fixed principles, working rules).
4. `docs/workbench/decisions/DEC-001-documentation-control-gate-v1.0.md` —
   the active blocker: what is forbidden and allowed until the stage is done.
5. `docs/workbench/reviews/REV-002-session-context-and-artifact-inventory-v0.1.md`
   — active context and artifact inventory.
6. `memory/README.md` — memory layer; then `memory/activeContext.md`.

An agent that has not read the chain does not act.

## Authority

The human owner of the project decides; agents prepare. Merges to main, rule
changes, status changes (draft / validated / approved) and lifting `DEC-001`
are human-gated. Fact-rule divergences are surfaced as observations, never
silently "fixed". `validated` is not `approved` (project working rule).

## Session protocol

Work happens in session branches (`session/<date>-<topic>`); session start is
registered in `SESSIONS.md` on main BEFORE work; artifacts are committed to
the session branch immediately after creation; merge to main goes through a
human-reviewed pull request with the codification gate.

## Codification duty

Before any handover, run the codification check
(`githooks/check-codification.sh`, activated once via
`git config core.hooksPath githooks`). LF, UTF-8, no BOM, no NUL, no
pictograms outside the allowlist, no absolute disk paths in file content.
Historical files are not rewritten in bulk: a violation surfacing on first
edit is fixed or allowlisted with a recorded decision.
