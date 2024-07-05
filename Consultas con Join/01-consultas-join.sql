--Consultas Avanzadas
SELECT c.CategoryName AS 'Nombre categoria',
p.ProductName AS 'Nombre producto' ,
p.UnitPrice AS 'Precio',
p.UnitsInstock As 'Existencia'
from
Categories AS C
INNER JOIN Products As P
ON c.CategoryID = p.CategoryID
WHERE CategoryName in ( 'Beverages', 'Produce')

--seleccionar todas las ordenes que fueron emitidas por los empleados
--Nancy Davolio, Anne Dodsworth y Andrew Fuller

SELECT * FROM Orders
WHERE EmployeeID = 1
or EmployeeID = 9
or EmployeeID = 2;

SELECT * FROM Orders
where EmployeeID in(1,9,2);

--seleccionar todas las ordenes, dividiendo la fecha de orden en año, mes y día
SELECT OrderDate as 'Fecha de Oren',
YEAR(OrderDate) as 'Año',
MONTH (OrderDate) as 'Mes',
day(OrderDate) as 'Dia'
 FROM Orders;

 --seleccionar todos los nombre de los empleados 
 SELECT CONCAT(FirstName, '' ,LastName) as 'Nombre completo' 
 FROM Employees

 --Seleccionar tosos los productos donde la existencia sea mayor o igual a 40 
 -- y el precio sea menor a 19

SELECT ProductName as 'Nombre del Producto',
UnitPrice as 'Precio',
UnitsInStock as 'Existencia'
FROM Products
WHERE UnitsInStock >=40
AND UnitPrice < 19;


--seleccionar todas las ordenes realizadas de abril a Agosto de 1996

SELECT OrderID , CustomerID, EmployeeID, OrderDate
FROM Orders
WHERE OrderDate>='1996-04-01' and OrderDate<='1996-08-31';

SELECT OrderID , CustomerID, EmployeeID, OrderDate
FROM Orders
WHERE OrderDate BETWEEN '1996-04-01' and '1996-08-31';

--seleccionar todas las ordenes entre 1996 y 1998
SELECT  * FROM  Orders
WHERE YEAR(OrderDate) BETWEEN '1996' and '1998'

--Seleccionar todas las ordenes de 1996 y 1999
SELECT  * FROM  Orders
WHERE YEAR(OrderDate) in ('1996', '1999')

--seleccionar todos los productos que comiencen con  C
SELECT *
 FROM Products
 WHERE ProductName like 'c%';

 --Seleccionar todos los productos que terminen con S
 SELECT *
 FROM Products
 WHERE ProductName like '%s';

--selecionar todos los productos que el nombre del producto contenga la palabra no
 SELECT *
 FROM Products
 WHERE ProductName like '%no%';

 --seleccionar todos los productos que contengan las letras A o N
  SELECT *
 FROM Products
 WHERE ProductName like '%[AN]%';

--seleccionar todos los productos que comiencen entre la letra A y N
SELECT*
FROM Products
WHERE ProductName like '[A-N]%'



SELECT o.OrderID as 'Numero de Orden',
o.OrderDate as 'Fecha Orden',
CONCAT(FirstName, '' ,LastName) as 'Nombre Empleado'
FROM Employees as e
INNER JOIN
Orders AS o
on e.EmployeeID= o.EmployeeID
WHERE e.FirstName in ('Nancy', 'Anne', 'Andrew')
and e.LastName in ('Davolio', 'Dodsworth', 'Fuller')

--crear base de datos 
CREATE DATABASE pruebaxyz;
--utilizar la base de datos
use pruebaxyz;

--Crear una tabla a pertir de un constraint a la tabla products2
select top 0 * 
into pruebaxyz.dbo.products2
from NORTHWND.dbo.Products;

SELECT*FROM products2
--Agragar un constraint a la tabla products2
ALTER table products2
add constraint pk_products2
primary key (Productid) 


select * from products2

--llenar una tabla a partir de una consulta

insert into pruebaxyz.dbo.products2 (ProductName,SupplierID,CategoryID,
QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,
ReorderLevel,Discontinued)


select ProductName,SupplierID,CategoryID,
QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,
ReorderLevel,Discontinued from NORTHWND.dbo.Products;


