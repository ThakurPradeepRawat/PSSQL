-- =============================================
-- TABLE : auth.UserRoles
-- =============================================

CREATE TABLE [auth].[UserRoles]
(
    [UserRoleId]        INT IDENTITY(1,1) NOT NULL,
    [UserId]            INT NOT NULL,
    [Role]              VARCHAR(30) NOT NULL,
    [AssignedAt]        DATETIME2 DEFAULT GETUTCDATE(),

    CONSTRAINT PK_UserRoles
        PRIMARY KEY ([UserRoleId]),

    CONSTRAINT FK_UserRoles_Users
        FOREIGN KEY ([UserId])
        REFERENCES [auth].[Users]([UserId])
);
GO