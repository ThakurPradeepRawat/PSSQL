Use Prashad
go
CREATE  OR ALTER   PROCEDURE [temple].[temple_sp_GetTempleById]
    @TempleId INT
/***************************************************************************************************             
* Object Name            : [temple].[temple_sp_GetTempleById]
* Object Type            : << Stored Procedure >>                
* Scope                  : Used for get  temple by id 
*
* -------------------------------------------------------------------------------------------------                
* Change Number | Change Owner   | Change Date   | Change Reason and comments                
* --------------------------------------------------------------------------------------------------                
* V1.0          | Pradeep Rawat  | 01-April-2026 | Initial Creation     
***************************************************************************************************/ 
AS
BEGIN
    SET NOCOUNT ON
    DECLARE 
    @lTempleId    INT,
    @ErrorMessage NVARCHAR(MAX);

    SET @lTempleId = @TempleId

    SELECT 
        TempleId, Slug, Name, Deity, Description, City, State, PinCode, 
        Latitude, Longitude, CoverImageUrl, AverageRating, TotalReviews, 
        IsVerified, IsActive, Tags, CreatedAt 
    FROM [temple].[Temples] 
    WHERE TempleId = @lTempleId AND IsActive = 1;
END



