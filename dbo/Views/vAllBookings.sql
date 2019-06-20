
CREATE VIEW vAllBookings
as
SELECT [BookingID]
      ,[VehicleID]
      ,[DepartTime]
      ,[ReturnTime]
      ,[BookingFor]
      ,[BookingBy]
      ,[BookingType]
      ,[Destination]
      ,[DeletedInd]
      ,[DateCreated]
  FROM [vehiclebookings].[dbo].[tblBooking]
WHERE DeletedInd = 'N'
UNION

SELECT [BookingID]
      ,[VehicleID]
      ,[DepartTime]
      ,[ReturnTime]
      ,[BookingFor]
      ,[BookingBy]
      ,[BookingType]
      ,[Destination]
      ,[DeletedInd]
      ,[DateCreated]
  FROM [vehiclebookings].[dbo].[tblBookingArchive]
WHERE DeletedInd = 'N'
