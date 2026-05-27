Use Prashad
go
CREATE  or ALTER  PROCEDURE [orders].[orders_sp_GetOrderById]
    @OrderId INT
/***************************************************************************************************             
* Object Name            : [orders].[orders_sp_GetOrderById]
* Object Type            : << Stored Procedure >>                
* Scope                  : Used for get order details by OrderId from Orders table
*
* -------------------------------------------------------------------------------------------------                
* Change Number | Change Owner   | Change Date   | Change Reason and comments                
* --------------------------------------------------------------------------------------------------                
* V1.0          | Pradeep Rawat  | 10 -April-2026 | Initial Creation     
***************************************************************************************************/ 
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY 

        DECLARE 
          @lOrderId     INT,
          @ErrorMessage NVARCHAR(MAX);

         SET @lOrderId = @OrderId;

        IF @lOrderId IS NULL OR @lOrderId <= 0
        BEGIN
            SET @ErrorMessage = 'Invalid OrderId. It must be a positive integer.';
            RAISERROR (@ErrorMessage, 16, 1);
            RETURN;
        END
        SELECT 
            OrderId, OrderNumber, UserId, AddressId,
            CouponId, Status, SubTotal,
            DeliveryCharges, DiscountAmount,
            TaxAmount, TotalAmount, DeliveryType,
            SpecialInstructions, PlacedAt,
            UpdatedAt, RazorpayOrderId,
            PaymentId, PaymentStatus

       FROM [orders].[Orders]
       WITH (NOLOCK)
       WHERE OrderId = @lOrderId;

       END TRY
       BEGIN CATCH
        SET @ErrorMessage = ERROR_MESSAGE();
            RAISERROR (@ErrorMessage, 16, 1);
        END CATCH

         SET NOCOUNT OFF;
END




