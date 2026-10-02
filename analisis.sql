
-- ANÁLISIS EXPLORATORIO DE DATOS (EDA) - E-COMMERCE

-- 1. Top 5 clientes por gasto total
-- Identificamos a los compradores de alto valor (VIP) para enfocar campañas 
-- de fidelización y retención, protegiendo así el 80% de los ingresos recurrentes.
SELECT 
    c.cliente_id,
    c.nombre,
    -- Usamos COALESCE para asegurar que ningún valor nulo distorsione la suma monetaria
    SUM(COALESCE(p.monto_total, p.cantidad * pr.precio, 0)) AS gasto_total
FROM clientes c
JOIN pedidos p ON c.cliente_id = p.cliente_id
JOIN productos pr ON p.producto_id = pr.producto_id
GROUP BY c.cliente_id, c.nombre
ORDER BY gasto_total DESC
LIMIT 5;


-- 2. Ventas totales por mes
-- Medimos la estacionalidad y el crecimiento intermensual para optimizar 
-- la planeación de inventarios y presupuestos de marketing de cara a los picos de demanda.
SELECT 
    TO_CHAR(p.fecha_pedido, 'YYYY-MM') AS mes,
    COUNT(p.pedido_id) AS total_pedidos,
    SUM(COALESCE(p.monto_total, 0)) AS ingresos_totales
FROM pedidos p
GROUP BY TO_CHAR(p.fecha_pedido, 'YYYY-MM')
ORDER BY mes ASC;


-- 3. Productos menos vendidos
-- Detectamos artículos de baja rotación para evaluar estrategias de liquidación 
-- (descuentos o combos) y liberar capital de trabajo inmovilizado en bodega.
SELECT 
    pr.producto_id,
    pr.nombre_producto,
    pr.categoria,
    COALESCE(SUM(p.cantidad), 0) AS unidades_vendidas
FROM productos pr
LEFT JOIN pedidos p ON pr.producto_id = p.producto_id
GROUP BY pr.producto_id, pr.nombre_producto, pr.categoria
ORDER BY unidades_vendidas ASC
LIMIT 3;


-- 4. Ranking de pedidos por categoría utilizando Window Functions (RANK)
-- Analizamos qué transacciones destacan económicamente dentro de cada categoría 
-- para entender qué tipo de producto impulsa la rentabilidad en cada sector.
SELECT 
    p.pedido_id,
    pr.categoria,
    pr.nombre_producto,
    COALESCE(p.monto_total, p.cantidad * pr.precio) AS monto_calculado,
    RANK() OVER (PARTITION BY pr.categoria ORDER BY COALESCE(p.monto_total, p.cantidad * pr.precio, 0) DESC) AS ranking_en_categoria
FROM pedidos p
JOIN productos pr ON p.producto_id = pr.producto_id;