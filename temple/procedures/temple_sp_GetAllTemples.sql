USE Prashad;
GO

CREATE OR ALTER PROCEDURE [temple].[temple_sp_GetAllTemples]

/***************************************************************************************************             
* Object Name            : [temple].[temple_sp_GetAllTemples]
* Object Type            : << Stored Procedure >>                
* Scope                  : Used for get all active temples
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
        SELECT
             TempleId, Slug, Name, Deity
            ,Description, City, State
            ,PinCode, Latitude, Longitude, CoverImageUrl
            ,AverageRating,TotalReviews, IsVerified
            ,IsActive, Tags, CreatedAt
        FROM [temple].[Temples]
        WHERE IsActive = 1
        ORDER BY CreatedAt DESC;

    END TRY

    BEGIN CATCH

        DECLARE @ErrorMessage NVARCHAR(MAX);

        SET @ErrorMessage = ERROR_MESSAGE();

        RAISERROR(@ErrorMessage,16,1);

    END CATCH

    SET NOCOUNT OFF;

END
GO


