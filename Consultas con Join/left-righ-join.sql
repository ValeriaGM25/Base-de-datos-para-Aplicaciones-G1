create database pruebajoinsg1;

use pruebajoinsg1;

CREATE TABLE proveerdor (
    provid int not null identity(1,1),
    nombre VARCHAR (50) not null,
    limite_crédito money not NULL
    CONSTRAINT pk_proveedor
    PRIMARY KEY (provid),
    CONSTRAINT unico_nombrepro
    UNIQUE(nombre)
)

create table productos(
 productid int not null identity(1,1),
 nombre varchar(50) not null,
 existencia int not null,
 proveedor int,
 constraint pk_prooveedor
 primary key(productid),
 constraint unico_nombre_proveedor
 UNIQUE (nombre),
 CONSTRAINT fk_proveedor_producto
 FOREIGN KEY (proveedor)
 REFERENCES proveerdor(provid)
 );

--Agregar registros a las tablas proveedor y producto
INSERT INTO proveerdor(nombre, limite_credito)
VALUES
('Proveedor1', 5000),
('Proveedor2', 6778),
('Proveedor3', 6788),
('Proveedor4', 5677),
('Proveedor5', 6666);

SELECT * FROM proveerdor;

INSERT into productos(nombre, precio, existencia, proveedor)
VALUES
('Proveedor1', 56, 34, 1),
('Proveedor2', 56.56, 12, 1),
('Proveedor3', 45.6, 33, 2),
('Proveedor4', 22.34, 666, 3);

SELECT * FROM Productos;

SELECT * FROM
proveerdor as p 
INNER JOIN productos as pr 
on pr.proveerdor = p.proveerdor

SELECT c.CategoryName, p.ProductName, p.UnistInStock, p.UnitPrice, p.discontinued 

SELECT s.CompanyName as 'Provedor', sum (od.UnitPrice*od.Quantity) as 'Total de ventas $'
from (
    SELECT CompanyName Suppliers  
)as s
inner join Products as p 
on p.SupplierID=s.SupplierID
inner JOIN [Order Details] as od 
on od.ProductID=p.ProductID
inner join orders as o 
on o.OrderID=od.OrderID
where o.OrderDate BETWEEN '1996-09-01' and '1996-12-31'
GROUP BY s.CompanyName
ORDER by 'Total de ventas $' DESC;


