CREATE TABLE [dbo].[tblVehicleMake] (
    [vehicle_make_id]   INT          IDENTITY (1, 1) NOT NULL,
    [vehicle_make_name] VARCHAR (30) NOT NULL,
    CONSTRAINT [PK_vehicle_make] PRIMARY KEY CLUSTERED ([vehicle_make_id] ASC) WITH (FILLFACTOR = 90)
);

