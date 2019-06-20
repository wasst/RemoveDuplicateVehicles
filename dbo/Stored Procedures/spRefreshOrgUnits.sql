CREATE procedure spRefreshOrgUnits

AS
--Create a temporary table to store the new divisions in
Create Table #Division(Division_ID Integer, Division_Name varchar(64))
Insert into #Division
	Select code_ID, code_descr from vlink_HRSTC_CODE where code_type = 'Department_code'
	and isnumeric(Code_ID) = 1


--Add new division where there is a new Division_ID
Insert into tblDivision
	Select * from #Division where #Division.Division_ID not in (Select Division_ID from tblDivision)

--select * from tblDivision

--Delete divisions where the division ID no longer exists.
Delete from tblDivision where tblDivision.Division_ID not in (Select Division_ID from #Division)

--Update divisions where the name nas changed.
Update tblDivision
	Set tblDivision.Division_Name = (Select Division_Name from #Division t1 
		where t1.Division_ID = tblDivision.Division_ID)
		where  tblDivision.Division_Name <> (Select Division_Name from #Division where tblDivision.Division_ID = #Division.Division_ID)


--Create a temporary table to store the new units in
Create Table #OrgUnit(Org_Unit_ID integer, Unit_Name varchar(64), Division_ID integer)

insert into #OrgUnit
	select CODE_ID as Org_Unit_ID, Code_Descr as Unit_Name, Left(Code_ID, 1) as Division_ID from vLink_HRSTC_CODE 
	where code_type = 'WORK_GROUP' and isnumeric(code_id) = 1

--add new unit where there is a new Org_Unit_ID
Insert into tblOrgUnit
	Select * from #OrgUnit where #OrgUnit.Org_Unit_ID not in (Select Org_Unit_ID from tblOrgUnit)

--Delete org unit where the org_unit_id no longer exists.
Delete from tblOrgUnit where tblOrgUnit.Org_Unit_Id not in (Select Org_Unit_ID from #OrgUnit)

--Now perform any updates where the OrgUnit name has changed
Update tblOrgUnit
	Set tblOrgUnit.Unit_Name = (Select Unit_Name from #OrgUnit 
			where #OrgUnit.Org_Unit_ID = tblOrgUnit.Org_Unit_ID)
					--where tblOrgUnit.Unit_Name <> 
					--	(Select #OrgUnit.Unit_Name from #OrgUnit where #OrgUnit.Org_Unit_ID = tblOrgUnit.Org_Unit_ID)