CREATE VIEW dbo.vAvailableVehicles
AS
SELECT     TOP 100 PERCENT dbo.tblVehicle.VehicleID, dbo.tblVehicle.ParkingSpace, dbo.tblVehicle.Registration, dbo.tblVehicle.vehicle_model_id, 
                      dbo.tblVehicle.vehicle_type_id, dbo.tblVehicle.SeatingCapacity, dbo.tblVehicle.BookingCount, dbo.tblVehicle.Weighting, dbo.tblVehicle.Colour, 
                      dbo.tblVehicle.Information, dbo.tblVehicle.AcquisitionDate, dbo.tblVehicle.DisposalDate, dbo.tblVehicle.AssignedToPersonId, dbo.tblVehicle.DivisionId, 
                      dbo.tblVehicle.key_location_id, dbo.tblVehicle.Avail_Now, dbo.tblVehicle.Avail_Early, dbo.tblVehicle.Avail_Late, dbo.tblVehicle.Avail_Overnight, 
                      dbo.tblVehicle.Reserve_Unit, dbo.tblVehicle.Reserve_Special_Usage, dbo.tblVehicle.OrgUnitID, dbo.tblVehicle.Special_Usage_Description, 
                      dbo.tblVehicleModel.vehicle_model_name, dbo.tblVehicleMake.vehicle_make_name, dbo.tblVehicleType.Description, 
                      ISNULL(dbo.tblPerson.FullName_Forward, 'Pool') AS AssignedToPerson, dbo.tblKeyLocation.Description AS LocationDescription, 
                      dbo.tblKeyLocation.Directions AS LocationDirections, dbo.tblOrgUnit.Unit_Name AS OrgUnitName
FROM         dbo.tblVehicle INNER JOIN
                      dbo.tblVehicleModel ON dbo.tblVehicle.vehicle_model_id = dbo.tblVehicleModel.vehicle_model_id INNER JOIN
                      dbo.tblVehicleMake ON dbo.tblVehicleModel.vehicle_make_id = dbo.tblVehicleMake.vehicle_make_id INNER JOIN
                      dbo.tblVehicleType ON dbo.tblVehicle.vehicle_type_id = dbo.tblVehicleType.VehicleTypeID INNER JOIN
                      dbo.tblKeyLocation ON dbo.tblVehicle.key_location_id = dbo.tblKeyLocation.KeyLocationID LEFT OUTER JOIN
                      dbo.tblOrgUnit ON dbo.tblVehicle.OrgUnitID = dbo.tblOrgUnit.Org_Unit_ID LEFT OUTER JOIN
                      dbo.tblPerson ON dbo.tblVehicle.AssignedToPersonId = dbo.tblPerson.Employee_ID
WHERE     (dbo.tblVehicle.Avail_Now = 1) AND (dbo.tblVehicle.DisposalDate IS NULL)
ORDER BY dbo.tblVehicle.Weighting
