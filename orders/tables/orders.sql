CREATE TABLE [orders].[Orders]
(
    [OrderId]               INT IDENTITY(1,1) NOT NULL,
    [OrderNumber]           VARCHAR(30) NOT NULL,
    [UserId]                INT NOT NULL,
    [AddressId]             INT NOT NULL,
    [CouponId]              INT NULL,
    [Status]                VARCHAR(30) DEFAULT 'Pending',
    [SubTotal]              DECIMAL(10,2) NOT NULL,
    [DeliveryCharges]       DECIMAL(10,2) DEFAULT 0,
    [DiscountAmount]        DECIMAL(10,2) DEFAULT 0,
    [TaxAmount]             DECIMAL(10,2) DEFAULT 0,
    [TotalAmount]           DECIMAL(10,2) NOT NULL,
    [DeliveryType]          VARCHAR(20) DEFAULT 'Standard',
    [SpecialInstructions]   NVARCHAR(500) NULL,
    [PlacedAt]              DATETIME2 DEFAULT GETUTCDATE(),
    [UpdatedAt]             DATETIME2 DEFAULT GETUTCDATE(),
    [RazorpayOrderId]       VARCHAR(100) NULL,
    [PaymentId]             VARCHAR(100) NULL,
    [PaymentStatus]         VARCHAR(50) DEFAULT 'Pending',

    CONSTRAINT PK_Orders
        PRIMARY KEY ([OrderId]),

    CONSTRAINT UQ_Orders_OrderNumber
        UNIQUE ([OrderNumber]),

    CONSTRAINT FK_Orders_Users
        FOREIGN KEY ([UserId])
        REFERENCES [auth].[Users]([UserId]),

    CONSTRAINT FK_Orders_UserAddresses
        FOREIGN KEY ([AddressId])
        REFERENCES [auth].[UserAddresses]([AddressId]),

    CONSTRAINT FK_Orders_Coupons
        FOREIGN KEY ([CouponId])
        REFERENCES [orders].[Coupons]([CouponId])
);
GO
