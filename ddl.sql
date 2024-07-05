DROP DATABASE IF EXISTS garden;

CREATE DATABASE garden;

USE garden;

CREATE TABLE gama_producto (
    gama VARCHAR(50),
    descripcion_texto TEXT,
    descripcion_html TEXT,
    imagen VARCHAR(256),
    CONSTRAINT pk_idgama_gama PRIMARY KEY (gama)
);

CREATE TABLE oficina (
    codigo_oficina VARCHAR(10),
    ciudad VARCHAR(30),
    pais VARCHAR(50),
    region VARCHAR(50),
    codigo_postal VARCHAR(10),
    telefono VARCHAR(20),
    linea_direccion1 VARCHAR(50),
    linea_direccion2 VARCHAR(50),
    CONSTRAINT pk_idoficiona_oficina PRIMARY KEY (codigo_oficina)
);

CREATE TABLE producto (
    codigo_producto VARCHAR(15),
    nombre VARCHAR(70),
    gama VARCHAR(50),
    dimensiones VARCHAR(25),
    proveedor VARCHAR(50),
    descripcion TEXT,
    cantidad_en_stock SMALLINT(6),
    precio_venta DECIMAL(15,2),
    precio_proveedor DECIMAL(15,2),
    CONSTRAINT pk_idproducto_producto PRIMARY KEY (codigo_producto),
    CONSTRAINT fk_idgama_producto FOREIGN KEY (gama) REFERENCES gama_producto(gama)
);

CREATE TABLE empleado (
    codigo_empleado INT(11),
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    extension VARCHAR(10),
    email VARCHAR(100),
    codigo_oficina VARCHAR(10),
    codigo_jefe INT(11),
    puesto VARCHAR(50),
    CONSTRAINT pk_idempleado_empleado PRIMARY KEY (codigo_empleado),
    CONSTRAINT fk_idoficina_empleado FOREIGN KEY (codigo_oficina) REFERENCES oficina(codigo_oficina)
);

CREATE TABLE cliente (
    codigo_cliente INT(11),
    nombre_cliente VARCHAR(50),
    nombre_contacto VARCHAR(30),
    apellido_contacto VARCHAR(30),
    telefono VARCHAR(15),
    fax VARCHAR(15),
    linea_direccion1 VARCHAR(50),
    linea_direccion2 VARCHAR(50),
    ciudad VARCHAR(50),
    region VARCHAR(50),
    pais VARCHAR(50),
    codigo_postal VARCHAR(10),
    codigo_empleado_rep_ventas INT(11),
    limite_credito DECIMAL(15,2),
    CONSTRAINT pk_idcliente_cliente PRIMARY KEY (codigo_cliente),
    CONSTRAINT fk_idempleado_cliente FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES empleado(codigo_empleado)
);

CREATE TABLE pago (
    codigo_cliente INT(11),
    forma_pago VARCHAR(40),
    id_transaccion VARCHAR(50),
    fecha_pago DATE,
    total DECIMAL(15.2),
    CONSTRAINT pk_idtransaccion_pago PRIMARY KEY (id_transaccion),
    CONSTRAINT fk_idcliente_pago FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente)
);

CREATE TABLE pedido (
    codigo_pedido INT(11),
    fecha_pedido DATE,
    fecha_esperada DATE,
    fecha_entrega DATE,
    estado VARCHAR(15),
    comentarios TEXT,
    codigo_cliente INT(11),
    CONSTRAINT pk_idpedido_pedido PRIMARY KEY (codigo_pedido),
    CONSTRAINT fk_idcliente_pedido FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente)
);

CREATE TABLE detalle_pedido (
    codigo_pedido INT(11),
    codigo_producto VARCHAR(15),
    cantidad INT(11),
    precio_unidad DECIMAL(15,2),
    numero_linea SMALLINT(6),
    CONSTRAINT pk_id_detalle_pedido PRIMARY KEY (codigo_pedido, codigo_producto),
    CONSTRAINT fk_idproducto_detalle_pedido FOREIGN KEY (codigo_producto) REFERENCES producto(codigo_producto),
    CONSTRAINT fk_idpedido_detalle_pedido FOREIGN KEY (codigo_pedido) REFERENCES pedido(codigo_pedido)
);

