CREATE PROCEDURE spPrevBooking  

 @BookingID  Integer
,@PrevBookingID Integer = 0 output

AS
DECLARE @VehicleID Integer
DECLARE @ReturnTime DateTime

Set  @VehicleID=  (Select VehicleID from tblBooking where BookingID =   @BookingID)
Set @ReturnTIme  = (Select ReturnTime from tblBooking where BookingID = @BookingID)


Set @PrevBookingID = 
(Select Max( BookingID) from tblBooking where vehicleID = @VehicleID and ReturnTime =
	(Select Max(ReturnTime) from tblBooking where VehicleID = @VehicleID and ReturnTime < @ReturnTime))


IF @PrevBookingID IS NOT NULL
BEGIN
SELECT * FROM tblBooking where BookingID = @PrevBookingID
END
ELSE
BEGIN
	Set @PrevBookingID = 0
END