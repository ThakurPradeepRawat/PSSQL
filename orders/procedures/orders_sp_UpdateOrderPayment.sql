Use Prashad 
go 


CREATE OR ALTER   PROCEDURE [orders].[orders_sp_UpdateOrderPayment]
    @OrderId INT,
    @PaymentId VARCHAR(100),
    @PaymentStatus VARCHAR(50),
    @OrderStatus VARCHAR(30)

/***************************************************************************************************             
* Object Name            : [orders].[orders_sp_UpdateOrderPayment]
* Object Type            : << Stored Procedure >>                
* Scope                  : Used for update payment details and order status in Orders table
*
* -------------------------------------------------------------------------------------------------                
* Change Number | Change Owner   | Change Date   | Change Reason and comments                
* --------------------------------------------------------------------------------------------------                
* V1.0          | Pradeep Rawat  | 01-April-2026 | Initial Creation     
***************************************************************************************************/ 

AS
BEGIN
    SET NOCOUNT ON;
     BEGIN TRY
        DECLARE
             @lOrderId INT
            ,@lPaymentId VARCHAR(100)
            ,@lPaymentStatus VARCHAR(50)
            ,@lOrderStatus VARCHAR(30)
            ,@ErrorMessage NVARCHAR(MAX);
        SET @lOrderId = @OrderId;
        SET @lPaymentId = LTRIM(RTRIM(@PaymentId));
        SET @lPaymentStatus = LTRIM(RTRIM(@PaymentStatus));
        SET @lOrderStatus = LTRIM(RTRIM(@OrderStatus));

        IF NOT EXISTS (SELECT 1 FROM [orders].[Orders] WHERE OrderId = @lOrderId)
        BEGIN
            SET @ErrorMessage = CONCAT('Order with ID ', @lOrderId, ' does not exist.');
            RAISERROR (@ErrorMessage, 16, 1);
            RETURN;
        END

        IF @lPaymentId IS NULL OR @lPaymentId = ''
        BEGIN
        SET @ErrorMessage = 'PaymentId is required.';
            RAISERROR (@ErrorMessage, 16, 1);
            RETURN;
        END
        
        UPDATE [orders].[Orders]
        SET PaymentId = @lPaymentId,
        PaymentStatus = @lPaymentStatus,
        Status = @lOrderStatus,
        UpdatedAt = GETUTCDATE()
    WHERE OrderId = @lOrderId;

    END TRY
    BEGIN CATCH 
        SET @ErrorMEssage = ERROR_MESSAGE()
        RAISERROR (@ErrorMessage , 16 , 1);
    END CATCH
    SET NOCOUNT OFF;
END




