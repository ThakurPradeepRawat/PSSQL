

USE Prashad;
GO

CREATE OR ALTER PROCEDURE [catalog].[catalog_sp_CreatePrasad]
(
     @TempleId       INT
    ,@CategoryId     INT
    ,@Slug           VARCHAR(160)
    ,@Name           NVARCHAR(200)
    ,@ShortDesc      NVARCHAR(500) = NULL
    ,@Description    NVARCHAR(MAX) = NULL
    ,@Price          DECIMAL(10,2)
    ,@OriginalPrice  DECIMAL(10,2) = NULL
    ,@WeightGrams    INT = NULL
    ,@ShelfLifeDays  INT = NULL
    ,@Ingredients    NVARCHAR(MAX) = NULL
    ,@IsGITagged     BIT = 0
    ,@IsBestseller   BIT = 0
)

/***************************************************************************************************             
* Object Name            : [catalog].[catalog_sp_CreatePrasad]
* Object Type            : << Stored Procedure >>                
* Scope                  : Used for create new prasad record in Prasad table
*                          and return generated PrasadId
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
             @lTempleId       INT
            ,@lCategoryId     INT
            ,@lSlug           VARCHAR(160)
            ,@lName           NVARCHAR(200)
            ,@lShortDesc      NVARCHAR(500)
            ,@lDescription    NVARCHAR(MAX)
            ,@lPrice          DECIMAL(10,2)
            ,@lOriginalPrice  DECIMAL(10,2)
            ,@lWeightGrams    INT
            ,@lShelfLifeDays  INT
            ,@lIngredients    NVARCHAR(MAX)
            ,@lIsGITagged     BIT
            ,@lIsBestseller   BIT
            ,@ErrorMessage    NVARCHAR(MAX);


        SET @lTempleId      = @TempleId;
        SET @lCategoryId    = @CategoryId;
        SET @lSlug          = LOWER(LTRIM(RTRIM(@Slug)));
        SET @lName          = LTRIM(RTRIM(@Name));
        SET @lShortDesc     = LTRIM(RTRIM(@ShortDesc));
        SET @lDescription   = @Description;
        SET @lPrice         = @Price;
        SET @lOriginalPrice = @OriginalPrice;
        SET @lWeightGrams   = @WeightGrams;
        SET @lShelfLifeDays = @ShelfLifeDays;
        SET @lIngredients   = @Ingredients;
        SET @lIsGITagged    = @IsGITagged;
        SET @lIsBestseller  = @IsBestseller;


        IF @lTempleId IS NULL OR @lTempleId <= 0
        BEGIN
            RAISERROR('Valid TempleId is required.',16,1);
            RETURN;
        END;

        IF @lCategoryId IS NULL OR @lCategoryId <= 0
        BEGIN
            RAISERROR('Valid CategoryId is required.',16,1);
            RETURN;
        END;

        IF @lSlug IS NULL OR @lSlug = ''
        BEGIN
            RAISERROR('Slug is required.',16,1);
            RETURN;
        END;

        IF @lName IS NULL OR @lName = ''
        BEGIN
            RAISERROR('Prasad name is required.',16,1);
            RETURN;
        END;

        IF @lPrice IS NULL OR @lPrice <= 0
        BEGIN
            RAISERROR('Valid price is required.',16,1);
            RETURN;
        END;

        IF EXISTS
        (
            SELECT 1
            FROM [catalog].[Prasad]
            WHERE Slug = @lSlug
        )
        BEGIN
            RAISERROR('Prasad slug already exists.',16,1);
            RETURN;
        END;

     

        BEGIN TRANSACTION;

        INSERT INTO [catalog].[Prasad]  
            (TempleId, CategoryId, Slug, Name, ShortDesc, Description, Price, OriginalPrice,   
             WeightGrams, ShelfLifeDays, Ingredients, IsGITagged, IsBestseller)  
        SELECT  
             @lTempleId, @lCategoryId, @lSlug, @lName, @lShortDesc, @lDescription, @lPrice, @lOriginalPrice,   
             @lWeightGrams, @lShelfLifeDays, @lIngredients, @lIsGITagged, @lIsBestseller;

         SELECT
              CAST(SCOPE_IDENTITY() AS INT) AS PrasadId;

        COMMIT TRANSACTION;

    END TRY

    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SET @ErrorMessage = ERROR_MESSAGE();

        RAISERROR(@ErrorMessage,16,1);

    END CATCH;

    SET NOCOUNT OFF;

END
GO