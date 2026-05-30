# Demo De Auditoría De Repositorio: firmagob-client

Esta demo muestra cómo `decision-memory` puede auditar un repositorio público y proponer
una estructura ADR antes de crear archivos.

Repositorios objetivo:

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

## Reporte De Auditoría

```text
Candidatos a ADR aceptado

1. Alcance público y genérico del paquete
   Evidencia:
   - AGENTS.md
   - README.md
   - package.json
   Razón:
   El paquete está pensado para cualquier institución pública chilena habilitada para
   usar FirmaGob. Los ejemplos, tests y documentación futuros no deben introducir
   nombres de clientes privados, proyectos internos, RUN reales, documentos no públicos
   ni evidencia específica de una institución.
   Acción sugerida:
   Crear ADR-0001-alcance-publico-generico-paquete.md.

2. Las fuentes oficiales de FirmaGob son la autoridad contractual
   Evidencia:
   - README.md, "Fuentes oficiales"
   Razón:
   El README declara que la documentación y ejemplos oficiales de Gobierno Digital
   prevalecen si divergen del paquete. El trabajo futuro debe preservar esa regla de
   fuente de verdad.
   Acción sugerida:
   Crear ADR-0002-fuentes-oficiales-firmagob-autoridad.md.

3. Credenciales y evidencia real quedan fuera del repositorio
   Evidencia:
   - AGENTS.md
   - docs/credentials.md
   - examples/sign-hash-sandbox.js
   - firmagob-client-examples/.env.example
   Razón:
   Los ejemplos públicos y flujos de validación dependen de variables de entorno. Los
   secretos reales, tokens, RUNs, documentos firmados y respuestas productivas no deben
   commitearse ni imprimirse como evidencia.
   Acción sugerida:
   Crear ADR-0003-credenciales-evidencia-externas.md.

4. Las dependencias runtime requieren justificación explícita
   Evidencia:
   - AGENTS.md
   - package.json
   - README.md
   Razón:
   El paquete se presenta como cliente TypeScript liviano sin dependencias runtime.
   Agregar una dependencia runtime cambia riesgo, mantención y exposición de cadena de
   suministro.
   Acción sugerida:
   Crear ADR-0004-dependencias-runtime-requieren-justificacion.md.

5. Firma por hash es el flujo recomendado para integración PDF
   Evidencia:
   - README.md
   - docs/credentials.md
   - src/firmagob-client.ts
   - src/pdf-external-signature.ts
   Razón:
   El paquete soporta firma de hashes e inyección externa de firmas PKCS#7 en PDFs. La
   documentación también indica que PDFs sobre 5 MB deben usar firma por hash.
   Acción sugerida:
   Crear ADR-0005-firma-por-hash-integracion-pdf.md.

Candidatos pendientes

1. Separar paquete y demos ejecutables en repositorios distintos
   Evidencia:
   - README.md enlaza firmagob-client-examples
   - firmagob-client-examples/README.md
   Razón:
   La separación es visible y útil, pero la auditoría debería confirmar si es una
   frontera deliberada de largo plazo o solo el empaquetado actual.
   Acción sugerida:
   Mantener en docs/adr/README.md bajo "Candidatos pendientes".

2. El stack demo usa Hono + Angular + Node CLI
   Evidencia:
   - firmagob-client-examples/README.md
   - firmagob-client-examples/package.json
   Razón:
   Hoy es una elección de implementación para ejemplos. No debería marcarse como ADR
   aceptado salvo que el repo de ejemplos decida mantener esos stacks como rutas
   canónicas de integración.
   Acción sugerida:
   Mantener como candidato pendiente o documentación de implementación.

No requiere ADR

1. Nombres de helpers de test y estructura local de fixtures.
   Razón:
   Son detalles de implementación salvo que cambien API pública, postura de seguridad u
   ownership del paquete.

2. Copy menor del README, orden de badges o nombres locales de scripts.
   Razón:
   No afectan arquitectura futura, contratos ni memoria durable del repo.
```

## Estructura ADR Sugerida

`decision-memory` debe respetar la ubicación ADR existente. Si el repo no tiene ADRs, la
recomendación por defecto es `docs/adr/`.

```text
docs/
  adr/
    README.md
    ADR-0001-alcance-publico-generico-paquete.md
    ADR-0002-fuentes-oficiales-firmagob-autoridad.md
    ADR-0003-credenciales-evidencia-externas.md
    ADR-0004-dependencias-runtime-requieren-justificacion.md
    ADR-0005-firma-por-hash-integracion-pdf.md
```

## Ejemplo De Índice ADR

````md
# Architecture Decision Records

Este directorio almacena decisiones técnicas durables de `firmagob-client`.

## Cuándo Crear O Actualizar Un ADR

Crea o actualiza un ADR cuando una decisión afecte contratos del paquete, API pública,
seguridad, manejo de credenciales, dependencias runtime, fuentes de verdad o fronteras
de integración futuras.

Pregunta de corte:

> Si otro agente o mantenedor cambia esta área en dos meses, ¿necesita conocer esta
> decisión para no romper la arquitectura?

## Formato

```md
# ADR-0001: Título De La Decisión

## Estado

Aceptado

## Contexto

Por qué existe esta decisión.

## Decisión

Qué se decidió.

## Consecuencias

Qué debe respetar el trabajo futuro.
```

## Índice

- [ADR-0001: Alcance Público Y Genérico Del Paquete](ADR-0001-alcance-publico-generico-paquete.md)
- [ADR-0002: Fuentes Oficiales De FirmaGob Como Autoridad](ADR-0002-fuentes-oficiales-firmagob-autoridad.md)
- [ADR-0003: Credenciales Y Evidencia Real Externas](ADR-0003-credenciales-evidencia-externas.md)
- [ADR-0004: Dependencias Runtime Con Justificación Explícita](ADR-0004-dependencias-runtime-requieren-justificacion.md)
- [ADR-0005: Firma Por Hash Para Integración PDF](ADR-0005-firma-por-hash-integracion-pdf.md)

## Candidatos Pendientes

- Separar paquete y demos ejecutables en repositorios distintos.
- Tratar Hono + Angular + Node CLI como stack canónico de demo.
````

## Ejemplo De ADR

```md
# ADR-0001: Alcance Público Y Genérico Del Paquete

## Estado

Aceptado

## Contexto

`firmagob-client` es un paquete TypeScript público para integrar con FirmaGob Chile.
Debe servir a cualquier institución pública chilena habilitada y no depender de contexto
privado de clientes.

## Decisión

El paquete, los ejemplos, tests y documentación se mantienen públicos y neutrales por
institución. Deben usar nombres genéricos y fuentes oficiales públicas. No deben incluir
nombres de clientes privados, proyectos internos, RUN reales, documentos no públicos ni
evidencia específica de una institución.

## Consecuencias

Los ejemplos se mantienen reutilizables y seguros de publicar. Cualquier detalle de
integración específico de una institución pertenece fuera del repositorio público. Si se
agrega accidentalmente información privada o real, debe eliminarse antes de publicar y
podría requerir limpieza de historial.
```

La auditoría produce primero un reporte. Los archivos ADR deberían crearse solo después
de que el mantenedor revise qué candidatos son decisiones realmente aceptadas.
