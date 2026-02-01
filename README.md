# 🏦 Sistema de Conciliación Bancaria Automatizada con SQL

## 📝 Descripción del Proyecto
Este proyecto simula un escenario real de auditoría financiera. El objetivo es identificar discrepancias entre los registros internos de una empresa (`conciliacion_bancaria`) y el estado de cuenta proporcionado por el banco (`banco_estado_cuenta`).

El enfoque principal fue resolver problemas comunes de datos como:
- Transacciones presentes en un sistema pero no en el otro.
- Diferencias de céntimos por redondeos.
- Falta de una llave primaria (ID) consistente entre ambos sistemas.

## 🛠️ Tecnologías Utilizadas
- **Base de Datos:** PostgreSQL
- **Lenguaje:** SQL (DML, DDL)

## 🧠 Desafíos Lógicos y Soluciones SQL

### 1. El Problema de los Datos No Estructurados
Las descripciones del banco eran textos largos (ej. 'TRF RECEP QR'), mientras que el sistema interno usaba categorías simples ('QR'). 
- **Solución:** Utilicé la sentencia `CASE WHEN` con el operador `LIKE` para crear un **Traductor de Canales** y estandarizar la información antes del cruce.



### 2. La "Explosión" de Registros
Al intentar unir tablas por montos duplicados en una misma fecha, se generaban duplicidades (Producto Cartesiano).
- **Solución:** Implementé **CTEs (Common Table Expressions)** para agrupar y sumar los totales por día y canal antes de realizar el JOIN, asegurando una comparación 1 a 1 de flujos de caja.

### 3. Integridad Total (No perder datos)
Un `INNER JOIN` normal ocultaba las comisiones bancarias no registradas.
- **Solución:** Utilicé `FULL OUTER JOIN` combinado con `COALESCE` para garantizar que el reporte muestre el 100% de los movimientos, marcando con `NULL` donde falta información pero manteniendo el cálculo de la diferencia financiera.



## 🚀 Cómo ejecutarlo
1. Ejecuta el archivo `schema.sql` para crear la estructura.
2. Carga los datos ficticios con `data.sql`.
3. Corre las consultas en `analysis.sql` para ver los resultados de la auditoría.

## 📈 Próximos Pasos (Roadmap)
- [ ] Implementar detección de duplicados por ventana de tiempo.
- [ ] Crear una función para automatizar la limpieza de strings.
- [ ] Generar un reporte de transacciones sospechosas (Fuzzy Matching).

---
**Autor:** Julio Machado 
**Objetivo:** Desarrollador de Datos / Analista SQL
