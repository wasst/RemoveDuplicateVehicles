CREATE PROCEDURE
spNextUnusedPersonID
	@NextPersonID Integer OUTPUT


 AS

--First check to see if the number 1  is used
if Exists(Select Employee_ID from tblPerson where Employee_ID = 1)
begin 
set @NextPersonID = 
(
select min( IsNull(t1.Employee_ID,0) + 1) as NextPersonID from tblPerson t1 left outer join tblPerson t2 on t1.Employee_ID + 1 = t2.Employee_ID 
where t2.Employee_ID is null
)
end 
else begin
   Set @NextPersonID = 1
end;