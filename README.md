# Filtro BASE DE DATOS SQL

----

# Consultas sobre una tabla 

<br>

## 1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

<br>

```sql
    SELECT 
        ofi.codigo_oficina, 
        ofi.ciudad
    FROM
        oficina AS ofi
	
```

<br>

---

## 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

<br>

```sql
    SELECT
        ofi.ciudad,
        ofi.telefono
    FROM
        oficina AS ofi
    WHERE
        ofi.ciudad = "España";

```

<br>

---

## 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

<br>

```sql
    SELECT 
        emp.nombre,
        emp.apellido1,
        emp.apellido2,
        emp.email
    FROM
        empleado AS emp
    WHERE 
        emp.codigo_jefe = 7;

```

<br>

---

## 4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

<br>

```sql
    SELECT
        emp.puesto,
        emp.nombre,
        emp.apellido1,
        emp.apellido2,
        emp.email
    FROM 
        empleado AS emp
    WHERE 
        emp.codigo_empleado IS NULL;

```

**Explicación**: Se deja **IS NULL** porque el jefe de la empresa no tiene ningún jefe asignado por lo que su código de jefe es **NULL**

<br>

---

## 5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

<br>

```sql
    SELECT 
        emp.nombre,
        emp.apellido1,
        emp.apellido2,
        emp.puesto
    FROM
        empleado AS emp
    WHERE
        emp.puesto <> "Representante de venta";
``` 

<br>

---

## 6. Devuelve un listado con el nombre de los todos los clientes españoles.

<br>

```sql
    SELECT 
        cl.nombre
    FROM 
        cliente AS cl
    WHERE 
        cl.pais = "España";
``` 

<br>

---

## 7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.

<br>

```sql
    SELECT DISTINCT
        pe.estado
    FROM
        pedido AS pe;
```

<br>

---

## 8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta: 
## • Utilizando la función YEAR de MySQL.
## • Utilizando la función DATE_FORMAT de MySQL.
## • Sin utilizar ninguna de las funciones anteriores.

<br>

### Usando YEAR()

```sql
    SELECT DISTINCT
        pa.codigo_cliente
    FROM 
        pago AS pa
    WHERE 
        YEAR(pa.fecha_pago) = "2008";
```

### Usando DATE_FORMAT()

```sql
    SELECT DISTINCT
        pa.codigo_cliente
    FROM 
        pago AS pa
    WHERE 
        DATE_FORMAT(pa.fecha_pago, "%Y") = "2008";
``` 

### Sin usar las funciones 

```sql
    SELECT DISTINCT
        pa.codigo_cliente
    FROM 
        pago AS pa
    WHERE
        pa.fecha_pago >= "2008-01-01" AND pa.fecha_pago < "2009-01-01";

```

<br>

---

## 9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

<br>

```sql
    SELECT  
        ped.codigo_pedido,
        ped.codigo_cliente,
        ped.fecha_esperada,
        ped.fecha_entrega
    FROM
        pedido AS ped
    WHERE 
        ped.fecha_entrega > ped.fecha_esperada;
``` 

<br>

---

## 10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
## • Utilizando la función ADDDATE de MySQL.
## • Utilizando la función DATEDIFF de MySQL.
## • ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?

<br>

### Usando ADDDATE

```sql
    SELECT 
        ped.codigo_pedido, 
        ped.codigo_cliente, 
        ped.fecha_esperada, 
        ped.fecha_entrega
    FROM 
        pedido AS ped
    WHERE 
        fecha_entrega <= ADDDATE(fecha_esperada, -2);
``` 

### Usando DATEDIFF

```sql
    SELECT 
        ped.codigo_pedido, 
        ped.codigo_cliente, 
        ped.fecha_esperada, 
        ped.fecha_entrega
    FROM 
        pedido AS ped
    WHERE 
        DATEDIFF(fecha_entrega, fecha_esperada) <= -2;
```

**Respuesta**: Sí es posible hacerlo formateando la fecha para mostrar solo el día y colocando que la fecha de entrega sea menor o igual a la fecha esperada formateada -2

<br>

---

## 11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

<br>

```sql
    SELECT 
        ped.codigo_pedido,
        ped.fecha_pedido,
        ped.fecha_esperada,
        ped.fecha_entrega,
        ped.estado,
        ped.comentarios,
        ped.codigo_cliente
    FROM
        pedido AS ped
    WHERE 
        ped.estado = "Rechazado"
    AND 
        YEAR(ped.fecha_pedido) = "2009";

        
``` 

<br>

---

## 12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.

<br>

```sql
    SELECT 
        ped.codigo_pedido,
        ped.fecha_pedido,
        ped.fecha_esperada,
        ped.fecha_entrega,
        ped.estado,
        ped.comentarios,
        ped.codigo_cliente
    FROM 
        pedido AS ped
    WHERE
        ped.estado = "Entregado"
    AND
        DATE_FORMAT(ped.fecha_entrega, "%m") = "01";
``` 

<br>

---

## 13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

<br>

```sql
    SELECT 
        pa.codigo_cliente,
        pa.forma_pago,
        pa.id_transaccion,
        pa.fecha_pago,
        pa.total
    FROM
        pago AS pa
    WHERE
        YEAR(pa.fecha_pago) = "2008"
    AND
        pa.forma_pago = "Paypal"
    ORDER BY
        pa.total ASC;
``` 

<br>

---

## 14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

<br>

```sql
    SELECT DISTINCT 
        pa.forma_pago
    FROM 
        pago AS pa;
```

<br>

---

## 15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

<br>

```sql
    SELECT
        prod.codigo_producto,
        prod.nombre,
        prod.gama,
        prod.dimensiones,
        prod.proveedor,
        prod.descripcion,
        prod.cantidad_en_stock AS stock,
        prod.precio_venta,
        prod.precio_proveedor
    FROM
        producto AS prod
    WHERE
        prod.gama = "Ornamental"
    AND 
        prod.cantidad_en_stock > 100
    ORDER BY
        prod.precio_venta ASC;
        
```    

<br>

---

## 16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.

```sql
    SELECT  
        cli.codigo_cliente,
        cli.nombre_cliente,
        cli.nombre_contacto,
        cli.apellido_contacto,
        cli.telefono,
        cli.fax,
        cli.linea_direccion1,
        cli.linea_direccion2,
        cli.ciudad,
        cli.region,
        cli.pais,
        cli.codigo_postal,
        cli.codigo_empleado_rep_ventas,
        cli.limite_credito
    FROM
        cliente AS cli
    WHERE 
        cli.ciudad = "Madrid"
    AND 
        cli.codigo_empleado_rep_ventas = 11 or cli.codigo_empleado_rep_ventas = 30;
```

<br>

---

# Consultas Multitabla ( Composición interna )

Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con
sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.

<br>

---

## 1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

<br>

### SQL1

```sql
    SELECT 
        cli.nombre_cliente,
        emp.nombre,
        emp.apellido1
    FROM 
        cliente AS cli, empleado AS emp
    WHERE 
        cli.
``` 
