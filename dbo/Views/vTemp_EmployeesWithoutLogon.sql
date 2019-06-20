CREATE VIEW dbo.vTemp_EmployeesWithoutLogon
AS
SELECT     dbo.vEmployee_Base.Last_Name + LEFT(dbo.vEmployee_Base.First_Name, 1) AS PotentialLogon, dbo.vEmployee_Base.Employee_ID, 
                      dbo.vEmployee_Base.Last_Name, dbo.vEmployee_Base.First_Name
FROM         dbo.vEmployee_Base LEFT OUTER JOIN
                      dbo.tblLogon ON dbo.vEmployee_Base.Employee_ID = dbo.tblLogon.EmployeeID
WHERE     (dbo.tblLogon.LogonName IS NULL)
