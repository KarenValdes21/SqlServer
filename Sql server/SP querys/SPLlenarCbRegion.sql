USE [SuperMarketPrueba2]
GO
/****** Object:  StoredProcedure [dbo].[LlenarCbRegion]    Script Date: 14/05/2024 12:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[LlenarCbRegion]
@id varchar (255)
as
begin 
	select  id, Region as Nombre
	from Region
	where idCiudad=@id
end 