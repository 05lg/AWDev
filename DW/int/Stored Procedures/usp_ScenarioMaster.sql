/*
 Author:		Lakshay Goel
 Create date: 11/02/2023
 Description:	Master Stored Procedure for Scenario
 Unittest :  EXEC int.usp_ScenarioMaster
*/
CREATE PROCEDURE [int].[usp_ScenarioMaster]
AS
BEGIN
	SET NOCOUNT ON;

	EXEC [int].[usp_ScenarioExtract];
	EXEC [int].[usp_ScenarioLoad]
END