CREATE PROCEDURE [spVehicleModel_update]
	(@vehicle_model_id_1 	[int],
	 @vehicle_model_id_2 	[int],
	 @vehicle_make_id_3 	[int],
	 @vehicle_model_name_4 	[varchar](30))

AS UPDATE [dbo].[tblVehicleModel] 

SET  [vehicle_model_id]	 = @vehicle_model_id_2,
	 [vehicle_make_id]	 = @vehicle_make_id_3,
	 [vehicle_model_name]	 = @vehicle_model_name_4 

WHERE 
	( [vehicle_model_id]	 = @vehicle_model_id_1)