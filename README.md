# Filtro BASE DE DATOS SQL
# Hecho por Jhoan Sebastian Landazabal
# Y Jhon Jairo Marín Díaz
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
    cli.nombre_cliente AS nombre_cliente,
    emp.nombre AS nombre_representante,
    emp.apellido1 AS apellido_representante
<<<<<<< HEAD
FROM 
    cliente AS cli, empleado AS emp
WHERE 
    cli.codigo_empleado_rep_ventas = emp.codigo_empleado; 
    cli.nombre_cliente,
    emp.nombre,
    emp.apellido1
=======
>>>>>>> 5e0f5c9 (safe commit)
FROM 
    cliente AS cli, empleado AS emp
WHERE 
    cli.codigo_empleado_rep_ventas = emp.codigo_empleado; 
``` 

<br>

### SQL2 

```sql

SELECT
    cli.nombre_cliente,
    emp.nombre AS nombre_representante,
    emp.apellido1 AS apellido_representante
FROM 
    cliente AS cli
JOIN 
    empleado AS emp
ON
    cli.codigo_empleado_rep_ventas = emp.codigo_empleado;

```

<br>

<<<<<<< HEAD
### SQL2 

```sql

SELECT
    cli.nombre_cliente,
    emp.nombre AS nombre_representante,
    emp.apellido1 AS apellido_representante
FROM 
    cliente AS cli
JOIN 
    empleado AS emp
ON
    cli.codigo_empleado_rep_ventas = emp.codigo_empleado;

```

<br>

=======
>>>>>>> b07554b (safe commit)
---

## 2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

<br>

<<<<<<< HEAD
### SQL2

```sql

SELECT
    cli.nombre_cliente,
    emp.nombre AS nombreRepresentante
FROM
    cliente AS cli
JOIN 
    empleado AS emp
ON
    cli.codigo_empleado_rep_ventas = emp.codigo_empleado
RIGHT JOIN 
    pago AS pa
ON
    pa.codigo_cliente = cli.codigo_cliente;

``` 

<br>

---

## 3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.

<br>

### SQL1

```sql
SELECT 
    cli.nombre_cliente AS nombre_cliente,
    emp.nombre AS nombre_representante,
    emp.apellido1 AS apellido_representante
FROM 
    cliente AS cli, empleado AS emp, pago AS p
WHERE 
    cli.codigo_empleado_rep_ventas = emp.codigo_empleado
AND
    cli.codigo_cliente = p.codigo_cliente;
``` 

<br>

---

## 3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.

<br>

<<<<<<< HEAD
### SQL2

```sql

SELECT
    cli.nombre_cliente,
    emp.nombre AS nombreRepresentante
FROM
    cliente AS cli
JOIN 
    empleado AS emp ON cli.codigo_empleado_rep_ventas = emp.codigo_empleado
LEFT JOIN
    pago AS p ON cli.codigo_cliente = p.codigo_cliente
WHERE 
    p.codigo_cliente IS NULL;


```

<br>

---

## 4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

<br>

<<<<<<< HEAD
### SQL2

```sql

SELECT
    cli.nombre_cliente,
    emp.nombre AS nombreRepresentante,
    ofi.ciudad AS ciudadRepresentante
FROM
    cliente AS cli
JOIN 
    empleado AS emp ON cli.codigo_empleado_rep_ventas = emp.codigo_empleado
JOIN
    oficina AS ofi ON emp.codigo_oficina = ofi.codigo_oficina
JOIN
    pago AS p ON cli.codigo_cliente = p.codigo_cliente;


```
=======
>>>>>>> b07554b (safe commit)
### SQL1

```sql
SELECT 
    cli.nombre_cliente AS nombre_cliente,
    emp.nombre AS nombre_representante,
    emp.apellido1 AS apellido_representante,
    o.ciudad AS ciudad_oficina
FROM 
    cliente AS cli, empleado AS emp, pago AS p, oficina AS o
WHERE 
    cli.codigo_empleado_rep_ventas = emp.codigo_empleado
AND 
    cli.codigo_cliente = p.codigo_cliente
AND
    emp.codigo_oficina = o.codigo_oficina
;
``` 

<br>

---

## 5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

<br>

<<<<<<< HEAD
### SQL2

```sql

