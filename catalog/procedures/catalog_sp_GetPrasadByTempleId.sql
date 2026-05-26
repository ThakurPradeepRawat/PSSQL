USE Prashad;
GO

CREATE OR ALTER PROCEDURE [catalog].[catalog_sp_GetPrasadByTempleId]
(
     @TempleId INT
)

/***************************************************************************************************             
* Object Name            : [catalog].[catalog_sp_GetPrasadByTempleId]
* Object Type            : << Stored Procedure >>                
* Scope                  : Used for get list of prasads for given temple id from Prasad table
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
             @lTempleId     INT
            ,@ErrorMessage  NVARCHAR(MAX)

        SET @lTempleId = @TempleId

  
        IF @lTempleId IS NULL OR @lTempleId <= 0
        BEGIN
            RAISERROR('Valid TempleId is required.',16,1);
            RETURN;
        END

        SELECT
             PrasadId
            ,TempleId
            ,CategoryId
            ,Slug
            ,Name
            ,ShortDesc
            ,Description
            ,Price
            ,OriginalPrice
            ,WeightGrams
            ,ShelfLifeDays
            ,Ingredients
            ,IsGITagged
            ,IsBestseller
            ,IsActive
            ,AverageRating
            ,TotalReviews
            ,CreatedAt
        FROM [catalog].[Prasad] WITH (NOLOCK)
        WHERE TempleId = @lTempleId
          AND IsActive = 1
        ORDER BY CreatedAt DESC;

    END TRY

    BEGIN CATCH

        SET @ErrorMessage = ERROR_MESSAGE();

        RAISERROR(@ErrorMessage,16,1);

    END CATCH

    SET NOCOUNT OFF;

END
GO