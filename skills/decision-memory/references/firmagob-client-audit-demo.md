# Demo De Auditoría De Repositorio: firmagob-client

This bilingual demo shows how `decision-memory` can audit a public repository and
propose an ADR structure before creating files.

Esta demo bilingüe muestra cómo `decision-memory` puede auditar un repositorio público y
proponer una estructura ADR antes de crear archivos.

Target repositories / Repositorios objetivo:

- <https://github.com/ltorresu82/firmagob-client>
- <https://github.com/ltorresu82/firmagob-client-examples>

## Prompt

```text
Usa decision-memory para auditar este repositorio público y proponer memoria durable.
No edites archivos todavía.

Entrega:
- candidatos a ADR aceptado;
- candidatos pendientes;
- ADRs existentes que deberían actualizarse;
- decisiones que no requieren ADR;
- evidencia por archivo y razón;
- estructura sugerida de docs/adr/.
```

English version:

```text
Use decision-memory to audit this public repository and propose durable decision memory.
Do not edit files yet.

Return accepted ADR candidates, pending candidates, existing ADR updates, no-ADR items,
evidence paths, rationale and a suggested docs/adr/ structure.
```

## Audit Report / Reporte De Auditoría

```text
Accepted ADR candidates / Candidatos a ADR aceptado

1. Public generic package scope
   Alcance público y genérico del paquete
   Evidence / Evidencia:
   - AGENTS.md
   - README.md
   - package.json
   Reason / Razón:
   The package is intended for any Chilean public institution enabled to use FirmaGob.
   Future examples, tests and docs must not introduce private client names, internal
   project names, real RUNs, non-public documents or institution-specific evidence.
   Suggested action / Acción sugerida:
   Create ADR-0001-public-generic-package-scope.md.

2. Official FirmaGob sources are contract authority
   Las fuentes oficiales de FirmaGob son la autoridad contractual
   Evidence / Evidencia:
   - README.md, "Fuentes oficiales"
   Reason / Razón:
   The README says official Gobierno Digital docs and examples prevail if they diverge
   from this package. Future work needs to preserve that source-of-truth rule.
   Suggested action / Acción sugerida:
   Create ADR-0002-official-firmagob-sources-authority.md.

3. Credentials and real evidence stay outside the repository
   Credenciales y evidencia real quedan fuera del repositorio
   Evidence / Evidencia:
   - AGENTS.md
   - docs/credentials.md
   - examples/sign-hash-sandbox.js
   - firmagob-client-examples/.env.example
   Reason / Razón:
   Public examples and validation flows depend on environment variables. Real secrets,
   tokens, RUNs, signed documents and productive responses must not be committed or
   printed as evidence.
   Suggested action / Acción sugerida:
   Create ADR-0003-externalized-credentials-and-evidence.md.

4. Runtime dependencies require explicit justification
   Las dependencias runtime requieren justificación explícita
   Evidence / Evidencia:
   - AGENTS.md
   - package.json
   - README.md
   Reason / Razón:
   The package is positioned as a lightweight TypeScript client without runtime
   dependencies. Adding a runtime dependency changes package risk, maintenance and
   transitive supply-chain exposure.
   Suggested action / Acción sugerida:
   Create ADR-0004-runtime-dependencies-require-justification.md.

5. Hash signing is the recommended PDF integration flow
   Firma por hash es el flujo recomendado para integración PDF
   Evidence / Evidencia:
   - README.md
   - docs/credentials.md
   - src/firmagob-client.ts
   - src/pdf-external-signature.ts
   Reason / Razón:
   The package supports signing hashes and externally embedding PKCS#7 signatures into
   PDFs. The docs also note that PDFs over 5 MB should use hash signing.
   Suggested action / Acción sugerida:
   Create ADR-0005-hash-signing-for-pdf-integration.md.

Pending candidates / Candidatos pendientes

1. Separate package and runnable demos into distinct repositories
   Separar paquete y demos ejecutables en repositorios distintos
   Evidence / Evidencia:
   - README.md links firmagob-client-examples
   - firmagob-client-examples/README.md
   Reason / Razón:
   This separation is visible and useful, but an audit should confirm whether it is a
   deliberate long-term boundary or just current packaging.
   Suggested action / Acción sugerida:
   Keep in docs/adr/README.md under "Pending candidates".

2. Demo stack uses Hono + Angular + Node CLI
   El stack demo usa Hono + Angular + Node CLI
   Evidence / Evidencia:
   - firmagob-client-examples/README.md
   - firmagob-client-examples/package.json
   Reason / Razón:
   This is currently an example implementation choice. It may not be a durable
   architecture decision unless the examples repo commits to maintaining those stacks as
   canonical integration paths.
   Suggested action / Acción sugerida:
   Keep as pending candidate or implementation documentation, not accepted ADR yet.

No ADR / No requiere ADR

1. Individual test helper names and local fixture structure.
   Nombres de helpers de test y estructura local de fixtures.
   Reason / Razón:
   Implementation details unless they change public API, security posture or package
   ownership.

2. Minor README copy, badge order or local script naming.
   Copy menor del README, orden de badges o nombres locales de scripts.
   Reason / Razón:
   They do not affect future architecture, contracts or repo memory.
```