SELECT
    cli.nombre_cliente,
    emp.nombre AS nombreRepresentante,
    ofi.ciudad AS ciudadRepresentante
FROM
    cliente AS cli
JOIN 
    empleado AS emp ON cli.codigo_empleado_rep_ventas = emp.codigo_empleado
JOIN
    oficina AS ofi ON emp.codigo_oficina = ofi.codigo_oficina
LEFT JOIN
    pago AS p ON cli.codigo_cliente = p.codigo_cliente
WHERE
    p.codigo_cliente IS NULL;


```

<br>

---

## 5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

<br>

### SQL1

```sql
SELECT 
    cli.nombre_cliente AS nombre_cliente,
    emp.nombre AS nombre_representante,
    emp.apellido1 AS apellido_representante,
    o.ciudad AS ciudad_oficina
FROM 
    cliente AS cli, empleado AS emp, pago AS p, oficina AS o
WHERE 
    cli.codigo_empleado_rep_ventas = emp.codigo_empleado
AND 
    cli.codigo_cliente NOT IN (SELECT p.codigo_cliente FROM pago AS p)
AND
    emp.codigo_oficina = o.codigo_oficina
;
``` 

<br>

---

## 6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

<br>

### SQL1

```sql
SELECT 
    o.linea_direccion1 AS direccion1,
    o.linea_direccion2 AS direccion2
FROM 
    oficina AS o, cliente AS cli, empleado AS emp
WHERE
    o.codigo_oficina = emp.codigo_oficina
AND 
    emp.codigo_empleado = cli.codigo_empleado_rep_ventas
AND
    cli.ciudad = 'Fuenlabrada'
;
``` 

<br>

---

## 7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

<br>

### SQL1

```sql
SELECT 
    cli.nombre_cliente AS nombre_cliente,
    emp.nombre AS nombre_representante,
    emp.apellido1 AS apellido_representante,
    o.ciudad AS ciudad_oficina
FROM 
    cliente AS cli, empleado AS emp, oficina AS o
WHERE 
    cli.codigo_empleado_rep_ventas = emp.codigo_empleado
AND
    emp.codigo_oficina = o.codigo_oficina
;
``` 

<br>

---

## 8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

<br>

### SQL1

```sql
SELECT 
    CONCAT(emp1.nombre, ' ', emp1.apellido1) AS nombre_empleado,
    (SELECT 
        CONCAT(emp2.nombre, ' ', emp2.apellido1)
    FROM 
        empleado AS emp2
    WHERE 
        emp2.codigo_empleado = emp1.codigo_jefe
    ) AS nombre_jefe
FROM 
    empleado AS emp1
;

``` 

<br>

---

## 9. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

<br>

### SQL1

```sql
SELECT 
    CONCAT(emp1.nombre, ' ', emp1.apellido1) AS nombre_empleado,
    (
        SELECT 
            CONCAT(emp2.nombre, ' ', emp2.apellido1)
        FROM 
            empleado emp2
        WHERE 
            emp2.codigo_empleado = emp1.codigo_jefe
    ) AS nombre_jefe,
    (
        SELECT 
            CONCAT(emp3.nombre, ' ', emp3.apellido1)
        FROM 
            empleado emp2, empleado emp3
        WHERE 
            emp2.codigo_empleado = emp1.codigo_jefe
        AND 
            emp2.codigo_jefe = emp3.codigo_empleado
    ) AS nombre_jefe_del_jefe
FROM 
    empleado emp1
;
``` 

<br>

---

## 10. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

<br>

### SQL1

```sql
SELECT 
    cli.nombre_cliente
FROM 
    cliente AS cli
WHERE EXISTS (
    SELECT 
        1
    FROM 
        pedido p
    WHERE 
        p.codigo_cliente = cli.codigo_cliente
    AND 
        p.fecha_entrega > p.fecha_esperada
)
;

``` 

<br>

---

## 11. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

<br>

### SQL1

```sql
SELECT 
    cli.nombre_cliente,
    (
        SELECT DISTINCT 
            pr.gama
        FROM 
            producto AS pr, pedido  AS pe, detalle_pedido AS dp
        WHERE 
            pe.codigo_cliente = cli.codigo_cliente
        AND 
            pe.codigo_pedido = dp.codigo_pedido
        AND 
            dp.codigo_producto = pr.codigo_producto
    ) AS gamas_compradas
