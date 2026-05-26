CREATE TABLE [temple].[TempleImages]
(
    [ImageId]          INT IDENTITY(1,1) NOT NULL,
    [TempleId]         INT NOT NULL,
    [ImageUrl]         NVARCHAR(500) NOT NULL,
    [AltText]          NVARCHAR(200) NULL,
    [SortOrder]        INT DEFAULT 0,
    [IsPrimary]        BIT DEFAULT 0,

    CONSTRAINT PK_TempleImages
        PRIMARY KEY ([ImageId]),

    CONSTRAINT FK_TempleImages_Temples
        FOREIGN KEY ([TempleId])
        REFERENCES [temple].[Temples]([TempleId])
);
GO