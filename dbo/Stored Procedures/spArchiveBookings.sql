--Scripts to archive vehicle bookings
--Created 26 Oct 2004 


CREATE Procedure spArchiveBookings AS

DECLARE @ins_error INTEGER
DECLARE @del_error INTEGER
DECLARE @ins_count INTEGER
DECLARE @del_count INTEGER

BEGIN TRAN

INSERT INTO tblBookingArchive
	SELECT *, getdate() as ArchiveDate from tblBooking with (nolock) where DateDiff(Month, ReturnTime, getdate()) > 1

SET @ins_error = @@ERROR
SET @ins_count = @@ROWCOUNT

DELETE FROM tblBooking  WHERE DateDiff(Month, ReturnTime, getdate()) > 1
SET @del_error = @@ERROR
SET @del_count = @@ROWCOUNT


IF (@ins_error =  0) AND (@del_error = 0)  AND (@ins_count = @del_count)
BEGIN
	COMMIT TRANSACTION
	RETURN 0
END
ELSE
BEGIN
	ROLLBACK TRANSACTION
	RAISERROR('Scheduled task ''Archive Bookings'' task failed', 16, 1)
END