FROM 
    cliente AS cli
;
``` 

<br>

---

<<<<<<< HEAD
## 6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.


<br>

### SQL2

```sql

SELECT DISTINCT
    o.linea_direccion1,
    o.linea_direccion2,
    o.ciudad,
    o.region,
    o.pais,
    o.codigo_postal
FROM
    oficina o
JOIN
    empleado e ON o.codigo_oficina = e.codigo_oficina
JOIN
    cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE
    c.ciudad = 'Fuenlabrada';

```
<br>

---

## 7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

<br>

### SQL2

```sql

SELECT
    cli.nombre_cliente AS Nombre_Cliente,
    CONCAT(emp.nombre, ' ', emp.apellido1) AS Nombre_Representante,
    ofi.ciudad AS Ciudad_Oficina_Representante
FROM
    cliente AS cli
JOIN
    empleado AS emp ON cli.codigo_empleado_rep_ventas = emp.codigo_empleado
JOIN
    oficina AS ofi ON emp.codigo_oficina = ofi.codigo_oficina;


```

<br>

---

## 8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

<br>

### SQL2

```sql

SELECT
    emp1.nombre,
    emp2.nombre AS nombreJefe
FROM empleado AS emp1
LEFT JOIN empleado AS emp2
ON emp1.codigo_jefe = emp2.codigo_empleado;

```

<br>

---

## 9. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

<br>

### SQL2

```sql

SELECT 
    e1.nombre AS nombre_empleado,
    e2.nombre AS nombre_jefe,
    e3.nombre AS nombre_jefe_de_jefe
FROM 
    empleado AS e1
LEFT JOIN 
    empleado AS e2 
ON 
    e1.codigo_jefe = e2.codigo_empleado
LEFT JOIN 
    empleado AS e3 
ON 
    e2.codigo_jefe = e3.codigo_empleado;

```

<br>

---

## 10. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

<br>

### SQL2

```sql

SELECT DISTINCT
    cli.nombre_cliente AS Nombre_Cliente
FROM
    cliente AS cli
JOIN
    pedido AS ped ON cli.codigo_cliente = ped.codigo_cliente
WHERE
    ped.fecha_entrega > ped.fecha_esperada;


```
### SQL1

```sql
SELECT 
    cli.nombre_cliente AS nombre_cliente,
    emp.nombre AS nombre_representante,
    emp.apellido1 AS apellido_representante,
    o.ciudad AS ciudad_oficina
FROM 
    cliente AS cli, empleado AS emp, pago AS p, oficina AS o
WHERE 
    cli.codigo_empleado_rep_ventas = emp.codigo_empleado
AND 
    cli.codigo_cliente NOT IN (SELECT p.codigo_cliente FROM pago AS p)
AND
    emp.codigo_oficina = o.codigo_oficina
;
``` 

<br>

---

<<<<<<< HEAD
=======
## 6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

<br>

### SQL1

```sql
SELECT 
    o.linea_direccion1 AS direccion1,
    o.linea_direccion2 AS direccion2,
FROM 
    oficina AS o, cliente AS cli, empleado
WHERE
    o.
;
``` 
### SQL2

```sql

SELECT
    cli.nombre_cliente,
    emp.nombre AS nombreRepresentante,
    ofi.ciudad AS ciudadRepresentante
FROM
    cliente AS cli
JOIN 
    empleado AS emp ON cli.codigo_empleado_rep_ventas = emp.codigo_empleado
JOIN
    oficina AS ofi ON emp.codigo_oficina = ofi.codigo_oficina
LEFT JOIN
    pago AS p ON cli.codigo_cliente = p.codigo_cliente
WHERE
    p.codigo_cliente IS NULL;


```

<br>

---

## 6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.


<br>

### SQL2

```sql

SELECT DISTINCT
    o.linea_direccion1,
    o.linea_direccion2,
    o.ciudad,
    o.region,
    o.pais,
    o.codigo_postal
FROM
    oficina o
JOIN
    empleado e ON o.codigo_oficina = e.codigo_oficina
