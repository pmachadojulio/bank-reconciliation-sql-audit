CREATE TABLE banco_estado_cuenta (
    id_banco SERIAL PRIMARY KEY,
    referencia_externa INT, -- Se cruzará con id_transaccion de la otra tabla
    monto_banco DECIMAL(12, 2),
    fecha_banco DATE,
    descripcion_banco VARCHAR(50)
);
