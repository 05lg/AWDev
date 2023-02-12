
/*
 Author:		Lakshay Goel
 Create date: 09/02/2023
 Description:	Stored Procedure to load dimension Organization table
 Unittest :  EXEC int.usp_TableOrganizationLoad
*/
CREATE PROCEDURE [int].[usp_OrganizationLoad]
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql nvarchar(max) = NULL;

	If OBJECT_ID('dbo.DimOrganization') IS NOT NULL
	BEGIN
		SET @sql = 'INSERT INTO dbo.DimOrganization(OrganizationKey, CurrencyKey, OrganizationName, ParentOrganizationName, PercentageOfOwnership)
					SELECT OrganizationKey, CurrencyKey, OrganizationName, ParentOrganizationName, PercentageOfOwnership
					FROM int.Organization a
					WHERE NOT EXISTS ( SELECT OrganizationName FROM dbo.DimOrganization d WHERE a.OrganizationKey = d.OrganizationKey)';
		PRINT @sql
		EXEC (@sql)
	END	
	ELSE
		BEGIN
			SET @sql = 'SELECT * INTO dbo.DimOrganization
						FROM int.Organization'
			PRINT @sql
			EXEC (@sql)
		END
END