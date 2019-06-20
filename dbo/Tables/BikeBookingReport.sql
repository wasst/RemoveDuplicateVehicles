CREATE TABLE [dbo].[BikeBookingReport] (
    [BookingID]   INT            NOT NULL,
    [DepartTime]  DATETIME       NOT NULL,
    [ReturnTime]  DATETIME       NOT NULL,
    [Destination] NVARCHAR (600) NOT NULL,
    [BookingFor]  VARCHAR (101)  NULL,
    [BookingBy]   VARCHAR (101)  NULL
);

