/*
 Author:		Lakshay Goel
 Create date: 11/02/2023
 Description:	Master Stored Procedure for Organization
 Unittest :  EXEC int.usp_OrganizationMaster
*/
CREATE PROCEDURE [int].[usp_OrganizationMaster]
AS
BEGIN
	SET NOCOUNT ON;

	EXEC [int].[usp_OrganizationExtract];
	EXEC [int].[usp_OrganizationLoad]
END