INSERT INTO gama_producto(gama, descripcion_texto, descripcion_html, imagen)
VALUES ('Gama1', 'Descripción de la Gama 1 en texto', '<p>Descripción de la Gama 1 en HTML</p>', 'gama1.jpg'), ('Gama2', 'Descripción de la Gama 2 en texto', '<p>Descripción de la Gama 2 en HTML</p>', 'gama2.jpg'), ('Gama3', 'Descripción de la Gama 3 en texto', '<p>Descripción de la Gama 3 en HTML</p>', 'gama3.jpg'), ('Gama4', 'Descripción de la Gama 4 en texto', '<p>Descripción de la Gama 4 en HTML</p>', 'gama4.jpg'), ('Gama5', 'Descripción de la Gama 5 en texto', '<p>Descripción de la Gama 5 en HTML</p>', 'gama5.jpg'), ('Gama6', 'Descripción de la Gama 6 en texto', '<p>Descripción de la Gama 6 en HTML</p>', 'gama6.jpg'), ('Gama7', 'Descripción de la Gama 7 en texto', '<p>Descripción de la Gama 7 en HTML</p>', 'gama7.jpg'), ('Gama8', 'Descripción de la Gama 8 en texto', '<p>Descripción de la Gama 8 en HTML</p>', 'gama8.jpg'), ('Gama9', 'Descripción de la Gama 9 en texto', '<p>Descripción de la Gama 9 en HTML</p>', 'gama9.jpg'), ('Ornamental', 'Descripción de la Gama 10 en texto', '<p>Descripción de la Gama 10 en HTML</p>', 'gama10.jpg');

