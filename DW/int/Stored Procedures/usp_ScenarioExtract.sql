/*
 Author:		Lakshay Goel
 Create date: 11/02/2023
 Description:	Stored Procedure to extract Scenario.csv
 Unittest :  EXEC int.usp_ScenarioExtract
*/
CREATE PROCEDURE int.usp_ScenarioExtract
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql nvarchar(max) = NULL;

	CREATE TABLE dbo.t(
	[ScenarioName] [varchar](50) NULL
	)
	BULK INSERT dbo.t
	FROM 'C:\Users\Lakshay\source\repos\Adventure Works DW\Source Files\Scenario.csv'
	WITH
	(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		TABLOCK
	)
	SET @sql = 'INSERT INTO dbo.Scenario (ScenarioName)
				SELECT ScenarioName
				FROM dbo.t
				WHERE NOT EXISTS (SELECT ScenarioName FROM dbo.Scenario a WHERE a.ScenarioName = t.ScenarioName)';
	PRINT @sql
	EXEC (@sql)
	DROP TABLE dbo.t
END