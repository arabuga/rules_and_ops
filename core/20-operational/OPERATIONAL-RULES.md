# OPERATIONAL RULES — how work is run

> Layer: `core/` (project-agnostic, English). Role-specific conduct is in
> `AGENT-CONDUCT.md` (same directory).

## 1. Surface, don't fix

A divergence between fact and rule — wrong status, stale link, contradictory
record, reality that outgrew the rulebook — is an observation for the human
operator, never a defect to repair silently. The observation is written down
(session note, active context, decision-log candidate) and left for judgment.

## 2. Authority is human

Human-gated, always:

- merge to the main branch;
- changes to rules and protocols;
- status changes (draft -> accepted, active -> merged, proposal verdicts);
- moving content between layers (core <-> project binding);
- anything that touches another repository.

Agents draft, verify and propose. The operator decides.

## 3. Session handover contract

A session that changed artifacts closes with a handover (session note plus
final message) containing at minimum:

- scope done / out of scope — honest and explicit;
- verification matrix: Artifact - Check - Expected - Actual - Pass;
- files touched (list; with commit ids where commit rights existed);
- observations: surfaced divergences, candidate decisions;
- status: Complete or Partial — stated honestly.

"Done" without a verification matrix is not done.

## 4. Secrets

- Secrets (tokens, keys, credentials, personal data) never enter the
  repository: not in files, not in commit messages, not in memory.
- Redaction-first: when quoting external material, redact before writing.
- Environment files (".env" and similar) stay untracked; commit templates
  with empty placeholders instead.

## 5. Truth is the filesystem and git

The state of the repository — files plus git history — is the only truth of
record. Agent claims, chat context and tool logs are hints, not truth.
Verification reads the filesystem, not the transcript.
