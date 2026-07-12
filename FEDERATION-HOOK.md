# Federation Hook — rules_and_ops (governance frame home)

> **Status:** hook of the frame home itself (marker + rule-descent pointer).
> **Hook version:** v0.1 - 2026-07-12 - Operator: Vitalii.

## What this repo is

The **home of a reusable governance frame** for AI-assisted, multi-agent, multi-tool
software projects, plus its **binding to one concrete project** (see `project-familycode/`).
Two layers, strictly separated:

- `core/` — universal, project-agnostic frame (rules, protocols, gates, adapters,
  templates). This layer is the future **starter kit**: it must contain no names,
  paths, or facts of any concrete project.
- `project-familycode/` — the binding of `core/` to the target project. Everything
  project-specific lives ONLY here.

This repo does not modify the target project. The target project's maintainer applies
the binding by copying files listed in `project-familycode/ONBOARDING.md`.

## Read-first order (fail-closed)

Any agent entering this repo reads, in order, BEFORE acting:

1. This hook (you are here).
2. `AGENTS.md` — hard rules digest and map.
3. `core/` documents relevant to the task (codification, operational rules,
   session protocol — see the map in `AGENTS.md`).
4. `memory/README.md` — memory layer; then `memory/activeContext.md`.

An agent that has not read the chain does not act.

## Authority

The human operator decides; agents prepare. Rules changes, layer moves
(core <-> project), merges to `main`, and anything touching the target project
are human-gated. Fact-rule divergences are surfaced as observations, never
silently "fixed".

## Session protocol (applies to this repo from its first commit)

Work happens in session branches (`session/<date>-<topic>`); session start is
registered in `SESSIONS.md` on `main`; artifacts are committed to the session
branch immediately after creation; merge to `main` goes through a human-reviewed
pull request with the codification gate. Full protocol: `core/40-sessions/SESSION-PROTOCOL.md`.

## Codification duty

Before any handover, run the codification check (`githooks/check-codification.sh`,
activated via `git config core.hooksPath githooks`). LF, UTF-8, no BOM, no NUL,
no pictograms outside the allowlist, no absolute disk paths in file content.
