CREATE VIEW dbo.vRptAlderman
AS
SELECT     TOP 100 PERCENT Title, LastName + ', ' + FirstName AS Name, StreetAddress, Suburb, PhWork1 AS Phone, PhHome AS [Home Phone], 
                      Email1 AS Email, FaxWork AS WorkFax, FaxHome AS HomeFax, SortOrder, KeepPrivate AS IsPrivate
FROM         dbo.tblAlderman
ORDER BY SortOrder
