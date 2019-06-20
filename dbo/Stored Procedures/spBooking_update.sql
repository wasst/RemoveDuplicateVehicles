CREATE PROCEDURE [spBooking_update]
	(@BookingID_1 	[int],
	 @BookingID_2 	[int],
	 @VehicleID_3 	[int],
	 @DepartTime_4 	[smalldatetime],
	 @ReturnTime_5 	[smalldatetime],
	 @BookingFor_6 	[int],
	 @BookingBy_7 	[int],
--	 @BookingType_8 	[int],
	 @Destination_9 	[nvarchar](600),
	 @DeletedInd_10 	[char](1)
--	 @DateCreated_11 	[datetime]
)

AS UPDATE [dbo].[tblBooking] 

SET  [BookingID]	 = @BookingID_2,
	 [VehicleID]	 = @VehicleID_3,
	 [DepartTime]	 = @DepartTime_4,
	 [ReturnTime]	 = @ReturnTime_5,
	 [BookingFor]	 = @BookingFor_6,
	 [BookingBy]	 = @BookingBy_7,
--	 [BookingType]	 = @BookingType_8,
	 [Destination]	 = @Destination_9,
	 [DeletedInd]	 = @DeletedInd_10
	-- [DateCreated]	 = @DateCreated_11 

WHERE 
	( [BookingID]	 = @BookingID_1)