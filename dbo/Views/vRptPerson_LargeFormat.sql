CREATE VIEW dbo.vRptPerson_LargeFormat
AS
SELECT     TOP 100 PERCENT LEFT(FullName_Backward, 1) AS Letter, FullName_Backward AS fullname, Unit_Name + ' - ' + Position_Desc AS Description, 
                      COALESCE (PhWork_Ext, PhWork_Full) AS PhoneNumber, PhMobile AS MobilePhone
FROM         dbo.tblPerson
WHERE     (LogonName IS NOT NULL) AND (LogonName <> '')
ORDER BY letter, FullName_Backward
