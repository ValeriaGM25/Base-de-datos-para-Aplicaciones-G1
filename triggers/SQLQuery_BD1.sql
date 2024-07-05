use NORTHWND
--lenguaje SQL-LMD

--seleccionar todos los productos
SELECT * FROM Products;

--seleccionar todas las categorias
SELECT *FROM Categories;

--seleccionar los provedores
SELECT *FROM Suppliers;

--seleccionar los clientes
SELECT *FROM Customers;

--selecionar los empleados
SELECT * FROM Employees;

--seleccionar todos las paqueterias
SELECT *FROM Shippers;

--seleccionar todas la ordenes 
SELECT * FROM Orders;

--seleccionar todos los detalles de ordenes
SELECT * FROM [Order Details];

--proyecciones
--Alias de columna
SELECT ProductID AS 'Numero Producto', ProductName AS 'Nombre Producto', UnitsInStock AS Existencia, UnitPrice AS 'Precio' FROM Products; 

--Alias de tablas
SELECT ProductID AS 'Numero Producto', ProductName AS 'Nombre Producto',
 UnitsInStock AS Existencia, UnitPrice AS 'Precio' FROM Products; 

SELECT * FROM Products, Categories
WHERE Categories.CategoryID = Products.CategoryID

SELECT * FROM Products
SELECT * FROM Customers

-- Campo calculado 
-- Seleccionar todos los productos mostrando el ID del producto,
-- El nombre del producto, la exixtencia, el precio y el importe

SELECT *, (UnitPrice * UnitsInStock) AS 'Importe' FROM Products;

SELECT ProductID AS 'Numero Producto', 
ProductName AS 'Nombre del Producto',
UnitsInStock AS 'Existencia',
UnitPrice AS 'Precio',
 (UnitPrice * UnitsInStock) AS 'Importe'
  FROM Products;

  --Sleccionar las primeras 10 ordenas

SELECT * FROM Orders;
 SELECT top 10 * FROM Orders;

 --Seleccionar tos los clientes ordenados de forma ascendete por el pais

 --Opción 1
SELECT  CustomerID as 'Numero de Cliente',
 companyName as 'Noambre del Cliente',
[address] as 'Direccion', 
city as 'Ciudad', 
Country as 'Pais'
 FROM Customers
 ORDER by country ASC;

--Opción 2
 SELECT  CustomerID as 'Numero de Cliente',
 companyName as 'Nombre del Cliente',
[address] as 'Direccion', 
city as 'Ciudad', 
Country as 'Pais'
 FROM Customers
 ORDER by 5 ASC;

--Opción 3 por el alias
 SELECT  CustomerID as 'Numero de Cliente',
 companyName as 'Nombre del Cliente',
[address] as 'Direccion', 
city as 'Ciudad', 
Country as 'Pais'
 FROM Customers
 ORDER by 'Pais' ASC;

 --Seleccionar todos los cliente ordenados por pais de forma decendete 

 --Opción 1
SELECT  CustomerID as 'Numero de Cliente',
 companyName as 'Nombre del Cliente',
[address] as 'Direccion', 
city as 'Ciudad', 
Country as 'Pais'
 FROM Customers
 ORDER by country DESC;

--Opción 2
SELECT  CustomerID as 'Numero de Cliente',
companyName as 'Nombre del Cliente',
[address] as 'Direccion', 
city as 'Ciudad', 
Country as 'Pais'
FROM Customers
ORDER by 5 DESC;

--Opción 3 por el alias
SELECT  CustomerID as 'Numero de Cliente',
companyName as 'Nombre del Cliente',
[address] as 'Direccion', 
city as 'Ciudad', 
Country as 'Pais'
FROM Customers
ORDER by 'Pais' DESC;

--SELECCIONA TODOS LOS CLIENTES ORDENADOS DE FORMA ASCENDENTE POR PAIS Y DENTRO DE 
--CADA PAIS ORDENADO POR CIUDAD DE FORMA DESCENDENTE

SELECT CustomerID, companyName, country, City
FROM Customers
ORDER BY Country, city DESC; 

--Operadores relacionales 
--(<, >, <=, >=,==, <>, o !=)

--Seleccionar todos los paises a los cuales se les a enviado las ordenes
SELECT distinct ShipCountry FROM Orders
ORDER by 1

--Seleccionar todas las ordenes enviadas a francia
SELECT * FROM Orders
WHERE ShipCountry = 'France'

--Seleccionar todas las ordenes realizadas a Francia, mostrando,
--Numero de orden, cliente al que se le envio, empleado que la realizo,
--el pais al qe se envio, ciudad a la que se envio 
SELECT OrderID as 'Numero de orden',
CustomerID as 'Cliente',
EmployeeID as 'Empleado',
ShipCountry as 'Pais',
ShipCity as 'Ciudad'
 FROM Orders
 WHERE ShipCountry = 'France'

--Seleccionar las ordenes en donde no se ha asignado una region de  envio
SELECT OrderID as 'Numero de orden',
CustomerID as 'Cliente',
EmployeeID as 'Empleado',
ShipCountry as 'Pais',
ShipCity as 'Ciudad', ShipRegion
 FROM Orders
 WHERE ShipRegion is null


 --Seleccionar las ordenes en donde  se ha asignado una region de  envio
SELECT OrderID as 'Numero de orden',
CustomerID as 'Cliente',
EmployeeID as 'Empleado',
ShipCountry as 'Pais',
ShipCity as 'Ciudad', ShipRegion
 FROM Orders
 WHERE ShipRegion is not null

--Seleccionar los productos con un precio mayor a 50 dolares

-- seleccionar los empleados contratados despues de 1 de enero 1990

--Seleccionar los clientes cuyo ID sea mayor que 10 

--mostrar los productos con una cantidad menor o igual  100

-- seleccionar todas las ordenes realizadas antes del primero de enero

SELECT * FROM Products
WHERE UnitPrice > 50

SELECT* FROM Employees;
WHERE HireDate>'1990-01-01'

SELECT * FROM Customers
WHERE Country = 'German'

SELECT * FROM Products
where UnitsInStock <= 100

SELECT * FROM Orders
WHERE OrderDate< '1990-01-01'

--seleccionar todas las ordenes realizadas por el empleado fuller

SELECT * FROM Orders
WHERE EmployeeID = 2

--seleccionar todas las ordenes mostrando el num de orden, el cliente 
--y la fecha de orden dividida en año, mes y día

SELECT OrderID, CustomerID, OrderDate, YEAR(OrderDate) as 'Año',
 MONTH(OrderDate) as 'Mes', DAY(OrderDate) as 'Dia'
 FROM Orders

 --Operadores logicos
--Seleccionar los productos con un precio mayor a 50 y con una cantidad menor o igual a 100
SELECT * FROM Products
WHERE UnitPrice > 50 and UnitsInStock<=100

--Sleccionar todas llas ordenes para francia y alemania 
SELECT * from Orders
WHERE ShipCountry = 'France'or ShipCountry = 'Germany'

SELECT * from Orders
WHERE ShipCountry in ('France', 'Germany')

--Sleccionar todas las ordenes para francia, alemania y mexico
SELECT *  FROM Orders
WHERE ShipCountry = ' France'
or ShipCountry = 'Germany'
or ShipCountry = 'Mexico'

Select * from Orders
Where ShipCountry in ()









