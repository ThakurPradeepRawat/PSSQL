USE Prashad;
GO

CREATE OR ALTER PROCEDURE [common].[common_sp_GetAllFestivals]

/***************************************************************************************************
* Object Name            : [common].[common_sp_GetAllFestivals]
* Object Type            : << Stored Procedure >>
* Scope                  : Used to get all festivals ordered by festival date
* EXEC  [common].[common_sp_GetAllFestivals]
* -------------------------------------------------------------------------------------------------
* Change Number | Change Owner   | Change Date    | Change Reason and Comments
* -------------------------------------------------------------------------------------------------
* V1.0          | Pradeep Rawat  | 10-April-2026  | Initial Creation
***************************************************************************************************/
AS
BEGIN

    SET NOCOUNT ON;

    BEGIN TRY

        SELECT
             Id
            ,Name
            ,Description
            ,Date
            ,Tag
            ,TagClass
            ,DateBgColor
            ,DateTextColor
        FROM [common].[Festivals] 
        ORDER BY [Date];

    END TRY

    BEGIN CATCH

        DECLARE @ErrorMessage NVARCHAR(MAX);

        SET @ErrorMessage = ERROR_MESSAGE();

        RAISERROR(@ErrorMessage, 16, 1);

    END CATCH;

    SET NOCOUNT OFF;

END;
GO