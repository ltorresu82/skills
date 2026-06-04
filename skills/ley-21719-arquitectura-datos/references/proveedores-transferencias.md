# Proveedores y transferencias

Los proveedores son parte del perimetro de tratamiento cuando acceden, procesan,
almacenan o reciben datos personales.

## Proveedores comunes

- Cloud.
- Hosting.
- CRM.
- ERP.
- Mesa de ayuda.
- Email marketing.
- Analitica.
- BI.
- OCR.
- IA generativa.
- Almacenamiento documental.
- Call center.
- Nomina y RRHH.

## Informacion a levantar

- Nombre del proveedor.
- Rol: encargado, tercero, responsable independiente u otro segun validacion legal.
- Datos tratados.
- Finalidad.
- Pais de almacenamiento/procesamiento.
- Si el pais u organizacion ofrece nivel adecuado de proteccion o que garantias
  existen.
- Subencargados.
- Medidas de seguridad.
- Retencion y devolucion/eliminacion al termino.
- Evidencia contractual.
- Contacto operacional.

## Riesgos tecnicos frecuentes

- Contratos genericos sin tratamiento de datos.
- Subprocesadores no conocidos.
- Datos enviados por correo o planillas.
- Logs o adjuntos con datos personales.
- Transferencias internacionales no mapeadas.
- Proveedores IA que reciben prompts con datos personales.
- Falta de proceso para eliminar o bloquear datos en sistemas externos.
- No poder acreditar por que una transferencia internacional es licita.

## Recomendacion de arquitectura

Reducir lo que se envia:

- usar `person_id` o token cuando sea suficiente;
- evitar RUT/email/telefono en integraciones si no son necesarios;
- enviar datos agregados o anonimizados para analytics;
- registrar cada flujo externo en el inventario;
- exigir capacidad de eliminacion, bloqueo y respuesta ante incidentes;
- mantener evidencia de garantias, autorizaciones o evaluacion de adecuacion cuando
  exista transferencia internacional.
