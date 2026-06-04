# Matriz de riesgo tecnico

| ID | Sistema | Hallazgo | Evidencia | Riesgo | Impacto | Probabilidad | Recomendacion | Responsable | Estado |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| R-001 | CRM | Email usado como identificador tecnico | `schema.sql:12` | Medio | Medio | Alta | Crear `person_id` interno y dejar email como atributo gobernado | TI | Abierto |

## Criterios

Alto:

- datos sensibles sin controles claros;
- RUT/email/telefono como llave tecnica compartida;
- datos personales en logs, exports o proveedores sin control;
- no existe forma de eliminar, bloquear o localizar datos.

Medio:

- finalidad o base legal no documentada;
- retencion indefinida;
- duplicidad de datos personales entre sistemas;
- acceso amplio sin auditoria suficiente.

Bajo:

- dato necesario, finalidad clara, controles razonables y evidencia disponible.
