Create procedure spDebug_DisplayAvailableVehicles @RunID int
as

/*
Used saved values in tblBookingParamgers_Debug and use this in spDisplayAvailableVehicles


*/
select * from tblBookingParameters_Debug where RunID = @RunID

declare @DepartTime DateTime
declare @ReturnTime DateTime

declare @VehicleMakeID int 
declare @VehicleModelID int 
declare @SeatingCapacity int 
declare @AvailableEarly int 
declare @AvailableLate int 
declare @AvailableOverNight int 
declare @WhereVehicleType varchar(150) 
declare @WhereVehicleAssignedTo varchar(600) 
declare @WhereKeyLocation  varchar(600) 

Declare BookingParams Cursor for
Select DepartTime, ReturnTime, VehicleMakeID, VehicleModelID, SeatingCapacity, AvailableEarly, AvailableLate
,AvailableOvernight, WhereVehicleType, WhereVehicleAssignedTo, WhereKeyLocation from tblBookingParameters_Debug where RunID = 12 


Open BookingParams

Fetch Next from BookingParams into @DepartTime, @ReturnTime, @VehicleMakeID, @VehicleModelID, @SeatingCapacity, @AvailableEarly, @AvailableLate
,@AvailableOvernight, @WhereVehicleType, @WhereVehicleAssignedTo, @WhereKeyLocation

Close BookingParams

Deallocate BookingParams	

exec spDisplayAvailableVehicles @DepartTime, @ReturnTime, @VehicleMakeID, @VehicleModelID, 
@SeatingCapacity, @AvailableEarly, @AvailableLate, @AvailableOvernight, @WhereVehicleType, @WhereVehicleAssignedTo,
@WhereKeyLocation

--exec spDisplayAvailableVehicles
	
