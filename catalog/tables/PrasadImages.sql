
CREATE TABLE [catalog].[PrasadImages]
(
    [ImageId]           INT IDENTITY(1,1) NOT NULL,
    [PrasadId]          INT NOT NULL,
    [ImageUrl]          NVARCHAR(500) NOT NULL,
    [AltText]           NVARCHAR(200) NULL,
    [SortOrder]         INT DEFAULT 0,
    [IsPrimary]         BIT DEFAULT 0,

    CONSTRAINT PK_PrasadImages
        PRIMARY KEY ([ImageId]),

    CONSTRAINT FK_PrasadImages_Prasad
        FOREIGN KEY ([PrasadId])
        REFERENCES [catalog].[Prasad]([PrasadId])
);
GO