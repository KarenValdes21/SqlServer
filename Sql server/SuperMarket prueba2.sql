use SuperMarketPrueba2

select * from [dbo].[Sample_ Superstore]

create table Producto(
   id INT IDENTITY(1,1) PRIMARY KEY,
   ProductoID varchar (30),
   NombreProducto VARCHAR(255),
   idUsuarioCrea INT,
   idUsuarioModifica INT DEFAULT NULL,
   fechaCrea DATETIME DEFAULT GETDATE(),
   fechaModifica DATETIME DEFAULT NULL,
   estatus BIT DEFAULT 1
)
alter table Producto
add idSubcategoria int

create table Categoria(
   id INT IDENTITY(1,1) PRIMARY KEY,
   Categoria varchar(255),
   idsubcategoria int,
   idUsuarioCrea INT,
   idUsuarioModifica INT DEFAULT NULL,
   fechaCrea DATETIME DEFAULT GETDATE(),
   fechaModifica DATETIME DEFAULT NULL,
   estatus BIT DEFAULT 1
)

create table Subcategoria(
   id INT IDENTITY(1,1) PRIMARY KEY,
   Subcategoria varchar(40),
   idUsuarioCrea INT,
   idCategoria INT,
   idUsuarioModifica INT DEFAULT NULL,
   fechaCrea DATETIME DEFAULT GETDATE(),
   fechaModifica DATETIME DEFAULT NULL,
   estatus BIT DEFAULT 1
   )
  -- alter table Subcategoria add idCategoria int


create table Cliente(
   id INT IDENTITY(1,1) PRIMARY KEY,
     ClienteID varchar (30),
	 idSegmento int,
	 idRegion int,
	idUsuarioCrea INT,
idUsuarioModifica INT DEFAULT NULL,
fechaCrea DATETIME DEFAULT GETDATE(),
fechaModifica DATETIME DEFAULT NULL,
estatus BIT DEFAULT 1
   )

--alter table Cliente add idSegmento int

select * from Cliente

create table Segmento(
   id INT IDENTITY(1,1) PRIMARY KEY,
   Segmento varchar (50),
   idUsuarioCrea INT,
idUsuarioModifica INT DEFAULT NULL,
fechaCrea DATETIME DEFAULT GETDATE(),
fechaModifica DATETIME DEFAULT NULL,
estatus BIT DEFAULT 1
   )

   create table Ciudad(
   id INT IDENTITY(1,1) PRIMARY KEY,
   Ciudad varchar (max),
   idEstado int,
    	idUsuarioCrea INT,
idUsuarioModifica INT DEFAULT NULL,
fechaCrea DATETIME DEFAULT GETDATE(),
fechaModifica DATETIME DEFAULT NULL,
estatus BIT DEFAULT 1
)

--alter table Ciudad add idEstado int

   create table Pais(
   id INT IDENTITY(1,1) PRIMARY KEY,
   Pais varchar (max),
   	idUsuarioCrea INT,
idUsuarioModifica INT DEFAULT NULL,
fechaCrea DATETIME DEFAULT GETDATE(),
fechaModifica DATETIME DEFAULT NULL,
estatus BIT DEFAULT 1
)


create table Estado(
   id INT IDENTITY(1,1) PRIMARY KEY,
   Estado varchar (max),
   idPais int,
     	idUsuarioCrea INT,
idUsuarioModifica INT DEFAULT NULL,
fechaCrea DATETIME DEFAULT GETDATE(),
fechaModifica DATETIME DEFAULT NULL,
estatus BIT DEFAULT 1
)
--alter table Estado add idPais int

create table Region(
   id INT IDENTITY(1,1) PRIMARY KEY,
   Region varchar (max),
   idCiudad int,
   	idUsuarioCrea INT,
idUsuarioModifica INT DEFAULT NULL,
fechaCrea DATETIME DEFAULT GETDATE(),
fechaModifica DATETIME DEFAULT NULL,
estatus BIT DEFAULT 1
)
--alter table Region add idCiudad int
select * from Region

   create table Pedido(
      id INT IDENTITY(1,1) PRIMARY KEY,
	   PedidoID varchar (30),
	   OrdenFecha nvarchar (30),
	   EnvioFecha nvarchar (30),
	   ModoEnvio nvarchar (30),	   
	   Precio nvarchar (30),--venta
       Cantidad nvarchar (30),
       Descuento nvarchar (30),
       Ganancia nvarchar (30) ,
	   idUsuarioCrea INT,
	   idCliente int,
	   idProducto int,
idUsuarioModifica INT DEFAULT NULL,
fechaCrea DATETIME DEFAULT GETDATE(),
fechaModifica DATETIME DEFAULT NULL,
estatus BIT DEFAULT 1,

   )

      CREATE TABLE Usuario(
id INT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
username VARCHAR(50) NOT NULL,
contraseña VARCHAR(50),
estatus BIT DEFAULT 1,
)
   
   ALTER TABLE Pedido
