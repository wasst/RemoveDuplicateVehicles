CREATE VIEW dbo.vVehicleMake
AS
SELECT     TOP 100 PERCENT dbo.tblVehicleMake.*
FROM         dbo.tblVehicleMake
ORDER BY vehicle_make_name
