CREATE VIEW dbo.[vTemp_UpdateLogons]
AS
SELECT     dbo.vTemp_EmployeesWithoutLogon.PotentialLogon, dbo.vTemp_EmployeesWithoutLogon.Employee_ID, 
                      dbo.vTemp_EmployeesWithoutLogon.Last_Name, dbo.vTemp_EmployeesWithoutLogon.First_Name, dbo.tbl_temp_AllNTLogins.Name
FROM         dbo.vTemp_EmployeesWithoutLogon INNER JOIN
                      dbo.tbl_temp_AllNTLogins ON dbo.vTemp_EmployeesWithoutLogon.PotentialLogon = dbo.tbl_temp_AllNTLogins.Name AND 
                      dbo.tbl_temp_AllNTLogins.Name NOT IN
                          (SELECT     LogonName
                            FROM          tblLogon) AND dbo.tbl_temp_AllNTLogins.Name NOT IN
                          (SELECT     PotentialLogon
                            FROM          vTemp_EmployeesWithoutLogon
                            GROUP BY PotentialLogon
                            HAVING      COUNT(PotentialLogon) > 1)
