CREATE TABLE [orders].[CartSessions]
(
    [CartId]            INT IDENTITY(1,1) NOT NULL,
    [UserId]            INT NULL,
    [SessionToken]      VARCHAR(100) NULL,
    [ExpiresAt]         DATETIME2 NOT NULL,
    [CreatedAt]         DATETIME2 DEFAULT GETUTCDATE(),

    CONSTRAINT PK_CartSessions
        PRIMARY KEY ([CartId]),

    CONSTRAINT UQ_CartSessions_SessionToken
        UNIQUE ([SessionToken]),

    CONSTRAINT FK_CartSessions_Users
        FOREIGN KEY ([UserId])
        REFERENCES [auth].[Users]([UserId])
);
GO