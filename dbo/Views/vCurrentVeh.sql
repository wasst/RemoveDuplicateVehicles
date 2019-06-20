create view [vCurrentVeh]
as 
select VehicleId, ParkingSpace, Registration, m.vehicle_make_name, vm.vehicle_model_Name  
, V.colour, v.AcquisitionDate
,isnull(P.FullName_Forward, 'Pool') as VehicleAssignedTo

from tblVehicle V join tblVehicleModel VM on v.vehicle_model_id = VM.vehicle_Model_id 
join tblVehicleMake M on VM.vehicle_make_id = m.vehicle_make_id
left outer join tblPerson P on V.AssignedToPersonId = P.Employee_ID
where disposaldate is null
