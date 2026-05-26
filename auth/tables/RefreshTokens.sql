CREATE TABLE [auth].[RefreshTokens]
(
    [TokenId]           INT IDENTITY(1,1) NOT NULL,
    [UserId]            INT NOT NULL,
    [Token]             NVARCHAR(512) NOT NULL,
    [ExpiresAt]         DATETIME2 NOT NULL,
    [IsRevoked]         BIT DEFAULT 0,
    [DeviceInfo]        NVARCHAR(200) NULL,
    [CreatedAt]         DATETIME2 DEFAULT GETUTCDATE(),

    CONSTRAINT PK_RefreshTokens
        PRIMARY KEY ([TokenId]),

    CONSTRAINT UQ_RefreshTokens_Token
        UNIQUE ([Token]),

    CONSTRAINT FK_RefreshTokens_Users
        FOREIGN KEY ([UserId])
        REFERENCES [auth].[Users]([UserId])
);
GO