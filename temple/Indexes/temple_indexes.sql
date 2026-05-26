
CREATE INDEX IX_Temples_Deity
ON [temple].[Temples]([Deity]);
GO

CREATE INDEX IX_Temples_State
ON [temple].[Temples]([State]);
GO

CREATE INDEX IX_Temples_IsActive
ON [temple].[Temples]([IsActive]);
GO

CREATE INDEX IX_TempleImages_TempleId
ON [temple].[TempleImages]([TempleId]);
GO

CREATE INDEX IX_TempleReviews_TempleId
ON [temple].[TempleReviews]([TempleId]);
GO

CREATE INDEX IX_TempleReviews_UserId
ON [temple].[TempleReviews]([UserId]);
GO

CREATE INDEX IX_TempleTimings_TempleId
ON [temple].[TempleTimings]([TempleId]);
GO