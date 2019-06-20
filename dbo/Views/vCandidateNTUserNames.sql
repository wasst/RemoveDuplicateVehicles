create view vCandidateNTUserNames as

select * from tblNTUserNames where NTUserName 
not in (Select LogonName from tblPerson)

