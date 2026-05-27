 USE PRASHAD 
 GO 

 
CREATE or alter PROCEDURE [common].[common_sp_GetAllRegions] 
/***************************************************************************************************
* Object Name            : [common].[common_sp_GetAllRegions] 
* Object Type            : << Stored Procedure >>
* Scope                  : Used to get all regions
* EXEC  [common].[common_sp_GetAllRegions] 
* -------------------------------------------------------------------------------------------------
* Change Number | Change Owner   | Change Date    | Change Reason and Comments
* -------------------------------------------------------------------------------------------------
* V1.0          | Pradeep Rawat  | 10-April-2026  | Initial Creation
***************************************************************************************************/
AS  
BEGIN  
    SET NOCOUNT ON;  
     BEGIN TRY 
           SELECT Id, Name
           FROM common.MasterRegions
           WITH (NOLOCK)
       END TRY 
       BEGIN CATCH 
           DECLARE @ErrorMessage NVARCHAR(MAX);
           SET @ErrorMessage = ERROR_MESSAGE();
           RAISERROR(@ErrorMessage, 16, 1);
       END CATCH;
    SET NOCOUNT OFF;
  END 