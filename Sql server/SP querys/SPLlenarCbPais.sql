USE [SuperMarketPrueba2]
GO
/****** Object:  StoredProcedure [dbo].[LlenarCbPais]    Script Date: 14/05/2024 12:30:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[LlenarCbPais]
as
begin 
	select  id, Pais as Nombre
	from Pais
end 
