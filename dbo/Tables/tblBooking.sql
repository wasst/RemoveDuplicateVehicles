CREATE TABLE [dbo].[tblBooking] (
    [BookingID]   INT            NOT NULL,
    [VehicleID]   INT            NOT NULL,
    [DepartTime]  DATETIME       NOT NULL,
    [ReturnTime]  DATETIME       NOT NULL,
    [BookingFor]  INT            NOT NULL,
    [BookingBy]   INT            NOT NULL,
    [BookingType] INT            NULL,
    [Destination] NVARCHAR (600) NOT NULL,
    [DeletedInd]  CHAR (1)       CONSTRAINT [DF_tblBooking_DeletedInd] DEFAULT ('N') NOT NULL,
    [DateCreated] DATETIME       NULL,
    CONSTRAINT [PK_tblBooking] PRIMARY KEY NONCLUSTERED ([BookingID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblBooking_tblVehicle] FOREIGN KEY ([VehicleID]) REFERENCES [dbo].[tblVehicle] ([VehicleID])
);


GO
CREATE CLUSTERED INDEX [IX_tblBooking]
    ON [dbo].[tblBooking]([BookingID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [AK_tblBookingDepartReturnTime]
    ON [dbo].[tblBooking]([DeletedInd] ASC, [DepartTime] ASC, [ReturnTime] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tblBooking_1]
    ON [dbo].[tblBooking]([VehicleID] ASC) WITH (FILLFACTOR = 90);


GO

CREATE TRIGGER [dbo].[BookingAudit] ON [dbo].[tblBooking] 
FOR  UPDATE, INSERT
AS
Insert into tblBooking_Audit
(BookingID, VehicleID, DepartTime, ReturnTIme, BookingFor, BookingBy,
BookingType, Destination, DeletedInd, DateModified, ModifiedBy )

Select
BookingID, VehicleID, DepartTime, ReturnTIme, BookingFor, BookingBy,
BookingType, Destination, DeletedInd,  getDate(), SYSTEM_USER
from Inserted

