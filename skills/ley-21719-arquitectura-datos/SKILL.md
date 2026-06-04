---
name: ley-21719-arquitectura-datos
description: Revisa sistemas, modelos de datos, documentacion, APIs, planillas y decisiones tecnicas frente a la Ley 21.719 de Chile. Usa esta skill para identificar datos personales, RUT/email/telefono como identificadores, datos sensibles, riesgos en logs/exportaciones/proveedores, retencion, derechos de titulares, tokenizacion, anonimizacion, privacidad por diseno y evidencia tecnica. No reemplaza asesoria legal.
---

# Ley 21.719: Arquitectura de Datos Personales

Usa esta skill para traducir la Ley 21.719 de Chile a revision tecnica de
sistemas, datos y arquitectura.

Objetivo:

> Ayudar a equipos tecnicos a encontrar donde existen datos personales, como se
> tratan, que riesgos tecnicos aparecen y que cambios de arquitectura podrian
> reducir exposicion y mejorar evidencia de cumplimiento.

Limite: esta skill no entrega asesoria legal ni declara cumplimiento. Clasifica
riesgos tecnicos y senala puntos que requieren validacion juridica o de DPO.

## Flujo

1. Identifica el artefacto revisado:
   - esquema SQL, ORM, migraciones, APIs, JSON, CSV, planillas, logs, README,
     arquitectura, contratos tecnicos, proveedores o codigo.
2. Clasifica datos personales:
   - identificadores directos;
   - identificadores tecnicos;
   - atributos personales;
   - datos sensibles;
   - categorias especiales de datos personales;
   - documentos o archivos con datos personales;
   - proveedores o transferencias.
3. Evalua el tratamiento:
   - finalidad declarada o inferida;
   - base legal declarada o ausente;
   - minimizacion;
   - retencion;
   - acceso y trazabilidad;
   - derechos de titulares;
   - deber de informacion y transparencia;
   - privacidad desde el diseno y por defecto;
   - evaluacion de impacto cuando existan tratamientos de mayor riesgo;
   - decisiones automatizadas, perfilamiento y logica aplicada;
   - exportaciones, logs, respaldos e integraciones.
4. Detecta patrones de riesgo:
   - RUT, email o telefono como primary key;
   - datos personales replicados en multiples sistemas;
   - planillas o reportes sin control;
   - logs con datos personales;
   - datos sensibles sin controles reforzados;
   - proveedores sin rol, finalidad ni destino de datos claro;
   - ausencia de eliminacion, bloqueo o portabilidad.
5. Recomienda patrones tecnicos:
   - `person_id` interno no significativo;
   - datos personales como atributos gobernados;
   - tokenizacion reversible bajo control;
   - anonimizacion real para analytics cuando corresponda;
   - cifrado en reposo/transito;
   - auditoria de acceso;
   - retencion, bloqueo y eliminacion por finalidad;
   - contratos y controles para encargados/proveedores.
6. Entrega salida accionable:
   - hallazgos priorizados;
   - evidencia por archivo/campo/tabla/flujo;
   - riesgo bajo/medio/alto;
   - recomendacion tecnica;
   - punto de validacion legal si aplica.

## Referencias

Carga solo lo necesario:

- `references/principios.md`: principios tecnicos derivados de la ley.
- `references/taxonomia-datos-personales.md`: tipos de datos a detectar.
- `references/patrones-arquitectura.md`: patrones recomendados.
- `references/tokenizacion-anonimizacion.md`: cuando tokenizar, cifrar o anonimizar.
- `references/retencion-derechos.md`: retencion, supresion, bloqueo y portabilidad.
- `references/proveedores-transferencias.md`: encargados, terceros y transferencias.

## Plantillas

Usa estas plantillas cuando el usuario pida un entregable:

- `templates/checklist-tecnico.md`
- `templates/inventario-datos-personales.csv`
- `templates/matriz-riesgo.md`
- `templates/reporte-diagnostico.md`

## Scanner

Para busquedas iniciales en archivos de texto, usa:

```powershell
.\skills\ley-21719-arquitectura-datos\scripts\find-personal-data-patterns.ps1 -Path . -Recurse
```

No imprimas datos personales en respuestas salvo que el usuario lo pida
explicitamente y exista un motivo controlado. Prefiere archivo, linea, tipo de
patron y recomendacion.

## Criterios de severidad

Alto:

- datos sensibles expuestos o sin controles claros;
- categorias especiales sin reglas especificas: ninos, ninas y adolescentes,
  geolocalizacion, biometria, salud o perfil biologico;
- RUT/email/telefono como primary key en sistemas compartidos;
- datos personales en logs, exports o planillas sin control;
- proveedor externo con acceso a datos sin finalidad, contrato o destino claro;
- ausencia de capacidad tecnica para localizar, eliminar, bloquear o exportar datos.

Medio:

- datos personales duplicados en varios sistemas;
- campos personales sin retencion definida;
- finalidad o base legal no documentada;
- informacion de transparencia incompleta: responsable, politica, contacto,
  categorias, destinatarios, fuente, retencion o decisiones automatizadas;
- acceso amplio sin trazabilidad suficiente;
- analytics con datos identificables cuando podria usar agregacion o anonimizacion.

Bajo:

- datos personales necesarios, con finalidad clara, controles razonables y evidencia;
- identificadores internos no significativos;
- acceso limitado, trazabilidad, retencion y procedimientos definidos.

## Formato de respuesta recomendado

```text
Hallazgos
- [Alto] Tabla customers usa rut como primary key. Evidencia: schema.sql:12.
  Riesgo: expone un identificador personal como llave tecnica y facilita replicacion.
  Recomendacion: migrar a person_id interno y dejar rut como atributo gobernado.

Preguntas para validar
- Cual es la finalidad del campo fecha_nacimiento?
- Existe plazo de retencion para postulantes rechazados?

Siguiente paso
- Completar inventario de tratamientos y definir arquitectura objetivo para datos
  personales criticos.
```
