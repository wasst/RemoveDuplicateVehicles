CREATE PROCEDURE [pBooking_update]
	(@BookingID_1 	[int],
	 @VehicleID_2 	[int],
	 @DepartTime_3 	[datetime],
	 @ReturnTime_4 	[datetime],
	 @BookingFor_5 	[int],
	 @BookingBy_6 	[int],
	 @BookingType_7 	[int],
	 @Destination_8 	[nvarchar],
	 @DeletedInd_9 	[char],
	 @BookingID_10 	[int],
	 @VehicleID_11 	[int],
	 @DepartTime_12 	[datetime],
	 @ReturnTime_13 	[datetime],
	 @BookingFor_14 	[int],
	 @BookingBy_15 	[int],
	 @BookingType_16 	[int],
	 @Destination_17 	[nvarchar](150),
	 @DeletedInd_18 	[char](1))

AS UPDATE [dbo].[tblBooking] 

SET  [BookingID]	 = @BookingID_10,
	 [VehicleID]	 = @VehicleID_11,
	 [DepartTime]	 = @DepartTime_12,
	 [ReturnTime]	 = @ReturnTime_13,
	 [BookingFor]	 = @BookingFor_14,
	 [BookingBy]	 = @BookingBy_15,
	 [BookingType]	 = @BookingType_16,
	 [Destination]	 = @Destination_17,
	 [DeletedInd]	 = @DeletedInd_18 

WHERE 
	( [BookingID]	 = @BookingID_1 AND
	 [VehicleID]	 = @VehicleID_2 AND
	 [DepartTime]	 = @DepartTime_3 AND
	 [ReturnTime]	 = @ReturnTime_4 AND
	 [BookingFor]	 = @BookingFor_5 AND
	 [BookingBy]	 = @BookingBy_6 AND
	 [BookingType]	 = @BookingType_7 AND
	 [Destination]	 = @Destination_8 AND
	 [DeletedInd]	 = @DeletedInd_9)