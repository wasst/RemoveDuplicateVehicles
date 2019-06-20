CREATE TABLE [dbo].[tblVehicleModel] (
    [vehicle_model_id]   INT          IDENTITY (1, 1) NOT NULL,
    [vehicle_make_id]    INT          NOT NULL,
    [vehicle_model_name] VARCHAR (30) NULL,
    CONSTRAINT [PK_vehicle_model] PRIMARY KEY CLUSTERED ([vehicle_model_id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_vehicle_model_vehicle_make] FOREIGN KEY ([vehicle_make_id]) REFERENCES [dbo].[tblVehicleMake] ([vehicle_make_id])
);

