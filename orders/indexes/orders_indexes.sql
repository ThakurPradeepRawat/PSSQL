

-- =============================================
-- INDEXES : CartSessions
-- =============================================

CREATE INDEX IX_CartSessions_UserId
ON [orders].[CartSessions]([UserId]);
GO

CREATE INDEX IX_CartSessions_ExpiresAt
ON [orders].[CartSessions]([ExpiresAt]);
GO

-- =============================================
-- INDEXES : CartItems
-- =============================================

CREATE INDEX IX_CartItems_CartId
ON [orders].[CartItems]([CartId]);
GO

CREATE INDEX IX_CartItems_PrasadId
ON [orders].[CartItems]([PrasadId]);
GO

-- =============================================
-- INDEXES : Coupons
-- =============================================

CREATE INDEX IX_Coupons_IsActive
ON [orders].[Coupons]([IsActive]);
GO

CREATE INDEX IX_Coupons_ValidUntil
ON [orders].[Coupons]([ValidUntil]);
GO

-- =============================================
-- INDEXES : Orders
-- =============================================

CREATE INDEX IX_Orders_UserId
ON [orders].[Orders]([UserId]);
GO

CREATE INDEX IX_Orders_AddressId
ON [orders].[Orders]([AddressId]);
GO

CREATE INDEX IX_Orders_CouponId
ON [orders].[Orders]([CouponId]);
GO

CREATE INDEX IX_Orders_Status
ON [orders].[Orders]([Status]);
GO

CREATE INDEX IX_Orders_PlacedAt
ON [orders].[Orders]([PlacedAt]);
GO

CREATE INDEX IX_Orders_PaymentStatus
ON [orders].[Orders]([PaymentStatus]);
GO

-- =============================================
-- INDEXES : OrderItems
-- =============================================

CREATE INDEX IX_OrderItems_OrderId
ON [orders].[OrderItems]([OrderId]);
GO

CREATE INDEX IX_OrderItems_PrasadId
ON [orders].[OrderItems]([PrasadId]);
GO