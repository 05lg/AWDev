
CREATE VIEW [int].[Currency] AS
SELECT 
/*
Source: Table dbo.Currency
Unit Test: EXEC int.usp_TableCurrencyLoad
Author: Lakshay Goel
Changes: 09/02/2023 Changed view definition to include data types and create a primary key 'CurrencyKey'
*/
ISNULL (CONVERT (int, ROW_NUMBER() OVER (ORDER BY a.CurrencyCode)),0) AS CurrencyKey,
ISNULL (CONVERT (varchar(5), a.CurrencyCode),'') AS CurrencyCode,
ISNULL (CONVERT (varchar(30), a.CurrencyName),'') AS CurrencyName
FROM dbo.Currency a