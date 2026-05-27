Use Prashad 
go 


CREATE TABLE [common].[MasterRegions]
(
    [Id]                INT IDENTITY(1,1) NOT NULL,
    [Name]              NVARCHAR(100) NOT NULL,

    CONSTRAINT PK_MasterRegions
        PRIMARY KEY ([Id])
);
GO