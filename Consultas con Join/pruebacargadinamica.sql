CREATE DATABASE pruebacargadinamica;

USE pruebacargadinamica;


select top 0 * 
into pruebacargadinamica.dbo.empleado
from NORTHWND.dbo.Employees;



select top 0 EmployeeID, FirstName, LastName, [Address], HomePhone, Country
into pruebacargadinamica.dbo.empleado
from NORTHWND.dbo.Employees;


select top 0 EmployeeID, CONCAT(FirstName, '', LastName) as 'Nombre' , [Address], HomePhone, co
into pruebacargadinamica.dbo.Dim_Empleados
from pruebacargadinamica.dbo.empleado;

insert into pruebacargadinamica.dbo.empleado (FirstName, LastName, [Address], HomePhone, Country)
select FirstName, LastName, [Address], HomePhone, Country 
from NORTHWND.dbo.Employees;

