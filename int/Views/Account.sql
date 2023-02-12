CREATE VIEW [int].[Account] AS
SELECT 
/*
Source: Table dbo.Account
Unit Test: EXEC int.usp_TableAccountLoad
Author: Lakshay Goel
Changes: 09/02/2023 Changed view definition to include data types and create a primary key 'Account Type'
*/
ISNULL (CONVERT(int, ROW_NUMBER() OVER (ORDER BY a.AccountCode)),0) AS AccountKey,
ISNULL (CONVERT(int, a.AccountCode),0) AS AccountCode,
ISNULL (CONVERT(varchar(75), a.AccountDescription),'') AS AccountDescription,
ISNULL (CONVERT(varchar(50), a.AccountType),'') AS AccountType,
ISNULL (CONVERT(varchar(30), a.ValueType),'') AS ValueType
FROM dbo.Account a