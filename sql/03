CTE2 AS (

    SELECT 

        CASE 

            WHEN descripcion_banco LIKE '%QR%' THEN 'QR'

            WHEN descripcion_banco LIKE '%POS%' THEN 'POS'

            WHEN descripcion_banco LIKE '%TRANS%' THEN 'Transferencia'

            ELSE 'Otros'

        END AS canal_limpio, -- Esto convierte 'TRF RECEP QR' en simplemente 'QR'

        fecha_banco,

        SUM(monto_banco) AS total_banco_suma

    FROM banco_estado_cuenta

    GROUP BY fecha_banco, canal_limpio -- Agrupas por la versión limpia

)
