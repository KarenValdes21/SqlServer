-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE SPAgregarCliente
    @ClienteID NVARCHAR(100),
    @IdSegmento INT,
    @idRegion INT,
    @IdCiudad INT,
    @IdEstado INT,
    @IdPais INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Insertar el nuevo cliente
        INSERT INTO Cliente (ClienteID, idSegmento, idRegion)
        VALUES (@ClienteID, @IdSegmento, @IdRegion);

        -- Insertar nueva región si no existe
     
            INSERT INTO Region (id, Region, idCiudad)
            VALUES (@IdRegion, 'Nombre de la Región',@IdCiudad); -- Aquí puedes especificar el nombre de la región
   
        -- Insertar nueva ciudad si no existe
  
            INSERT INTO Ciudad (id, Ciudad,idEstado)
            VALUES (@IdCiudad, 'Nombre de la Ciudad',@IdEstado); -- Aquí puedes especificar el nombre de la ciudad
     

        -- Insertar nuevo estado si no existe

            INSERT INTO Estado (id, Estado,idPais)
            VALUES (@IdEstado, 'Nombre del Estado',@IdPais); -- Aquí puedes especificar el nombre del estado
 

        -- Insertar nuevo país si no existe

            INSERT INTO Pais (id, Pais)
            VALUES (@IdPais, 'Nombre del País'); -- Aquí puedes especificar el nombre del país


        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        -- Aquí puedes manejar cualquier error que ocurra durante la transacción
    END CATCH;
END;
DROP PROCEDURE IF EXISTS SP_AgregarCliente;
