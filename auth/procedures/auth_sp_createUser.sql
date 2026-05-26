USE Prashad;
GO

CREATE OR ALTER PROCEDURE [auth].[auth_sp_CreateUser]
(
     @FirstName         NVARCHAR(60)
    ,@LastName          NVARCHAR(60)
    ,@Email             NVARCHAR(255)
    ,@Phone             VARCHAR(15)   = NULL
    ,@PasswordHash      NVARCHAR(512)
    ,@ProfileImageUrl   NVARCHAR(500) = NULL
)

/***************************************************************************************************             
* Object Name            : [auth].[auth_sp_CreateUser]
* Object Type            : << Stored Procedure >>                
* Scope                  : Used for Register New User
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
             @lFirstName         NVARCHAR(60)
            ,@lLastName          NVARCHAR(60)
            ,@lEmail             NVARCHAR(255)
            ,@lPhone             VARCHAR(15)
            ,@lPasswordHash      NVARCHAR(512)
            ,@lProfileImageUrl   NVARCHAR(500);

        /*=========================================================
            Assign Local Variables
        =========================================================*/

        SET @lFirstName       = LTRIM(RTRIM(@FirstName));
        SET @lLastName        = LTRIM(RTRIM(@LastName));
        SET @lEmail           = LOWER(LTRIM(RTRIM(@Email)));
        SET @lPhone           = @Phone;
        SET @lPasswordHash    = @PasswordHash;
        SET @lProfileImageUrl = @ProfileImageUrl;

        /*=========================================================
            Validation
        =========================================================*/

        IF @lFirstName IS NULL OR @lFirstName = ''
        BEGIN
            RAISERROR('First Name is required.',16,1);
            RETURN;
        END

        IF @lEmail IS NULL OR @lEmail = ''
        BEGIN
            RAISERROR('Email is required.',16,1);
            RETURN;
        END

        IF EXISTS
        (
            SELECT 1
            FROM [auth].[Users]
            WHERE Email = @lEmail
        )
        BEGIN
            RAISERROR('Email already exists.',16,1);
            RETURN;
        END

        /*=========================================================
            Insert User
        =========================================================*/

        BEGIN TRANSACTION;

            INSERT INTO [auth].[Users]
            (
                 FirstName
                ,LastName
                ,Email
                ,Phone
                ,PasswordHash
                ,ProfileImageUrl
            )
            VALUES
            (
                 @lFirstName
                ,@lLastName
                ,@lEmail
                ,@lPhone
                ,@lPasswordHash
                ,@lProfileImageUrl
            );

            SELECT
                 CAST(SCOPE_IDENTITY() AS INT) AS UserId;

        COMMIT TRANSACTION;

    END TRY

    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(MAX);

        SET @ErrorMessage = ERROR_MESSAGE();

        RAISERROR(@ErrorMessage,16,1);

    END CATCH

    SET NOCOUNT OFF;

END
GO