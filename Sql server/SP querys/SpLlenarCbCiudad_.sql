USE [SuperMarketPrueba2]
GO
/****** Object:  StoredProcedure [dbo].[LlenarCbCiudad]    Script Date: 14/05/2024 12:28:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[LlenarCbCiudad]
as
begin 
	select  id, Ciudad as Nombre
	from Ciudad
end 
