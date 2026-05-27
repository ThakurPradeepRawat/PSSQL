CREATE TABLE [orders].[OrderItems]
(
    [OrderItemId]       INT IDENTITY(1,1) NOT NULL,
    [OrderId]           INT NOT NULL,
    [PrasadId]          INT NOT NULL,
    [PrasadName]        NVARCHAR(200) NOT NULL,
    [TempleName]        NVARCHAR(200) NOT NULL,
    [Quantity]          INT NOT NULL,
    [UnitPrice]         DECIMAL(10,2) NOT NULL,
    [TotalPrice]        DECIMAL(10,2) NOT NULL,
    [ReviewId]          INT NULL,

    CONSTRAINT PK_OrderItems
        PRIMARY KEY ([OrderItemId]),

    CONSTRAINT FK_OrderItems_Orders
        FOREIGN KEY ([OrderId])
        REFERENCES [orders].[Orders]([OrderId]),

    CONSTRAINT FK_OrderItems_Prasad
        FOREIGN KEY ([PrasadId])
        REFERENCES [catalog].[Prasad]([PrasadId])
);
GO