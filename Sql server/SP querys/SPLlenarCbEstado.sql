USE [SuperMarketPrueba2]
GO
/****** Object:  StoredProcedure [dbo].[LlenarCbEstado]    Script Date: 14/05/2024 12:29:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[LlenarCbEstado]
as
begin 
	select  id, Estado as Nombre
	from Estado
end 
