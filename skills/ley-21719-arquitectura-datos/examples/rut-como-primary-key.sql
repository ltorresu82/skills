-- Ejemplo intencionalmente riesgoso para diagnostico.
-- No usar como modelo recomendado.

CREATE TABLE clientes (
    rut VARCHAR(12) PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    nombre VARCHAR(200) NOT NULL,
    fecha_nacimiento DATE,
    direccion TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tickets_soporte (
    id BIGINT PRIMARY KEY,
    cliente_rut VARCHAR(12) NOT NULL REFERENCES clientes(rut),
    descripcion TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Riesgos esperados:
-- 1. RUT como primary key.
-- 2. Email y telefono como atributos personales sin gobierno explicito.
-- 3. Ticket de soporte puede contener texto libre con datos personales.
-- 4. No hay retencion ni bloqueo definidos.
