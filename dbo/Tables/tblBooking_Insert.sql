CREATE TABLE [dbo].[tblBooking_Insert] (
    [BookingID]   INT            NULL,
    [VehicleID]   INT            NOT NULL,
    [DepartTime]  DATETIME       NOT NULL,
    [ReturnTime]  DATETIME       NOT NULL,
    [BookingFor]  INT            NOT NULL,
    [BookingBy]   INT            NOT NULL,
    [BookingType] INT            NULL,
    [Destination] NVARCHAR (600) NOT NULL,
    [DeletedInd]  CHAR (1)       NOT NULL,
    [DateCreated] DATETIME       NULL,
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_tblBooking_Insert] PRIMARY KEY CLUSTERED ([ID] ASC)
);

