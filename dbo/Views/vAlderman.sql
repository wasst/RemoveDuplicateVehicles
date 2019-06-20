CREATE VIEW dbo.vAlderman
AS
SELECT     TOP 100 PERCENT LastName + ', ' + FirstName AS FullName, dbo.tblAlderman.*
FROM         dbo.tblAlderman
ORDER BY SortOrder
