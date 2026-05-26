USE Prashad;
GO

CREATE OR ALTER PROCEDURE [orders].[orders_sp_CreateOrder]
(
     @OrderNumber          VARCHAR(30)
    ,@UserId               INT
    ,@AddressId            INT
    ,@CouponId             INT = NULL
    ,@SubTotal             DECIMAL(10,2)
    ,@DeliveryCharges      DECIMAL(10,2)
    ,@DiscountAmount       DECIMAL(10,2)
    ,@TaxAmount            DECIMAL(10,2)
    ,@TotalAmount          DECIMAL(10,2)
    ,@DeliveryType         VARCHAR(20)
    ,@SpecialInstructions  NVARCHAR(500) = NULL
    ,@RazorpayOrderId      VARCHAR(100) = NULL
)

/***************************************************************************************************             
* Object Name            : [orders].[orders_sp_CreateOrder]
* Object Type            : << Stored Procedure >>                
* Scope                  : Used for create new order record in Orders table
*                          and return generated OrderId
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
             @lOrderNumber          VARCHAR(30)
            ,@lUserId               INT
            ,@lAddressId            INT
            ,@lCouponId             INT
            ,@lSubTotal             DECIMAL(10,2)
            ,@lDeliveryCharges      DECIMAL(10,2)
            ,@lDiscountAmount       DECIMAL(10,2)
            ,@lTaxAmount            DECIMAL(10,2)
            ,@lTotalAmount          DECIMAL(10,2)
            ,@lDeliveryType         VARCHAR(20)
            ,@lSpecialInstructions  NVARCHAR(500)
            ,@lRazorpayOrderId      VARCHAR(100)
            ,@ErrorMessage          NVARCHAR(MAX);

   

        SET @lOrderNumber         = LTRIM(RTRIM(@OrderNumber));
        SET @lUserId              = @UserId;
        SET @lAddressId           = @AddressId;
        SET @lCouponId            = @CouponId;
        SET @lSubTotal            = @SubTotal;
        SET @lDeliveryCharges     = @DeliveryCharges;
        SET @lDiscountAmount      = @DiscountAmount;
        SET @lTaxAmount           = @TaxAmount;
        SET @lTotalAmount         = @TotalAmount;
        SET @lDeliveryType        = UPPER(LTRIM(RTRIM(@DeliveryType)));
        SET @lSpecialInstructions = @SpecialInstructions;
        SET @lRazorpayOrderId     = @RazorpayOrderId;

  

        IF @lOrderNumber IS NULL OR @lOrderNumber = ''
        BEGIN
            RAISERROR('OrderNumber is required.',16,1);
            RETURN;
        END;

        IF @lUserId IS NULL OR @lUserId <= 0
        BEGIN
            RAISERROR('Valid UserId is required.',16,1);
            RETURN;
        END;

        IF @lAddressId IS NULL OR @lAddressId <= 0
        BEGIN
            RAISERROR('Valid AddressId is required.',16,1);
            RETURN;
        END;

        IF @lTotalAmount IS NULL OR @lTotalAmount <= 0
        BEGIN
            RAISERROR('Valid TotalAmount is required.',16,1);
            RETURN;
        END;

        IF @lDeliveryType IS NULL OR @lDeliveryType = ''
        BEGIN
            RAISERROR('DeliveryType is required.',16,1);
            RETURN;
        END;

        IF EXISTS
        (
            SELECT 1
            FROM [orders].[Orders]
            WHERE OrderNumber = @lOrderNumber
        )
        BEGIN
            RAISERROR('OrderNumber already exists.',16,1);
            RETURN;
        END;

        BEGIN TRANSACTION;
            
             INSERT INTO [orders].[Orders] 
             (
                      OrderNumber, UserId, AddressId, CouponId, 
                      SubTotal, DeliveryCharges, DiscountAmount, TaxAmount, TotalAmount, 
                      DeliveryType, SpecialInstructions, RazorpayOrderId
            )
           SELECT  
  
                    @OrderNumber, @UserId, @AddressId, @CouponId,
                    @SubTotal, @DeliveryCharges, @DiscountAmount, @TaxAmount, @TotalAmount,
                    @DeliveryType, @SpecialInstructions, @RazorpayOrderId
  
            SELECT
                CAST(SCOPE_IDENTITY() AS INT) AS OrderId;

        COMMIT TRANSACTION;

    END TRY

    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SET @ErrorMessage = ERROR_MESSAGE();

        RAISERROR(@ErrorMessage,16,1);

    END CATCH;

    SET NOCOUNT OFF;

END
GO