# Repository Decision Audit Demo: firmagob-client

This example shows how `decision-memory` can audit a public repository before creating
any ADR files.

Target repositories:

- <https://github.com/ltorresu82/firmagob-client>
- <https://github.com/ltorresu82/firmagob-client-examples>

Prompt:

```text
Use decision-memory to audit this public package repo and propose durable decision
memory. Do not edit files.

Return accepted ADR candidates, pending candidates, existing ADR updates and no-ADR
items, with evidence paths and rationale.
```

Example audit output:

```text
Accepted ADR candidates

1. Keep the package public and institution-neutral
   Evidence:
   - AGENTS.md
   - README.md
   - package.json
   Reason:
   The package is intended for any Chilean public institution enabled to use FirmaGob.
   Future examples, tests and docs must not introduce private client names, internal
   project names, real RUNs, non-public documents or institution-specific evidence.
   Suggested action:
   Create ADR: Public generic scope for firmagob-client.

2. FirmaGob official sources prevail over package behavior
   Evidence:
   - README.md, "Fuentes oficiales"
   Reason:
   The package documents that official Gobierno Digital documentation and examples are
   authoritative when they diverge from this package. Future changes need to preserve
   that source-of-truth rule.
   Suggested action:
   Create ADR: Official FirmaGob documentation is the contract authority.

3. Credentials stay outside the repository
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
   Create ADR: FirmaGob credentials and evidence are externalized.

4. The package keeps zero runtime dependencies by default
   Evidence:
   - AGENTS.md
   - package.json
   - README.md
   Reason:
   The package positions itself as a lightweight TypeScript client without runtime
   dependencies. Adding a runtime dependency changes package risk, maintenance and
   transitive supply-chain exposure.
   Suggested action:
   Create ADR: Runtime dependencies require explicit technical justification.

5. Firma por hash is the primary integration path for PDFs
   Evidence:
   - README.md
   - docs/credentials.md
   - src/firmagob-client.ts
   - src/pdf-external-signature.ts
   Reason:
   The package supports signing hashes and externally embedding PKCS#7 signatures into
   PDFs. The docs also note that PDFs over 5 MB should use hash signing.
   Suggested action:
   Create ADR: Hash signing is the recommended PDF integration flow.

Pending candidates

1. Separate package and runnable demos into distinct repositories
   Evidence:
   - README.md links firmagob-client-examples
   - firmagob-client-examples/README.md
   Reason:
   This separation is visible and useful, but an audit should confirm whether it is a
   deliberate long-term boundary or just current packaging.
   Suggested action:
   Leave as candidate until the maintainer accepts it as durable policy.

2. Demo stack uses Hono + Angular + Node CLI
   Evidence:
   - firmagob-client-examples/README.md
   - firmagob-client-examples/package.json
   Reason:
   This is currently an example implementation choice. It may not be a durable
   architecture decision unless the examples repo commits to maintaining those stacks as
   canonical integration paths.
   Suggested action:
   Pending candidate or implementation documentation, not accepted ADR yet.

No ADR

1. Individual test helper names and local fixture structure
   Reason:
   These are implementation details unless they change public API, security posture or
   package ownership.

2. Minor README copy, badge order or local script naming
   Reason:
   These do not affect future architecture, contracts or repo memory.
```

The audit intentionally produces a report first. ADR files should be created only after
the maintainer reviews which candidates are genuinely accepted decisions.
