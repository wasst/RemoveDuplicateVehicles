CREATE TABLE [dbo].[tblBookingCount] (
    [WeekStart]    DATETIME NOT NULL,
    [BookingCount] INT      NULL,
    CONSTRAINT [PK_tblBookingCount] PRIMARY KEY CLUSTERED ([WeekStart] ASC)
);

