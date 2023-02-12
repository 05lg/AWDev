CREATE TABLE [dbo].[FactTransactions] (
    [Date]            DATE  NOT NULL,
    [AccountKey]      INT   NOT NULL,
    [OrganizationKey] INT   NOT NULL,
    [CurrencyKey]     INT   NULL,
    [ScenarioKey]     INT   NOT NULL,
    [SalesAmount]     MONEY NOT NULL
);

