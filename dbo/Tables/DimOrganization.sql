CREATE TABLE [dbo].[DimOrganization] (
    [OrganizationKey]        INT          NOT NULL,
    [CurrencyKey]            INT          NULL,
    [OrganizationName]       VARCHAR (50) NOT NULL,
    [ParentOrganizationName] VARCHAR (50) NOT NULL,
    [PercentageOfOwnership]  FLOAT (53)   NOT NULL
);

