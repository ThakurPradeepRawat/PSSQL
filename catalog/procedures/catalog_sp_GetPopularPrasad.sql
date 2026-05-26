USE Prashad;
GO

CREATE OR ALTER PROCEDURE [catalog].[catalog_sp_GetPopularPrasad]

/***************************************************************************************************             
* Object Name            : [catalog].[catalog_sp_GetPopularPrasad]
* Object Type            : << Stored Procedure >>                
* Scope                  : Used for get list of popular prasads based on bestseller flag,
*                          average rating and total reviews from Prasad table
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
         
            @ErrorMessage NVARCHAR(MAX);

        SELECT TOP 12  
            PrasadId, TempleId, CategoryId, Slug, Name, ShortDesc, Description,  
            Price, OriginalPrice, WeightGrams, ShelfLifeDays, Ingredients,  
            IsGITagged, IsBestseller, IsActive, AverageRating, TotalReviews, CreatedAt  
        FROM [catalog].[Prasad] WITH (NOLOCK)
        WHERE IsActive = 1
        ORDER BY
             IsBestseller DESC
            ,AverageRating DESC
            ,TotalReviews DESC
            ,CreatedAt DESC;

    END TRY

    BEGIN CATCH

        SET @ErrorMessage = ERROR_MESSAGE();

        RAISERROR(@ErrorMessage,16,1);

    END CATCH;

    SET NOCOUNT OFF;

END
GO