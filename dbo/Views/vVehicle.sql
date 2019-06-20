CREATE VIEW dbo.vVehicle
AS
SELECT     TOP 100 PERCENT dbo.tblVehicle.*
FROM         dbo.tblVehicleModel INNER JOIN
                      dbo.tblVehicle ON dbo.tblVehicleModel.vehicle_model_id = dbo.tblVehicle.vehicle_model_id INNER JOIN
                      dbo.tblVehicleMake ON dbo.tblVehicleModel.vehicle_make_id = dbo.tblVehicleMake.vehicle_make_id
ORDER BY dbo.tblVehicle.VehicleID
