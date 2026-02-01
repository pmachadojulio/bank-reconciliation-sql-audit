CREATE TABLE conciliacion_bancaria (
    id_transaccion SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    canal VARCHAR(20) CHECK (canal IN ('QR', 'POS', 'Transferencia')),
    total_cliente DECIMAL(12, 2) NOT NULL,
    fecha_operacion DATE DEFAULT CURRENT_DATE
);
