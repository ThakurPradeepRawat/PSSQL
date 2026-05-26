-- =============================================
-- TABLE : auth.UserAddresses
-- =============================================

CREATE TABLE [auth].[UserAddresses]
(
    [AddressId]         INT IDENTITY(1,1) NOT NULL,
    [UserId]            INT NOT NULL,
    [AddressType]       VARCHAR(20) DEFAULT 'Home',
    [RecipientName]     NVARCHAR(100) NOT NULL,
    [Phone]             VARCHAR(15) NOT NULL,
    [Line1]             NVARCHAR(200) NOT NULL,
    [Line2]             NVARCHAR(200) NULL,
    [City]              NVARCHAR(80) NOT NULL,
    [State]             NVARCHAR(80) NOT NULL,
    [PinCode]           VARCHAR(10) NOT NULL,
    [Country]           VARCHAR(60) DEFAULT 'India',
    [IsDefault]         BIT DEFAULT 0,
    [Latitude]          DECIMAL(10,8) NULL,
    [Longitude]         DECIMAL(11,8) NULL,

    CONSTRAINT PK_UserAddresses
        PRIMARY KEY ([AddressId]),

    CONSTRAINT FK_UserAddresses_Users
        FOREIGN KEY ([UserId])
        REFERENCES [auth].[Users]([UserId])
);
GO