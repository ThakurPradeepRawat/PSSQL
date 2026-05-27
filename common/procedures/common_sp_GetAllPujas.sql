use Prashad;
go

CREATE OR ALTER PROCEDURE [common].[common_sp_GetAllPujas]

/***************************************************************************************************
* Object Name            : [common].[common_sp_GetAllPujas]
* Object Type            : << Stored Procedure >>
* Scope                  : Used to get all pujas
* EXEC [common].[common_sp_GetAllPujas]
* -------------------------------------------------------------------------------------------------
* Change Number | Change Owner   | Change Date    | Change Reason and Comments
* -------------------------------------------------------------------------------------------------
* V1.0          | Pradeep Rawat  | 10-April-2026  | Initial Creation
***************************************************************************************************/

AS  
BEGIN  
    SET NOCOUNT ON;
    BEGIN TRY 
       SELECT Id, Name, TempleName, Description, Icon,
       BgGradient, Duration, IncludesCertificate, IncludesVideo, 
       Tag, TagClass, Price, PriceNote
       FROM common.Pujas WITH (NOLOCK)
    END TRY 

       BEGIN CATCH
       DECLARE @ErrorMessage NVARCHAR(MAX);
           SET @ErrorMessage = ERROR_MESSAGE();
           RAISERROR(@ErrorMessage, 16, 1);
       END CATCH;
    SET NOCOUNT OFF;
END  