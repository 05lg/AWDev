CREATE TABLE [dbo].[Account] (
    [AccountCode]         VARCHAR (10)  NULL,
    [ParentAccountCode]   VARCHAR (10)  NULL,
    [AccountDescription]  VARCHAR (100) NULL,
    [AccountType]         VARCHAR (50)  NULL,
    [Operator]            NVARCHAR (10) NULL,
    [CustomMembers]       VARCHAR (300) NULL,
    [ValueType]           VARCHAR (50)  NULL,
    [CustomMemberOptions] VARCHAR (300) NULL
);

