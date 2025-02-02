SELECT COUNT(id) FROM `tienda_online_electronic_unicorn`.`Ventas`;
SELECT *FROM `tienda_online_electronic_unicorn`.`Ventas`;

SELECT COUNT(distinct nombre) FROM `tienda_online_electronic_unicorn`.`Clientes`;

SELECT id, nombre_producto FROM `tienda_online_electronic_unicorn`.`Productos`
where id=10;

-- Ventas por clientes / JOIN tabla ventas y clientes

SELECT
    v.id AS id_venta,
    v.fecha_venta,
    p.nombre_producto,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    v.cantidad,
    v.precio_unitario,
    v.total_venta,
    v.forma_de_pago
FROM `tienda_online_electronic_unicorn`.Ventas v
JOIN Productos p ON v.id_producto = p.id
JOIN Clientes c ON v.id_cliente = c.id;

-- Clientes con Mayor Cantidad de Compras

SELECT c.nombre, c.apellido, COUNT(v.id) AS cantidad_compras
FROM Ventas v
JOIN Clientes c ON v.id_cliente = c.id
GROUP BY c.nombre, c.apellido
ORDER BY cantidad_compras DESC;

-- Total de Ventas por Producto

SELECT p.nombre_producto, SUM(v.total_venta) AS total_ingresos
FROM Ventas v
JOIN Productos p ON v.id_producto = p.id
GROUP BY p.nombre_producto
ORDER BY total_ingresos DESC;

-- Productos con Bajo Inventario

SELECT nombre_producto, stock
FROM Productos
WHERE stock < 100;

-- Pedidos con el mayor importe pagado

SELECT id,MAX(total_venta) FROM `tienda_online_electronic_unicorn`.`Ventas`
GROUP BY id
ORDER BY MAX(total_venta) DESC
LIMIT 10;

-- ¿Cuántos productos hay por categoria 'Electrónica'?

SELECT COUNT(*) AS categoria
FROM `tienda_online_electronic_unicorn`.`Productos`
WHERE categoria= 'Electrónica';
 
 -- ¿Cuántos productos hay por categoria 'Electrodomésticos''?

SELECT COUNT(*) AS categoria
FROM `tienda_online_electronic_unicorn`.`Productos`
WHERE categoria= 'Electrodomésticos';


 --  ¿Cuántos pagos se realizaron en `Efectivo`?
 
 SELECT COUNT(*) AS forma_de_pago
FROM `tienda_online_electronic_unicorn`.`Ventas`
WHERE forma_de_pago= 'Efectivo';

--  ¿Cuántos pagos se realizaron en `Transferencia`?
 
 SELECT COUNT(*) AS forma_de_pago
FROM `tienda_online_electronic_unicorn`.`Ventas`
WHERE forma_de_pago= 'Transferencia';

--  ¿Cuántos pagos se realizaron en `Tarjeta`?
 
 SELECT COUNT(*) AS forma_de_pago
FROM `tienda_online_electronic_unicorn`.`Ventas`
WHERE forma_de_pago= 'Tarjeta';

--  ¿Cuáles son las ventas de cada mes?

SELECT MONTH(fecha_venta) AS mes, 
SUM(total_venta) AS total
FROM `tienda_online_electronic_unicorn`.`Ventas`
GROUP BY 1
ORDER BY 1;

--  ¿Cuál es el producto más vendido?

SELECT p.nombre_producto,v.id_producto,
SUM(v.cantidad) AS total_vendido
FROM Ventas v
JOIN Productos p 
ON v.id_producto = p.id
GROUP BY v.id_producto, p.nombre_producto
ORDER BY total_vendido DESC
LIMIT 1;

-- ¿Cuál es la provincia con mayor venta?

SELECT c.provincia,
SUM(v.total_venta) AS total_ventas
FROM Ventas v
JOIN Clientes c 
ON v.id_cliente = c.id
GROUP BY c.provincia
ORDER BY total_ventas DESC
LIMIT 1;

-- ¿Cuál es la ciudad con mayor venta?

SELECT c.ciudad,
SUM(v.total_venta) AS total_ventas
FROM Ventas v
JOIN Clientes c 
ON v.id_cliente = c.id
GROUP BY c.ciudad
ORDER BY total_ventas DESC
LIMIT 1;

-- ¿Cuál es la producto con mayor rentabilidad?

SELECT p.nombre_producto AS producto,
SUM((v.precio_unitario - p.precio_costo) * v.cantidad) AS rentabilidad_total
FROM Ventas v
JOIN Productos p ON v.id_producto = p.id
GROUP BY p.id
ORDER BY rentabilidad_total DESC
LIMIT 1;

SELECT forma_de_pago
FROM `Ventas`;

SELECT YEAR(fecha_venta) AS año, 
SUM(total_venta) AS total
FROM `tienda_online_electronic_unicorn`.`Ventas`
GROUP BY 1
ORDER BY 1;

SELECT COUNT(*) AS pais
FROM `tienda_online_electronic_unicorn`.`clientes`
WHERE pais=`Paraguay`;

SELECT * FROM clientes
