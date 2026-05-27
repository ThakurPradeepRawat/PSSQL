USE PRASHAD
go


CREATE TABLE [orders].[Coupons]
(
    [CouponId]          INT IDENTITY(1,1) NOT NULL,
    [Code]              VARCHAR(30) NOT NULL,
    [DiscountType]      VARCHAR(20) NOT NULL,
    [DiscountValue]     DECIMAL(10,2) NOT NULL,
    [MinOrderAmount]    DECIMAL(10,2) DEFAULT 0,
    [MaxDiscountCap]    DECIMAL(10,2) NULL,
    [MaxUsageCount]     INT NULL,
    [UsedCount]         INT DEFAULT 0,
    [ValidFrom]         DATETIME2 NOT NULL,
    [ValidUntil]        DATETIME2 NOT NULL,
    [IsActive]          BIT DEFAULT 1,

    CONSTRAINT PK_Coupons
        PRIMARY KEY ([CouponId]),

    CONSTRAINT UQ_Coupons_Code
        UNIQUE ([Code])
);
GO
