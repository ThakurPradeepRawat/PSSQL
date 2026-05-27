USE Prashad
go 

CREATE  OR ALTER   PROCEDURE [orders].[orders_sp_GetOrderItems]  
    @OrderId INT  

/***************************************************************************************************             
* Object Name            : [orders].[orders_sp_GetOrderItems]  
* Object Type            : << Stored Procedure >>                
* Scope                  : Used for get order items details by OrderId from OrderItems table for a given OrderId
* EXEC [orders].[orders_sp_GetOrderItems]  @OrderId = 8
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
        OrderItemId, OrderId, PrasadId, PrasadName,
        TempleName, Quantity, UnitPrice, TotalPrice,
        ReviewId

    FROM [orders].[OrderItems]
    WITH (NOLOCK)
    WHERE OrderId = @lOrderId;
    END TRY
    BEGIN CATCH
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
     SET NOCOUNT OFF; 
END  