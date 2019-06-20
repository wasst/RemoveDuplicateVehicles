CREATE TABLE [dbo].[tblBooking_Audit] (
    [BookingID]    INT            NOT NULL,
    [Audit_Count]  INT            IDENTITY (1, 1) NOT NULL,
    [VehicleID]    INT            NOT NULL,
    [DepartTime]   SMALLDATETIME  NOT NULL,
    [ReturnTime]   SMALLDATETIME  NOT NULL,
    [BookingFor]   INT            NOT NULL,
    [BookingBy]    INT            NOT NULL,
    [BookingType]  INT            NULL,
    [Destination]  NVARCHAR (150) NOT NULL,
    [DeletedInd]   CHAR (1)       NOT NULL,
    [DateModified] DATETIME       NULL,
    [ModifiedBy]   NVARCHAR (50)  NULL
);

