Use Prashad 
go 


CREATE TABLE [orders].[CartItems]
(
    [CartItemId]        INT IDENTITY(1,1) NOT NULL,
    [CartId]            INT NOT NULL,
    [PrasadId]          INT NOT NULL,
    [Quantity]          INT NOT NULL,
    [UnitPrice]         DECIMAL(10,2) NOT NULL,
    [AddedAt]           DATETIME2 DEFAULT GETUTCDATE(),

    CONSTRAINT PK_CartItems
        PRIMARY KEY ([CartItemId]),

    CONSTRAINT UQ_CartItems_CartPrasad
        UNIQUE ([CartId], [PrasadId]),

    CONSTRAINT FK_CartItems_CartSessions
        FOREIGN KEY ([CartId])
        REFERENCES [orders].[CartSessions]([CartId]),

    CONSTRAINT FK_CartItems_Prasad
        FOREIGN KEY ([PrasadId])
        REFERENCES [catalog].[Prasad]([PrasadId]),

    CONSTRAINT CHK_CartItems_Quantity
        CHECK ([Quantity] > 0)
);
GO