use NORTHWND


--store procedures 
GO
create PROCEDURE sp_prueba_g1
as 
BEGIN
     print 'Hola Mundo';
END

--store procedures
GO
CREATE PROC sp_1
AS
BEGIN

--de claracion de variables
DECLARE @n INT
DECLARE @i INT

SET @n = 5;
SET @i = 1;

PRINT ('El valor de n es: ' + cast(@n as varchar))
PRINT ('El valor de i es: ' + cast(@i as varchar))

END

EXEC sp_1;

GO
CREATE DATABASE prueba_sp
use prueba_sp;



--Ejecutar 10 veces sp_1 solamente si el sentinela es 1

GO
CREATE PROC sp_2
as 
BEGIN

DECLARE @n INT = 10, @i INT = 1 

WHILE @i<=@n
BEGIN 
   PRINT (@i);
   SET @i+=1  --set @i = @i + 1
 END

 END
 EXEC sp_2;


--store procedure con parametro de entrada
GO
CREATE PROC sp_4
@n INT --parametro de entrada
as 
BEGIN
DECLARE @i int = 1

if @n>0
BEGIN

WHILE @i<=@n
BEGIN 
   PRINT (@i);
   SET @i+=1  --set @i = @i + 1
 END
 END
 ELSE
 BEGIN
     PRINT 'El valor de n debe ser mayor a 0'
 END
 END

 EXEC sp_4 5;
 EXEC sp_4 @n =20 

 go
 CREATE or ALTER PROC sp_5
@n INT --parametro de entrada
as 
BEGIN
DECLARE @i int = 1
DECLARE @acum INT =0

if @n>0
BEGIN

WHILE @i<=@n
BEGIN 
   SET @acum+=@i
   SET @i+=1  --set @i = @i + 1
 END

    PRINT('La suma de los numeros es: ' +cast(@acum as varchar))
END  ELSE  BEGIN
     PRINT 'El valor de n debe ser mayor a 0'
 END
 END

 EXEC sp_5 5;
 EXEC sp_5 @n =20 

 --seleccionar de la base de datos NORW  toda las ordenes de compra para un año determinado usando store procidio
 GO
 USE NORTHWND
 select * from orders


 GO
CREATE or ALTER PROC ps_6
@year INT
as 
BEGIN
 select * FROM ORDERS 
 WHERE DATEPART (year, ORDERDATE) = @year
END

 EXEC ps_6 1996;

 --Crear un sp, que muestre el total de ventas ($)
 --para cada cliente por un rango de años

CREATE PROC sp_7
as 
BEGIN
