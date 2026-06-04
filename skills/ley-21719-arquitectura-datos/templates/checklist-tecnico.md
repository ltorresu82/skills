# Checklist tecnico Ley 21.719

## Inventario

- [ ] Sabemos que sistemas tratan datos personales.
- [ ] Sabemos que planillas, reportes y dashboards contienen datos personales.
- [ ] Sabemos que proveedores acceden o procesan datos personales.
- [ ] Tenemos identificadas las categorias de datos personales y sensibles.
- [ ] Tenemos identificadas categorias especiales: NNA, geolocalizacion, biometria,
      salud, perfil biologico, fines historicos/estadisticos/cientificos.

## Datos y artefactos

- [ ] RUT no se usa como primary key.
- [ ] Email no se usa como primary key.
- [ ] Telefono no se usa como primary key.
- [ ] Ningun dato personal se usa como primary key o identificador tecnico compartido
      sin justificacion.
- [ ] Existe un identificador interno no significativo (`person_id`, `customer_id` u otro).
- [ ] Los identificadores personales son atributos gobernados.
- [ ] Documentos, adjuntos, OCR, tickets, correos, grabaciones y texto libre estan
      incluidos en el inventario.
- [ ] Logs, trazas, backups, dumps, CSV, Excel y BI estan incluidos en el inventario.

## Finalidad y minimizacion

- [ ] Cada dato tiene finalidad documentada.
- [ ] Cada tratamiento tiene base legal identificada.
- [ ] Los formularios no piden datos innecesarios.
- [ ] Los logs no guardan payloads con datos personales sin necesidad.
- [ ] Los reportes y exports aplican minimizacion.
- [ ] Las APIs y dashboards aplican proteccion de datos desde el diseno y por defecto.

## Transparencia

- [ ] Existe politica de tratamiento con fecha y version.
- [ ] Estan identificados responsable, representante y canal de contacto.
- [ ] Estan publicadas o disponibles categorias de datos, finalidades, base de
      legitimidad, destinatarios y fuente.
- [ ] Se informa periodo de conservacion.
- [ ] Se informa el canal para ejercer derechos y reclamar ante la Agencia.
- [ ] Se informa retiro del consentimiento cuando aplica.
- [ ] Se informa logica y consecuencias de decisiones automatizadas cuando existan.

## Seguridad y trazabilidad

- [ ] Hay control de acceso por rol o necesidad.
- [ ] Los datos sensibles tienen controles reforzados.
- [ ] Existe auditoria de accesos relevantes.
- [ ] Los respaldos y dumps estan controlados.
- [ ] Hay protocolo de brechas de seguridad.

## Retencion y derechos

- [ ] Hay plazos o criterios de retencion por finalidad.
- [ ] Existe proceso para acceso.
- [ ] Existe proceso para rectificacion.
- [ ] Existe proceso para supresion.
- [ ] Existe proceso para oposicion.
- [ ] Existe proceso para bloqueo temporal.
- [ ] Existe proceso para portabilidad.
- [ ] Se puede localizar a una persona en sistemas relevantes.

## Proveedores

- [ ] Existe inventario de proveedores que tratan datos personales.
- [ ] Se conoce pais de tratamiento/almacenamiento.
- [ ] Existe evidencia de nivel adecuado, garantias o autorizacion para transferencias
      internacionales cuando corresponda.
- [ ] Hay contratos o anexos de tratamiento de datos.
- [ ] Se conocen subencargados relevantes.
- [ ] Se puede pedir eliminacion/bloqueo al proveedor.

## IA y automatizacion

- [ ] No se envian datos personales a modelos IA sin finalidad y control.
- [ ] Prompts, respuestas y logs de IA se revisan como tratamiento de datos.
- [ ] Decisiones automatizadas que afecten personas estan identificadas.
- [ ] Perfilamiento y logica aplicada estan documentados cuando corresponda.
- [ ] Hay supervision humana cuando corresponde.

## Evaluacion de impacto

- [ ] Tratamientos de alto riesgo estan identificados.
- [ ] Datos sensibles y categorias especiales tienen evaluacion de riesgos.
- [ ] Medidas de mitigacion estan documentadas.
- [ ] Pendientes de criterio de Agencia quedan marcados para validacion legal/DPO.
