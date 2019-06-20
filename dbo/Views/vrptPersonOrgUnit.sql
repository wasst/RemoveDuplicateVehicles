CREATE VIEW dbo.vrptPersonOrgUnit
AS
SELECT     TOP 100 PERCENT FullName_Backward, Position_Desc, Division_Name, Unit_Name, PhWork_Ext AS Phone, PhWork_Full AS PhoneAlt, 
                      PhMobile
FROM         dbo.tblPerson
ORDER BY Division_Name, Unit_Name, FullName_Backward
