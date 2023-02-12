
CREATE VIEW [int].[Organization] AS
SELECT 
/*
Source: Table dbo.Organization
Unit Test: EXEC int.usp_TableOrganizationLoad
Author: Lakshay Goel
Changes: 09/02/2023 Changed view definition to include data types and create a primary key 'OrganizationKey'
*/
ISNULL (CONVERT(int, ROW_NUMBER() OVER (ORDER BY a.OrganizationName)),0) AS OrganizationKey,
c.CurrencyKey,
ISNULL (CONVERT(varchar(50), a.OrganizationName),'') AS OrganizationName,
ISNULL (CONVERT(varchar(50), a.ParentOrganizationName),'') AS ParentOrganizationName,
ISNULL (CONVERT(float, a.PercentageOfOwnership),'') AS PercentageOfOwnership
FROM dbo.Organization a
LEFT JOIN dbo.dimCurrency c
ON a.CurrencyCode = c.CurrencyCode