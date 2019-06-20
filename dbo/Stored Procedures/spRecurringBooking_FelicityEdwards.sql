 
--exec spRecurringBooking_FelicityEdwards

CREATE procedure [dbo].[spRecurringBooking_FelicityEdwards]
as

--Recurring bookings
Declare @StartDate datetime
Declare @EndDate datetime

Declare @BookingStart datetime
declare @BookingEnd datetime
declare @VehicleID int

set @VehicleId = 5021

declare @BookingFor int

set @BookingFor =  52407 --Felicity Edwards

declare @SQLText nvarchar(max)


declare @DateLoop datetime


declare @BookingStartTime datetime
Declare @BookingEndTime datetime




set @StartDate = '23-Aug-2017'
Set @EndDate = '30-Dec-2018'
set @BookingStart = '2:00 PM'
Set @BookingEnd   = '5:00 PM'



set nocount on

set @DateLoop = @StartDate

WHILE  @DateLoop < @EndDate
BEGIN
	
	Set @DateLoop = dateadd(day, 1, @DateLoop)
	print @DateLoop
	if datepart(weekday, @DateLoop) in (3) --  Sun = 1, Mon = 2, Tue = 3-   (2, 4, 6)  --Recurring bookings on Wed //Mon, Wed, Fri  (Weekdays start on Sun = 1)
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
			SET @SQLText = @SQLText + ' SET @Destination = ''Vehicle 5021 not avail on Tues afternnon.'' ';
			

			SET @SQLTEXT = @SQLText + ' SELECT @MaxBookingId =  Max(BookingId) + 1 from tblBooking ';
			
			Set @SQLText = @SQLText + ' Insert into tblBooking (BookingId, VehicleID, DepartTime, ReturnTime, BookingFor, BookingBy, Destination, DateCreated)
						Values (@MaxBookingId, @VehicleID, @BookingStartTime, @BookingEndTime, @BookingFor, @BookingFor, @Destination, getdate())'
			
			print @SQLText
			select @SQLText
			exec (@SQLText)
		
	END
		

END

--94046






