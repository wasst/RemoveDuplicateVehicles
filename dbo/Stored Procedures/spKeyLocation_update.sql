

CREATE PROCEDURE [spKeyLocation_update]
	(@KeyLocationID_1 	[int],
	 @Description_2 	[varchar](20),
	 @Directions_3 	             [varchar](255))

AS UPDATE [vehiclebookings].[dbo].[tblKeyLocation] 

SET 
	 [Description]	 = @Description_2,
	 [Directions]	 = @Directions_3 

WHERE 
	( [KeyLocationID]	 = @KeyLocationID_1)