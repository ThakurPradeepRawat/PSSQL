use prashad 
go 


CREATE TABLE [common].[MasterRatings]
(
    [Id]                INT IDENTITY(1,1) NOT NULL,
    [FilterId]          NVARCHAR(10) NOT NULL,
    [Label]             NVARCHAR(50) NOT NULL,
    [Value]             INT NOT NULL,

    CONSTRAINT PK_MasterRatings
        PRIMARY KEY ([Id])
);
GO