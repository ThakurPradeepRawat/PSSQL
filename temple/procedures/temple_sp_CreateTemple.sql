USE Prashad;
GO

CREATE OR ALTER PROCEDURE [temple].[temple_sp_CreateTemple]
(
     @Slug              VARCHAR(120)
    ,@Name              NVARCHAR(200)
    ,@Deity             NVARCHAR(100)
    ,@Description       NVARCHAR(MAX) = NULL
    ,@City              NVARCHAR(80)
    ,@State             NVARCHAR(80)
    ,@PinCode           VARCHAR(10)   = NULL
    ,@Latitude          DECIMAL(10,8)
    ,@Longitude         DECIMAL(11,8)
    ,@CoverImageUrl     NVARCHAR(500) = NULL
    ,@Tags              NVARCHAR(500) = NULL
)

/***************************************************************************************************             
* Object Name            : [temple].[temple_sp_CreateTemple]
* Object Type            : << Stored Procedure >>                
* Scope                  : Used for create new temple record in Temples table
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
             @lSlug              VARCHAR(120)
            ,@lName              NVARCHAR(200)
            ,@lDeity             NVARCHAR(100)
            ,@lDescription       NVARCHAR(MAX)
            ,@lCity              NVARCHAR(80)
            ,@lState             NVARCHAR(80)
            ,@lPinCode           VARCHAR(10)
            ,@lLatitude          DECIMAL(10,8)
            ,@lLongitude         DECIMAL(11,8)
            ,@lCoverImageUrl     NVARCHAR(500)
            ,@lTags              NVARCHAR(500)
            ,@ErrorMessage       NVARCHAR(MAX);

        SET @lSlug          = LOWER(LTRIM(RTRIM(@Slug)));
        SET @lName          = LTRIM(RTRIM(@Name));
        SET @lDeity         = LTRIM(RTRIM(@Deity));
        SET @lDescription   = @Description;
        SET @lCity          = LTRIM(RTRIM(@City));
        SET @lState         = LTRIM(RTRIM(@State));
        SET @lPinCode       = LTRIM(RTRIM(@PinCode));
        SET @lLatitude      = @Latitude;
        SET @lLongitude     = @Longitude;
        SET @lCoverImageUrl = @CoverImageUrl;
        SET @lTags          = @Tags;

      

        IF @lSlug IS NULL OR @lSlug = ''
        BEGIN
            RAISERROR('Slug is required.',16,1);
            RETURN;
        END

        IF @lName IS NULL OR @lName = ''
        BEGIN
            RAISERROR('Temple name is required.',16,1);
            RETURN;
        END

        IF @lCity IS NULL OR @lCity = ''
        BEGIN
            RAISERROR('City is required.',16,1);
            RETURN;
        END

        IF EXISTS
        (
            SELECT 1
            FROM [temple].[Temples]
            WHERE Slug = @lSlug
        )
        BEGIN
            RAISERROR('Temple slug already exists.',16,1);
            RETURN;
        END

  
        BEGIN TRANSACTION;

            INSERT INTO [temple].[Temples]
            (
                 Slug 
                ,Name 
                ,Deity
                ,Description
                ,City
                ,State
                ,PinCode
                ,Latitude
                ,Longitude
                ,CoverImageUrl
                ,Tags
            )
           SELECT
            
                 @lSlug
                ,@lName
                ,@lDeity
                ,@lDescription
                ,@lCity
                ,@lState
                ,@lPinCode
                ,@lLatitude
                ,@lLongitude
                ,@lCoverImageUrl
                ,@lTags
       

            SELECT
                CAST(SCOPE_IDENTITY() AS INT) AS TempleId;

        COMMIT TRANSACTION;

    END TRY

    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SET @ErrorMessage = ERROR_MESSAGE();

        RAISERROR(@ErrorMessage,16,1);

    END CATCH

    SET NOCOUNT OFF;

END
