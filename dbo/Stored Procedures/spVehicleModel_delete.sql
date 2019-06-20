CREATE PROCEDURE [spVehicleModel_delete]
	(@vehicle_model_id_1 	[int])

AS DELETE [dbo].[tblVehicleModel] 

WHERE 
	( [vehicle_model_id]	 = @vehicle_model_id_1)