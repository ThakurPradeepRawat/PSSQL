Use Prashad 
go 


CREATE TABLE [common].[PujaCategories]
(
    [Id]                INT IDENTITY(1,1) NOT NULL,
    [Name]              NVARCHAR(100) NOT NULL,
    [Icon]              NVARCHAR(10) NULL,
    [BgColor]           NVARCHAR(20) NULL,
    [Count]             INT NULL,

    CONSTRAINT PK_PujaCategories
        PRIMARY KEY ([Id])
);
GO