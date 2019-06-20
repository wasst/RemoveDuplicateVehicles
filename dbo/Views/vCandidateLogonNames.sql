create view vCandidateLogonNames 
as
Select * from tblNTUserNames 
where NTUserName not in
(Select LogonName from tblPerson)

