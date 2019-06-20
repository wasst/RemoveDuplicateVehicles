CREATE TABLE [dbo].[Bookings] (
    [BookingID]        INT           IDENTITY (1, 1) NOT NULL,
    [EmployeeID]       INT           NOT NULL,
    [VehicleID]        INT           NOT NULL,
    [DepartTime]       DATETIME      NOT NULL,
    [ReturnTime]       DATETIME      NOT NULL,
    [Destination]      VARCHAR (255) NULL,
    [DeletedInd]       CHAR (1)      NULL,
    [BookedByPersonId] INT           NOT NULL
);

