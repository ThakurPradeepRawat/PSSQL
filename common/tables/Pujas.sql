use prashad 
go 


CREATE TABLE [common].[Pujas]
(
    [Id]                    INT IDENTITY(1,1) NOT NULL,
    [Name]                  NVARCHAR(200) NOT NULL,
    [TempleName]            NVARCHAR(200) NULL,
    [Description]           NVARCHAR(1000) NULL,
    [Icon]                  NVARCHAR(10) NULL,
    [BgGradient]            NVARCHAR(100) NULL,
    [Duration]              NVARCHAR(50) NULL,
    [IncludesCertificate]   BIT NULL,
    [IncludesVideo]         BIT NULL,
    [Tag]                   NVARCHAR(50) NULL,
    [TagClass]              NVARCHAR(50) NULL,
    [Price]                 DECIMAL(18,2) NULL,
    [PriceNote]             NVARCHAR(100) NULL,

    CONSTRAINT PK_Pujas
        PRIMARY KEY ([Id])
);
GO