
/*
 Author:		Lakshay Goel
 Create date: 11/02/2023
 Description:	Stored Procedure to extract Account.csv
 Unittest :  EXEC int.usp_AccountExtract
*/
CREATE PROCEDURE [int].[usp_AccountExtract]
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql nvarchar(max) = NULL;

	CREATE TABLE dbo.t(
	[AccountCode] [varchar](10) NULL,
	[ParentAccountCode] [varchar](10) NULL,
	[AccountDescription] [varchar](100) NULL,
	[AccountType] [varchar](50) NULL,
	[Operator] [varchar](10) NULL,
	[CustomMembers] [varchar](300) NULL,
	[ValueType] [varchar](50) NULL,
	[CustomMemberOptions] [varchar](300) NULL
	)
	BULK INSERT dbo.t
	FROM 'C:\Users\Lakshay\source\repos\Adventure Works DW\Source Files\Account.csv'
	WITH
	(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		TABLOCK
	)
	SET @sql = 'INSERT INTO dbo.Account(AccountCode,ParentAccountCode,AccountDescription,AccountType,Operator,CustomMembers,ValueType,CustomMemberOptions)
				SELECT AccountCode,ParentAccountCode,AccountDescription,AccountType,Operator,CustomMembers,ValueType,CustomMemberOptions
				FROM dbo.t
				WHERE NOT EXISTS (SELECT AccountCode FROM dbo.Account a WHERE a.AccountCode = t.AccountCode)';
	PRINT @sql
	EXEC (@sql)
	DROP TABLE dbo.t
END