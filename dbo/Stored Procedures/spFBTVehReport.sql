CREATE PROCEDURE [dbo].[spFBTVehReport]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

/*
--===============================================================================================
--#~~ PROGRAM REGISTER INFORMATION
--    ============================
--#~~ PRECIS
--    ------
FBTVehReport Configuration:
-----------------------------------------------

Needs to be reconfigured each year for the holidays that occur for it.
Holiday dates can be sourced from:
http://www.workplacestandards.tas.gov.au/resources/public_holidays

Needs to be run after the 31st of april for that FBT year.


FBTvehReport Data Scope:
-----------------------------------------------

May not serve to produce accurate data if a vehicle is rarely booked because 
it is key to the designated driver's position and the booking system 
is not used to record their usage. 

Only includes records for working days of the year that it was run and does not
include unused times for weekends or public holidays.

Does not measure vehicle availability for use. For example when a vehicle
is being repaired during working hours.


FBTvehReport Components
-----------------------------------------------

Data Originates from:
vAllBookings

Views developed for the FBTvehReport:
vFBT_TtlSecsVehcleUsed
vFBT_TtlSecsVehcleUsedAggregateConvert
vFBT_TtlSecsVehcleUsedDateConvert


Related documents
-----------------------------------------------
S:\_Data\_ADMINISTRATION\SQL and Data Base Management\Scripts\VehicleBookings



--#~~ CHANGE REGISTER
--    ---------------
--#~~ Date       	Who             Ver         	AR          	REASON
--    --------------------------------------------------------------------------------------------
--#~~ |05/03/10   | HCC  		|007		|		| Initial development February March 2010
--#~~ |13/05/11   | HCC  		|007		|		| Reconfigured and run for 2011
--#~~ |04/04/12   | HCC  		|007		|		| Reconfigured and run for 2012
--#~~ |03/04/13   | HCC  		|007		|		| Reconfigured and run for 2013
--#~~ |01/04/14   | HCC  		|007		|		| Reconfigured and run for 2014
--#~~ |28/04/15   | HCC  		|007		|		| Reconfigured and run for 2015
--================================================================================================
*/

-----------------------------------------------
-- Declare variables
-----------------------------------------------

declare 

	-- Variables for #tblFbtVehicles
		
	@VehicleId char(23),

	-- Variables for cursor #tblFbtUnutilisedTime
	
	@FBTYearDepartTime DateTime,
	@FBTCalendarVehicleID int,
	@FBTCalendarSecsUsed int,
	@FBTCalendarSecsUnused int,


	@DepartTime DateTime,
	@SecsUsed int,
	@SecsUnused varchar(10),
	@Row1SecsUsed char(23),
	@Row2SecsUsed char(23),
	@Row1SecsUnused char(23),
	@Row2SecsUnused char(23),
	@Row1DepartTime char(23),
	@Row2DepartTime char(23)

	



-----------------------------------------------
-- Create temporary tables
-----------------------------------------------


-- Create the #tblFbtVehicles table
-----------------------------------

CREATE TABLE #tblFbtVehicles(
	PK_FBTVehicles int IDENTITY(1,1) NOT NULL,
	VehicleId int NULL,
 CONSTRAINT PK_tblFbVehicles PRIMARY KEY CLUSTERED 
(
	[PK_FBTVehicles] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


-- Create the #tblFbtYearCalender table
-----------------------------------

CREATE TABLE #tblFbtYearCalender(
	PK_FBTYear int IDENTITY(1,1) NOT NULL,
	Year int NULL,
	DepartTime datetime NULL,
 CONSTRAINT PK_tblFbtYearCalender PRIMARY KEY CLUSTERED 
(
	[PK_FBTYear] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


-- Create the #tblFbtUnutilisedTime table
-----------------------------------

CREATE TABLE #tblFbtUnutilisedTime(
	DepartTime datetime NULL,
	VehicleId Int NULL,
	SecsUsed Int NULL,
	SecsUnused Int NULL
	
) ON [PRIMARY]


-- Create the #tblFbtUnutilisedTimeFinal table
-----------------------------------

CREATE TABLE #tblFbtUnutilisedTimeFinal(
	DepartTime datetime NULL,
	VehicleId Int NULL,
	SecsUsed Int NULL,
	SecsUnused Int NULL
) ON [PRIMARY]


