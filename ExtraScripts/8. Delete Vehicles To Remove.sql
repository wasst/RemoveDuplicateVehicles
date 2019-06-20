
DECLARE @CountVehiclesToRemove int

SET @CountVehiclesToRemove = (SELECT COUNT(*) FROM VEHICLESREMOVED)

BEGIN TRAN

DELETE FROM tblVehicle where VehicleID in (Select VehicleID from VEHICLESREMOVED)

IF @@ROWCOUNT = @CountVehiclesToRemove
BEGIN
	PRINT('Proceed with Delete of ' + convert(varchar(max), @CountVehiclesToRemove) + ' vehicles')
	COMMIT TRAN
END
ELSE
BEGIN
	PRINT('DO NOT Proceed with Delete of ' + convert(varchar(max), @CountVehiclesToRemove) + ' vehicles')
	ROLLBACK TRAN
END
