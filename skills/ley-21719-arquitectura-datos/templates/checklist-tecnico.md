# Checklist tecnico Ley 21.719

## Inventario

- [ ] Sabemos que sistemas tratan datos personales.
- [ ] Sabemos que planillas, reportes y dashboards contienen datos personales.
- [ ] Sabemos que proveedores acceden o procesan datos personales.
- [ ] Tenemos identificadas las categorias de datos personales y sensibles.

## Identificadores

- [ ] RUT no se usa como primary key.
- [ ] Email no se usa como primary key.
- [ ] Telefono no se usa como primary key.
- [ ] Existe un identificador interno no significativo (`person_id`, `customer_id` u otro).
- [ ] Los identificadores personales son atributos gobernados.

## Finalidad y minimizacion

- [ ] Cada dato tiene finalidad documentada.
- [ ] Cada tratamiento tiene base legal identificada.
- [ ] Los formularios no piden datos innecesarios.
- [ ] Los logs no guardan payloads con datos personales sin necesidad.
- [ ] Los reportes y exports aplican minimizacion.

## Seguridad y trazabilidad

- [ ] Hay control de acceso por rol o necesidad.
- [ ] Los datos sensibles tienen controles reforzados.
- [ ] Existe auditoria de accesos relevantes.
- [ ] Los respaldos y dumps estan controlados.
- [ ] Hay protocolo de brechas de seguridad.

## Retencion y derechos

- [ ] Hay plazos o criterios de retencion por finalidad.
- [ ] Existe proceso para supresion.
- [ ] Existe proceso para bloqueo temporal.
- [ ] Existe proceso para portabilidad.
- [ ] Se puede localizar a una persona en sistemas relevantes.

## Proveedores

- [ ] Existe inventario de proveedores que tratan datos personales.
- [ ] Se conoce pais de tratamiento/almacenamiento.
- [ ] Hay contratos o anexos de tratamiento de datos.
- [ ] Se conocen subencargados relevantes.
- [ ] Se puede pedir eliminacion/bloqueo al proveedor.

## IA y automatizacion

- [ ] No se envian datos personales a modelos IA sin finalidad y control.
- [ ] Prompts, respuestas y logs de IA se revisan como tratamiento de datos.
- [ ] Decisiones automatizadas que afecten personas estan identificadas.
- [ ] Hay supervision humana cuando corresponde.
