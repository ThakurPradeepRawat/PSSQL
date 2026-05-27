USE Prashad 
go


CREATE TABLE [common].[GiftOccasions]
(
    [Id]                INT IDENTITY(1,1) NOT NULL,
    [Name]              NVARCHAR(100) NOT NULL,
    [Icon]              NVARCHAR(10) NULL,
    [Description]       NVARCHAR(255) NULL,

    CONSTRAINT PK_GiftOccasions
        PRIMARY KEY ([Id])
);
GO
