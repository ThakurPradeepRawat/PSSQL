Use Prashad 
go 

CREATE OR ALTER   PROCEDURE [orders].[orders_sp_CreateOrderItem]  
    @OrderId       INT,  
    @PrasadId      INT,  
    @PrasadName    NVARCHAR(200),  
    @TempleName    NVARCHAR(200),  
    @Quantity      INT,  
    @UnitPrice     DECIMAL(10,2),  
    @TotalPrice    DECIMAL(10,2)  

/***************************************************************************************************             
* Object Name            : [orders].[orders_sp_CreateOrderItem]  
* Object Type            : << Stored Procedure >>                
* Scope                  : Used for create new order item record in OrderItems table for a given OrderId
*
* -------------------------------------------------------------------------------------------------                
* Change Number | Change Owner   | Change Date   | Change Reason and comments                
* --------------------------------------------------------------------------------------------------                
* V1.0          | Pradeep Rawat  |  10-April-2026 | Initial Creation     
***************************************************************************************************/ 


AS  
BEGIN  
    SET NOCOUNT ON; 
    BEGIN TRY 
    DECLARE 
        @lOrderId       INT,
        @lPrasadId      INT,
        @lPrasadName    NVARCHAR(200),
        @lTempleName    NVARCHAR(200),
        @lQuantity      INT,
        @lUnitPrice     DECIMAL(10,2),
        @lTotalPrice    DECIMAL(10,2),
        @ErrorMessage   NVARCHAR(MAX);

    SET @lOrderId       = @OrderId;
    SET @lPrasadId      = @PrasadId;
    SET @lPrasadName    = LTRIM(RTRIM(@PrasadName));
    SET @lTempleName    = LTRIM(RTRIM(@TempleName));
    SET @lQuantity      = @Quantity;
    SET @lUnitPrice     = @UnitPrice;
    SET @lTotalPrice    = @TotalPrice;

    IF @lOrderId IS NULL OR @lOrderId <= 0
    BEGIN
        SET @ErrorMessage = 'Invalid OrderId. It must be a positive integer.';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN;
    END

    IF @lPrasadId IS NULL OR @lPrasadId <= 0
    BEGIN
        SET @ErrorMessage = 'Invalid PrasadId. It must be a positive integer.';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN;
    END

    IF @lPrasadName IS NULL OR @lPrasadName = ''
    BEGIN
        SET @ErrorMessage = 'PrasadName is required.';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN;
    END

    IF @lTempleName IS NULL OR @lTempleName = ''
    BEGIN
        SET @ErrorMessage = 'TempleName is required.';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN;
    END

    IF @lQuantity IS NULL OR @lQuantity <= 0
    BEGIN
        SET @ErrorMessage = 'Quantity must be a positive integer.';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN;
    END
    IF @lUnitPrice IS NULL OR @lUnitPrice < 0
    BEGIN
        SET @ErrorMessage = 'UnitPrice cannot be negative.';
        RAISERROR (@ErrorMessage, 16, 1);
        RETURN;
    END

    INSERT INTO [orders].[OrderItems]  
        (OrderId, PrasadId, PrasadName, TempleName, Quantity, UnitPrice, TotalPrice)  
    VALUES  
        (@lOrderId, @lPrasadId, @lPrasadName, @lTempleName, @lQuantity, @lUnitPrice, @lTotalPrice);  
          
    SELECT SCOPE_IDENTITY() AS OrderItemId;  

    END TRY
    BEGIN CATCH
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
    SET NOCOUNT OFF;
END  


