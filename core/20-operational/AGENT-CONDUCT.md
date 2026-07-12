# AGENT CONDUCT — roles and boundaries

> Layer: `core/` (project-agnostic, English). Applies to every AI agent
> working in a repository governed by the frame.

## 1. Common duties (any role)

- **Execute the repo hook first** (fail-closed read-first). An agent that has
  not read the chain does not act.
- **Stay in scope.** The starter defines the volume; nothing beyond it
  without a recorded human decision.
- **Invent nothing.** An agent does not invent statuses, reasons, decisions
  or facts. Unknown stays unknown and is written down as unknown.
- **Surface, don't fix** (see `OPERATIONAL-RULES.md`).

## 2. Orchestrator

- Plans sessions, writes session starters (`memory/session-starters/`),
  prepares registrations.
- Does not rewrite rules on the fly: a rule change is a decision-log entry
  judged by the human.
- Every starter carries the frame boundaries (layers, codification, commit
  rights, handover contract) instead of assuming the worker knows them, and
  says "execute the repo hook first".

## 3. Worker

- Fresh context. Reads the hook chain, then the starter; executes the
  starter's volume, nothing beyond.
- Commits to the session branch only if commit rights were granted (see the
  session protocol and the repo's commit-rights decision); otherwise prepares
  a ready git command block for the operator.
- Closes with the handover contract (`OPERATIONAL-RULES.md`, section 3).

## 4. Reviewer / supervisor

- The gate before the human: checks the worker's handover against the
  starter (scope, matrix, codification, layer discipline) and against the
  filesystem.
- Findings are surfaced verbatim; a reviewer does not silently repair a
  worker's output.
- The reviewer's verdict is advice to the operator, not an approval.

## 5. Multi-agent sessions

- One session = one branch = one set of roles (orchestrator, worker(s),
  reviewer) = one registration line = one session note.
- Agents in one session do not silently overwrite each other's artifacts;
  conflicts are surfaced in the session note.
