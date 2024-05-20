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
CREATE PROCEDURE SP_AgregarProducto
    @ProductoID VARCHAR(30),
    @NombreProducto VARCHAR(255),
    @IdUsuarioCrea INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Insertar el nuevo producto
        INSERT INTO Producto (ProductoID, NombreProducto, idUsuarioCrea)
        VALUES (@ProductoID, @NombreProducto, @IdUsuarioCrea);

        COMMIT TRANSACTION;
        PRINT 'El producto se ha agregado correctamente.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        PRINT 'Ocurrió un error al intentar agregar el producto.';
        THROW; -- Lanza el error para su manejo externo
    END CATCH;
END;

DECLARE @ProductoID VARCHAR(30) = 'PROD001';
DECLARE @NombreProducto VARCHAR(255) = 'Licuadora';
DECLARE @IdUsuarioCrea INT = 1; -- Reemplaza 1 con el ID del usuario que está creando el producto

EXEC AgregarProducto @ProductoID, @NombreProducto, @IdUsuarioCrea;
