CREATE TABLE [dbo].[DimAccount] (
    [AccountKey]         INT          NOT NULL,
    [AccountCode]        INT          NOT NULL,
    [AccountDescription] VARCHAR (75) NOT NULL,
    [AccountType]        VARCHAR (50) NOT NULL,
    [ValueType]          VARCHAR (30) NOT NULL
);

