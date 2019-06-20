CREATE TABLE [dbo].[tblBookingArchive] (
    [BookingID]   INT            NOT NULL,
    [VehicleID]   INT            NOT NULL,
    [DepartTime]  DATETIME       NOT NULL,
    [ReturnTime]  DATETIME       NOT NULL,
    [BookingFor]  INT            NOT NULL,
    [BookingBy]   INT            NOT NULL,
    [BookingType] INT            NULL,
    [Destination] NVARCHAR (600) NOT NULL,
    [DeletedInd]  CHAR (1)       NOT NULL,
    [DateCreated] DATETIME       NULL,
    [ArchiveDate] DATETIME       NOT NULL
);

