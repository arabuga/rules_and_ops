# FRAME — the governance frame for AI-assisted projects

> Layer: `core/` (project-agnostic, English). This document is the top of the
> frame: what it is, how rules travel, who decides. Every other document in
> `core/` details one aspect of this frame.

## 1. Shape: one home, many member repositories

The frame separates two kinds of repositories:

- **Home** — the repository where the frame itself lives (its `core/` layer).
  Rules are written and versioned here, and only here.
- **Member repository** — a project repository that adopts the frame. It
  carries a small fixed set of files (hook, adapters, gates, memory seed) and
  follows the protocols; it does not host its own copy of the rulebook.

The home never edits a member repository. Adoption is performed by the
member's maintainer, following an onboarding instruction prepared as part of
the binding for that project.

## 2. Rule descent: three layers, one direction

Rules travel downward through exactly three layers:

1. **Home** (`core/` in the frame home) — the full rulebook: frame,
   codification, operational rules, memory spec, session protocol, gates,
   CI control, adapters.
2. **Hook** (`FEDERATION-HOOK.md` in the root of each member repository) — a
   short marker: what this repo is, its read-first order, its local facts
   (status, human-layer language, project-specific entry documents). The hook
   points at the rules; it restates only what is local.
3. **Adapters** (`AGENTS.md`, `CLAUDE.md`, optional tool-specific files) —
   pointers that make every AI tool read the hook first. **Adapters contain
   no rules.** A rule that exists only in an adapter is a defect.

State a rule once, in the home. Everywhere else: link, don't duplicate.

## 3. Flow upward: observations

Facts flow the opposite way, through an equally fixed channel:

1. An agent working in a member repository notices a divergence between fact
   and rule, or a gap in the rules.
2. It **surfaces** the divergence as an observation: a short record in the
   repo's journal or memory (session note, active context, decision-log
   candidate).
3. The **human operator judges**: accept the fact (change the rule), fix the
   fact, or record an allowed exception.

No agent silently "fixes" reality to match the rules, or rules to match
reality.

## 4. Honest statuses

Every participant (document, session, proposal, member repository) carries a
status, and **no participant raises its own status**:

- agents propose; statuses such as accepted, approved, merged are assigned by
  the human operator;
- a draft stays a draft until a recorded human decision says otherwise;
- a status change is a recorded event (decision log, session journal), never
  a silent edit.

## 5. Minimal vocabulary

| Term | Meaning |
|---|---|
| home | repository hosting the frame rulebook (`core/`) |
| member repo | project repository that adopted the frame |
| hook | root marker file with read-first order and local facts |
| adapter | tool-facing pointer file (no rules inside) |
| gate | machine or human check that blocks progress on failure |
| session | one unit of agent work: one branch, one registration, one note |

## 6. Principles

1. **Fail-closed read-first.** An agent that has not read the hook chain of
   the repo it works in does not act. Missing context stops work; it is never
   guessed.
2. **Surface, don't fix.** Divergences are observations for the operator,
   never silent repairs.
3. **Authority is human.** Merges, rule changes, status changes, layer moves —
   all human-gated. Agents draft and verify.
4. **Truth is the filesystem and git.** "It is done" means: the artifact
   exists, is committed, and its verification is recorded. Claims without
   artifacts do not count.
5. **Link, don't duplicate.** Memory and rules are short entries plus links;
   a duplicated rule forks and rots.
