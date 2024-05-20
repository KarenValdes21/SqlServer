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
CREATE PROCEDURE ModificarCliente
    @ClienteID INT,
    @NombreCliente NVARCHAR(100),
    @IdSegmento INT,
    @IdRegion INT,
    @IdCiudad INT,
    @IdEstado INT,
    @IdPais INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Modificar el cliente existente
        UPDATE Cliente 
        SET 
            idSegmento = @IdSegmento,
            idRegion = @IdRegion
        WHERE ClienteID = @ClienteID;

        -- Modificar la región si existe
        IF EXISTS (SELECT 1 FROM Region WHERE id = @IdRegion)
        BEGIN
            UPDATE Region
            SET Region = 'Nuevo Nombre de la Región' -- Actualiza el nombre de la región si es necesario
            WHERE id = @IdRegion;
        END;

        -- Modificar la ciudad si existe
        IF EXISTS (SELECT 1 FROM Ciudad WHERE id = @IdCiudad)
        BEGIN
            UPDATE Ciudad
            SET idRegion = @IdRegion,
                Ciudad = 'Nuevo Nombre de la Ciudad' -- Actualiza el nombre de la ciudad si es necesario
            WHERE id = @IdCiudad;
        END;

        -- Modificar el estado si existe
        IF EXISTS (SELECT 1 FROM Estado WHERE id = @IdEstado)
        BEGIN
            UPDATE Estado
            SET idPais = @IdPais,
                Estado = 'Nuevo Nombre del Estado' -- Actualiza el nombre del estado si es necesario
            WHERE id = @IdEstado;
        END;

        -- Modificar el país si existe
        IF EXISTS (SELECT 1 FROM Pais WHERE id = @IdPais)
        BEGIN
            UPDATE Pais
            SET Pais = 'Nuevo Nombre del País' -- Actualiza el nombre del país si es necesario
            WHERE id = @IdPais;
        END;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        -- Aquí puedes manejar cualquier error que ocurra durante la transacción
    END CATCH;
END;

