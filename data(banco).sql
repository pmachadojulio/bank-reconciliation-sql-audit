-- Nota: Cruzamos con los IDs de la tabla anterior (id_transaccion 1 al 50)
INSERT INTO banco_estado_cuenta (referencia_externa, monto_banco, fecha_banco, descripcion_banco) VALUES
(1, 150.50, '2026-01-01', 'TRF RECEP QR'),      -- OK
(2, 2500.00, '2026-01-01', 'VENTA POS'),        -- OK
-- (ID 3 falta a propósito: Transacción no procesada por el banco)
(4, 13.00, '2026-01-02', 'TRF RECEP QR'),       -- DISCREPANCIA: .01 de diferencia (12.99 vs 13.00)
(5, 85.00, '2026-01-02', 'VENTA POS'),          -- OK
(6, 1200.00, '2026-01-03', 'TRANSF RECIBIDA'),  -- OK (Fecha desfasada un día)
(7, 1500.75, '2026-01-03', 'VENTA POS'),        -- OK
(8, 890.00, '2026-01-04', 'TRANSF RECIBIDA'),   -- OK
(9, 210.00, '2026-01-04', 'VENTA POS'),         -- OK
(10, 55.50, '2026-01-04', 'TRF RECEP QR'),      -- OK
(NULL, 50.00, '2026-01-05', 'COMISION MANTENIMIENTO'), -- EXTRA: Cargo del banco que no tiene el cliente
(12, 4500.00, '2026-01-06', 'VENTA POS'),       -- OK
(13, 75.00, '2026-01-06', 'TRANSF RECIBIDA'),   -- OK
(14, 95.00, '2026-01-06', 'TRF RECEP QR'),      -- ERROR CANAL: En tu tabla es POS, aquí dice QR
(15, 220.40, '2026-01-07', 'TRF RECEP QR'),     -- OK
(16, 15.00, '2026-01-07', 'TRF RECEP QR'),      -- OK
(20, 130.00, '2026-01-08', 'VENTA POS'),        -- OK
(21, 88.00, '2026-01-08', 'TRF RECEP QR'),      -- OK
(22, 1100.00, '2026-01-08', 'VENTA POS'),       -- OK
(NULL, 10000.00, '2026-01-10', 'ERROR ABONO SISTEMA'); -- EXTRA: Un abono fantasma del banco