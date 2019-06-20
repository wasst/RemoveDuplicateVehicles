CREATE TABLE [dbo].[tblVehicleUnavailability] (
    [VehicleId]       INT            NOT NULL,
    [UnavailableFrom] DATETIME       NULL,
    [UnavailableTo]   DATETIME       NULL,
    [Comment]         NVARCHAR (600) NULL,
    CONSTRAINT [PK_tblVehicleUnavailability] PRIMARY KEY CLUSTERED ([VehicleId] ASC)
);