-----------------------------------------------
-- Insert data into the temporary tables with 
-----------------------------------------------

-- Insert data into #tblFbtVehicles
-----------------------------------

insert into #tblFbtVehicles(VehicleId)
select 
distinct(VehicleId)
from dbo.vFBT_TtlSecsVehcleUsedDateConvert
where DepartTime Between '2014-04-01 00:00:00.000' and '2015-03-31 00:00:00.000'
--and VehicleId = 4566


-- Insert data into #tblFbtYearCalender
-----------------------------------

-- This data will need to be updated for subsequent years
-- Fill the @FBTYearDepartTime with the date / time before the first day the calendar begins
-- Otherwise the 1st of April will not be selected
-- IE. The FBT calendar year starts on 1st of April so the @FBTYearDepartTime needs to be set to the 31st of March

set @FBTYearDepartTime = '2014-03-31 00:00:00.000'; -- 

-- Create records for all days in this year

while @FBTYearDepartTime <> '2015-04-01 00:00:00.000'
	begin
		set @FBTYearDepartTime = DATEADD(day, 1, @FBTYearDepartTime)
		insert into #tblFbtYearCalender VALUES ('2014',@FBTYearDepartTime)
	end

-----------------------------------------------
-- Instantiate the cursor CurFbtVehicles
-----------------------------------------------


declare CurFbtVehicles cursor 
for
select VehicleId from #tblFbtVehicles (nolock)
order by VehicleId

open CurFbtVehicles

fetch next from CurFbtVehicles into @VehicleId

while @@Fetch_status = 0

	begin
		-- Insert data from dbo.vFBT_TtlSecsVehcleUsedDateConvert into #tblFbtUnutilisedTime

		insert into #tblFbtUnutilisedTime(DepartTime, VehicleId, SecsUsed, SecsUnused)
		select 
		DepartTime, 
		VehicleId, 
		SecsUsed, 
	    (28800 - SecsUsed) as SecsUnused
		from vFBT_TtlSecsVehcleUsedDateConvert
		where DepartTime Between '2014-04-01 01:00:00.000' and '2015-03-31 00:00:00.000' and
		VehicleId = @VehicleId

		-- Set data constants to insert for each row to be created in #tblFbtUnutilisedTime

		set @FBTCalendarSecsUnused = 28800
		set @FBTCalendarSecsUsed = NULL
		set @FBTCalendarVehicleID = @VehicleID

		-- insert data set from #tblFbtYearCalender into #tblFbtUnutilisedTime

		insert into #tblFbtUnutilisedTime (DepartTime, VehicleId, SecsUsed, SecsUnused)
		select 
		DepartTime, 
		@FBTCalendarVehicleID as VehicleId, 
		@FBTCalendarSecsUsed as SecsUsed,
	    @FBTCalendarSecsUnused as SecsUnused
		from #tblFbtYearCalender



		insert into #tblFbtUnutilisedTimeFinal
		select * from #tblFbtUnutilisedTime
		where VehicleId = @VehicleId


		while @@trancount > 0 commit tran


		delete from #tblFbtUnutilisedTime 
		while @@trancount > 0 commit tran

		-- Deletions of duplicate records from FBTYearCalendar
		-----------------------------------

		delete from #tblFbtUnutilisedTimeFinal
		where isnull(secsused,0) = 0
		and VehicleId = @VehicleId
		and departtime in (select b.departtime from  #tblFbtUnutilisedTimeFinal b
						where b.departtime = departtime
						and  isnull(b.secsused, 0) <> 0 
						and b.VehicleId = @VehicleId)


		fetch next from CurFbtVehicles into @VehicleId
	
	end 

close CurFbtVehicles
deallocate CurFbtVehicles

