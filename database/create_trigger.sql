CREATE TRIGGER before_insert_ventas
BEFORE INSERT ON Ventas
FOR EACH ROW
BEGIN
DECLARE precio DECIMAL(10, 2);
-- Obtener el precio_venta del producto
SELECT precio_venta INTO precio
FROM Productos
WHERE id = NEW.id_producto;
-- Asignar el precio obtenido al campo precio_unitario
SET NEW.precio_unitario = precio;

-- Calcular el total de la venta como precio_unitario * cantidad
SET NEW.total_venta = NEW.cantidad * precio;
END;