ADD CONSTRAINT fk_cliente
FOREIGN KEY (idCliente) 
REFERENCES Cliente(id);

ALTER TABLE Pedido
ADD CONSTRAINT fk_producto
FOREIGN KEY (idProducto) 
REFERENCES Producto(id);

-- Relación entre país y estado
ALTER TABLE Estado
ADD CONSTRAINT fk_estado_pais
FOREIGN KEY (idPais) 
REFERENCES Pais(id);

-- Relación entre estado y ciudad
ALTER TABLE Ciudad
ADD CONSTRAINT fk_ciudad_estado
FOREIGN KEY (idEstado) 
REFERENCES Estado(id);

-- Relación entre ciudad y región

ALTER TABLE Region
ADD CONSTRAINT fk_region_ciudad
FOREIGN KEY (idCiudad) 
REFERENCES Ciudad(id);


-- Relación entre región y cliente
ALTER TABLE Cliente
ADD CONSTRAINT fk_cliente_region
FOREIGN KEY (idRegion) 
REFERENCES Region(id);

--
ALTER TABLE Producto
ADD CONSTRAINT fk_subcategoria
FOREIGN KEY (idSubcategoria) 
REFERENCES Subcategoria(id);

ALTER TABLE subcategoria
ADD CONSTRAINT fk_categoria
FOREIGN KEY (idCategoria) 
REFERENCES Categoria(id);

ALTER TABLE Cliente
ADD CONSTRAINT fk_segmento
FOREIGN KEY (idSegmento) 
REFERENCES Segmento(id);


-- CONECTAR TABLAS CON USUARIO

ALTER TABLE Cliente
ADD CONSTRAINT FK_ClienteUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id)

ALTER TABLE Cliente
ADD CONSTRAINT FK_ClienteUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id)

ALTER TABLE Pedido
ADD CONSTRAINT FK_PedidoUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id)

ALTER TABLE Pedido
ADD CONSTRAINT FK_PedidoUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id)

ALTER TABLE Producto
ADD CONSTRAINT FK_ProductoUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id)

ALTER TABLE Producto
ADD CONSTRAINT FK_ProductoUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id)


ALTER TABLE Categoria
ADD CONSTRAINT FK_CategoriaUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id)

ALTER TABLE Categoria
ADD CONSTRAINT FK_CategoriaUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id)

ALTER TABLE Subcategoria
ADD CONSTRAINT FK_SubcategoriaUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id)

ALTER TABLE Subcategoria
ADD CONSTRAINT FK_SubcategoriaUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id)

ALTER TABLE Segmento
ADD CONSTRAINT FK_SegmentoUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id)

ALTER TABLE Segmento
ADD CONSTRAINT FK_SegmentoUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id)

ALTER TABLE Pais
ADD CONSTRAINT FK_PaisUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id)

ALTER TABLE Pais
ADD CONSTRAINT FK_PaisUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id)

ALTER TABLE Ciudad
ADD CONSTRAINT FK_CiudadUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id)

ALTER TABLE Ciudad
ADD CONSTRAINT FK_CiudadUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id)

ALTER TABLE Estado
ADD CONSTRAINT FK_EstadoUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id)

ALTER TABLE Estado
ADD CONSTRAINT FK_EstadoUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id)

ALTER TABLE Region
ADD CONSTRAINT FK_RegionUsuarioCrea
FOREIGN KEY (idUsuarioCrea) REFERENCES Usuario(id)

ALTER TABLE Region
ADD CONSTRAINT FK_RegionUsuarioModifica
FOREIGN KEY (idUsuarioModifica) REFERENCES Usuario(id)


-- INDICES
CREATE INDEX IX_Usuario ON Usuario(id)

CREATE INDEX IX_Pedido ON Pedido(id)

