#!/usr/bin/env bash
# Anthril — Utilities Plugin Welcome Hook (SessionStart)

read -r -d '' MESSAGE <<'EOF'
Anthril — Utilities plugin loaded.

Skills:
  - /plan-completion-audit   Audit a plan file vs implementation.
  - /audit-resolver          Close the audit -> fix loop on a prior report.
  - /changelog-generator     Generate a CHANGELOG section from recent commits.
  - /pr-description-writer   Draft a PR description from the branch diff.
  - /env-var-auditor         Audit env-var usage and surface drift.
  - /doc-link-validator      Validate internal + external links in docs.
  - /repo-snapshot           Produce a structured snapshot of repo state.

Commands:
  - /utilities:audit-resolve  Chain plan-completion-audit -> audit-resolver.
EOF

# Emit a SessionStart system message JSON event.
ESCAPED=$(printf '%s' "$MESSAGE" | python -c 'import json,sys;print(json.dumps(sys.stdin.read()))')
printf '{"systemMessage": %s}\n' "$ESCAPED"
