/*
 Author:		Lakshay Goel
 Create date: 09/02/2023
 Description:	Stored Procedure to load dimension Currency table
 Unittest :  EXEC int.usp_TableCurrencyLoad
*/
CREATE PROCEDURE int.[usp_CurrencyLoad]
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql nvarchar(max) = NULL;

	If OBJECT_ID('dbo.DimCurrency') IS NOT NULL
	BEGIN
		SET @sql = 'INSERT INTO dbo.DimCurrency(CurrencyKey, CurrencyCode, CurrencyName)
					SELECT CurrencyKey, CurrencyCode, CurrencyName 
					FROM int.Currency a
					WHERE NOT EXISTS ( SELECT CurrencyCode FROM dbo.DimCurrency d WHERE a.CurrencyKey = d.CurrencyKey)';
		PRINT @sql
		EXEC (@sql)
	END	
	ELSE
		BEGIN
			SET @sql = 'SELECT * INTO dbo.DimCurrency
						FROM int.Currency'
			PRINT @sql
			EXEC (@sql)
		END
END