CREATE INDEX IX_Cliente ON Cliente(id)

CREATE INDEX IX_Producto ON Producto(id)

CREATE INDEX IX_Categoria ON Categoria(id)

CREATE INDEX IX_Subcategoria ON Subcategoria(id)

CREATE INDEX IX_Segmento ON Segmento(id)

CREATE INDEX IX_Region ON Region(id)

CREATE INDEX IX_Ciudad ON Ciudad(id)

CREATE INDEX IX_Estado ON Estado(id)

CREATE INDEX IX_Pais ON Pais(id)

--POBLAR

INSERT INTO usuario (nombre, username, contraseña)
VALUES ('Admin','admin',CONVERT(NVARCHAR(50), HASHBYTES('SHA1','admin'),2))
 select * from Subcategoria
 --
insert into Categoria(Categoria,idUsuarioCrea)
select distinct Category,1
from [dbo].[Sample_ Superstore]
--
insert into Pais(Pais,idUsuarioCrea)
select distinct  Country,1
from [dbo].[Sample_ Superstore]
--
insert into Segmento(Segmento,idUsuarioCrea)
select distinct Segment,1
from [dbo].[Sample_ Superstore]

   
insert into Estado(Estado,idPais ,idUsuarioCrea)
select distinct State,
(SELECT (id) FROM Pais WHERE Pais = [dbo].[Sample_ Superstore].[Country]) as idPais
,1
from [dbo].[Sample_ Superstore]


insert into Ciudad(Ciudad,idUsuarioCrea,idEstado)
select distinct City,1,(SELECT TOP 1(id) FROM Estado WHERE Estado = [dbo].[Sample_ Superstore].[State]) as idEstado
from [dbo].[Sample_ Superstore]


insert into Region(Region,idCiudad ,idUsuarioCrea)
select distinct Region,
(SELECT TOP 1(id) FROM Ciudad WHERE Ciudad = [dbo].[Sample_ Superstore].[City]) as idCiudad,1
from [dbo].[Sample_ Superstore]

insert into Subcategoria(Subcategoria,idUsuarioCrea,idCategoria)
select distinct Sub_Category,1,(SELECT (id) FROM Categoria WHERE Categoria = [dbo].[Sample_ Superstore].[Category]) as idCategoria
from [dbo].[Sample_ Superstore]


insert into Producto(ProductoID,NombreProducto,idUsuarioCrea,idSubcategoria)
select distinct Product_ID,Product_Name,1,(SELECT (id) FROM Subcategoria WHERE Subcategoria = [dbo].[Sample_ Superstore].[Sub_Category]) as idSubcategoria
from [dbo].[Sample_ Superstore]
select* from Producto

INSERT INTO Cliente (ClienteID, idRegion, idSegmento, idUsuarioCrea)
SELECT DISTINCT 
    Customer_ID,
    (SELECT top 1 (id) FROM Region WHERE Region = [dbo].[Sample_ Superstore].[Region]) AS idRegion,
    (SELECT(id) FROM Segmento WHERE Segmento =[dbo].[Sample_ Superstore].[Segment]) AS idSegmento,
    1 AS idUsuarioCrea
FROM [dbo].[Sample_ Superstore];

select * from Pedido

insert into Pedido(PedidoID,Precio,Cantidad,Descuento,Ganancia,OrdenFecha,EnvioFecha,ModoEnvio,idCliente,idProducto ,idUsuarioCrea)
select distinct Order_ID,Sales,Quantity,Discount,Profit,Order_Date,Ship_Date,Ship_Mode,
(SELECT TOP 1(id) FROM Cliente WHERE ClienteID = [dbo].[Sample_ Superstore].[Customer_ID]) as idCliente,
(SELECT TOP 1(id) FROM Producto WHERE ProductoID = [dbo].[Sample_ Superstore].[Product_ID]) as idProducto,1
from [dbo].[Sample_ Superstore]


CREATE VIEW Vw_DatosCliente AS
SELECT c.id, c.ClienteID AS Cliente_Identificador,
p.Pais AS NombrePais,
e.Estado AS NombreEstado,
ci.Ciudad AS NombreCiudad,
r.Region AS NombreRegion,
s.Segmento AS NombreSegmento
FROM Cliente c
inner JOIN Region r ON c.idRegion = r.id
inner JOIN Ciudad ci ON r.idCiudad = ci.id
inner JOIN Estado e ON ci.idEstado = e.id
inner JOIN Pais p ON e.idPais = p.id
inner JOIN Segmento s ON c.idSegmento = s.id;

