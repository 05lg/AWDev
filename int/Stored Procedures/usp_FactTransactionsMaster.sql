
/*
 Author:		Lakshay Goel
 Create date: 11/02/2023
 Description:	Master Stored Procedure for Transactions
 Unittest :  EXEC int.usp_TransactionsMaster
*/
CREATE PROCEDURE [int].[usp_FactTransactionsMaster]
AS
BEGIN
	SET NOCOUNT ON;

	EXEC [int].[usp_FactTransactionsExtract];
	EXEC [int].[usp_FactTransactionsLoad]
END