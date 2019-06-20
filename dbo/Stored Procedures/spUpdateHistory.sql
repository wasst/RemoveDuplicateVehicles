CREATE PROCEDURE 
spUpdateHistory as

update tblUpdateHistory
Set 
	LastRun = getdate()
	,PrevRun = (Select Max(LastRun) from tblUpdateHistory)
