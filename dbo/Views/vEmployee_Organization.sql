CREATE VIEW dbo.vEmployee_Organization
AS
SELECT     dbo.vEmployee_Details_Base.Employee_ID, dbo.vDivision.Division_Name, dbo.vOrgUnit.Unit_Name
FROM         dbo.vEmployee_Details_Base LEFT OUTER JOIN
                      dbo.vOrgUnit ON dbo.vEmployee_Details_Base.Unit_ID = dbo.vOrgUnit.Org_Unit_ID LEFT OUTER JOIN
                      dbo.vDivision ON dbo.vEmployee_Details_Base.Division_ID = dbo.vDivision.Division_ID
