


CREATE  procedure [dbo].[spRefreshPersonTable]
as

/*
	Step 1
	Delete all data from tblPerson_Transfer Table

*/

truncate table  tblPerson_transfer


/*
	Step 2
	Transfer all current employees to this table

*/




Insert into tblPerson_transfer
(Employee_ID 
,FullName_Backward                                                                                      
,FullName_Forward                                                                                      
,Last_Name                                          
,First_Name                                         
,Middle_Name                                        
,PhWork_Full          
,PhWork_Ext           
,PhMobile             
,PhHome               
,Email                                                                                               
,Fax                  
,Is_Current 
,LogonName      
,Unit_Name                                                        
,Division_Name                                                    
,Position_Desc                                                    

)

select 
Employee_ID 
,FullName_Backward                                                                                      
,FullName_Forward                                                                                      
,Last_Name                                          
,First_Name                                         
,Middle_Name                                        
,PhWork_Full          
,PhWork_Ext           
,PhMobile             
,PhHome               
,lower(Email)                                                                                               
,Fax                  
,Is_Current 
,LogonName      
,Unit_Name                                                        
,Division_Name                                                    
,Position_Desc                                                    

from vPerson_finProd
where Is_Current = 'Y'
or Employee_ID between 60000 and 90000



update tblPerson_transfer
	Set phWork_Full = null
	where phWork_Full = ''


update tblPerson_transfer
	Set phWork_Ext = null
	where phWork_Ext = ''


update tblPerson_transfer
	Set phMobile = null
	where phMobile = ''


/*

	Step 3
	Remove Duplicate Logon Names

*/



while exists (Select * from vDuplicateLogons)

begin
	
	Update tblPerson_Transfer
		Set LogonName = NULL where Employee_ID = (Select top 1 Employee_ID from vDuplicateLogons);
		
end;


/*

	Step 4
	Set Null LogonNames to EmployeeID

*/

Update tblPerson_Transfer 
set logonName = null
where LogonName =''

Update tblPerson_Transfer
set logonName = T1.Employee_ID
from tblPerson_transfer t1 join tblPerson t2 on t1.Employee_ID = t2.Employee_ID
where t1.LogonName is null and isnumeric(t2.Employee_id) = 1

/*
--update tblPerson
select * from tblPerson
where Employee_ID IN (Select Employee_ID from tblPerson_transfer)
and tblPerson.IsOnPayroll = 'N'
 
select * from tblPerson
where LogonName IN (Select LogonName from tblPerson_transfer)
and tblPerson.IsOnPayroll = 'N'

from tblPerson t1 join tblPerson_transfer t2 on t1.LogonName = t2.LogonName and t1.IsOnPayroll = 'N'

select * from tblPerson where IsOnPayroll = 'N'
*/

--select * from tblPerson_transfer where --LogonName is null
-- employee_id = 50670

/* Step 4b
	20 Dec 2004
	--Tom and Judy added this step because this stored procedure starting falling over and Judy made me fix it.


	If a person becomes a payroll employee from Non-Payroll, then we need to delete their old Employee_id from the tblPerson table.  We look for duplicate logonnames as a means of doing this
	and check that they are flagged as a non-payroll employee.  
	We also check that their first and last names are the same - this makes it pretty unlikely that a new employee with the same name and logonname will overwrite a current Non-Payroll employee

*/
	delete  from tblPerson where Employee_id in
(
select t1.Employee_ID from tblPerson t1 join tblPerson_transfer t2 on t1.first_name = t2.first_name and t1.last_name = t2.last_name
where t1.employee_id not in (Select employee_id from tblPerson_transfer)
and t1.IsOnPayroll = 'N'
)


--Step 4b
--If Logon name is left empty in FinProd then set it to the employee number

update tblPerson_Transfer
set LogonName = Employee_Id
where tblPerson_Transfer.Employee_ID not in (Select Employee_ID from tblPerson)
and tblPerson_transfer.logonName is null



/*
Step 4c  Changed Aug 11 2008
Identify duplicate logon names that have been entered against Active Employees
In FinProd
Append _Z onto Logon Name.
Doesn't matter 'cos Logon name is incorrect anyhow
*/
update tblPerson_Transfer
Set LogonName =  T.LogonName + '_Z'
from
tblPerson_transfer T join tblPerson  P on T.LogonName = P.LogonName
and T.Employee_ID <> P.Employee_ID

