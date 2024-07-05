
--Declaracion de y uso de variables en transact-sql
--SIEMPRE LLEVAN @
--Declaración de una variable
DECLARE @numeroCal int 
DECLARE @calif DECIMAL(10,2)
--(10,2) 10 enteros y 2 decimales

--Asignación de variables
SET @numeroCal = 10
IF @numeroCal <=0
BEGIN
SET @numeroCal = 1
END

DECLARE @i=1
WHILE(@i<=@numeroCal)
BEGIN
SET @calif = @calif + 10
SET @i= @i+1
END
set @calif=@calif/@numeroCal
PRINT('El resultado es:' +@calif)
