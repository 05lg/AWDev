/*
 Author:		Lakshay Goel
 Create date: 11/02/2023
 Description:	Stored Procedure to extract Transactions.csv
 Unittest :  EXEC int.usp_TransactionsExtract
*/
CREATE PROCEDURE int.[usp_FactTransactionsExtract]
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql nvarchar(max) = NULL;

	CREATE TABLE dbo.t(
	[AccountDate] [datetime] NULL,
	[OrganizationName] [varchar](30) NULL,
	[DepartmentGroupName] [varchar](50) NULL,
	[ScenarioName] [varchar](10) NULL,
	[AccountCode] [varchar](10) NULL,
	[Amount] [varchar](10) NULL,
	[Date] [varchar](30) NULL
	)
	BULK INSERT dbo.t
	FROM 'C:\Users\Lakshay\source\repos\Adventure Works DW\Source Files\Transactions.csv'
	WITH
	(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		TABLOCK
	)
	SET @sql = 'INSERT INTO dbo.Transactions (AccountDate,OrganizationName,DepartmentGroupName,ScenarioName,AccountCode,Amount,Date)
				SELECT AccountDate,OrganizationName,DepartmentGroupName,ScenarioName,AccountCode,Amount,Date
				FROM dbo.t
				WHERE NOT EXISTS (SELECT AccountDate,OrganizationName,DepartmentGroupName,ScenarioName,AccountCode,Amount,Date FROM dbo.Transactions a 
				WHERE 
				a.AccountDate = t.AccountDate AND
				a.OrganizationName = t.OrganizationName AND
				a.DepartmentGroupName = t.DepartmentGroupName AND
				a.ScenarioName = t.ScenarioName AND
				a.AccountCode = t.AccountCode AND
				a.Amount = t.Amount AND
				a.Date = t.Date)';
	PRINT @sql
	EXEC (@sql)
	DROP TABLE dbo.t
END