CREATE VIEW dbo.vEmployee_Contact
AS
SELECT     dbo.vEmployee_Base.Employee_ID, dbo.vLink_HRCOM_ADDRESS_REF.TELEPHONE_1 AS phHome, 
                      dbo.vLink_HRCOM_ADDRESS_REF.TELEPHONE_2 AS phWork, dbo.vLink_HRCOM_ADDRESS_REF.TELEPHONE_3 AS phAlternate, 
                      dbo.vLink_HRCOM_ADDRESS_REF.EMAIL_ADDRESS AS Email, dbo.vLink_HRCOM_ADDRESS_REF.MOBILE_PHONE AS PhMobile
FROM         dbo.vEmployee_Base INNER JOIN
                      dbo.vLink_HRCOM_ADDRESS_REF ON dbo.vEmployee_Base.ADDRSS_STREET_CODE = dbo.vLink_HRCOM_ADDRESS_REF.ADDRESS_CODE
