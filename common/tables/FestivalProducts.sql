Use Prashad
go

CREATE TABLE [common].[FestivalProducts]
(
    [Id]                INT IDENTITY(1,1) NOT NULL,
    [FestivalName]      NVARCHAR(100) NULL,
    [ProductName]       NVARCHAR(200) NULL,
    [Price]             DECIMAL(18,2) NULL,
    [Badge]             NVARCHAR(50) NULL,
    [BadgeClass]        NVARCHAR(50) NULL,
    [Icon]              NVARCHAR(10) NULL,
    [BgGradient]        NVARCHAR(100) NULL,
    [ButtonText]        NVARCHAR(50) NULL,

    CONSTRAINT PK_FestivalProducts
        PRIMARY KEY ([Id])
);
GO