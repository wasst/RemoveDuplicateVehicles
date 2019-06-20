CREATE PROCEDURE [spVehicle_delete]
	(@VehicleID_1 	[int])

AS DELETE [dbo].[tblVehicle] 

WHERE 
	( [VehicleID]	 = @VehicleID_1)