# ADR Template

Use the repository's existing ADR format first. If none exists, this compact format is a
safe default.

```md
# ADR-0001: Decision title

## Status

Proposed | Accepted | Superseded

## Context

What problem, constraint, or recurring risk requires a durable decision?

## Decision

What is now true for future work? What direction is rejected or no longer allowed?

## Consequences

What improves? What tradeoffs, costs, migration work, or future constraints follow?
```

Optional additions when the repo already uses them:

- `Date`
- `Deciders`
- `Related`
- `Supersedes`
- `Superseded by`

Keep accepted ADRs evidence-based. If the decision is not yet validated, use `Proposed`
or leave it as a pending candidate.
