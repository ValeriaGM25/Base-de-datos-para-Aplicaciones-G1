--Fucnoines de Agregado y agrupación

--Utilizar base de datos
use NORTHWND

--Funciones de agregado

--Seleccionar el numero de total de ordenes de compra

--count(*)
SELECT COUNT(*) as 'Nomero de ordenes' FROM  Orders;

SELECT * FROM Customers

--Count(campo)
SELECT  COUNT(region) FROM Customers;

--seleccionar el maximo numero de producos pedido
select MAX(Quantity) as 'Cantidad'
 FROM [Order Details];

 --Selecionar el total de las catidades de los productos vendidos 

SELECT CategoryID, COUNT(*) as 'numero de productos'
from Products

SELECT CategoryID
FROM Products


SELECT CategoryID, count(*) as ' total de productos'
FROM Products
GROUP by CategoryID

--seleccionar el num de productos por nombres de categoria
SELECT c.CategoryName, count(ProductID) as ' total de Productos'
FROM categories as c
INNER JOIN Products as p
on c.CategoryID = p.CategoryID
WHERE c.CategoryName in ('Beverges','Confections ')
GROUP by c.CategoryName;


