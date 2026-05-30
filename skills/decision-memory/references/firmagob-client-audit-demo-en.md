# Repository Decision Audit Demo: firmagob-client

This demo shows how `decision-memory` can audit a public repository and propose an ADR
structure before creating files.

Target repositories:

- <https://github.com/ltorresu82/firmagob-client>
- <https://github.com/ltorresu82/firmagob-client-examples>

## Prompt

```text
Use decision-memory to audit this public repository and propose durable decision memory.
Do not edit files yet.

Return:
- accepted ADR candidates;
- pending candidates;
- existing ADRs that should be updated;
- decisions that do not require ADRs;
- evidence paths and rationale;
- suggested docs/adr/ structure.
```

## Audit Report

```text
Accepted ADR candidates

1. Public generic package scope
   Evidence:
   - AGENTS.md
   - README.md
   - package.json
   Reason:
   The package is intended for any Chilean public institution enabled to use FirmaGob.
   Future examples, tests and docs must not introduce private client names, internal
   project names, real RUNs, non-public documents or institution-specific evidence.
   Suggested action:
   Create ADR-0001-public-generic-package-scope.md.

2. Official FirmaGob sources are contract authority
   Evidence:
   - README.md, "Fuentes oficiales"
   Reason:
   The README says official Gobierno Digital docs and examples prevail if they diverge
   from this package. Future work needs to preserve that source-of-truth rule.
   Suggested action:
   Create ADR-0002-official-firmagob-sources-authority.md.

3. Credentials and real evidence stay outside the repository
   Evidence:
   - AGENTS.md
   - docs/credentials.md
   - examples/sign-hash-sandbox.js
   - firmagob-client-examples/.env.example
   Reason:
   Public examples and validation flows depend on environment variables. Real secrets,
   tokens, RUNs, signed documents and productive responses must not be committed or
   printed as evidence.
   Suggested action:
   Create ADR-0003-externalized-credentials-and-evidence.md.

4. Runtime dependencies require explicit justification
   Evidence:
   - AGENTS.md
   - package.json
   - README.md
   Reason:
   The package is positioned as a lightweight TypeScript client without runtime
   dependencies. Adding a runtime dependency changes package risk, maintenance and
   transitive supply-chain exposure.
   Suggested action:
   Create ADR-0004-runtime-dependencies-require-justification.md.

5. Hash signing is the recommended PDF integration flow
   Evidence:
   - README.md
   - docs/credentials.md
   - src/firmagob-client.ts
   - src/pdf-external-signature.ts
   Reason:
   The package supports signing hashes and externally embedding PKCS#7 signatures into
   PDFs. The docs also note that PDFs over 5 MB should use hash signing.
   Suggested action:
   Create ADR-0005-hash-signing-for-pdf-integration.md.

Pending candidates

1. Separate package and runnable demos into distinct repositories
   Evidence:
   - README.md links firmagob-client-examples
   - firmagob-client-examples/README.md
   Reason:
   This separation is visible and useful, but an audit should confirm whether it is a
   deliberate long-term boundary or just current packaging.
   Suggested action:
   Keep in docs/adr/README.md under "Pending candidates".

2. Demo stack uses Hono + Angular + Node CLI
   Evidence:
   - firmagob-client-examples/README.md
   - firmagob-client-examples/package.json
   Reason:
   This is currently an example implementation choice. It may not be a durable
   architecture decision unless the examples repo commits to maintaining those stacks as
   canonical integration paths.
   Suggested action:
   Keep as pending candidate or implementation documentation.

No ADR

1. Individual test helper names and local fixture structure.
   Reason:
   These are implementation details unless they change public API, security posture or
   package ownership.

2. Minor README copy, badge order or local script naming.
   Reason:
   They do not affect future architecture, contracts or repo memory.
```

## Suggested ADR Structure

`decision-memory` should preserve any existing ADR location. If the repo has no ADRs,
the default recommendation is `docs/adr/`.

```text
docs/
  adr/
    README.md
    ADR-0001-public-generic-package-scope.md
    ADR-0002-official-firmagob-sources-authority.md
    ADR-0003-externalized-credentials-and-evidence.md
    ADR-0004-runtime-dependencies-require-justification.md
    ADR-0005-hash-signing-for-pdf-integration.md
```

## Example ADR Index

````md
# Architecture Decision Records

This directory stores durable technical decisions for `firmagob-client`.

## When To Create Or Update An ADR

Create or update an ADR when a decision affects package contracts, public API,
security posture, credential handling, runtime dependencies, source-of-truth rules or
future integration boundaries.

Cutoff question:

> If another agent or maintainer changes this area in two months, would they need to
> know this decision to avoid breaking the architecture?

## Format

```md
# ADR-0001: Decision Title

## Status

Accepted

## Context

Why this decision exists.

## Decision

What has been decided.

## Consequences

What future work must respect.
```

## Index

- [ADR-0001: Public Generic Package Scope](ADR-0001-public-generic-package-scope.md)
- [ADR-0002: Official FirmaGob Sources Are Contract Authority](ADR-0002-official-firmagob-sources-authority.md)
- [ADR-0003: Credentials And Real Evidence Stay Outside The Repository](ADR-0003-externalized-credentials-and-evidence.md)
- [ADR-0004: Runtime Dependencies Require Explicit Justification](ADR-0004-runtime-dependencies-require-justification.md)
- [ADR-0005: Hash Signing Is The Recommended PDF Integration Flow](ADR-0005-hash-signing-for-pdf-integration.md)

## Pending Candidates

- Separate package and runnable demos into distinct repositories.
- Treat Hono + Angular + Node CLI as canonical demo stack.
````

## Example ADR

```md
# ADR-0001: Public Generic Package Scope

## Status

Accepted

## Context

`firmagob-client` is a public TypeScript package for integrating with FirmaGob Chile.
It should be usable by any enabled Chilean public institution and must not depend on
private client context.

## Decision

The package, examples, tests and documentation remain public and institution-neutral.
They must use generic names and public official sources. They must not include private
client names, internal project names, real RUNs, non-public documents or
institution-specific evidence.

## Consequences

Examples stay reusable and safe to publish. Any institution-specific integration detail
belongs outside the public repository. If private or real data is accidentally added, it
must be removed before publication and history cleanup may be required.
```

The audit intentionally produces a report first. ADR files should be created only after
the maintainer reviews which candidates are genuinely accepted decisions.
