CREATE PROCEDURE [Booking_delete]
	(@BookingID_1 	[int],
	 @VehicleID_2 	[int],
	 @DepartTime_3 	[datetime],
	 @ReturnTime_4 	[datetime],
	 @BookingFor_5 	[int],
	 @BookingBy_6 	[int],
	 @BookingType_7 	[int],
	 @Destination_8 	[nvarchar],
	 @DeletedInd_9 	[char])

AS DELETE [dbo].[tblBooking] 

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