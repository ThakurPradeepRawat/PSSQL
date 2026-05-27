use Prashad 
go 

CREATE TABLE [common].[GiftBoxes]
(
    [Id]                INT IDENTITY(1,1) NOT NULL,
    [Name]              NVARCHAR(100) NOT NULL,
    [Description]       NVARCHAR(500) NULL,
    [Icon]              NVARCHAR(10) NULL,
    [BgGradient]        NVARCHAR(100) NULL,
    [Tag]               NVARCHAR(50) NULL,
    [TagClass]          NVARCHAR(50) NULL,
    [Price]             DECIMAL(18,2) NULL,
    [PriceNote]         NVARCHAR(100) NULL,
    [IsPopular]         BIT NULL,
    [ButtonClass]       NVARCHAR(50) NULL,
    [Contents]          NVARCHAR(MAX) NULL,

    CONSTRAINT PK_GiftBoxes
        PRIMARY KEY ([Id])
);
GO