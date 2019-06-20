CREATE TABLE [dbo].[tblVehicle] (
    [VehicleID]                 INT            NOT NULL,
    [ParkingSpace]              VARCHAR (15)   NOT NULL,
    [Registration]              VARCHAR (15)   NOT NULL,
    [vehicle_model_id]          INT            NOT NULL,
    [vehicle_type_id]           INT            NOT NULL,
    [SeatingCapacity]           INT            NOT NULL,
    [BookingCount]              INT            NOT NULL,
    [Weighting]                 INT            NOT NULL,
    [Colour]                    VARCHAR (20)   NOT NULL,
    [Information]               VARCHAR (500)  NULL,
    [AcquisitionDate]           DATETIME       NOT NULL,
    [DisposalDate]              DATETIME       NULL,
    [AssignedToPersonId]        INT            NULL,
    [DivisionId]                SMALLINT       NOT NULL,
    [key_location_id]           INT            NULL,
    [Avail_Now]                 BIT            CONSTRAINT [DF_tblVehicle_Avail_Now] DEFAULT ((0)) NOT NULL,
    [Avail_Early]               BIT            CONSTRAINT [DF_tblVehicle_Avail_Early] DEFAULT ((0)) NOT NULL,
    [Avail_Late]                BIT            CONSTRAINT [DF_tblVehicle_Avail_Late] DEFAULT ((0)) NOT NULL,
    [Avail_Overnight]           BIT            CONSTRAINT [DF_tblVehicle_Avail_Overnight] DEFAULT ((0)) NOT NULL,
    [Reserve_Unit]              BIT            NOT NULL,
    [Reserve_Special_Usage]     BIT            CONSTRAINT [DF_tblVehicle_Reserve_Special_Usage] DEFAULT ((0)) NOT NULL,
    [OrgUnitID]                 INT            NULL,
    [Special_Usage_Description] NVARCHAR (150) NULL,
    CONSTRAINT [PK_tblVehicle] PRIMARY KEY CLUSTERED ([VehicleID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblVehicle_tblKeyLocation] FOREIGN KEY ([key_location_id]) REFERENCES [dbo].[tblKeyLocation] ([KeyLocationID]),
    CONSTRAINT [FK_tblVehicle_tblVehicleType] FOREIGN KEY ([vehicle_type_id]) REFERENCES [dbo].[tblVehicleType] ([VehicleTypeID]),
    CONSTRAINT [FK_tblVehicle_vehicle_model] FOREIGN KEY ([vehicle_model_id]) REFERENCES [dbo].[tblVehicleModel] ([vehicle_model_id])
);


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER trigNewVehicleNotification 
   ON tblVehicle
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
    declare @VehicleId int
    select @VehicleId = VehicleId from INSERTED
    declare @msgBody varchar(max)
    
    set @msgBody = 'Hi,' + + '<br />' 
    + 'This email is to notify you that a new vehicle has just been added to the HCC car pool '
    + '<br />' 
    + 'Details may be <a href="http://test2008/HCCVehiclesMVC/Veh/Details/' + convert(varchar(15), @VehicleId) 
    + '" title="view new vehicle details">viewed here </a>';
    
   
    
    exec msdb.dbo.sp_send_dbmail 
         @profile_name='SQL'
         ,@recipients='rodwellp@hobartcity.com.au'
		,@body = @msgBody
		,@body_format = 'HTML'
		,@subject = 'Notification of new vehicle added to system'
		
    

END
