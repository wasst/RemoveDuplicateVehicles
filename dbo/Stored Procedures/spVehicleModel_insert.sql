CREATE PROCEDURE [spVehicleModel_insert]
	(@vehicle_model_id_1 	[int] = 0 OUTPUT,
	 @vehicle_make_id_2 	[int],
	 @vehicle_model_name_3 	[varchar](30))

AS 

SET @vehicle_model_id_1 =
	(SELECT ISNULL(MAX(vehicle_model_id),0) + 1 from tblVehicleModel)
	
INSERT INTO [dbo].[tblVehicleModel] 
	 ( [vehicle_model_id],
	 [vehicle_make_id],
	 [vehicle_model_name]) 
 
VALUES 
	( @vehicle_model_id_1,
	 @vehicle_make_id_2,
	 @vehicle_model_name_3)