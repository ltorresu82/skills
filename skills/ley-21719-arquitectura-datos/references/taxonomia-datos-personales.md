# Taxonomia de datos personales

Usa esta taxonomia para revisar modelos, APIs, planillas, logs y documentos.

## Identificadores directos

- RUT.
- Numero de documento.
- Nombre y apellido.
- Email.
- Telefono.
- Direccion.
- Firma.

Riesgo tipico: usar un identificador directo como primary key, login universal o clave
de integracion.

## Identificadores tecnicos

- `user_id`.
- `person_id`.
- `customer_id`.
- `account_id`.
- `device_id`.
- `session_id`.
- IP.
- user agent.
- cookies.
- tokens de integracion.

Un identificador tecnico puede ser dato personal si permite identificar directa o
indirectamente a una persona.

## Atributos personales

- Fecha de nacimiento.
- Edad.
- Nacionalidad.
- Estado civil.
- Ocupacion.
- Cargo.
- Empresa.
- Comuna, region o ubicacion.
- Preferencias.
- Historial de compra o uso.

Riesgo tipico: combinaciones que permiten reidentificar aunque no exista RUT o email.

## Datos sensibles

- Salud.
- Biometria.
- Datos geneticos.
- Vida sexual.
- Creencias religiosas.
- Opinion politica.
- Afiliacion sindical.
- Origen racial o etnico.
- Datos de ninos, ninas y adolescentes.

Requieren controles reforzados y revision juridica mas estricta.

## Datos financieros, comerciales y laborales

- Deudas.
- Historial crediticio.
- Medios de pago.
- Remuneracion.
- Licencias medicas.
- Evaluaciones de desempeno.
- Asistencia.
- Postulaciones.
- Contratos.

Riesgo tipico: RRHH y finanzas suelen tener datos personales intensivos y multiples
proveedores.

## Documentos y archivos

- Cedulas.
- Pasaportes.
- CV.
- Contratos.
- Certificados.
- Fichas medicas.
- Grabaciones.
- Fotografias.
- PDFs escaneados.
- Adjuntos de correo.

Riesgo tipico: documentos almacenan muchos datos en texto libre u OCR, fuera del modelo
relacional principal.

## Artefactos tecnicos con datos personales

- Logs de aplicacion.
- Trazas distribuidas.
- Dumps de base de datos.
- Backups.
- CSV.
- Excel.
- Dashboards BI.
- Capturas de pantalla.
- Tickets de soporte.

Riesgo tipico: los equipos no los consideran "sistema", pero tambien son tratamiento de
datos personales.
