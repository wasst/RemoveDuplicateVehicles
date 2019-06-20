CREATE PROCEDURE [spVehicleMake_insert]
	(@vehicle_make_id_1 	[int] = 0 	OUTPUT ,
	 @vehicle_make_name_2 	[varchar](30))

AS 


SET @vehicle_make_id_1 =
	(SELECT ISNULL(MAX(vehicle_make_id),0) + 1 from tblVehicleMake)

INSERT INTO [dbo].[tblVehicleMake] 
	 ( [vehicle_make_id],
	 [vehicle_make_name]) 
 
VALUES 
	( @vehicle_make_id_1,
	 @vehicle_make_name_2)