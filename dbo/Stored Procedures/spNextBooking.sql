CREATE PROCEDURE spNextBooking  

 @BookingID  Integer
,@NextBookingID Integer = 0 output

AS
DECLARE @VehicleID Integer
DECLARE @DepartTime DateTime

Set @VehicleID =  (Select VehicleID from tblBooking where BookingID =   @BookingID)
Set @DepartTime = (Select DepartTime from tblBooking where BookingID = @BookingID)

Set @NextBookingID = (Select Min(BookingID) from tblBooking where VehicleID = @VehicleID and DepartTime = 
	(Select MIN(DepartTime) from tblBooking where VehicleID = @VehicleID and DepartTime > @DepartTime))

IF @NextBookingID IS NOT NULL
BEGIN
SELECT * FROM tblBooking where BookingID = @NextBookingID
END
ELSE
BEGIN
	Set @NextBookingID = 0
END