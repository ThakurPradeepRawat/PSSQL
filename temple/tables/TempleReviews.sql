CREATE TABLE [temple].[TempleReviews]
(
    [ReviewId]             INT IDENTITY(1,1) NOT NULL,
    [TempleId]             INT NOT NULL,
    [UserId]               INT NOT NULL,
    [Rating]               TINYINT NOT NULL,
    [ReviewText]           NVARCHAR(1000) NULL,
    [IsVerifiedPurchase]   BIT DEFAULT 0,
    [IsApproved]           BIT DEFAULT 0,
    [CreatedAt]            DATETIME2 DEFAULT GETUTCDATE(),

    CONSTRAINT PK_TempleReviews
        PRIMARY KEY ([ReviewId]),

    CONSTRAINT FK_TempleReviews_Temples
        FOREIGN KEY ([TempleId])
        REFERENCES [temple].[Temples]([TempleId]),

    CONSTRAINT FK_TempleReviews_Users
        FOREIGN KEY ([UserId])
        REFERENCES [auth].[Users]([UserId]),

    CONSTRAINT UQ_TempleReviews_User
        UNIQUE ([TempleId], [UserId]),

    CONSTRAINT CHK_TempleReviews_Rating
        CHECK ([Rating] >= 1 AND [Rating] <= 5)
);
GO