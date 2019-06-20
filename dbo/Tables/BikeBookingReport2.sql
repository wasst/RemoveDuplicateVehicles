CREATE TABLE [dbo].[BikeBookingReport2] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [BookingID]   INT            NOT NULL,
    [DepartTime]  DATETIME       NOT NULL,
    [ReturnTime]  DATETIME       NOT NULL,
    [Destination] NVARCHAR (600) NOT NULL,
    [BookingFor]  VARCHAR (101)  NULL,
    [BookingBy]   VARCHAR (101)  NULL,
    CONSTRAINT [PK_BikeBookingReport2] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [IX_BikeBookingReport2] UNIQUE CLUSTERED ([BookingID] ASC)
);

