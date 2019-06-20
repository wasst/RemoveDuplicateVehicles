CREATE PROCEDURE 

/*
	Look for a conflicting booking.
	Use this when making a booking, or modifying a booking.
	Returns zero if there is no booking conflict
	Returns the  booking ID of the conflicting booking.

*/
pBookingConflict  
	@BookingID int output
	,@VehicleID   integer
	,@DepartTime DateTime
	,@ReturnTime DateTime




 AS

Set @BookingID =
(
Select ISNULL(MIN(BookingID), 0) as BookingConflict  FROM tblBooking
WHERE 
(
@DepartTime Between DepartTime and ReturnTime
OR
@ReturnTime BETWEEN DepartTime and ReturnTime
OR
DepartTime Between @DepartTime and @ReturnTime
)
and VehicleID = @VehicleID
)

--and tblVehicle.DisposalDate is Null
--and tblVehicle.Avail_Now = 1