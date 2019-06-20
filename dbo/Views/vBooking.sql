CREATE VIEW dbo.vBooking
AS
SELECT     TOP 100 PERCENT CONVERT(char(6), dbo.tblBooking.VehicleID) + dbo.tblPerson.FullName_Forward + ' ' + CONVERT(varchar(6), 
                      dbo.tblBooking.BookingID) AS DisplayField, dbo.tblBooking.*
FROM         dbo.tblBooking INNER JOIN
                      dbo.tblPerson ON dbo.tblBooking.BookingFor = dbo.tblPerson.Employee_ID
ORDER BY dbo.tblBooking.DateCreated DESC
