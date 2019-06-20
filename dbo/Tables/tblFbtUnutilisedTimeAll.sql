CREATE TABLE [dbo].[tblFbtUnutilisedTimeAll] (
    [DepartTime]     DATETIME     NULL,
    [ReturnTime]     DATETIME     NULL,
    [VehicleId]      VARCHAR (50) NULL,
    [FbtAllId]       INT          IDENTITY (1, 1) NOT NULL,
    [SecondsUsedInt] INT          NULL,
    [SecsUnutilised] INT          NULL,
    [DayTtlChck]     INT          NULL,
    [Hours]          VARCHAR (12) NULL,
    [Minutes]        VARCHAR (12) NULL,
    [Seconds]        VARCHAR (11) NULL
);


GO
CREATE NONCLUSTERED INDEX [AK_IDAndDepartTime]
    ON [dbo].[tblFbtUnutilisedTimeAll]([VehicleId] ASC, [DepartTime] ASC);

