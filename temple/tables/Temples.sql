CREATE TABLE [temple].[Temples]
(
    [TempleId]         INT IDENTITY(1,1) NOT NULL,
    [Slug]             VARCHAR(120) NOT NULL,
    [Name]             NVARCHAR(200) NOT NULL,
    [Deity]            NVARCHAR(100) NOT NULL,
    [Description]      NVARCHAR(MAX) NULL,
    [City]             NVARCHAR(80) NOT NULL,
    [State]            NVARCHAR(80) NOT NULL,
    [PinCode]          VARCHAR(10) NULL,
    [Latitude]         DECIMAL(10,8) NOT NULL,
    [Longitude]        DECIMAL(11,8) NOT NULL,
    [CoverImageUrl]    NVARCHAR(500) NULL,
    [AverageRating]    DECIMAL(3,2) DEFAULT 0.00,
    [TotalReviews]     INT DEFAULT 0,
    [IsVerified]       BIT DEFAULT 0,
    [IsActive]         BIT DEFAULT 1,
    [Tags]             NVARCHAR(500) NULL,
    [CreatedAt]        DATETIME2 DEFAULT GETUTCDATE(),

    CONSTRAINT PK_Temples
        PRIMARY KEY ([TempleId]),

    CONSTRAINT UQ_Temples_Slug
        UNIQUE ([Slug])
);
GO