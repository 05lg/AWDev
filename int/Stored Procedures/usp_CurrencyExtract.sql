/*
 Author:		Lakshay Goel
 Create date: 09/02/2023
 Description:	Stored Procedure to extract currency.csv
 Unittest :  EXEC int.usp_CurrencyExtract
*/
CREATE PROCEDURE int.usp_CurrencyExtract
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql nvarchar(max) = NULL;

	CREATE TABLE dbo.t(
	[CurrencyCode] [varchar](5) NOT NULL,
	[CurrencyName] [varchar](50) NULL
	)
	BULK INSERT dbo.t
	FROM 'C:\Users\Lakshay\source\repos\Adventure Works DW\Source Files\Currency.csv'
	WITH
	(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		TABLOCK
	)
	SET @sql = 'INSERT INTO dbo.Currency (CurrencyCode,CurrencyName)
				SELECT CurrencyCode,CurrencyName
				FROM dbo.t
				WHERE NOT EXISTS (SELECT CurrencyCode FROM dbo.Currency a WHERE a.CurrencyCode = t.CurrencyCode)';
	PRINT @sql
	EXEC (@sql)
	DROP TABLE dbo.t
END