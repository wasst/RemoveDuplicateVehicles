CREATE PROCEDURE dbo.spBookingDelete
@BookingID_1 integer
as
Update tblBooking Set  DeletedInd = 'Y' where BookingID = @BookingID_1