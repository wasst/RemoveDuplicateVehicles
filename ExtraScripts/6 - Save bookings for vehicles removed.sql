
TRUNCATE TABLE BOOKING_VEHICLESREMOVED


INSERT INTO BOOKING_VEHICLESREMOVED (
    [BookingID]  
    ,[VehicleID] 
    ,[DepartTime] 
    ,[ReturnTime] 
    ,[BookingFor]  
    ,[BookingBy]   
    ,[BookingType] 
    ,[Destination]
    ,[DeletedInd] 
    ,[DateCreated] 
	)

	SELECT 
	 [BookingID]  
    ,[VehicleID] 
    ,[DepartTime] 
    ,[ReturnTime] 
    ,[BookingFor]  
    ,[BookingBy]   
    ,[BookingType] 
    ,[Destination]
    ,[DeletedInd] 
    ,[DateCreated] 

	FROM tblBooking

	WHERE VehicleId IN

	(SELECT VehicleID FROM VehiclesRemoved)

	GO

	SELECT * FROM BOOKING_VEHICLESREMOVED ORDER BY VehicleId, DateCreated DESC