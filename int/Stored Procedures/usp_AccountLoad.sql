/*
 Author:		Lakshay Goel
 Create date: 09/02/2023
 Description:	Stored Procedure to load dimension account table
 Unittest :  EXEC int.usp_TableAccountLoad
*/
CREATE PROCEDURE int.[usp_AccountLoad]
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql nvarchar(max) = NULL;

	If OBJECT_ID('dbo.DimAccount') IS NOT NULL
	BEGIN
		SET @sql = 'INSERT INTO dbo.DimAccount(AccountKey, AccountCode, AccountDescription, AccountType, ValueType)
					SELECT AccountKey, AccountCode, AccountDescription, AccountType, ValueType 
					FROM int.Account a
					WHERE NOT EXISTS ( SELECT AccountCode FROM dbo.dimAccount d WHERE a.AccountKey = d.AccountKey)';
		PRINT @sql
		EXEC (@sql)
	END	
	ELSE
		BEGIN
			SET @sql = 'SELECT * INTO dbo.DimAccount
						FROM int.Account'
			PRINT @sql
			EXEC (@sql)
		END
END