


/*
 Author:		Lakshay Goel
 Create date: 09/02/2023
 Description:	Stored Procedure to load Fact Transactions table
 Unittest :  EXEC int.usp_TableTransactionsLoad
*/
CREATE PROCEDURE [int].[usp_FactTransactionsLoad]
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql nvarchar(max) = NULL;

	If OBJECT_ID('dbo.FactTransactions') IS NOT NULL
	BEGIN
		SET @sql = 'INSERT INTO dbo.FactTransactions(Date, AccountKey, OrganizationKey, CurrencyKey, ScenarioKey, SalesAmount)
					SELECT Date, AccountKey, OrganizationKey, CurrencyKey, ScenarioKey, SalesAmount
					FROM int.Transactions a
					WHERE NOT EXISTS ( SELECT Date, AccountKey, OrganizationKey, CurrencyKey, ScenarioKey, SalesAmount FROM dbo.FactTransactions d 
					WHERE
					d.Date = a.Date AND
					d.AccountKey = a.AccountKey AND 
					d.OrganizationKey = a.OrganizationKey AND 
					d.CurrencyKey = a.CurrencyKey AND 
					d.ScenarioKey = a.ScenarioKey AND 
					d.SalesAmount = a.SalesAmount)';
		PRINT @sql
		EXEC (@sql)
	END	
	ELSE
		BEGIN
			SET @sql = 'SELECT * INTO FactTransactions
						FROM int.Transactions'
			PRINT @sql
			EXEC (@sql)
		END
END