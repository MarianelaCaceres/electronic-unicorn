
-- Tabla Clientes
CREATE TABLE Clientes (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
edad INT NOT NULL,
genero ENUM('Masculino', 'Femenino') NOT NULL,
direccion VARCHAR(255) NOT NULL,
ciudad VARCHAR(100) NOT NULL,
provincia VARCHAR(100) NOT NULL,
pais VARCHAR(100) NOT NULL,
codigo_postal VARCHAR(10) NOT NULL
);

-- Tabla Productos
CREATE TABLE Productos (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre_producto VARCHAR(100) NOT NULL,
categoria VARCHAR(50) NOT NULL,
tipo VARCHAR(50) NOT NULL,
stock INT NOT NULL,
descripcion TEXT NOT NULL,
marca VARCHAR(50),
precio_costo DECIMAL(10, 2) NOT NULL,
precio_venta DECIMAL(10, 2) AS (precio_costo * 1.25) STORED
);

-- Tabla Ventas
CREATE TABLE Ventas (
id INT AUTO_INCREMENT PRIMARY KEY,
fecha_venta DATE NOT NULL,
id_producto INT NOT NULL,
id_cliente INT NOT NULL,
cantidad INT NOT NULL,
precio_unitario DECIMAL(10, 2),
total_venta DECIMAL(10, 2),
forma_de_pago ENUM('Efectivo', 'Tarjeta', 'Transferencia') NOT NULL,
FOREIGN KEY (id_producto) REFERENCES Productos(id),
FOREIGN KEY (id_cliente) REFERENCES Clientes(id)
);
