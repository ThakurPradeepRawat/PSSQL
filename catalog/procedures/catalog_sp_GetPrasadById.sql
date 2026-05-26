
USE Prashad
go

CREATE OR  ALTER   PROCEDURE [catalog].[catalog_sp_GetPrasadById]
    @PrasadId INT
/***************************************************************************************************             
* Object Name            : [catalog].[catalog_sp_GetPrasadById]
* Object Type            : << Stored Procedure >>                
* Scope                  : Used for get prasad details by given prasad id from Prasad table
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
                    @lPrasadId     INT
                ,@ErrorMessage  NVARCHAR(MAX)
            SET @lPrasadId = @PrasadId
            IF @lPrasadId IS NULL OR @lPrasadId <= 0
            BEGIN
                RAISERROR('Valid PrasadId is required.',16,1);
                RETURN;
            END
            SELECT 
                PrasadId, TempleId, CategoryId, Slug, Name, ShortDesc, Description, 
                Price, OriginalPrice, WeightGrams, ShelfLifeDays, Ingredients, 
                IsGITagged, IsBestseller, IsActive, AverageRating, TotalReviews, CreatedAt
            FROM [catalog].[Prasad] WITH (NOLOCK)
            WHERE PrasadId = @lPrasadId AND IsActive = 1;
      END TRY
      BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage,16,1);
      END CATCH
    SET NOCOUNT OFF
END



