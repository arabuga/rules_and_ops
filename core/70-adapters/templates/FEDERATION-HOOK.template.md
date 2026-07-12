# Federation Hook — {{PROJECT_NAME}}

> **Status:** {{STATUS}}
> **Hook version:** v0.1 - {{DATE}} - Operator: {{OPERATOR}}.

## What this repo is

{{PROJECT_SUMMARY}}

This repository is a member of a governance frame: rules descend from the
frame home; this hook is the entry marker and holds only local facts.
Human-layer language of this repo: {{HUMAN_LAYER_LANG}}.

## Read-first order (fail-closed)

Any agent entering this repo reads, in order, BEFORE acting:

1. This hook (you are here).
2. `AGENTS.md` — hard rules digest and map.
3. {{PROJECT_ENTRY_DOCS}} — project-specific entry documents, if any.
4. `memory/README.md` — memory layer; then `memory/activeContext.md`.

An agent that has not read the chain does not act.

## Authority

The human operator decides; agents prepare. Merges to main, rule changes and
status changes are human-gated. Fact-rule divergences are surfaced as
observations, never silently "fixed".

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
