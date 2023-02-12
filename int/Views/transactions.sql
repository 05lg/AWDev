CREATE VIEW [int].[transactions] AS
SELECT 
/*
Source: Table dbo.Transactions
Unit Test: EXEC int.usp_TableTransactionsLoad
Author: Lakshay Goel
Changes: 09/02/2023 Changed view definition to include data types
*/
ISNULL (CONVERT(date, t.AccountDate),'01/01/1990') AS Date,
a.AccountKey,
o.OrganizationKey,
o.CurrencyKey,
s.ScenarioKey,
ISNULL (CONVERT(money, t.Amount),0) AS SalesAmount
FROM dbo.Transactions t
INNER JOIN dbo.dimOrganization o ON o.OrganizationName = t.OrganizationName
INNER JOIN dbo.DimScenario s ON s.ScenarioName = t.ScenarioName
INNER JOIN dbo.dimAccount a ON a.AccountCode = t.AccountCode