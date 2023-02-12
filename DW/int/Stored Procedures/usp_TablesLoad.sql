


/*
 Author:		Lakshay Goel
 Create date: 09/02/2023
 Description:	Stored Procedure to master load
 Unittest :  EXEC int.usp_TableLoad
*/
CREATE PROCEDURE [int].[usp_TablesLoad]
AS
BEGIN
	EXEC [int].[usp_TableAccountLoad];
	EXEC [int].[usp_TableCurrencyLoad];
	EXEC [int].[usp_TableOrganizationLoad];
	EXEC [int].[usp_TableScenarioLoad];
	EXEC [int].[usp_TableFactTransactionsLoad];

END