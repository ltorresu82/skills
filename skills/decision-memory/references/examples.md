# Decision Memory Examples

## Accepted ADR

User request:

> We already decided that the notification service owns all functional email and in-app
> notifications. Capture it.

Action:

- Review existing docs and code for evidence.
- Create an accepted ADR if the decision is already current.
- State that business services publish notification intent and do not send email
  directly.

## Candidate

User request:

> Maybe we should move background jobs from cron to a workflow engine.

Action:

- Do not create an accepted ADR.
- Add a pending candidate or proposed ADR.
- Record the decision still needing validation, including evaluation criteria.

## No ADR

User request:

> Fix the button label and align the icon.

Action:

- Do not create an ADR.
- This is a UI implementation detail unless it changes a design-system policy.

## Update Existing ADR

User request:

> The API gateway still owns public routing, but we added an explicit exception for one
> internal callback path.

Action:

- Update the existing gateway/routing ADR.
- Do not create a duplicate ADR.
- Add consequences and constraints for the exception.

## Supersede

User request:

> We no longer use Provider A for embeddings. Provider access now goes through the AI
> gateway only.

Action:

- Find the old provider decision.
- Create a new ADR or update status according to repo convention.
- Mark the old ADR as superseded and link the replacement.

## Repository Decision Audit

User request:

> Audit this public package repo and propose initial ADRs. Do not edit files.

Action:

- Read repo guidance, README, package metadata, docs and high-signal source files.
- Return a report before creating ADRs.
- Separate accepted ADR candidates from pending candidates and implementation details.

Example output shape:

```text
Accepted ADR candidates

1. Public generic package scope
   Evidence: AGENTS.md, README.md, package.json
   Reason: future changes must not introduce private institutions, client-specific
   names or non-public evidence.
   Suggested action: create ADR.

2. Credentials stay outside the repository
   Evidence: AGENTS.md, docs/credentials.md, examples/*.env docs
   Reason: affects security posture, examples, validation flow and public repo safety.
   Suggested action: create ADR.

Pending candidates

1. Runtime dependency policy
   Evidence: AGENTS.md says runtime dependencies require a clear technical reason.
   Reason: durable policy exists, but audit should confirm whether it has been applied
   consistently before marking it accepted.
   Suggested action: candidate or proposed ADR.

No ADR

1. Test fixture names and local helper refactors.
   Reason: implementation details that do not change package contracts or ownership.
```

For concrete public-package examples with suggested ADR directory, README index,
accepted ADR drafts and pending candidates, see:

- `firmagob-client-audit-demo-en.md`
- `firmagob-client-audit-demo-es.md`