## Suggested ADR Structure / Estructura ADR Sugerida

`decision-memory` should preserve any existing ADR location. If the repo has no ADRs,
the default recommendation is `docs/adr/`.

`decision-memory` debe respetar la ubicación ADR existente. Si el repo no tiene ADRs, la
recomendación por defecto es `docs/adr/`.

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

## Example ADR Index / Ejemplo De Índice ADR

````md
# Architecture Decision Records

This directory stores durable technical decisions for `firmagob-client`.

Este directorio almacena decisiones técnicas durables de `firmagob-client`.

## When To Create Or Update An ADR

Create or update an ADR when a decision affects package contracts, public API,
security posture, credential handling, runtime dependencies, source-of-truth rules or
future integration boundaries.

Crea o actualiza un ADR cuando una decisión afecte contratos del paquete, API pública,
seguridad, manejo de credenciales, dependencias runtime, fuentes de verdad o fronteras
de integración futuras.

Cutoff question / Pregunta de corte:

> If another agent or maintainer changes this area in two months, would they need to
> know this decision to avoid breaking the architecture?
>
> Si otro agente o mantenedor cambia esta área en dos meses, ¿necesita conocer esta
> decisión para no romper la arquitectura?

## Format / Formato

```md
# ADR-0001: Decision title

## Status

Accepted

## Context

Why this decision exists.

## Decision

What has been decided.

## Consequences

What future work must respect.
```

## Index / Índice

- [ADR-0001: Public Generic Package Scope](ADR-0001-public-generic-package-scope.md)
- [ADR-0002: Official FirmaGob Sources Are Contract Authority](ADR-0002-official-firmagob-sources-authority.md)
- [ADR-0003: Credentials And Real Evidence Stay Outside The Repository](ADR-0003-externalized-credentials-and-evidence.md)
- [ADR-0004: Runtime Dependencies Require Explicit Justification](ADR-0004-runtime-dependencies-require-justification.md)
- [ADR-0005: Hash Signing Is The Recommended PDF Integration Flow](ADR-0005-hash-signing-for-pdf-integration.md)

## Pending Candidates / Candidatos Pendientes

- Separate package and runnable demos into distinct repositories.
- Treat Hono + Angular + Node CLI as canonical demo stack.
````

## Example ADR Draft / Ejemplo De ADR

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

Spanish-only repos can use the same structure with Spanish headings:

```md
# ADR-0001: Alcance Público Y Genérico Del Paquete

## Estado

Aceptado

## Contexto

...

## Decisión

...

## Consecuencias

...
```

The audit intentionally produces a report first. ADR files should be created only after
the maintainer reviews which candidates are genuinely accepted decisions.

La auditoría produce primero un reporte. Los archivos ADR deberían crearse solo después
de que el mantenedor revise qué candidatos son decisiones realmente aceptadas.
