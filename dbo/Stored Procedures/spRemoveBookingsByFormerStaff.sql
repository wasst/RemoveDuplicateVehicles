
CREATE procedure [dbo].[spRemoveBookingsByFormerStaff]
as

--Routine to identify future bookings that are by people 
--that no longer work here and set them to Deleted status.

Update VehicleBookings.dbo.tblBooking
Set DeletedInd = 'Y'
where
bookingId in 
(
select BookingId from VehicleBookings.dbo.tblBooking
where departtime >= getdate()
and BookingBy not in
	(
	select Employee_ID from 
	VehicleBookings.dbo.tblPerson
	)
)