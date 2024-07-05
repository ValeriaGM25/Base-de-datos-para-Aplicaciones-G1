-- Crear la base de datos
create database ejercicioexam;

-- Usar la base de datos
use ejercicioexam;
-- Crear las tablas solicitadas
-- Proveedor
CREATE TABLE proveedor(
    idprov int not null IDENTITY(1,1),
    nombre varchar(50) not null,
    limite_credito money not null,
    constraint pk_proveedor
    primary key(idprov),
    constraint unico_nombre_proveedor
    unique(nombre)
);

-- Tabla Categoria
CREATE TABLE categoria(
    idcatego int not null,
    nombre varchar(50) not null,
    constraint pk_categoria
    primary key (idcatego),
    constraint unico_nombre
    unique(nombre)
);

CREATE TABLE Producto(
    idprod int not null,
    nombre varchar(50) not null,
    precio money not null,
    existencia int not null,
    proveedor int,
    idcatego int
    constraint pk_producto
    primary key(idprod),
    constraint fk_producto_prov
    foreign key (proveedor)
    references proveedor(idprov),
    constraint fk_producto_categoria
    foreign key (idcatego)
    references categoria(idcatego)
)


-- Insertar datos en las tablas
insert into proveedor (nombre, limite_credito)
values('Coca-cola', 98777),
      ('Pecsi', 234567),
      ('Hay me Pica', 44566),
      ('Hay me Duele', 45677),
      ('Tengo Miedo', 22344);


insert into categoria
values(1, 'Lacteos'),
(2, 'Linea Blanca'),
(3, 'Dulces'),
(4, 'Vinos'),
(5, 'Abarrotes');
     

select * from proveedor

insert into producto
values(1, 'Mascara', 78.9, 20, 5,5)

insert into producto(proveedor, existencia, idcatego, precio, idprod, nombre)
values(3, 34, 5, 56.7, 2, 'Manita Rascadora')

insert into producto
values (3, 'Tonayan', 1450, 56,4 ,4),
       (4, 'Caramelo', 200, 22,1 ,3),
       (5, 'Terry', 200, 24,4 ,4);


select * from Producto
select * from Categoria
select * from proveedor

--consulta con inner join
SELECT c.idcatego, p.idcatego, c.nombre, p.nombre, p.precio
FROM categoria as c 
INNER JOIN producto as p 
on c.idcatego= p.idcatego;

--
SELECT *, (p.precio * p.existencia) as importe 
FROM categoria as c 
INNER JOIN producto as p 
on c.idcatego= p.idcatego;

--de la tabla categoria quiero
--idcatego
--nombre

--Producto
--precio
--existencia
--nombre

SELECT c.idcatego, c.nombre, p.nombre, p.existencia, p.precio, (p.precio * p.existencia) as importe
From 
(select idcatego, nombre from categoria) as c 
INNER JOIN
(select nombre, precio, existencia, idcatego  from Producto) as p 
on c.idcatego = p.idcatego;

use NORTHWND



SELECT *
from (select OrderID, OrderDate, shipCountry, RequiredDate from Orders) as o 

 

SELECT  * FROM
categoria as c 
INNER join producto  as p 
on c.idcatego = p.idcatego
INNER JOIN proveedor as pr
on pr.idprov = p.proveedor;

SELECT c.nombre, p.nombre, p.precio, p.existencia
FROM categoria as c 
LEFT JOIN producto as p 
on c.idcatego = p.idcatego
where p.idcatego is null;

SELECT c.nombre, p.nombre, p.precio, p.existencia
FROM (select nombre, idcatego from  categoria) as c 
LEFT JOIN (select precio, existencia, idcatego, nombre from producto) as p 
on c.idcatego = p.idcatego
where p.idcatego is null;

SELECT * from producto
where idcatego in (1,2)


SELECT c.nombre, p.nombre, p.precio, p.existencia
FROM categoria as c 
RIGHT JOIN producto as p 
on c.idcatego = p.idcatego


insert into producto 
values(6, 'p6', 45.6, 12, 2, null)


SELECT c.nombre, p.nombre, p.precio, p.existencia
FROM categoria as c 
FULL JOIN producto as p 
on c.idcatego = p.idcatego

--El FULL JOIN  es todo
SELECT *
FROM categoria as c 
FULL JOIN producto as p 
on c.idcatego = p.idcatego;

SELECT * FROM 
categoria as c 
RIGHT JOIN producto as p 
on c.idcatego = p.idcatego
INNER join proveedor os pr 
on pr.idprov = p.proveedor;


