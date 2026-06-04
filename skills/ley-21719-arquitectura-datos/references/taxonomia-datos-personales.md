# Taxonomia de datos personales

Usa esta taxonomia para revisar modelos, APIs, planillas, logs y documentos.

## Como usar esta taxonomia

No partas buscando solo RUT, email o telefono. Parte preguntando:

- que permite identificar directa o indirectamente a una persona;
- que atributo describe a una persona;
- que documento, log, ticket, reporte o proveedor contiene datos personales;
- que combinacion de campos permite reidentificar;
- que datos tienen reglas especiales por sensibilidad, edad, finalidad o contexto.

RUT, email y telefono son senales fuertes en Chile, pero el tratamiento de datos
personales incluye mucho mas.

## Identificadores directos

- RUT.
- Numero de documento.
- Nombre y apellido.
- Email.
- Telefono.
- Direccion.
- Firma.
- Patente asociada a una persona.
- Identificador de credencial o cuenta nominativa.

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
- Historial academico.
- Historial laboral.
- Relaciones familiares o cargas.
- Reclamos, solicitudes o interacciones de soporte.
- Imagen, voz o grabaciones.

Riesgo tipico: combinaciones que permiten reidentificar aunque no exista RUT o email.

## Datos sensibles

- Salud.
- Biometria.
- Datos geneticos.
- Vida sexual.
- Orientacion sexual.
- Identidad de genero.
- Creencias religiosas.
- Opinion politica.
- Afiliacion sindical.
- Afiliacion gremial.
- Origen racial o etnico.
- Situacion socioeconomica.
- Convicciones ideologicas o filosoficas.
- Perfil biologico humano.

Requieren controles reforzados y revision juridica mas estricta.

## Categorias especiales de datos personales

No todo dato especialmente regulado es necesariamente "dato sensible" en todos los
casos. En auditorias tecnicas, separa estas categorias para no mezclar reglas:

- Datos personales de ninos, ninas y adolescentes.
- Datos personales sensibles de adolescentes menores de dieciseis anos.
- Datos de geolocalizacion.
- Datos con fines historicos, estadisticos, cientificos, de estudios o
  investigacion.

Riesgo tipico: tratarlos como datos comunes y no levantar finalidad, autorizacion,
medidas especificas, anonimizar publicaciones o evaluar riesgos.

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
- Prompts y respuestas de IA.
- Transcripciones de llamadas.
- Archivos OCR.
- Correos electronicos.
- Repositorios documentales.

Riesgo tipico: los equipos no los consideran "sistema", pero tambien son tratamiento de
datos personales.
