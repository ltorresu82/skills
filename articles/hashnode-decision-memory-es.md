# Los agentes de código necesitan memoria durable, no solo contexto

**Subtitle:** Cómo usar ADRs y memoria versionada del repo para que las decisiones arquitectónicas no queden perdidas en chats de agentes.

**Canonical URL:** https://github.com/ltorresu82/skills/blob/main/articles/decision-memory-es.md

**Tags sugeridos:** AI, Software Architecture, Open Source, Developer Tools

---

Cuando trabajamos con agentes de código, es normal pensar primero en contexto:
archivos relevantes, instrucciones del proyecto, historial de la conversación,
errores recientes, logs, planes y pruebas.

Todo eso ayuda al agente a resolver la tarea actual.

Pero hay un problema distinto que aparece rápido en repos reales: algunas decisiones
técnicas no deberían vivir solo en el chat.

Si una decisión cambia una frontera de servicio, define qué sistema es fuente de
verdad, fija un contrato de API, decide un runtime productivo o establece una
política técnica como "no usar fallbacks silenciosos", esa decisión afecta el trabajo
futuro. No basta con que el agente actual la entienda. El repositorio también debe
recordarla.

Ahí entra la idea de memoria durable del repo.

## El problema

Un agente puede recordar contexto durante una sesión. Incluso puede tener memoria
privada entre sesiones, dependiendo de la herramienta. Pero esa memoria no siempre es:

- visible para el equipo;
- revisable en pull requests;
- versionada junto al código;
- portable entre herramientas;
- explícita sobre qué decisiones están aceptadas y cuáles siguen en evaluación.

Eso importa porque muchas decisiones técnicas condicionan cambios futuros.

Por ejemplo:

- "Este servicio es la fuente de verdad del workflow".
- "Esta API es la única frontera válida para herramientas de agentes".
- "Si falta configuración obligatoria, el sistema debe fallar claro".
- "El entorno local debe activarse con un perfil explícito".
- "Esta integración es candidata, pero todavía no está aceptada".

Si esas reglas quedan solo en una conversación, el próximo desarrollador o agente puede
volver a discutirlas, duplicarlas o romperlas sin saberlo.

## ADRs como memoria del repositorio

Una forma simple de resolverlo es usar ADRs: Architecture Decision Records.

Un ADR no tiene que ser largo. De hecho, mientras más corto y concreto, mejor. Su valor
está en registrar:

- qué decisión se tomó;
- por qué era necesaria;
- qué consecuencias debe respetar el trabajo futuro;
- si está aceptada, propuesta, pendiente o reemplazada.

La pregunta de corte que uso es esta:

> Si otro agente o desarrollador toca esta parte en dos meses, ¿necesita conocer esta
> decisión para no romper la arquitectura?

Si la respuesta es sí, probablemente debe vivir como ADR, actualización de ADR o
candidato pendiente.

Si la respuesta es no, probablemente basta con código, tests o documentación de
implementación.

## No todo merece un ADR

El objetivo no es documentar todo.

Cambiar el texto de un botón, refactorizar una función local o ajustar un detalle visual
normalmente no necesita un ADR. Son cambios importantes para el producto, pero no
necesariamente gobiernan decisiones futuras de arquitectura.

En cambio, mover la fuente de verdad de un workflow desde un servicio backend hacia
constantes del frontend sí debería encender una alerta. Eso cambia ownership, contratos
y expectativas futuras. Si ya existía una decisión previa, no basta con editar código:
hay que actualizarla o reemplazarla explícitamente.

La memoria durable no busca generar burocracia. Busca evitar que decisiones importantes
queden invisibles.

## Qué hace Decision Memory

Decision Memory es un skill open source para agentes de código. Su trabajo es ayudar al
agente a decidir si una decisión técnica debe:

- crear un ADR;
- actualizar un ADR existente;
- reemplazar una decisión previa;
- quedar como candidata pendiente;
- o mantenerse como documentación de implementación.

La idea no es que el agente escriba más documentación por defecto. La idea es que, cuando
detecte una decisión durable, ayude a moverla desde memoria temporal hacia memoria
versionada del repositorio.

También ayuda a detectar señales de deuda técnica oculta:

- fallbacks silenciosos;
- configuración inventada por defecto;
- mocks o no-ops en runtime productivo;
- decisiones temporales sin criterio de salida;
- duplicación de reglas de dominio entre frontend y backend.

## Memoria de agente vs memoria de repo

La memoria del agente sigue siendo útil. Sirve para preferencias, patrones recurrentes,
comandos habituales y contexto operativo.

Pero las decisiones arquitectónicas deberían estar donde el equipo pueda revisarlas:
en el repositorio.

Una división práctica es:

- memoria del agente para preferencias y hábitos de trabajo;
- instrucciones del repo para reglas operativas del agente;
- ADRs para decisiones técnicas que condicionan arquitectura futura;
- documentación de implementación para detalles locales;
- candidatos pendientes para ideas relevantes que todavía no están validadas.

Esa separación reduce ambigüedad. También permite que distintas herramientas lean el
mismo repositorio sin depender de la memoria privada de una sesión o de un proveedor.

## Ejemplo de uso

Una pregunta útil para un agente sería:

```text
Usa decision-memory para evaluar esta decisión:
mover la fuente de verdad del workflow desde el backend hacia constantes del frontend.

No edites archivos. Clasifica si requiere un nuevo ADR, actualizar un ADR existente,
reemplazar una decisión previa o quedar como documentación de implementación.
```

Una respuesta esperada sería:

```text
Clasificación: requiere ADR o actualización de ADR existente.

Razón: cambia la fuente de verdad, el ownership del dominio y el contrato entre backend
y frontend. Futuros cambios necesitarán conocer esta decisión para no reconstruir estados
paralelos ni romper la arquitectura.
```

## Proyecto

El skill está publicado como open source:

- GitHub: <https://github.com/ltorresu82/skills>
- skills.sh: <https://www.skills.sh/ltorresu82/skills/decision-memory>

Instalación:

```bash
npx skills add ltorresu82/skills --skill decision-memory
```

La tesis es simple: los agentes de código no necesitan solo más contexto. Necesitan mejor
memoria. Y las decisiones que gobiernan el futuro de un sistema deberían vivir cerca del
código, versionadas y visibles para humanos y agentes.
