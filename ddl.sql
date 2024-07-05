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
    codigo_producto VARCHAR(5),
    cantidad INT(11),
    precio_unidad DECIMAL(15,2),
    numero_line SMALLINT(6),
    CONSTRAINT pk_id_detalle_pedido PRIMARY KEY (codigo_pedido, codigo_producto),
    CONSTRAINT fk_idproducto_detalle_pedido FOREIGN KEY (codigo_producto) REFERENCES producto(codigo_producto),
    CONSTRAINT fk_idpedido_detalle_pedido FOREIGN KEY (codigo_pedido) REFERENCES pedido(codigo_pedido)
);