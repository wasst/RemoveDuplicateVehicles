CREATE VIEW dbo.vRole
AS
SELECT     TOP 100 PERCENT RoleID, RoleName, RoleDescription
FROM         dbo.tblRole
ORDER BY RoleName
