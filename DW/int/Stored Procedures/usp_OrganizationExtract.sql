/*
 Author:		Lakshay Goel
 Create date: 11/02/2023
 Description:	Stored Procedure to extract organization.csv
 Unittest :  EXEC int.usp_OrganizationExtract
*/
CREATE PROCEDURE int.usp_OrganizationExtract
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql nvarchar(max) = NULL;

	CREATE TABLE dbo.t(
	[OrganizationName] [varchar](50) NULL,
	[ParentOrganizationName] [varchar](50) NULL,
	[PercentageOfOwnership] [varchar](5) NULL,
	[CurrencyCode] [varchar](5) NULL
	)
	BULK INSERT dbo.t
	FROM 'C:\Users\Lakshay\source\repos\Adventure Works DW\Source Files\Organization.csv'
	WITH
	(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		TABLOCK
	)
	SET @sql = 'INSERT INTO dbo.Organization (OrganizationName,ParentOrganizationName,PercentageOfOwnership,CurrencyCode)
				SELECT OrganizationName,ParentOrganizationName,PercentageOfOwnership,CurrencyCode
				FROM dbo.t
				WHERE NOT EXISTS (SELECT OrganizationName FROM dbo.Organization a WHERE a.OrganizationName = t.OrganizationName)';
	PRINT @sql
	EXEC (@sql)
	DROP TABLE dbo.t
END