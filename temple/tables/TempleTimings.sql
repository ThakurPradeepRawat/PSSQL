CREATE TABLE [temple].[TempleTimings]
(
    [TimingId]         INT IDENTITY(1,1) NOT NULL,
    [TempleId]         INT NOT NULL,
    [DayOfWeek]        TINYINT NOT NULL,
    [SessionName]      VARCHAR(50) NOT NULL,
    [OpenTime]         TIME NOT NULL,
    [CloseTime]        TIME NOT NULL,

    CONSTRAINT PK_TempleTimings
        PRIMARY KEY ([TimingId]),

    CONSTRAINT FK_TempleTimings_Temples
        FOREIGN KEY ([TempleId])
        REFERENCES [temple].[Temples]([TempleId])
);
GO
