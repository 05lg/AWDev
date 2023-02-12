CREATE VIEW [int].[Scenario] AS
SELECT 
/*
Source: Table dbo.Scenario
Unit Test: EXEC int.usp_TableScenarioLoad
Author: Lakshay Goel
Changes: 09/02/2023 Changed view definition to include data types and create a primary key 'ScenarioKey'
*/
ISNULL (CONVERT(int, ROW_NUMBER() OVER (ORDER BY a.ScenarioName)),0) AS ScenarioKey,
ISNULL (CONVERT(varchar(50), a.ScenarioName),'') AS ScenarioName
FROM dbo.Scenario a