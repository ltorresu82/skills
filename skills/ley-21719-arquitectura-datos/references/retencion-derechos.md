# Retencion y derechos de titulares

## Retencion

No conservar datos personales indefinidamente sin finalidad. Cada tratamiento deberia
tener:

- finalidad;
- base legal;
- plazo o criterio de conservacion;
- accion al terminar la finalidad;
- responsable;
- evidencia.

Acciones posibles:

- eliminar;
- anonimizar;
- bloquear temporalmente;
- conservar por obligacion legal;
- restringir acceso.

## Supresion

La supresion requiere capacidad tecnica para ubicar los datos de una persona en sistemas,
planillas, documentos, respaldos operacionales y proveedores relevantes.

Riesgo tecnico: sistemas que no pueden buscar por `person_id` o que dependen de RUT/email
como identificador disperso.

## Bloqueo

El bloqueo limita temporalmente el tratamiento mientras se resuelve una disputa,
solicitud o condicion. Tecnologicamente puede requerir:

- flags de estado;
- reglas de autorizacion;
- exclusion de procesos batch;
- exclusion de marketing;
- bloqueo de transferencias.

## Portabilidad

La portabilidad exige entregar datos en formato estructurado y legible por maquina
cuando corresponda. Revisa si el sistema puede:

- localizar datos por persona;
- exportar datos sin incluir informacion de terceros;
- distinguir datos entregables de datos internos;
- registrar la solicitud y respuesta.

## Acceso y rectificacion

Los sistemas deben poder responder que datos se tratan, con que finalidad y permitir
correccion de datos inexactos cuando proceda.

## Oposicion

El sistema debe poder registrar y aplicar oposiciones cuando proceda. En la practica
puede requerir excluir a la persona de marketing, perfilamiento, comunicaciones,
tratamientos basados en interes legitimo u otros procesos definidos por validacion
legal.

## Decisiones automatizadas y perfilamiento

Si existen decisiones automatizadas o perfilamiento, el inventario tecnico debe
registrar:

- sistema o modelo utilizado;
- datos de entrada;
- finalidad;
- logica general aplicada;
- consecuencias previstas para el titular;
- intervencion humana o canal de revision cuando corresponda;
- evidencia de pruebas, sesgos, versionado y monitoreo.

## Checklist tecnico minimo

- Existe `person_id` o identificador interno consistente?
- Se puede ubicar a la persona en todos los sistemas relevantes?
- Hay inventario de planillas y reportes?
- Los proveedores pueden ejecutar eliminacion/bloqueo?
- Existen plazos de retencion por finalidad?
- Hay evidencia de solicitudes y respuestas?
- Se puede aplicar oposicion cuando proceda?
- Se registran decisiones automatizadas y perfilamiento?