-- Ejercicio 1: Obtener el nombre del cliente y el nombre del empleado
-- del representante de ventas de cada pedido.

--Nombre del cliente (Customers)
--Nombre del empleado (Employees)
--Pedido


use NORTHWND;

SELECT o.CustomerId, o.Employeeid, o.OrderID, o.OrderDate 
FROM 
orders as o;

SELECT c.CompanyName as 'Nombre del cliente',
concat (e.FirstName,',',e.LastName) as 'Nombre Empleado',
o.OrderID, o.OrderDate, (od.Quantity * od.UnitPrice) as 'Importe' 
FROM Customers as c
INNER JOIN
Orders as o
on c.CustomerID = o.customerid
INNER JOIN Employees as e
on o.EmployeeID = e.EmployeeID
INNER JOIN [Order Details] as od
on od.OrderID= o.OrderID
WHERE year(OrderDate) in('1996','1998')

--seleccionar cuantas ordenes se han realizado en 1996 y 1998

SELECT COUNT(*) as 'Total de Ordenes' 
FROM Customers as c
INNER JOIN
Orders as o
on c.CustomerID = o.customerid
INNER JOIN Employees as e
on o.EmployeeID = e.EmployeeID
INNER JOIN [Order Details] as od
on od.OrderID= o.OrderID
WHERE year(OrderDate) in('1996','1998')
















--Ejercicio 5: Mostrar el nombre del proveedor, el nombre del contacto y el teléfono del contacto para cada proveedor.
--Ejercicio 6: Listar el nombre del producto, la categoría del producto y el nombre del proveedor para cada producto.
--Ejercicio 7: Obtener el nombre del cliente, el ID del pedido, el nombre del producto y la cantidad del producto para cada detalle del pedido.
--Ejercicio 8: Obtener el nombre del empleado, el nombre del territorio y la región del territorio para cada empleado que tiene asignado un territorio.
--Ejercicio 9: Mostrar el nombre del cliente, el nombre del transportista y el nombre del país del transportista para cada pedido enviado por un transportista.
--Ejercicio 10: Obtener el nombre del producto, el nombre de la categoría y la descripción de la categoría para cada producto que pertenece a una categoría.

--Ejercicio 11:  Seleccionar el total de ordenes hechas por cada uno de los proovedores

SELECT s.companyName as 'Provedor', COUNT(*) as 'Total de Ordenes'
FROM Suppliers as s
INNER JOIN Products as p
ON s.SupplierID = s.SupplierID
INNER JOIN [Order Details] as od
on od.OrderID = p.ProductID
GROUP BY s.CompanyName

--Ejercicio 12: seleccionar el total de dinero que e vendidod por proveedor del ultimo trimestre de 1996

SELECT sum(od.UnitPrice * od.Quantity) as 'Total de ventas $'
FROM Suppliers as s
INNER JOIN Products as p
ON s.SupplierID = p.SupplierID
INNER JOIN [Order Details] as od
on od.ProductID = p.ProductID
INNER JOIN Orders as o 
on o.OrderID = od.OrderID
WHERE o.OrderDate BETWEEN '1996-09-01' and '1996-12-31'
GROUP BY s.CompanyName 
ORDER BY 'Total de ventas $' DESC;

SELECT SUM(un)



--Ejercicio 13: seleccionar el total de dinero vendido por categoria
SELECT c.categoryname, 
sum(od.Quantity * od.UnitPrice) as 'total de ventas'
FROM [Order Details] as od
INNER JOIN Products as p
on od.ProductID = p.ProductID
INNER JOIN Categories as c
on c.CategoryID = p.CategoryID
GROUP BY c.CategoryName
ORDER by 2 DESC;

--Ejercicio 14: seleccionar el total de dinero vendido por categoria y dentro por producto

SELECT c.categoryname as 'Nombre de la categoria',
p.productname as 'producto',
SUM(od.Quantity * od.UnitPrice) as 'Total'
FROM [Order Details]  as [od]
INNER JOIN Products as p 
on od.ProductID=p.ProductID
INNER JOIN  Categories as c 
on c.CategoryID = p.CategoryID
GROUP by c.CategoryName, p.ProductName
ORDER by 1 desc;