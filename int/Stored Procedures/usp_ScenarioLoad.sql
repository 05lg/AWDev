/*
 Author:		Lakshay Goel
 Create date: 09/02/2023
 Description:	Stored Procedure to load dimension Scenario table
 Unittest :  EXEC int.usp_TableScenarioLoad
*/
CREATE PROCEDURE int.[usp_ScenarioLoad]
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql nvarchar(max) = NULL;

	If OBJECT_ID('dbo.DimScenario') IS NOT NULL
	BEGIN
		SET @sql = 'INSERT INTO dbo.DimScenario(ScenarioKey, ScenarioName)
					SELECT ScenarioKey, ScenarioName 
					FROM int.Scenario a
					WHERE NOT EXISTS ( SELECT ScenarioName FROM dbo.DimScenario d WHERE a.ScenarioKey = d.ScenarioKey)';
		PRINT @sql
		EXEC (@sql)
	END	
	ELSE
		BEGIN
			SET @sql = 'SELECT * INTO dbo.DimScenario
						FROM int.Scenario'
			PRINT @sql
			EXEC (@sql)
		END
END