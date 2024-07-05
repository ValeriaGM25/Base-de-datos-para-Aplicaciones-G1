--Parametros de salida 

--Ejemplo clase
CREATE OR ALTER PROCEDURE calcular_area
@radio float,
@area float OUTPUT
AS
BEGIN
    SET @area = PI() *@radio
END 

DECLARE @resp float
exec calcular_area @radio = 22.3, @area = @resp
print 'El area es: ' +  cast(@resp as varchar)

go

--Ejercicio clase
create or alter proc sp_obtenerdatosempleado
@numeroEmpleado int,
@fullname nvarchar (35) output
as
begin

select @fullname=concat (FirstName, '', LastName)
from 
Employees
where EmployeeID =  @numeroEmpleado 
end;
go
declare @nombreCompleto varchar (20)
exec sp_obtenerdatosempleado 3, @fullname = @nombreCompleto output
print @nombreCompleto;

--ejercicio2
create or alter proc sp_obtenerdatosempleado2
@numeroEmpleado int,
@fullname nvarchar (35) output
as
begin
     @verificar int


select @fullname=concat (FirstName, '', LastName)
from 
Employees
where EmployeeID =  @numeroEmpleado 
end;
go
declare @nombreCompleto varchar (20)
exec sp_obtenerdatosempleado 3, @fullname = @nombreCompleto output
print @nombreCompleto;