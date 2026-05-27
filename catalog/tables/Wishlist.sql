CREATE TABLE [catalog].[Wishlists]
(
    [WishlistId]        INT IDENTITY(1,1) NOT NULL,
    [UserId]            INT NOT NULL,
    [PrasadId]          INT NOT NULL,
    [AddedAt]           DATETIME2 DEFAULT GETUTCDATE(),

    CONSTRAINT PK_Wishlists
        PRIMARY KEY ([WishlistId]),

    CONSTRAINT UQ_Wishlists_UserPrasad
        UNIQUE ([UserId], [PrasadId]),

    CONSTRAINT FK_Wishlists_Users
        FOREIGN KEY ([UserId])
        REFERENCES [auth].[Users]([UserId]),

    CONSTRAINT FK_Wishlists_Prasad
        FOREIGN KEY ([PrasadId])
        REFERENCES [catalog].[Prasad]([PrasadId])
);
GO
