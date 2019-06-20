CREATE PROCEDURE [spVehicleMake_update]
	(@vehicle_make_id_1 	[int],
	 @vehicle_make_id_2 	[int],
	 @vehicle_make_name_3 	[varchar](30))

AS UPDATE [dbo].[tblVehicleMake] 

SET  [vehicle_make_id]	 = @vehicle_make_id_2,
	 [vehicle_make_name]	 = @vehicle_make_name_3 

WHERE 
	( [vehicle_make_id]	 = @vehicle_make_id_1)