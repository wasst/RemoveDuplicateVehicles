CREATE PROCEDURE [spVehicleMake_delete]
	(@vehicle_make_id_1 	[int])

AS DELETE [dbo].[tblVehicleMake] 

WHERE 
	( [vehicle_make_id]	 = @vehicle_make_id_1)