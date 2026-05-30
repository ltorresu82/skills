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
