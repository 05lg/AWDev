



/*
 Author:		Lakshay Goel
 Create date: 11/02/2023
 Description:	Master Stored Procedure
 Unittest :  EXEC int.usp_TablesMaster
*/
CREATE PROCEDURE [int].[usp_TablesMaster]
AS
BEGIN
	EXEC [int].[usp_AccountMaster];
	EXEC [int].[usp_CurrencyMaster];
	EXEC [int].[usp_OrganizationMaster];
	EXEC [int].[usp_ScenarioMaster];
	EXEC [int].[usp_FactTransactionsMaster];

END