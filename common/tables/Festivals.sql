use Prashad
go


CREATE TABLE [common].[Festivals]
(
    [Id]                INT IDENTITY(1,1) NOT NULL,
    [Name]              NVARCHAR(100) NOT NULL,
    [Description]       NVARCHAR(255) NULL,
    [Date]              DATETIME NOT NULL,
    [Tag]               NVARCHAR(50) NULL,
    [TagClass]          NVARCHAR(50) NULL,
    [DateBgColor]       NVARCHAR(20) NULL,
    [DateTextColor]     NVARCHAR(20) NULL,

    CONSTRAINT PK_Festivals
        PRIMARY KEY ([Id])
);
GO