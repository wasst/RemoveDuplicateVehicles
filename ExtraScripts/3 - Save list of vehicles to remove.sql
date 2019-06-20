TRUNCATE TABLE VEHICLESREMOVED

GO

INSERT INTO VEHICLESREMOVED
(VEHICLEID)


SELECT 

VehicleID 


from tblVehicle 
where vehicleId between 4000 and 5000
and DisposalDate is not null

--and VehicleID not in 

--(4001, 4002, 4020, 4021, 4022, 4025, 4026, 4027, 4028, 4037, 4043, 4044, 4047, 4049, 4050, 4051, 4003)

--and VehicleID not between 4404 and 4019
--and VehicleID not in (4023, 4045, 4046, 4048)
--and VehicleID not between 4030 and 4042
--order by DisposalDate desc


GO

SELECT * FROM VEHICLESREMOVED