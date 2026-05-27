CREATE INDEX IX_Prasad_TempleId
ON [catalog].[Prasad]([TempleId]);
GO

CREATE INDEX IX_Prasad_CategoryId
ON [catalog].[Prasad]([CategoryId]);
GO

CREATE INDEX IX_Prasad_IsActive
ON [catalog].[Prasad]([IsActive]);
GO

CREATE INDEX IX_Prasad_IsBestseller
ON [catalog].[Prasad]([IsBestseller]);
GO

CREATE INDEX IX_Prasad_Price
ON [catalog].[Prasad]([Price]);
GO

CREATE INDEX IX_Prasad_CreatedAt
ON [catalog].[Prasad]([CreatedAt]);
GO

CREATE INDEX IX_PrasadImages_PrasadId
ON [catalog].[PrasadImages]([PrasadId]);
GO



CREATE INDEX IX_PrasadInventory_PrasadId
ON [catalog].[PrasadInventory]([PrasadId]);
GO



CREATE INDEX IX_Wishlists_UserId
ON [catalog].[Wishlists]([UserId]);
GO

CREATE INDEX IX_Wishlists_PrasadId
ON [catalog].[Wishlists]([PrasadId]);
GO



CREATE INDEX IX_PrasadCategories_ParentCategoryId
ON [catalog].[PrasadCategories]([ParentCategoryId]);
GO

CREATE INDEX IX_PrasadCategories_IsActive
ON [catalog].[PrasadCategories]([IsActive]);
GO