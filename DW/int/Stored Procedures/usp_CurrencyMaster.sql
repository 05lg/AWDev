/*
 Author:		Lakshay Goel
 Create date: 11/02/2023
 Description:	Master Stored Procedure for Currency
 Unittest :  EXEC int.usp_CurrencyMaster
*/
CREATE PROCEDURE [int].[usp_CurrencyMaster]
AS
BEGIN
	SET NOCOUNT ON;

	EXEC [int].[usp_CurrencyExtract];
	EXEC [int].[usp_CurrencyLoad]
END