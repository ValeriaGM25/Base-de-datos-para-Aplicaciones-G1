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


select*from products2

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