USE TIENDA;
SELECT * FROM producto; -- EJERCICIO 1
select NOMBRE,PRECIO from PRODUCTO; -- EJERCICIO 2
SHOW COLUMNS FROM producto; -- EJERCICIO 3
SELECT nombre, precio as 'Euros',precio * 0.80 as 'Dolares Americ'from producto;-- ejercicio 4
select nombre, precio as Euros, precio * 0.80 as Dolares FROM producto;
select nombre,nombre AS 'SIGLAS'from fabricante;
update fabricante SET NOMBRE=UPPER(NOMBRE) WHERE CODIGO >0;
UPDATE producto SET nombre=UPPER(nombre) WHERE CODIGO > 0; -- EJERCICIO 6 
SELECT NOMBRE,PRECIO FROM producto; 
UPDATE producto SET nombre=LOWER(nombre) WHERE CODIGO > 0; -- EJERCICIO 7
SELECT NOMBRE,PRECIO FROM producto;
select * FROM fabricante;
 select nombre, substring(nombre,1,2)from fabricante;-- EJERCICIO 8 
update fabricante SET columnueva = nombre;
select * FROM fabricante;
select nombre,round(precio) as rprecio from producto;-- ejercicio 9
select  * from producto;
 Select nombre, truncate(precio,0) FROM producto; -- ejercicio 10 
select fabricante.nombre,producto.codigo_fabricante FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante; -- ejercicio 11
select distinct fabricante.nombre,producto.codigo_fabricante FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante; -- ejercicio 12
select nombre FROM fabricante ORDER BY nombre ASC; -- EJERCICIO 13
select nombre FROM fabricante ORDER BY nombre DESC; -- EJERCICIO 14
SELECT NOMBRE,PRECIO FROM producto ORDER BY nombre ASC;
SELECT NOMBRE,PRECIO FROM producto ORDER BY precio DESC;-- EJERCICIO 15
SELECT * from FABRICANTE limit 5; -- ejercicio 16
SELECT * from FABRICANTE WHERE  codigo>=4; -- ejejrcicio 17
select nombre, precio FROM producto order by precio asc limit 1;-- ejercicio 18
select nombre, precio FROM producto order by precio desc limit 1;-- ejercicio 19
select * from producto inner join fabricante on producto.codigo_fabricante =2 group by producto.nombre;-- ejercicio 20
select  producto.nombre, producto.precio, fabricante.nombre FROM fabricante inner join producto on fabricante.codigo = producto.codigo_fabricante;-- ejercicio 21
select  producto.nombre, producto.precio, fabricante.nombre FROM fabricante inner join producto on fabricante.codigo = producto.codigo_fabricante ORDER BY fabricante.nombre desc;-- ejercicio 22
select producto.nombre, producto.codigo as codigo_producto,fabricante.nombre, fabricante.codigo as codigo_fabbricante FROM fabricante INNER JOIN producto on fabricante.codigo = producto.codigo_fabricante group by producto.nombre; -- ejercicio 23
select producto.nombre,producto.precio, fabricante.nombre From producto inner join fabricante on fabricante.codigo = producto.codigo_fabricante order by producto.precio limit 1; -- ejercicio 24
select producto.nombre,producto.precio, fabricante.nombre From producto inner join fabricante on fabricante.codigo = producto.codigo_fabricante order by producto.precio desc limit 1;-- ejercici 25
select fabricante.nombre, producto.nombre from fabricante inner join producto on fabricante.codigo = producto.codigo_fabricante where fabricante.codigo = 2;-- ejercicio 26
select * from fabricante inner join producto on fabricante.codigo = producto.codigo_fabricante where producto.codigo_fabricante =6 and producto.precio>200;-- ejercicio 27
select fabricante.nombre, producto.nombre,fabricante.codigo from fabricante inner join producto on fabricante.codigo = producto.codigo_fabricante where producto.codigo_fabricante =1 or producto.codigo_fabricante =3 or producto.codigo_fabricante =5;-- ejejrcicio 28
select fabricante.nombre, producto.nombre,fabricante.codigo from fabricante inner join producto on fabricante.codigo = producto.codigo_fabricante where producto.codigo_fabricante IN(1,3,5);-- ejercicio 29
select fabricante.nombre,producto.nombre,producto.precio from fabricante inner join producto on fabricante.codigo = producto.codigo_fabricante where right(fabricante.nombre,1)='e'; -- ejercicio 30
select producto.nombre,producto.precio from producto inner join fabricante on fabricante.codigo = producto.codigo_fabricante where fabricante.nombre like '%w%'; -- ejercicio 31
SELECT fabricante.nombre,producto.nombre,producto.precio from fabricante inner join producto on fabricante.codigo = producto.codigo_fabricante where producto.precio >=180 order by producto.precio;-- ejercicio 32
select distinct fabricante.codigo, fabricante.nombre from fabricante inner join producto on fabricante.codigo = producto.codigo_fabricante ; -- ejercicio 33
select fabricante.codigo, fabricante.nombre , producto.nombre, producto.precio from producto right join fabricante on fabricante.codigo = producto.codigo_fabricante; -- ejercicio 34
select fabricante.codigo, fabricante.nombre  from producto right join fabricante on fabricante.codigo = producto.codigo_fabricante where producto.codigo_fabricante != fabricante.codigo ; -- ejercicio35 no sale
-- select fabricante.codigo, fabricante.nombre , producto.nombre, producto.precio from producto, fabricante WHERE fabricante.codigo = producto.codigo_fabricante group by fabricante.codigo=2 ;
select * from producto, fabricante where fabricante.codigo = producto.codigo_fabricante and fabricante.codigo =2; -- ejercicio 36
select fabricante.nombre,producto.nombre,producto.precio from producto, fabricante where fabricante.codigo = producto.codigo_fabricante  and producto.precio = 559; -- ejercicio 37
select producto.nombre,max(producto.precio),fabricante.nombre from producto, fabricante where fabricante.codigo = producto.codigo_fabricante  and producto.codigo_fabricante =2;-- ejercicio 38
select fabricante.codigo, producto.nombre, min(producto.precio) from producto, fabricante where fabricante.codigo = producto.codigo_fabricante and fabricante.codigo =3; -- ejercicio 39
select fabricante.codigo, producto.nombre, producto.precio from producto, fabricante where avg(precio)  and producto.precio >=444; -- ejercicio 40
select avg(precio) as 'precio medio',producto.precio,producto.nombre, fabricante.nombre from producto, fabricante where fabricante.codigo = producto.codigo_fabricante and producto.precio > (select avg(producto.precio) from producto);-- ejercicio 41 no va
select avg(precio) as 'precio medio',producto.precio,producto.nombre, fabricante.nombre from producto inner join fabricante on fabricante.codigo = producto.codigo_fabricante where producto.precio > (select avg(producto.precio) from producto);
use tienda;
select * from fabricante;
select *from producto;


