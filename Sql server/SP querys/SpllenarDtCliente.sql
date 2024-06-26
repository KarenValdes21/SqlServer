USE [SuperMarketPrueba2]
GO
/****** Object:  StoredProcedure [dbo].[llenarDtCliente]    Script Date: 14/05/2024 12:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[llenarDtCliente]
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