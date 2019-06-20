﻿CREATE PROCEDURE [spVehicle_update]
	(@VehicleID_1 	[int],
	 @VehicleID_2 	[int],
	 @ParkingSpace_3 	[varchar](15),
	 @Registration_4 	[varchar](15),
	 @vehicle_model_id_5 	[int],
	 @vehicle_type_id_6 	[int],
	 @SeatingCapacity_7 	[int],
	 @BookingCount_8 	[int],
	 @Weighting_9 	[int],
	 @Colour_10 	[varchar](20),
	 @Information_11 	[varchar](255),
	 @AcquisitionDate_12 	[datetime],
	 @DisposalDate_13 	[datetime],
	 @AssignedToPersonId_14 	[int],
	 @DivisionId_15 	[smallint],
	 @key_location_id_16 	[smallint],
	 @Avail_Now_17 	[bit],
	 @Avail_Early_18 	[bit],
	 @Avail_Late_19 	[bit],
	 @Avail_Overnight_20 	[bit],
	 @Reserve_Unit_21 	[bit],
	 @Reserve_Special_Usage_22 	[bit],
	 @OrgUnitID_23 	[int],
	 @Special_Usage_Description_24 	[nvarchar](150))

AS UPDATE [dbo].[tblVehicle] 

SET  [VehicleID]	 = @VehicleID_2,
	 [ParkingSpace]	 = @ParkingSpace_3,
	 [Registration]	 = @Registration_4,
	 [vehicle_model_id]	 = @vehicle_model_id_5,
	 [vehicle_type_id]	 = @vehicle_type_id_6,
	 [SeatingCapacity]	 = @SeatingCapacity_7,
	 [BookingCount]	 = @BookingCount_8,
	 [Weighting]	 = @Weighting_9,
	 [Colour]	 = @Colour_10,
	 [Information]	 = @Information_11,
	 [AcquisitionDate]	 = @AcquisitionDate_12,
	 [DisposalDate]	 = @DisposalDate_13,
	 [AssignedToPersonId]	 = @AssignedToPersonId_14,
	 [DivisionId]	 = @DivisionId_15,
	 [key_location_id]	 = @key_location_id_16,
	 [Avail_Now]	 = @Avail_Now_17,
	 [Avail_Early]	 = @Avail_Early_18,
	 [Avail_Late]	 = @Avail_Late_19,
	 [Avail_Overnight]	 = @Avail_Overnight_20,
	 [Reserve_Unit]	 = @Reserve_Unit_21,
	 [Reserve_Special_Usage]	 = @Reserve_Special_Usage_22,
	 [OrgUnitID]	 = @OrgUnitID_23,
	 [Special_Usage_Description]	 = @Special_Usage_Description_24 

WHERE 
	( [VehicleID]	 = @VehicleID_1)