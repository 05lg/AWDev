

/*
 Author:		Lakshay Goel
 Create date: 11/02/2023
 Description:	Master Stored Procedure for Account
 Unittest :  EXEC int.usp_AccountMaster
*/
CREATE PROCEDURE [int].[usp_AccountMaster]
AS
BEGIN
	SET NOCOUNT ON;

	EXEC [int].[usp_AccountExtract];
	EXEC [int].[usp_AccountLoad]
END