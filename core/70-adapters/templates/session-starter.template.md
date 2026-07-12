# {{STARTER_NAME}} — starter for session {{SESSION_ID}}

> Executor: worker agent (fresh context). Written by the orchestrator;
> launched by the operator. Branch: `session/{{DATE}}-{{TOPIC}}`.
> Locations outside this repository (donors, clones) are passed in the
> launch text, never written into this file.

## Boundaries

1. Execute the repo hook first (fail-closed), then this starter.
2. Files are written with file tools (Write/Edit); shell is read-only unless
   the launch text grants more.
3. Codification: LF, UTF-8, no BOM, no pictograms, no absolute disk paths in
   file content.
4. Commit rights: {{COMMIT_RIGHTS}} (see the repo's commit-rights decision).
5. Scope: the volume below, nothing beyond; divergences are surfaced in the
   handover, not fixed silently.

## Volume

1. {{VOLUME_ITEM_1}}
2. {{VOLUME_ITEM_2}}

## Handover

Session note in `memory/session-notes/` plus a final message, both carrying:
verification matrix (Artifact - Check - Expected - Actual - Pass), files
touched (with commit ids if commit rights existed), observations, what
remains for the operator, honest Complete/Partial status.
