CREATE VIEW dbo.vEmployee_AllDetails
AS
SELECT     dbo.vEmployee_Details_Base.Employee_ID, dbo.vEmployee_Details_Base.Last_Name, dbo.vEmployee_Details_Base.First_Name, 
                      dbo.vEmployee_Details_Base.Middle_Name, dbo.vEmployee_Organization.Division_Name, dbo.vEmployee_Organization.Unit_Name, 
                      dbo.vEmployee_Contact.phHome, dbo.vEmployee_Contact.phWork, dbo.vEmployee_Contact.PhMobile, dbo.vEmployee_Contact.Email, 
                      dbo.vPosition.Position_Desc, dbo.vEmployee_Details_Base.NTLogon AS LogonName, dbo.vEmployee_Details_Base.Is_Current
FROM         dbo.vEmployee_Details_Base INNER JOIN
                      dbo.vEmployee_Contact ON dbo.vEmployee_Details_Base.Employee_ID = dbo.vEmployee_Contact.Employee_ID INNER JOIN
                      dbo.vEmployee_Organization ON dbo.vEmployee_Details_Base.Employee_ID = dbo.vEmployee_Organization.Employee_ID LEFT OUTER JOIN
                      dbo.vPosition ON dbo.vEmployee_Details_Base.JOB_TITLE_CODE = dbo.vPosition.Job_Title_Code
