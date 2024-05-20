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
CREATE PROCEDURE SP_EliminarPedido
    @PedidoID VARCHAR(30)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Actualizar el estatus del pedido a 0 (eliminado)
        UPDATE Pedido 
        SET estatus = 0,
            idUsuarioModifica = @idUsuarioModifica, -- Actualiza el ID del usuario que lo modificó
            fechaModifica = GETDATE() -- Actualiza la fecha de modificación
        WHERE PedidoID = @PedidoID;

        COMMIT TRANSACTION;
        PRINT 'El pedido ha sido eliminado correctamente.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        PRINT 'Ocurrió un error al intentar eliminar el pedido.';
        THROW; -- Lanza el error para su manejo externo
    END CATCH;
END;
