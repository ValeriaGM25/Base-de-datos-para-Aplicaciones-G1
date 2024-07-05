
--Creacion de base de dato 

create database etlempresa;
use etlempresa;

select * from Customers;

--Creacion de tablas
create table cliente(
clienteid int not null identity (1,1),
clientebk nchar(5) not null,
empresa nvarchar (40) not null,
ciudad nvarchar (15) not null,
region nvarchar(15) not null,
pais nvarchar (15) not null,
constraint pk_cliente
primary key(clienteid)
);

CREATE TABLE empresas (
  empresaid INT PRIMARY KEY NOT NULL,
  nombreEmpresa VARCHAR(255) NOT NULL,
  ciudad VARCHAR(255) NOT NULL,
  region VARCHAR(255) NOT NULL,
  pais VARCHAR(255) NOT NULL
);

CREATE TABLE empleados (
  empleadoid INT PRIMARY KEY NOT NULL,
  nombreCompleto VARCHAR(255) NOT NULL,
  ciudad VARCHAR(255) NOT NULL,
  region VARCHAR(255) NOT NULL,
  pais VARCHAR(255) NOT NULL,
  empresaid INT NOT NULL,
  FOREIGN KEY (empresaid ) REFERENCES empresas(empresaid )
);

CREATE TABLE pedidos (
  pedidoid INT PRIMARY KEY NOT NULL,
  clienteid INT NOT NULL,
  fechaPedido DATE NOT NULL,
  estatusPedido VARCHAR(255) NOT NULL,
  FOREIGN KEY (clienteid) REFERENCES cliente(clienteid)
);

CREATE TABLE Proveedores (
  proveedorid INT PRIMARY KEY NOT NULL,
  nombreProveedor VARCHAR(255) NOT NULL,
  ciudad VARCHAR(255) NOT NULL,
  region VARCHAR(255) NOT NULL,
  pais VARCHAR(255) NOT NULL
);

CREATE TABLE Categorias (
  categoriaid INT PRIMARY KEY NOT NULL,
  nombreCategoria VARCHAR(255) NOT NULL
);

CREATE TABLE productos (
  productoid INT PRIMARY KEY NOT NULL,
  nombreProducto VARCHAR(255) NOT NULL,
  descripcion TEXT NOT NULL,
  precioUnitario DECIMAL(10,2) NOT NULL,
  proveedorID INT NOT NULL,
  categoriaID INT NOT NULL,
  FOREIGN KEY (proveedorid) REFERENCES proveedores(proveedorid),
  FOREIGN KEY (categoriaid) REFERENCES categorias(categoriaid)
);

CREATE TABLE detallesPedidos (
  detallePedidoid INT PRIMARY KEY NOT NULL,
  pedidoid INT NOT NULL,
  productoid INT NOT NULL,
  cantidad INT NOT NULL,
  precioUnitario DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (pedidoid) REFERENCES Pedidos(pedidoid),
  FOREIGN KEY (productoid) REFERENCES productos(productoid)
);

SELECT *
INTO etlempresa.dbo.cliente
FROM NORTHWND.dbo.Customers;




insert into etlempresa.dbo.cliente
select CustomerID, upper(CompanyName) as 'Empresa' , upper(City) as Ciudad,
upper( isnull(nc.Region , 'Sin Region'))as Region, upper(Country) as pais
from NORTHWND.dbo.Customers as nc

UPDATE cl.empresa = UPPER (c.CompanyName),
cl.ciudad = UPPER

select * from NORTHWND.dbo.Customers as nc
left join etlempresa.dbo.cliente etle
on nc.CustomerID = etle.clientebk
where etle.clientebk is null;