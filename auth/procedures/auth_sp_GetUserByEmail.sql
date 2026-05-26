USE Prashad;
GO

CREATE OR ALTER PROCEDURE [auth].[auth_sp_GetUserByEmail]
(
     @Email NVARCHAR(255)
)

/***************************************************************************************************             
* Object Name            : [auth].[auth_sp_GetUserByEmail]
* Object Type            : << Stored Procedure >>                
* Scope                  : Used for get user details by email
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
              @lEmail NVARCHAR(255)
             ,@ErrorMessage NVARCHAR(MAX)

        SET @lEmail = LOWER(LTRIM(RTRIM(@Email)));

        IF @lEmail IS NULL OR @lEmail = ''
        BEGIN
            RAISERROR('Email is required.',16,1);
            RETURN;
        END

        SELECT
             UserId, FirstName, LastName, Email, Phone,
             ProfileImageUrl, PasswordHash
        FROM [auth].[Users]
        WHERE Email = @lEmail
          AND IsActive = 1;

    END TRY

    BEGIN CATCH

        SET @ErrorMessage = ERROR_MESSAGE();

        RAISERROR(@ErrorMessage,16,1);

    END CATCH

    SET NOCOUNT OFF;

END
GO