
CREATE TABLE [catalog].[PrasadInventory]
(
    [InventoryId]       INT IDENTITY(1,1) NOT NULL,
    [PrasadId]          INT NOT NULL,
    [StockQuantity]     INT DEFAULT 0,
    [ReservedQuantity]  INT DEFAULT 0,
    [ReorderLevel]      INT DEFAULT 10,
    [LastRestockedAt]   DATETIME2 NULL,
    [UpdatedAt]         DATETIME2 DEFAULT GETUTCDATE(),

    CONSTRAINT PK_PrasadInventory
        PRIMARY KEY ([InventoryId]),

    CONSTRAINT UQ_PrasadInventory_PrasadId
        UNIQUE ([PrasadId]),

    CONSTRAINT FK_PrasadInventory_Prasad
        FOREIGN KEY ([PrasadId])
        REFERENCES [catalog].[Prasad]([PrasadId]),

    CONSTRAINT CHK_PrasadInventory_Stock
        CHECK ([StockQuantity] >= 0)
);
GO
