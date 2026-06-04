# Tokenizacion, cifrado y anonimizacion

## Tokenizacion

La tokenizacion reemplaza un dato personal por un token.

Ejemplo:

```text
rut real: 12.345.678-9
token: tok_person_8f31...
```

Si existe una boveda o tabla de resolucion que permite volver al dato real, el token
debe tratarse como dato personal o dato asociado a dato personal.

Sirve para:

- reducir exposicion en sistemas secundarios;
- evitar que RUT/email/telefono viajen por integraciones;
- auditar resoluciones;
- controlar que sistemas pueden ver el dato real.

No sirve para:

- declarar que el dato deja de ser personal;
- evadir finalidad, base legal, retencion o derechos;
- reemplazar controles de acceso.

## Cifrado

El cifrado protege datos en reposo o transito. Es una medida de seguridad, no una
justificacion del tratamiento.

Un dato cifrado sigue siendo dato personal si la organizacion puede descifrarlo o
determinar a quien pertenece.

## Seudonimizacion

Reduce el vinculo directo con la identidad, pero permite reidentificacion bajo ciertas
condiciones. Ayuda a reducir riesgo, pero no elimina la aplicacion de proteccion de datos.

## Anonimizacion

Anonimizar significa que no sea razonablemente posible reidentificar a la persona,
considerando medios disponibles, contexto, combinacion de datos y destinatarios.

Errores comunes:

- quitar el nombre y dejar RUT;
- quitar RUT pero dejar email;
- dejar combinaciones unicas como comuna + edad + cargo + empresa;
- publicar datasets pequenos con atributos muy especificos;
- anonimizar una vez y luego cruzar con nuevas fuentes.

## Regla practica

- Para operar con una persona: usa ID interno o token.
- Para contactar o verificar identidad: resuelve el dato real con control y auditoria.
- Para analytics: agrega, minimiza o anonimiza.
- Para seguridad: cifra y controla accesos.
- Para cumplimiento: documenta finalidad, base legal, retencion y evidencia.
