Use Prashad 
go

-- Get User By Id
CREATE  OR ALTER  PROCEDURE [auth].[auth_sp_GetUserById]
    @UserId INT

/***************************************************************************************************             
* Object Name            : [auth].[auth.sp_GetUserById]
* Object Type            : << Stored Procedure >>                
* Scope                  : Used for get user details by ID
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
              @lUserId      INT
             ,@ErrorMessage NVARCHAR(MAX)

        SET @lUserId = @UserId

        SELECT
             UserId, FirstName, LastName, Email, Phone,
             ProfileImageUrl
        FROM [auth].[Users]
        WHERE UserId = @lUserId
          AND IsActive = 1;

    END TRY

    BEGIN CATCH

        SET @ErrorMessage = ERROR_MESSAGE();

        RAISERROR(@ErrorMessage,16,1);

    END CATCH

    SET NOCOUNT OFF;

END
GO

