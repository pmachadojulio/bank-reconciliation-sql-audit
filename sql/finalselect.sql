SELECT 
    COALESCE(c1.fecha_operacion, c2.fecha_banco) AS fecha_final,
    COALESCE(c1.canal, c2.canal_limpio) AS canal_final,
    c1.total_banco AS monto_sistema,
    c2.total_banco_suma AS monto_banco,
    (COALESCE(c1.total_banco, 0) - COALESCE(c2.total_banco_suma, 0)) AS diferencia
FROM CTE AS c1
FULL OUTER JOIN CTE2 AS c2 
    ON c2.canal_limpio = c1.canal 
    AND c2.fecha_banco = c1.fecha_operacion
ORDER BY fecha_final;
