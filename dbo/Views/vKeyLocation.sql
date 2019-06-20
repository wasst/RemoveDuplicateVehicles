CREATE VIEW dbo.vKeyLocation
AS
SELECT     TOP 100 PERCENT KeyLocationID, Description, Directions
FROM         dbo.tblKeyLocation
ORDER BY Description
