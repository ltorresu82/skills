# Principios tecnicos para Ley 21.719

Usa estos principios como lente tecnico. No reemplazan interpretacion legal.

## Licitud

Cada tratamiento debe tener una base legal documentada. En revision tecnica,
marca como riesgo cualquier dato personal recolectado o usado sin finalidad o base
legal visible.

Preguntas:

- Que dato se trata?
- Para que finalidad?
- Cual es la base legal?
- Donde queda evidencia?

## Finalidad

Un dato recolectado para una finalidad no deberia reutilizarse libremente para otra.
En arquitectura, evita bases compartidas o exports que permitan usos no trazados.

Preguntas:

- El sistema separa finalidades?
- Hay datos usados por BI, marketing, soporte o IA sin finalidad declarada?
- Los reportes conservan la finalidad original?

## Proporcionalidad y minimizacion

No recolectar ni conservar mas datos de los necesarios. En modelos de datos, cuestiona
campos "por si acaso", formularios excesivos y logs con payload completo.

## Calidad

Los datos deben ser correctos, actualizados y pertinentes. Evalua si existen fuentes
duplicadas, datos divergentes o ausencia de sincronizacion controlada.

## Transparencia

El titular debe poder entender quien trata sus datos, para que, por cuanto tiempo y
con quienes se comparten. Tecnologicamente, esto requiere inventario, trazabilidad y
versionado de politicas/consentimientos cuando corresponda.

Como minimo revisa si existe informacion publica o disponible sobre:

- politica de tratamiento, fecha y version;
- responsable, representante y canal de contacto;
- categorias de datos y universo de titulares;
- destinatarios o cesiones previstas;
- finalidades y base de legitimidad;
- medidas de seguridad;
- derechos de los titulares y canal para ejercerlos;
- transferencias internacionales;
- periodo de conservacion;
- fuente de los datos;
- retiro del consentimiento cuando aplica;
- decisiones automatizadas, perfilamiento, logica aplicada y consecuencias.

## Seguridad

Aplicar medidas tecnicas y organizativas proporcionales al riesgo:

- control de acceso;
- cifrado;
- auditoria;
- segregacion;
- gestion de secretos;
- respaldos;
- respuesta ante incidentes.

Seguridad no reemplaza privacidad. Un sistema cifrado igual puede tratar datos de forma
excesiva o sin finalidad.

## Proteccion desde el diseno y por defecto

Los sistemas deben aplicar medidas tecnicas y organizativas desde el diseno para que,
por defecto, solo se traten los datos personales especificos y estrictamente
necesarios para la actividad.

En revision tecnica, busca:

- formularios con campos innecesarios;
- APIs que retornan mas datos de los necesarios;
- permisos amplios por defecto;
- dashboards con identificadores directos;
- retencion indefinida;
- logs con payload completo.

## Evaluacion de impacto

Marca como candidato a evaluacion de impacto todo tratamiento de alto riesgo,
especialmente si involucra datos sensibles, categorias especiales, monitoreo,
perfilamiento, decisiones automatizadas, gran escala, tecnologias nuevas o
proveedores con transferencia internacional. La Agencia podra emitir criterios y
listas orientativas; hasta entonces, reporta la necesidad como punto de validacion
legal/DPO.

## Confidencialidad

Quienes acceden a datos personales deben mantener reserva. En sistemas, revisar roles,
permisos, exports, soporte, administradores, proveedores y trazas.

## Responsabilidad

La organizacion debe poder demostrar cumplimiento. En arquitectura, esto implica
evidencia: inventarios, decisiones, logs de acceso, retencion, solicitudes de titulares,
contratos de proveedores y controles verificables.