create view VW_DatosSuperMarket as 
SELECT c.id, c.ClienteID AS Cliente_Identificador,
p.Pais AS NombrePais,
e.Estado AS NombreEstado,
ci.Ciudad AS NombreCiudad,
r.Region AS NombreRegion,
s.Segmento AS NombreSegmento, 
pro.NombreProducto, sub.Subcategoria,Cat.Categoria
FROM Pedido ped
inner join Producto pro on ped.idProducto= pro.id
inner join Subcategoria sub on pro.idSubcategoria =sub.id
inner join Categoria cat on sub.idCategoria = cat.id
inner join Cliente c on Ped.idCliente =c.id
inner JOIN Region r ON c.idRegion = r.id
inner JOIN Ciudad ci ON r.idCiudad = ci.id
inner JOIN Estado e ON ci.idEstado = e.id
inner JOIN Pais p ON e.idPais = p.id
inner JOIN Segmento s ON c.idSegmento = s.id

create view VW_DatosSuperMarket1 as 
SELECT c.id, c.ClienteID AS Cliente_Identificador,
p.Pais AS NombrePais, 
e.Estado AS NombreEstado,
ci.Ciudad AS NombreCiudad,
r.Region AS NombreRegion,
s.Segmento AS NombreSegmento, 
pro.NombreProducto,ped.PedidoID,ped.Precio,ped.Cantidad,ped.Descuento,ped.Ganancia,ped.ModoEnvio,ped.OrdenFecha,ped.EnvioFecha,
sub.Subcategoria,Cat.Categoria,
pro.ProductoID
FROM Pedido ped
inner join Producto pro on ped.idProducto= pro.id
inner join Subcategoria sub on pro.idSubcategoria =sub.id
inner join Categoria cat on sub.idCategoria = cat.id
inner join Cliente c on Ped.idCliente =c.id
inner JOIN Region r ON c.idRegion = r.id
inner JOIN Ciudad ci ON r.idCiudad = ci.id
inner JOIN Estado e ON ci.idEstado = e.id
inner JOIN Pais p ON e.idPais = p.id
inner JOIN Segmento s ON c.idSegmento = s.id

select distinct Cliente_Identificador,NombreSegmento,NombreRegion, NombreCiudad, NombreEstado , NombrePais 
from VW_DatosSuperMarket
where NombreEstado='Oregon'

select id, ProductoID,NombreProducto,Categoria,Subcategoria
from VW_DatosSuperMarket1

select * from Producto where ProductoID ='lola'
select * from Cliente

alter procedure LlenarCbRegion
@id varchar (255)
as
begin 
	select  id, Region as Nombre
	from Region
	where idCiudad=@id
end 
exec LlenarCbRegion 

create procedure LlenarCbCiudad
as
begin 
	select  id, Ciudad as Nombre
	from Ciudad
end 

create procedure LlenarCbPais
as
begin 
	select  id, Pais as Nombre
	from Pais
end 


create procedure LlenarCbEstado
as
begin 
	select  id, Estado as Nombre
	from Estado
end 

alter procedure llenarDtCliente
@idpais varchar (255),
@idEstado varchar (255),
@idCiudad varchar (255),
@idRegion varchar (255),
@texto varchar (255)
as 
begin
	select  c.id, c.ClienteID AS Cliente_Identificador,
	p.Pais AS NombrePais,
	e.Estado AS NombreEstado,
	ci.Ciudad AS NombreCiudad,
	r.Region AS NombreRegion
	from Cliente c
	inner JOIN Region r ON c.idRegion = r.id
	inner JOIN Ciudad ci ON r.idCiudad = ci.id
	inner JOIN Estado e ON ci.idEstado = e.id
	inner JOIN Pais p ON e.idPais = p.id
	where r.id like'%'+ @idRegion+'%' and ci.id like'%'+ @idCiudad +'%'and e.id like'%'+ @idEstado+'%'and p.id like'%'+ @idpais+'%' and c.ClienteID like '%'+@texto+'%'
end

exec llenarDtCliente '1','','1','',''

select * from region

select * from Estado where Estado='Pennsylvania'
select * from Ciudad order by Ciudad
