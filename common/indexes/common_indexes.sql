

-- =============================================
-- INDEXES : Festivals
-- =============================================

CREATE INDEX IX_Festivals_Date
ON [common].[Festivals]([Date]);
GO

CREATE INDEX IX_Festivals_Name
ON [common].[Festivals]([Name]);
GO

-- =============================================
-- INDEXES : FestivalProducts
-- =============================================

CREATE INDEX IX_FestivalProducts_FestivalName
ON [common].[FestivalProducts]([FestivalName]);
GO

CREATE INDEX IX_FestivalProducts_ProductName
ON [common].[FestivalProducts]([ProductName]);
GO

-- =============================================
-- INDEXES : GiftBoxes
-- =============================================

CREATE INDEX IX_GiftBoxes_IsPopular
ON [common].[GiftBoxes]([IsPopular]);
GO

CREATE INDEX IX_GiftBoxes_Name
ON [common].[GiftBoxes]([Name]);
GO

-- =============================================
-- INDEXES : GiftOccasions
-- =============================================

CREATE INDEX IX_GiftOccasions_Name
ON [common].[GiftOccasions]([Name]);
GO

-- =============================================
-- INDEXES : MasterRatings
-- =============================================

CREATE UNIQUE INDEX IX_MasterRatings_FilterId
ON [common].[MasterRatings]([FilterId]);
GO

-- =============================================
-- INDEXES : MasterRegions
-- =============================================

CREATE INDEX IX_MasterRegions_Name
ON [common].[MasterRegions]([Name]);
GO

-- =============================================
-- INDEXES : PujaCategories
-- =============================================

CREATE INDEX IX_PujaCategories_Name
ON [common].[PujaCategories]([Name]);
GO

-- =============================================
-- INDEXES : Pujas
-- =============================================

CREATE INDEX IX_Pujas_Name
ON [common].[Pujas]([Name]);
GO

CREATE INDEX IX_Pujas_TempleName
ON [common].[Pujas]([TempleName]);
GO

CREATE INDEX IX_Pujas_Price
ON [common].[Pujas]([Price]);
GO