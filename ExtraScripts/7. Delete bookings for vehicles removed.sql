
DECLARE @CountBookingsVehiclesRemoved int


SELECT @CountBookingsVehiclesRemoved =

Count(*) FROM BOOKING_VEHICLESREMOVED


Print('The number of bookings to remove is ' + Convert(varchar(max), @CountBookingsVehiclesRemoved))



BEGIN TRAN
	
	DELETE FROM tblBooking WHERE BookingID IN (SELECT BookingID FROM BOOKING_VEHICLESREMOVED)

	IF @@ROWCOUNT = @CountBookingsVehiclesRemoved
	BEGIN
		PRINT('Proceed with Delete')
		COMMIT TRAN
	END
	ELSE
	BEGIN
		PRINT('DO NOT proceed with Delete')
		ROLLBACK TRAN
	END





