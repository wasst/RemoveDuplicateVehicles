CREATE PROCEDURE [spBooking_insert]
	(@BookingID_1 	[int] output,
	 @VehicleID_2 	[int],
	 @DepartTime_3 	[datetime],
	 @ReturnTime_4 	[datetime],
	 @BookingFor_5 	[int],
	 @BookingBy_6 	[int],
--	 @BookingType_7 	[int],
	 @Destination_8 	[nvarchar](150),
--	 @DeletedInd_9 	[char](1)
	@DateCreated                [datetime] )


AS 
BEGIN TRANSACTION

SET @BookingID_1 =  (SELECT (ISNULL(MAX(BookingID),0) + 1) from tblBooking)

INSERT INTO [dbo].[tblBooking] 
	 ( [BookingID],
	 [VehicleID],
	 [DepartTime],
	 [ReturnTime],
	 [BookingFor],
	 [BookingBy],
--	 [BookingType],
	 [Destination],
--	 [DeletedInd],
	[DateCreated]
) 
 
VALUES 
	( @BookingID_1,
	 @VehicleID_2,
	 @DepartTime_3,
	 @ReturnTime_4,
	 @BookingFor_5,
	 @BookingBy_6,
--	 @BookingType_7,
	 @Destination_8,
--	 @DeletedInd_9,
	getdate()
)

COMMIT TRANSACTION

--Now increment the booking count in the vehicles table
Update tblVehicle
set BookingCount = isnull(BookingCount, 0) + 1
where VehicleID = @VehicleID_2