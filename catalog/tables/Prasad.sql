-- =============================================
-- TABLE : catalog.Prasad
-- =============================================

CREATE TABLE [catalog].[Prasad]
(
    [PrasadId]          INT IDENTITY(1,1) NOT NULL,
    [TempleId]          INT NOT NULL,
    [CategoryId]        INT NOT NULL,
    [Slug]              VARCHAR(160) NOT NULL,
    [Name]              NVARCHAR(200) NOT NULL,
    [ShortDesc]         NVARCHAR(500) NULL,
    [Description]       NVARCHAR(MAX) NULL,
    [Price]             DECIMAL(10,2) NOT NULL,
    [OriginalPrice]     DECIMAL(10,2) NULL,
    [WeightGrams]       INT NULL,
    [ShelfLifeDays]     INT NULL,
    [Ingredients]       NVARCHAR(MAX) NULL,
    [IsGITagged]        BIT DEFAULT 0,
    [IsBestseller]      BIT DEFAULT 0,
    [IsActive]          BIT DEFAULT 1,
    [AverageRating]     DECIMAL(3,2) DEFAULT 0.00,
    [TotalReviews]      INT DEFAULT 0,
    [CreatedAt]         DATETIME2 DEFAULT GETUTCDATE(),

    CONSTRAINT PK_Prasad
        PRIMARY KEY ([PrasadId]),

    CONSTRAINT UQ_Prasad_Slug
        UNIQUE ([Slug]),

    CONSTRAINT FK_Prasad_Temples
        FOREIGN KEY ([TempleId])
        REFERENCES [temple].[Temples]([TempleId]),

    CONSTRAINT FK_Prasad_Categories
        FOREIGN KEY ([CategoryId])
        REFERENCES [catalog].[PrasadCategories]([CategoryId]),

    CONSTRAINT CHK_Prasad_Price
        CHECK ([Price] > 0),

    CONSTRAINT CHK_Prasad_OriginalPrice
        CHECK ([OriginalPrice] > 0)
);
GO