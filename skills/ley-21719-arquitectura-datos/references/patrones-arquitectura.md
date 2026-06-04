# Patrones de arquitectura

## ID interno no significativo

Evita usar datos personales como primary key. Esto incluye RUT, email, telefono,
numero de documento, direccion, patente u otros identificadores personales. Usa un
identificador interno:

```text
person_id
customer_id
subject_id
```

El ID interno no debe revelar informacion de la persona ni depender de un dato personal.

## Datos personales como atributos gobernados

Modelo recomendado:

```text
person_id -> identidad tecnica
rut       -> atributo personal gobernado
email     -> atributo personal gobernado
telefono  -> atributo personal gobernado
nombre    -> atributo personal gobernado
```

Los sistemas deberian pedir atributos personales solo cuando exista necesidad, finalidad
y autorizacion operacional.

## Boveda de datos personales

Una boveda central puede concentrar atributos de alto riesgo y entregar a otros sistemas
tokens o vistas minimizadas.

Uso recomendado:

- RUT, email y telefono usados por muchos sistemas.
- Datos sensibles.
- Documentos, archivos OCR, tickets, grabaciones o texto libre con datos personales.
- Datos de NNA, geolocalizacion, perfilamiento o decisiones automatizadas.
- Integraciones con proveedores.
- Procesos que requieren auditoria de acceso.

No todo sistema necesita una boveda completa. Para empresas pequenas puede bastar
inventario, controles de acceso, retencion y minimizacion.

## Tokenizacion

Tokenizar reemplaza un dato por un token. Si el token puede resolverse para recuperar el
dato o vincularlo a la persona, sigue siendo dato personal.

Valor tecnico:

- reduce exposicion;
- limita copias;
- permite auditoria de resolucion;
- separa sistemas operacionales del dato real;
- facilita rotacion y controles.

## Analytics con minimizacion

Para analytics, usar datos agregados o anonimizados cuando el objetivo no requiere
identificar personas.

Evita:

- dashboards con RUT o email;
- eventos con nombres o telefonos;
- prompts de IA con datos personales sin minimizacion;
- tickets o transcripciones indexadas sin clasificacion;
- exportar bases completas a BI;
- usar identificadores persistentes sin control.

## Auditoria de acceso

Registra accesos relevantes:

- quien accedio;
- a que dato o categoria;
- en que sistema;
- con que finalidad operacional;
- cuando;
- resultado.

No conviertas logs de auditoria en otra fuente de exposicion. Minimiza y protege esos
logs.
