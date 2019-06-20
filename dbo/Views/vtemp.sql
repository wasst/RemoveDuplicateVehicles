CREATE VIEW dbo.vtemp
AS
SELECT     dbo.vPerson.*
FROM         dbo.vPerson INNER JOIN
                      dbo.vEmployeeRole ON dbo.vPerson.Employee_ID = dbo.vEmployeeRole.EmployeeID
WHERE     (dbo.vEmployeeRole.RoleID = 2)
