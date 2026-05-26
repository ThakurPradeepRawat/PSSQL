CREATE INDEX IX_Users_Phone
ON [auth].[Users]([Phone]);
GO

CREATE INDEX IX_UserAddresses_UserId
ON [auth].[UserAddresses]([UserId]);
GO

CREATE INDEX IX_UserRoles_UserId
ON [auth].[UserRoles]([UserId]);
GO

CREATE INDEX IX_RefreshTokens_UserId
ON [auth].[RefreshTokens]([UserId]);
GO