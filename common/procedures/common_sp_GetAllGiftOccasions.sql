use Prashad;
go

CREATE OR ALTER   PROCEDURE [common].[common_sp_GetAllGiftOccasions ] 
/***************************************************************************************************
* Object Name            : [common].[common_sp_GetAllGiftOccasions ] 
* Object Type            : << Stored Procedure >>
* Scope                  : Used to get all gift occasions
* EXEC  [common].[common_sp_GetAllGiftOccasions ] 
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
                ID , Name , Icon , Description
           FROM common.GiftOccasions
           WITH (NOLOCK)
       END TRY 
       BEGIN CATCH 
           DECLARE @ErrorMessage NVARCHAR(MAX);
           SET @ErrorMessage = ERROR_MESSAGE();
           RAISERROR(@ErrorMessage, 16, 1);
       END CATCH;
    SET NOCOUNT OFF;
END



