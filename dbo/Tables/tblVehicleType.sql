CREATE TABLE [dbo].[tblVehicleType] (
    [VehicleTypeID] INT          NOT NULL,
    [Description]   VARCHAR (30) NOT NULL,
    [Modified]      ROWVERSION   NULL,
    CONSTRAINT [PK_vehicle_type] PRIMARY KEY NONCLUSTERED ([VehicleTypeID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE CLUSTERED INDEX [IX_vehicle_type_1]
    ON [dbo].[tblVehicleType]([Description] ASC) WITH (FILLFACTOR = 90);