-----------------------------------------------
-- Delete holiday data in #tblFbtUnutilisedTimeFinal
-----------------------------------------------

-- This must be updated each year for holidays

while @@trancount > 0 commit tran
begin tran

delete from #tblFbtUnutilisedTimeFinal
where

-- Delete for Easter - Remember the dates could be both in the first and the second year!! (Good Friday to following Wednesday):

DepartTime between '2014-04-18 00:00:00.000' and '2014-04-23 00:00:00.000'

or

-- Delete for Easter Current Year - Only if Easter starts before April 1st or part thereof!! (Good Friday to following Wednesday):

-- DepartTime between '2013-03-29 00:00:00.000' and '2013-04-01 00:00:00.000'

-- or

-- Delete for Anzac day (If Anzac day falls on a weekday!), Queens Birthday, Show Day, Cup/Regatta Day, Eight Hour Day:

DepartTime in ('2014-04-25 00:00:00.000','2014-06-09 00:00:00.000','2014-10-23 00:00:00.000','2015-02-09 00:00:00.000','2015-03-09 00:00:00.000')

or

-- Delete for Xmas Day, Boxing Day, New Years, Aust Day (For Aust Day check day numbers re holidays - eg in 2014 Australia Day holiday was on 27th of January!)

DatePart(dy, DepartTime) in (359,360,1,26)

or

-- Delete for Weekends

DatePart(dw, DepartTime) in (7,1)

commit tran
while @@trancount > 0 commit tran

-----------------------------------------------
-- Format for copy to XL
-----------------------------------------------

alter table #tblFbtUnutilisedTimeFinal
drop column SecsUsed
while @@trancount > 0 commit tran

alter table #tblFbtUnutilisedTimeFinal
add UnusedHours int
while @@trancount > 0 commit tran

alter table #tblFbtUnutilisedTimeFinal
add UnusedMinutes int
while @@trancount > 0 commit tran

update #tblFbtUnutilisedTimeFinal
set UnusedHours = CASE 
					 WHEN (SecsUnused / 3600) < 10 THEN '0' + CONVERT(VARCHAR(10), SecsUnused / 3600) ELSE '' + ':'
				  END 

update #tblFbtUnutilisedTimeFinal
set UnusedMinutes = CASE 
						WHEN ((SecsUnused % 3600) / 60) < 10 THEN '0' + CONVERT(VARCHAR(10), (SecsUnused % 3600) / 60) ELSE + CONVERT(VARCHAR(10), (SecsUnused % 3600) / 60) 
					END 

alter table #tblFbtUnutilisedTimeFinal
add UnusedTime varchar(5)

update #tblFbtUnutilisedTimeFinal
set UnusedTime = CONVERT(VARCHAR(5),UnusedHours) + ':' + CONVERT(VARCHAR(5),UnusedMinutes)

alter table #tblFbtUnutilisedTimeFinal
drop column UnusedHours

alter table #tblFbtUnutilisedTimeFinal
drop column UnusedMinutes

-----------------------------------------------
-- Data from tables
-----------------------------------------------

select * from #tblFbtVehicles
select * from #tblFbtYearCalender
select * from #tblFbtUnutilisedTime
select * from #tblFbtUnutilisedTimeFinal

-----------------------------------------------
-- Total Hours For Year
-----------------------------------------------

--select VehicleId, round(sum(SecsUnused / 3600),0) as TtlHrsUnusedThisYr
select VehicleId, round((sum(secsUnused))/ 3600, 0) as TtlHrsUnusedThisYr

from #tblFbtUnutilisedTimeFinal
group by VehicleId
order by TtlHrsUnusedThisYr

-----------------------------------------------
-- Count of Rows
-----------------------------------------------

select  VehicleId, Count(VehicleId) as TotalRcds
from #tblFbtUnutilisedTimeFinal
group by VehicleId
order by TotalRcds


drop table #tblFbtUnutilisedTime
drop table #tblFbtYearCalender
drop table #tblFbtVehicles
drop table #tblFbtUnutilisedTimeFinal

while @@trancount > 0 commit tran


END
