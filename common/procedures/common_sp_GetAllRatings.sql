use Prashad 
go 

CREATE OR ALTER PROCEDURE  [common].[common_sp_GetAllRatings] 
/***************************************************************************************************
* Object Name            :  [common].[common_sp_GetAllRatings] 
* Object Type            : << Stored Procedure >>
* Scope                  : Used to get all filter ratings
* EXEC [common].[common_sp_GetAllRatings] 
* -------------------------------------------------------------------------------------------------
* Change Number | Change Owner   | Change Date    | Change Reason and Comments
* -------------------------------------------------------------------------------------------------
* V1.0          | Pradeep Rawat  | 10-April-2026  | Initial Creation
***************************************************************************************************/
AS  
BEGIN  
    SET NOCOUNT ON;
    BEGIN TRY 
          SELECT ID , FilterId , Label , Value
          FROM common.MasterRatings 
          WITH (NOLOCK)
    END TRY
    BEGIN CATCH 
          DECLARE @ErrorMessage NVARCHAR(MAX);
          SET @ErrorMessage = ERROR_MESSAGE();
          RAISERROR(@ErrorMessage, 16, 1);
    END CATCH;
   SET NOCOUNT OFF;
END  