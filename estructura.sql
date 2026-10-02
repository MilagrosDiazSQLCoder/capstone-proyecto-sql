
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;

-- Creación de tabla Clientes
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    fecha_registro DATE NOT NULL
);

-- Creación de tabla Productos
CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio NUMERIC(10, 2) NOT NULL
);

-- Creación de tabla Pedidos 
CREATE TABLE pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    producto_id INT REFERENCES productos(producto_id),
    cantidad INT,
    fecha_pedido DATE NOT NULL,
    monto_total NUMERIC(10, 2)
);

-- Inserción de Clientes
INSERT INTO clientes (nombre, email, fecha_registro) VALUES
('Ana Pérez', 'ana.perez@email.com', '2025-01-15'),
('Carlos Gómez', 'carlos.gomez@email.com', '2025-02-10'),
('Lucía Fernández', 'lucia.f@email.com', '2025-03-01'),
('Mateo Rodríguez', 'mateo.r@email.com', '2025-03-20'),
('Sofía Martínez', 'sofia.m@email.com', '2025-04-05');

-- Inserción de Productos
INSERT INTO productos (nombre_producto, categoria, precio) VALUES
('Laptop Pro 15"', 'Tecnología', 1200.00),
('Mouse Inalámbrico', 'Tecnología', 25.50),
('Silla Ergonomica', 'Hogar y Oficina', 250.00),
('Cafetera Automática', 'Hogar y Oficina', 99.99),
('Auriculares Bluetooth', 'Tecnología', 80.00),
('Mochila Impermeable', 'Accesorios', 45.00);

-- Inserción de Pedidos (Simulando nulos en cantidad o monto_total para limpieza con COALESCE)
INSERT INTO pedidos (cliente_id, producto_id, cantidad, fecha_pedido, monto_total) VALUES
(1, 1, 1, '2025-02-01', 1200.00),
(1, 2, 2, '2025-02-15', 51.00),
(2, 3, 1, '2025-02-20', 250.00),
(3, 4, NULL, '2025-03-05', 199.98), -- Cantidad nula, requiere COALESCE
(4, 5, 2, '2025-03-12', NULL),     -- Monto total nulo, requiere COALESCE
(5, 6, 1, '2025-04-01', 45.00),
(2, 1, 1, '2025-04-10', 1200.00),
(3, 2, 3, '2025-04-18', 76.50);