JOIN
    cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE
    c.ciudad = 'Fuenlabrada';

```
<br>

---

## 7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

<br>

### SQL2

```sql

SELECT
    cli.nombre_cliente AS Nombre_Cliente,
    CONCAT(emp.nombre, ' ', emp.apellido1) AS Nombre_Representante,
    ofi.ciudad AS Ciudad_Oficina_Representante
FROM
    cliente AS cli
JOIN
    empleado AS emp ON cli.codigo_empleado_rep_ventas = emp.codigo_empleado
JOIN
    oficina AS ofi ON emp.codigo_oficina = ofi.codigo_oficina;


```

<br>

---

## 8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

<br>

### SQL2

```sql

SELECT
    emp1.nombre,
    emp2.nombre AS nombreJefe
FROM empleado AS emp1
LEFT JOIN empleado AS emp2
ON emp1.codigo_jefe = emp2.codigo_empleado;

```

<br>

---

## 9. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

<br>

### SQL2

```sql

SELECT 
    e1.nombre AS nombre_empleado,
    e2.nombre AS nombre_jefe,
    e3.nombre AS nombre_jefe_de_jefe
FROM 
    empleado AS e1
LEFT JOIN 
    empleado AS e2 
ON 
    e1.codigo_jefe = e2.codigo_empleado
LEFT JOIN 
    empleado AS e3 
ON 
    e2.codigo_jefe = e3.codigo_empleado;

```

<br>

---

## 10. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

<br>

### SQL2

```sql

SELECT DISTINCT
    cli.nombre_cliente AS Nombre_Cliente
FROM
    cliente AS cli
JOIN
    pedido AS ped ON cli.codigo_cliente = ped.codigo_cliente
WHERE
    ped.fecha_entrega > ped.fecha_esperada;


```

<br>

---

### 11. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

<br>

## SQL2

```sql

SELECT
    cli.nombre_cliente AS Nombre_Cliente,
    pro.gama AS Gama_Producto
FROM
    cliente AS cli
JOIN
    pedido AS ped ON cli.codigo_cliente = ped.codigo_cliente
JOIN
    detalle_pedido AS det ON ped.codigo_pedido = det.codigo_pedido
JOIN
    producto AS pro ON det.codigo_producto = pro.codigo_producto
GROUP BY
    cli.nombre_cliente, pro.gama

```

<br>

---

# Consultas multitabla (Composición externa)
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL
LEFT JOIN y NATURAL RIGHT JOIN.

---

<br>

## 1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

<br>

```sql

SELECT
    cli.codigo_cliente,
    cli.nombre_cliente AS Nombre_Cliente
FROM
    cliente AS cli
LEFT JOIN
    pago AS pag ON cli.codigo_cliente = pag.codigo_cliente
WHERE
    pag.codigo_cliente IS NULL;


```

<br>

---

## 2. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.

<br>

```sql

SELECT
    cli.codigo_cliente,
    cli.nombre_cliente AS Nombre_Cliente
FROM
    cliente AS cli
LEFT JOIN
    pedido AS ped ON cli.codigo_cliente = ped.codigo_cliente
WHERE
    ped.codigo_pedido IS NULL;


```

<br>

---

## 3. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.

<br>

```sql

SELECT DISTINCT
    cli.codigo_cliente,
    cli.nombre_cliente AS Nombre_Cliente
FROM
    cliente AS cli
LEFT JOIN
    pago AS pag ON cli.codigo_cliente = pag.codigo_cliente
LEFT JOIN
    pedido AS ped ON cli.codigo_cliente = ped.codigo_cliente
WHERE
    pag.codigo_cliente IS NULL OR ped.codigo_cliente IS NULL;


```

<br>

---

## 4. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada

<br>

```sql

SELECT
    emp.codigo_empleado,
    CONCAT(emp.nombre, ' ', emp.apellido1) AS Nombre_Empleado
FROM
    empleado AS emp
LEFT JOIN
    oficina AS ofi ON emp.codigo_oficina = ofi.codigo_oficina
WHERE
    emp.codigo_oficina IS NULL;


```

<br>

---

## 5. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.

<br>

```sql



```
>>>>>>> 3ccc6fa (feat: Safe)