/* Step 4d
Save this so we can identify them */
Insert into tblDuplicateLogonName
(Employee_ID, Last_Name, First_Name, LogonName, CreationDate)
Select T.Employee_ID, T.Last_Name, T.First_Name, T.LogonName, getdate()
from
tblPerson_transfer T join tblPerson  P on T.LogonName = P.LogonName
and T.Employee_ID <> P.Employee_ID


/*
--Step 5
Insert any new records into tblPerson

*/

Insert into tblPerson
(Employee_ID 
,FullName_Backward                                                                                      
,FullName_Forward                                                                                      
,Last_Name                                          
,First_Name                                         
,Middle_Name                                        
,PhWork_Full          
,PhWork_Ext           
,PhMobile             
,PhHome               
,Email                                                                                               
,Fax                  
,Is_Current 
,LogonName      
,Unit_Name                                                        
,Division_Name                                                    
,Position_Desc                                                    
,IsOnPayroll
,IsExternal
)
Select 
Employee_ID 
,FullName_Backward                                                                                      
,FullName_Forward                                                                                      
,Last_Name                                          
,First_Name                                         
,Middle_Name                                        
,PhWork_Full          
,PhWork_Ext           
,PhMobile             
,PhHome               
,Email                                                                                               
,Fax                  
,Is_Current 
,LogonName      
,Unit_Name                                                        
,Division_Name                                                    

,Position_Desc                                                    
,'Y' as InOnPayroll   --Person is on payroll because they are in People 1 database
, case LogonName  --If they do not have a logon name, assume they are external
	when '' then 'Y'
	when null then 'Y'
        else 'N'
   end		 
       as IsExternal

 from tblPerson_transfer
where tblPerson_Transfer.Employee_ID not in (Select Employee_ID from tblPerson)


/*
	Step 6
	Update any changes that have been made in People 1

*/
UPDATE tblPerson
	Set 
	FullName_Backward = PT.FullName_Backward
	,FullName_Forward = PT.FullName_Forward                                             
	,Last_Name        = PT.Last_Name                    
	,First_Name       = PT.First_Name                   
	,Middle_Name      = PT.Middle_Name                  
	,PhWork_Full      = PT.PhWork_Full
	,PhWork_Ext       = PT.PhWork_Ext
	,PhMobile         = PT.PhMobile
	,PhHome           = PT.PhHome
	,Email            = PT.Email                                                                         
	,Fax              = PT.Fax
	,Is_Current       = PT.Is_Current
	,LogonName        = PT.LogonName
	,Unit_Name        = PT.Unit_Name                                  
	,Division_Name    = PT.Division_Name                              
	,Position_Desc    = PT.Position_Desc                              
	,IsOnPayroll      = 'Y'

	from tblPerson P, tblPerson_Transfer PT
	where P.Employee_ID = PT.Employee_ID


/*
	Changes made June 2007 
	Don't update LogonName above but update LogonName if it is numeric or blank

	Step 6b
*/
UPDATE tblPerson
	Set 
	
	LogonName        = PT.LogonName
	
	from tblPerson P, tblPerson_Transfer PT
	where P.Employee_ID = PT.Employee_ID
	and ((isnull(P.LogonName, '') = '') or isnumeric(P.LogonName) = 1)

/*

	Step 7
	Delete old records from tblPerson

*/
/*
Delete from tblPerson
where
tblPerson.Employee_ID not in (Select Employee_ID from tblPerson_Transfer)
and
IsOnPayroll = 'Y'	--Make sure data has come from People 1
*/
--Alternative form of above
Delete from tblPerson where
not  exists(Select Employee_ID from tblPerson_Transfer where tblPerson_Transfer.Employee_ID = tblPerson.Employee_ID)
and
IsOnPayroll = 'Y'


--Now call stored procedure to refresh the org units information
exec spRefreshOrgUnits


update tblPerson set fullname_backward = 'Richardson, Ian G'
where employee_id  = 1149

--Save run dates in tblUpdateHistory
exec spUpdateHistory

