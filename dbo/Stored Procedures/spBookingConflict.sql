
CREATE PROCEDURE spBookingConflict


 @VehicleID Integer
,@DepartTime DateTime
,@ReturnTime DateTime
,@BookingID Integer = 0



--If checking for conflicts for an existing bookng, need to pass the bookingID

/*
	This stored procedure returns a list of all booking conflicts
	Used after viewing all available vehicles and 
*/

AS

SELECT * FROM tblBooking
WHERE VehicleID = @VehicleID

AND
(
(
	(DepartTime > @DepartTime and DepartTime <  @ReturnTime)
)
OR
(
	(ReturnTime > @DepartTime and ReturnTime < @ReturnTime)
)
OR
(
	(@DepartTime > DepartTime and @DepartTime < ReturnTime)
)



)
AND BookingID <> @BookingID
--Put this back - this is just commented out when developing
AND DeletedInd <> 'Y' --booking has not been deleted-  

RETURN @@Rowcount