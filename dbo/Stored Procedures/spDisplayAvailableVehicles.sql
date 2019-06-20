
CREATE procedure spDisplayAvailableVehicles 
 @DepartTime DateTime
,@ReturnTime DateTime

--,@VehicleTypeID Int = 0
,@VehicleMakeID int = 0
,@VehicleModelID int = 0
,@SeatingCapacity int = 0
,@AvailableEarly int = 0
,@AvailableLate int = 0
,@AvailableOverNight int = 0
,@WhereVehicleType varchar(150) = ''
,@WhereVehicleAssignedTo varchar(600) = ''
,@WhereKeyLocation  varchar(600) = ''
AS

------------------------------------------------
/*
Insert into tblBookingParameters_Debug values (@DepartTime, @ReturnTime, @VehicleMakeID, @VehicleModelID, @SeatingCapacity, @AvailableEarly,
	@AvailableLate, @AvailableOvernight, @WhereVehicleType, @WhereVehicleAssignedTo, @WhereKeyLocation )

*/


--Create temporary table to store results.

DECLARE @SQLString varchar(600)
	
CREATE TABLE #TempAvailVehicle (
	
	[VehicleID] [int] NOT NULL ,
	[ParkingSpace] [varchar] (15)  ,
	[Registration] [varchar] (15)  ,
	[vehicle_model_id] [int] NOT NULL ,
	[vehicle_type_id] [int] NOT NULL ,
	[SeatingCapacity] [int] NOT NULL ,
	[BookingCount] [int] NOT NULL ,
	[Weighting] [int] NOT NULL ,
	[Colour] [varchar] (20)  ,
	[Information] [varchar] (255)  ,
	[AcquisitionDate] [datetime] NOT NULL ,
	[DisposalDate] [datetime] NULL ,
	[AssignedToPersonId] [int]  NULL ,
	[DivisionId] [smallint] NOT NULL ,
	[key_location_id] [smallint] NULL ,
	[Avail_Now] [bit] NOT NULL ,
	[Avail_Early] [bit] NOT NULL ,
	[Avail_Late] [bit] NOT NULL ,
	[Avail_Overnight] [bit] NULL ,
	[Reserve_Unit] [bit] NOT NULL ,
	[Reserve_Special_Usage] [bit] NOT NULL ,
	[OrgUnitID] [int] NULL,
	[Special_Usage_Description] nvarchar(150) NULL
)





---------------------------------------------------

Insert into #TempAvailVehicle



SELECT * 

FROM 
tblVehicle


WHERE VehicleID NOT IN
(
--List of Unavaliable Vehicles because they have bookings for them
	Select VehicleID FROM tblBooking
	WHERE 
	DeletedInd = 'N' AND
	(
		(@DepartTime > DepartTime and @DepartTime <  ReturnTime)
	OR
		(@ReturnTime  >= DepartTime and @ReturnTime <=  ReturnTime)
	OR
		--(DepartTime < @DepartTime and DepartTime > @ReturnTime)
	               (DepartTime > @DepartTime and DepartTime < @ReturnTime)
	
	OR (@DepartTime = DepartTime)
	OR (@ReturnTime = ReturnTime)

	)

)
and (tblVehicle.DisposalDate is null or tblVehicle.DisposalDate >= @ReturnTime)
and tblVehicle.Avail_Now = 1

/*
IF @VehicleTypeID > 0 
BEGIN
	DELETE FROM #TempAvailVehicle where Vehicle_type_ID <> @VehicleTypeID	
END
*/


IF @VehicleMakeID > 0
BEGIN
	DELETE FROM #TempAvailVehicle where Vehicle_model_ID not in (Select vehicle_model_id from vVehiclemodel where vehicle_make_id = @VehicleMakeID)
END


IF @VehicleModelID > 0 
BEGIN
	DELETE FROM #TempAvailVehicle where Vehicle_Model_ID <> @VehicleModelID
END

IF @SeatingCapacity > 0 
BEGIN
	DELETE FROM #TempAvailVehicle where SeatingCapacity < @SeatingCapacity
END


/*
	Notes on vehicle availability
	Vehicle availability should be one of
	
A	None
B	Avail Early
C	Avail Late
D	Avail Early and Avail Late
E	Avail overnight

*/

IF @AvailableLate = 1 
BEGIN
	DELETE FROM #TempAvailVehicle WHERE Avail_Late = 0 and Avail_Overnight = 0
END;

IF @AvailableEarly = 1 
BEGIN
	DELETE FROM #TempAvailVehicle WHERE Avail_Early= 0 and Avail_Overnight = 0
END;


IF @AvailableOvernight = 1
BEGIN
	DELETE FROM #TempAvailVehicle where Avail_Overnight = 0
END 







IF @WhereVehicleType <> ''
BEGIN
	
	Set @SQLString = 'Delete from #TempAvailVehicle where vehicle_type_ID not ' + @WhereVehicleType
	exec (@SQLString)



END


IF @WhereVehicleAssignedTo <> ''
BEGIN
	Set @SQLString = 'Delete from #TempAvailVehicle where AssignedToPersonID  not ' + @WhereVehicleAssignedTo
	exec (@SQLString)

	--Now also delete vehicles that are not assigned to anybody
	Set @SQLString = 'DELETE FROM #TempAvailVehicle WHERE AssignedToPersonID IS NULL'
   	exec (@SQLString)
	
END;

IF @WhereKeyLocation <> ''
BEGIN
	Set @SQLString = 'Delete from #TempAvailVehicle where Key_Location_ID  not ' + @WhereKeyLocation
	exec (@SQLString)
END




--Select * from #TempAvailVehicle join tblVehicle on #TempAvailVehicle.vehicle_type_id = tblVehicle.vehTypeID
--select * from #TempAvailVehicle  t1 join tblVehicleType  t2 on t1.vehicle_type_id = t2.vehtypeid
 Select t1.*  from vVehicle  t1 join #TempAvailVehicle t2 on t1.VehicleID = t2.VehicleID ORDER BY (t1.Weighting + t1.BookingCount) asc