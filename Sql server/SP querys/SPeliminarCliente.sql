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
CREATE PROCEDURE EliminarCliente
    @ClienteID INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Eliminar los registros relacionados en la tabla Segmento
        DELETE FROM Segmento WHERE id = (SELECT idSegmento FROM Cliente WHERE id = @ClienteID);

        -- Eliminar los registros relacionados en la tabla Region
        DELETE FROM Region WHERE id = (SELECT idRegion FROM Cliente WHERE id = @ClienteID);

        -- Eliminar los registros relacionados en la tabla Estado
        DELETE FROM Estado WHERE id IN (SELECT idEstado FROM Ciudad WHERE idRegion = (SELECT idRegion FROM Cliente WHERE id = @ClienteID));

        -- Eliminar los registros relacionados en la tabla Ciudad
        DELETE FROM Ciudad WHERE idRegion = (SELECT idRegion FROM Cliente WHERE id = @ClienteID);

        -- Eliminar los registros relacionados en la tabla Pais
        DELETE FROM Pais WHERE id IN (SELECT idPais FROM Estado WHERE id IN (SELECT idEstado FROM Ciudad WHERE idRegion = (SELECT idRegion FROM Cliente WHERE id = @ClienteID)));

        -- Eliminar el registro de la tabla Cliente
        DELETE FROM Cliente WHERE id = @ClienteID;

        COMMIT TRANSACTION;
        PRINT 'El cliente y sus datos relacionados han sido eliminados correctamente.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        PRINT 'Ocurrió un error al intentar eliminar el cliente y sus datos relacionados.';
    END CATCH;
END;
