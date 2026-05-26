CREATE TABLE [auth].[Users]
(
    [UserId]            INT IDENTITY(1,1) NOT NULL,
    [FirstName]         NVARCHAR(60) NOT NULL,
    [LastName]          NVARCHAR(60) NOT NULL,
    [Email]             NVARCHAR(255) NOT NULL,
    [Phone]             VARCHAR(15) NULL,
    [PasswordHash]      NVARCHAR(512) NOT NULL,
    [ProfileImageUrl]   NVARCHAR(500) NULL,
    [IsEmailVerified]   BIT DEFAULT 0,
    [IsPhoneVerified]   BIT DEFAULT 0,
    [IsActive]          BIT DEFAULT 1,
    [OtpCode]           VARCHAR(6) NULL,
    [OtpExpiry]         DATETIME2 NULL,
    [CreatedAt]         DATETIME2 DEFAULT GETUTCDATE(),
    [UpdatedAt]         DATETIME2 DEFAULT GETUTCDATE(),
    [LastLoginAt]       DATETIME2 NULL,

    CONSTRAINT PK_Users 
        PRIMARY KEY ([UserId]),

    CONSTRAINT UQ_Users_Email 
        UNIQUE ([Email]),

    CONSTRAINT UQ_Users_Phone 
        UNIQUE ([Phone])
);
GO