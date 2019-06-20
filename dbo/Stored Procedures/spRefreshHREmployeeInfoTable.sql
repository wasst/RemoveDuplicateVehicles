
CREATE PROCEDURE [dbo].[spRefreshHREmployeeInfoTable]
AS

/*

Note - confirm this is current as of Dec 2010 Migration

*/

--To Do and to be continued
--Step 1 Populate the transfer tables.

/*

NOT SURE THAT THIS STEP IS REQUIRED ANYMORE - LAJ 20170712
exec uspPopulateTransferTables

*/
--Amendecd 4 Aug 2009 to not update Roger Vineys information
--Amended 31/10/2014 to update Roger Viney's information - change in position
delete from tblHREmployeeInfo
where User_ID <> 'VINEYR'

INSERT INTO tblHREmployeeInfo
SELECT DISTINCT [ID_NUMBER]
      ,[FAMILY_NAME]
      ,[GIVEN_NAME]
      ,[OTHER_GIVEN_NAME]
      ,[ALIAS_NAME]
      ,[ACTIVE_IND]
      ,[USER_ID]
      ,[WorkPhone_1]
      ,[WorkPhone_2]
      ,[EMAIL_ADDRESS]
      ,[MOBILE_PHONE]
      ,[MOBILE_PHONE_2]
      ,[JOB_POS_TITLE]
      ,[POSITION_CODE]
      ,[POSITION_SUPERVSR]
      ,[DivisionCode]
      ,[Division]
      ,[UnitCode]
      ,[Unit]
      ,[LocationCode]
      ,[Location]
, 'Y' AS InPayroll
FROM vRemoteAllEmployeeDetails
WHERE (Active_Ind = 'Y' OR ((ID_NUMBER BETWEEN 60000 AND 65000) AND ID_CLASS = 'X'))
AND last_term_datei !< GETDATE()

--Set external people to active
  UPDATE tblHREmployeeInfo
  SET Active_Ind = 'Y'
  WHERE id_number BETWEEN 60000 AND 65000

--We need to identify people that are now in HREmployee Info table
UPDATE tblEmployee
SET InPayroll = 'Y'
,LastUpdated = GETDATE()
,EmployeeId = tblHREmployeeInfo.ID_Number
FROM
tblEmployee JOIN tblHREmployeeInfo
	ON tblEmployee.LogonName = tblHREmployeeInfo.USER_ID 
	AND tblEmployee.EmployeeId <> tblHREmployeeInfo.ID_Number
    AND tblEmployee.InPayroll = 'U'
	AND tblEmployee.EmployeeId < 0

--Now set alias_name to given name if it is blank
UPDATE tblHREmployeeInfo
SET Alias_name = given_name
WHERE LTRIM(RTRIM(alias_name)) = ''

INSERT INTO tblRefreshHistory (RefreshDate)
VALUES (GETDATE())

