CREATE PROCEDURE EliminarProducto
    @ProductoID VARCHAR(30)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Actualizar el estado del producto a inactivo
        UPDATE Producto
        SET estatus = 0,
            fechaModifica = GETDATE()
        WHERE ProductoID = @ProductoID;

        COMMIT TRANSACTION;
        PRINT 'El producto ha sido eliminado correctamente.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        PRINT 'Ocurrió un error al intentar eliminar el producto.';
    END CATCH;
END;

EXEC EliminarProducto 'OFF-LA-10000240';
SELECT * FROM Producto WHERE ProductoID = 'FUR-BO-10001798';