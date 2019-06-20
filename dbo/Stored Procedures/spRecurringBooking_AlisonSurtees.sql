 
--exec spRecurringBooking

CREATE PROCEDURE [dbo].[spRecurringBooking_AlisonSurtees]
AS

--Recurring bookings
Declare @StartDate datetime
Declare @EndDate datetime

Declare @BookingStart datetime
declare @BookingEnd datetime
declare @VehicleID int

set @VehicleId = 4422  --Geoff Lang's car

declare @BookingFor int

set @BookingFor = 90193 --Geoff Lang

declare @SQLText nvarchar(max)


declare @DateLoop datetime


declare @BookingStartTime datetime
Declare @BookingEndTime datetime




set @StartDate = '3-Feb-2016'
Set @EndDate = '28-Dec-2016'
set @BookingStart = '8:00 AM'
Set @BookingEnd   = '5:00 PM'



set nocount on

set @DateLoop = @StartDate

WHILE  @DateLoop < @EndDate
BEGIN
	
	Set @DateLoop = dateadd(day, 1, @DateLoop)
	print @DateLoop
	if datepart(weekday, @DateLoop) in (4) --(2, 4, 6)  --Recurring bookings on Wed //Mon, Wed, Fri  (Weekdays start on Sun = 1)
	BEGIN
		set @BookingStartTime = @DateLoop + @BookingStart
		set @BookingEndTime = @DateLoop + @BookingEnd
	
		
			SET @SQLText = ' DECLARE @VehicleID int ';
			SET @SQLText = @SQLText + ' DECLARE @MaxBookingId int ';

			SET @SQLText = @SQLText + ' Set @VehicleId = ' + convert(nvarchar(5), @VehicleId)

			SET @SQLText = @SQLText + ' DECLARE @BookingStartTime DateTime ';
			SET @SQLText = @SQLText + ' SET @BookingStartTime = ''' + convert(varchar(100), @BookingStartTime) + ''''

			SET @SQLText = @SQLText + ' DECLARE @BookingEndTime DateTime ';
			SET @SQLText = @SQLText + ' SET @BookingEndTime = ''' + convert(varchar(100), @BookingEndTime) + ''''

			SET @SQLTExt = @SQLText + ' DECLARE @BookingFor int ';
			SET @SQLText = @SQLText + ' Set @BookingFor = ' + convert(nvarchar(5), @BookingFor)

			SET @SQLText = @SQLText + ' DECLARE @Destination nvarchar(150) ';
			SET @SQLText = @SQLText + ' SET @Destination = ''Vehicle 4422 not available for bookings on Wednesdays! ''';
			

			SET @SQLTEXT = @SQLText + ' SELECT @MaxBookingId =  Max(BookingId) + 1 from tblBooking ';
			
			Set @SQLText = @SQLText + ' Insert into tblBooking (BookingId, VehicleID, DepartTime, ReturnTime, BookingFor, BookingBy, Destination, DateCreated)
						Values (@MaxBookingId, @VehicleID, @BookingStartTime, @BookingEndTime, @BookingFor, @BookingFor, @Destination, getdate())'
			
			print @SQLText
			select @SQLText
			exec (@SQLText)
		
	END
		

END

--94046