INSERT INTO producto (codigo_producto, nombre, gama, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES ('Prodcuto1', 'Nombre1', 'Gama1', '100x200', 'Proveedor1', 'Descripcion1', 10, 2000.300, 1000.300), ('Prodcuto2', 'Nombre2', 'Gama2', '200x200', 'Proveedor2', 'Descripcion2', 11, 2000.300, 1000.300),
('Prodcuto3', 'Nombre3', 'Gama3', '300x300', 'Proveedor3', 'Descripcion2', 12, 2000.300, 1000.300), ('Prodcuto4', 'Nombre4', 'Gama4', '400x200', 'Proveedor4', 'Descripcion4', 13, 2000.300, 1000.300), ('Prodcuto5', 'Nombre5', 'Gama5', '500x200', 'Proveedor5', 'Descripcion5', 14, 2000.300, 1000.300), ('Prodcuto6', 'Nombre6', 'Gama6', '600x200', 'Proveedor6', 'Descripcion6', 15, 2000.300, 1000.300), ('Prodcuto7', 'Nombre7', 'Gama7', '700x200', 'Proveedor7', 'Descripcion7', 16, 2000.300, 1000.300), ('Prodcuto8', 'Nombre8', 'Gama8', '800x200', 'Proveedor8', 'Descripcion8', 17, 2000.300, 1000.300), ('Prodcuto9', 'Nombre9', 'Ornamental', '900x200', 'Proveedor9', 'Descripcion9', 18, 2000.300, 1000.300), ('Prodcuto10', 'Nombre10', 'Ornamental', '1000x200', 'Proveedor10', 'Descripcion10', 19, 2000.300, 1000.300);

INSERT INTO oficina (codigo_oficina, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2)
VALUES ('OF001', 'Ciudad 1', 'País 1', 'Región 1', '12345', '+123456789', 'Calle Principal 123', 'Edificio A'), ('OF002', 'Ciudad 2', 'País 2', 'Región 2', '54321', '+987654321', 'Avenida Central 456', 'Torre B'), ('OF003', 'Ciudad 3', 'País 3', 'Región 3', '67890', '+246813579', 'Plaza Principal 789', 'Piso 2'), ('OF004', 'Ciudad 4', 'País 4', 'Región 4', '98765', '+135792468', 'Carrera Central 789', 'Local 5'), ('OF005', 'Ciudad 5', 'País 5', 'Región 5', '45678', '+369258147', 'Avenida Principal 987', 'Edificio C'), ('OF006', 'Ciudad 6', 'País 6', 'Región 6', '23456', '+987654321', 'Calle Secundaria 654', 'Piso 3'), ('OF007', 'Ciudad 7', 'País 7', 'Región 7', '87654', '+654321987', 'Plaza Mayor 321', 'Torre A'), ('OF008', 'Ciudad 8', 'País 8', 'Región 8', '34567', '+789456123', 'Carrera Central 456', 'Local 7'), ('OF009', 'Madrid', 'España', 'Europa', '76543', '+321654987', 'Avenida Principal 654', 'Edificio D'), ('OF010', 'Madrid', 'España', 'Europa', '12345', '+456123789', 'Calle Principal 789', 'Piso 4');

INSERT INTO empleado (codigo_empleado, nombre, apellido1, apellido2, extension, email, codigo_oficina, codigo_jefe, puesto)
VALUES (1, 'Juan', 'Pérez', 'García', '1234', 'juan.perez@example.com', 'OF001', NULL, 'Gerente'), (2, 'María', 'López', 'Martínez', '5678', 'maria.lopez@example.com', 'OF002', 1, 'Asistente Administrativo'), (3, 'Carlos', 'González', 'Sánchez', '9012', 'carlos.gonzalez@example.com', 'OF003', 1, 'Contador'), (4, 'Ana', 'Martín', 'Santos', '3456', 'ana.martin@example.com', 'OF004', 2, 'Vendedor'), (5, 'Pedro', 'Ruiz', 'Jiménez', '7890', 'pedro.ruiz@example.com', 'OF005', 2, 'Recepcionista'), (6, 'Laura', 'Gómez', 'Hernández', '2345', 'laura.gomez@example.com', 'OF006', 3, 'Analista Financiero'), (7, 'Miguel', 'Díaz', 'Prieto', '6789', 'miguel.diaz@example.com', 'OF007', 3, 'Ingeniero de Sistemas'), (8, 'Sofía', 'Sánchez', 'Morales', '0123', 'sofia.sanchez@example.com', 'OF008', 4, 'Desarrollador Web'), (9, 'David', 'Hernández', 'Rodríguez', '4567', 'david.hernandez@example.com', 'OF009', 4, 'Diseñador Gráfico'), (10, 'Elena', 'Torres', 'Muñoz', '8901', 'elena.torres@example.com', 'OF010', 5, 'Analista de Marketing');

INSERT INTO cliente (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, codigo_empleado_rep_ventas, limite_credito)
VALUES (1, 'Cliente A', 'Ana', 'Gómez', '+123456789', '+123456789', 'Avenida Principal 456', 'Local 1', 'Ciudad A', 'Región X', 'País A', '54321', 1, 5000.00), (2, 'Cliente B', 'Pedro', 'Rodríguez', '+987654321', '+987654321', 'Calle Secundaria 789', 'Piso 3', 'Ciudad B', 'Región Y', 'País B', '98765', 2, 8000.00), (3, 'Cliente C', 'Laura', 'Fernández', '+246813579', '+246813579', 'Plaza Mayor 123', 'Apartamento B', 'Ciudad C', 'Región Z', 'País C', '13579', 3, 10000.00), (4, 'Cliente D', 'Carlos', 'Martínez', '+369258147', '+369258147', 'Avenida Central 789', 'Oficina 2', 'Ciudad D', 'Región W', 'País D', '75319', 4, 12000.00), (5, 'Cliente E', 'Marta', 'López', '+951753468', '+951753468', 'Calle Principal 456', 'Piso 4', 'Ciudad E', 'Región V', 'País E', '98745', 5, 15000.00), (6, 'Cliente F', 'Roberto', 'García', '+753951846', '+753951846', 'Plaza Central 789', 'Local 5', 'Ciudad F', 'Región U', 'País F', '32145', 6, 18000.00), (7, 'Cliente G', 'Sandra', 'Gutiérrez', '+258963147', '+258963147', 'Avenida Mayor 123', 'Edificio A', 'Ciudad G', 'Región T', 'País G', '65487', 7, 20000.00), (8, 'Cliente H', 'Javier', 'Ruíz', '+741852963', '+741852963', 'Carrera Principal 789', 'Torre B', 'Ciudad H', 'Región S', 'País H', '15963', 8, 22000.00), (9, 'Cliente I', 'Lucía', 'Sánchez', '+369852147', '+369852147', 'Plaza Central 456', 'Piso 6', 'Madrid', 'Europa', 'España', '85236', 9, 25000.00), (10, 'Cliente J', 'Diego', 'Martín', '+147852369', '+147852369', 'Calle Principal 789', 'Local 7', 'Madrid', 'Europa', 'España', '36985', 10, 28000.00);

INSERT INTO pedido (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente)
VALUES (1, '2023-01-01', '2023-01-10', '2023-01-08', 'Entregado', 'Pedido completado a tiempo', 1), (2, '2023-02-05', '2023-02-15', NULL, 'Pendiente', 'Esperando confirmación del cliente', 2), (3, '2023-03-10', '2023-03-20', NULL, 'En Proceso', 'Preparando envío', 3), (4, '2023-04-15', '2023-04-25', NULL, 'Pendiente', 'Esperando confirmación de stock', 4), (5, '2023-05-20', '2023-06-01', NULL, 'En Proceso', 'En producción', 5), (6, '2008-06-25', '2008-07-05', NULL, 'Pendiente', 'Esperando pago', 6), (7, '2008-07-30', '2008-08-10', NULL, 'En Proceso', 'Preparando envío internacional', 7), (8, '2023-08-15', '2023-08-25', NULL, 'Rechazado', 'Esperando confirmación de entrega', 8), (9, '2023-09-20', '2023-09-30', NULL, 'En Proceso', 'Empaquetando productos', 9), (10, '2023-10-25', '2023-11-05', NULL, 'Entregado', 'Esperando autorización de cliente', 10);

INSERT INTO pago (codigo_cliente, forma_pago, id_transaccion, fecha_pago, total)
VALUES (1, 'Tarjeta de Crédito', 'TRANS001', '2023-01-15', 250.00), (2, 'Paypal', 'TRANS002', '2023-02-20', 350.00), (3, 'PayPal', 'TRANS003', '2023-03-25', 150.00), (4, 'Cheque', 'TRANS004', '2023-04-30', 200.00), (5, 'Tarjeta de Débito', 'TRANS005', '2023-05-15', 180.00), (6, 'Transferencia Electrónica', 'TRANS006', '2023-06-20', 300.00), (7, 'Efectivo', 'TRANS007', '2023-07-25', 400.00), (8, 'Tarjeta Regalo', 'TRANS008', '2023-08-30', 100.00), (9, 'Paypal', 'TRANS009', '2023-09-15', 280.00), (10, 'Bitcoin', 'TRANS010', '2023-10-20', 500.00);

INSERT INTO detalle_pedido (codigo_pedido, codigo_producto, cantidad, precio_unidad, numero_linea)
VALUES (1, 'Prodcuto1', 2, 50.00, 1), (1, 'Prodcuto2', 1, 100.00, 2), (2, 'Prodcuto3', 3, 75.00, 1), (2, 'Prodcuto4', 2, 120.00, 2), (3, 'Prodcuto5', 1, 50.00, 1), (3, 'Prodcuto6', 4, 30.00, 2), (4, 'Prodcuto7', 2, 100.00, 1), (4, 'Prodcuto8', 3, 75.00, 2), (5, 'Prodcuto9', 1, 120.00, 1), (5, 'Prodcuto10', 2, 30.00, 2);