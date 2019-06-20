USE [vehiclebookings_TEST]
GO

IF EXISTS (
SELECT * FROM SYS.objects WHERE NAME = 'BOOKING_VEHICLESREMOVED' AND TYPE_DESC = 'USER_TABLE')

BEGIN
	DROP TABLE BOOKING_VEHICLESREMOVED
	PRINT('TABLE BOOKING_VEHICLESREMOVED FOUND EXISTING AND SO DROPPED')
END


/****** Object: Table [dbo].[tblBooking] Script Date: 6/19/2019 3:03:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE BOOKING_VEHICLESREMOVED (
    [BookingID]   INT            NOT NULL,
    [VehicleID]   INT            NOT NULL,
    [DepartTime]  DATETIME       NOT NULL,
    [ReturnTime]  DATETIME       NOT NULL,
    [BookingFor]  INT            NOT NULL,
    [BookingBy]   INT            NOT NULL,
    [BookingType] INT            NULL,
    [Destination] NVARCHAR (600) NOT NULL,
    [DeletedInd]  CHAR (1)       NOT NULL,
    [DateCreated] DATETIME       NULL
);


