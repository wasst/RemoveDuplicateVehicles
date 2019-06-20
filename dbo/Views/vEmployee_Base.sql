create view vEmployee_Base as

SELECT     ID_NUMBER AS Employee_ID, FAMILY_NAME AS Last_Name, GIVEN_NAME, First_Name = CASE alias_name WHEN ('') THEN
                          (SELECT     given_name) ELSE alias_name END, OTHER_GIVEN_NAME AS Middle_Name, ADDRSS_STREET_CODE, USER_ID AS NTLogon, 
                      Active_ind AS Is_Current
FROM         dbo.vLink_HRHMN_EMPL_REF

