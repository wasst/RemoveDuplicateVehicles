CREATE TABLE [dbo].[tblBookingParameters_Debug] (
    [RunID]                  INT           IDENTITY (1, 1) NOT NULL,
    [DepartTime]             DATETIME      NULL,
    [ReturnTime]             DATETIME      NULL,
    [VehicleMakeID]          INT           NULL,
    [VehicleModelID]         INT           NULL,
    [SeatingCapacity]        INT           NULL,
    [AvailableEarly]         INT           NULL,
    [AvailableLate]          INT           NULL,
    [AvailableOvernight]     INT           NULL,
    [WhereVehicleType]       VARCHAR (600) NULL,
    [WhereVehicleAssignedTo] VARCHAR (600) NULL,
    [WhereKeyLocation]       VARCHAR (600) NULL
);


GO
CREATE CLUSTERED INDEX [AK_tblBookingParameters_Debug]
    ON [dbo].[tblBookingParameters_Debug]([DepartTime] ASC, [ReturnTime] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PK_tblBookingParameters_Debug]
    ON [dbo].[tblBookingParameters_Debug]([RunID] ASC) WITH (FILLFACTOR = 90);

