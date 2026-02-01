WITH CTE AS(

SELECT canal, 

fecha_operacion,

SUM(total_cliente) AS total_banco

FROM conciliacion_bancaria c

GROUP BY fecha_operacion, canal

ORDER BY fecha_operacion

),
