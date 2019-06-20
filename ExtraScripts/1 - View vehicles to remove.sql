

SELECT 

t1.VehicleID 
,t1.ParkingSpace
,t1.Registration
,t1.Colour
,t1.AcquisitionDate
,t1.DisposalDate
,t2.FullName_Forward
,t4.vehicle_make_name + ' ' + t3.vehicle_model_name as MakeAndModel


from tblVehicle t1  left outer join tblPerson t2  on t1.AssignedToPersonId = t2.Employee_ID

left outer join tblVehicleModel t3 on t1.vehicle_model_id = t3.vehicle_model_id

join tblVehicleMake t4 on t3.vehicle_make_id = t4.vehicle_make_id


where vehicleId between 4000 and 5000
and DisposalDate is not null

--and t1.VehicleID not in 

--(4001, 4002, 4020, 4021, 4022, 4025, 4026, 4027, 4028, 4037, 4043, 4044, 4047, 4049, 4050, 4051, 4003)

--and t1.VehicleID not between 4404 and 4019
--and t1.VehicleID not in (4023, 4045, 4046, 4048)
--and t1.VehicleID not between 4030 and 4042
--order by DisposalDate desc
