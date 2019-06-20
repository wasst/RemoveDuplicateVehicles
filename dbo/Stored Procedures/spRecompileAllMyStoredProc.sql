--recompile all stored procedures
CREATE procedure spRecompileAllMyStoredProc as

declare @SQLText varchar(150);
Declare @ProcName varchar(50);

declare  UserStoredProc  cursor for
	select name from sysobjects where xtype = 'p' and name like 'sp%';
open UserStoredProc
	Fetch Next from UserStoredProc into @ProcName;
	
	while @@Fetch_status = 0
	begin
		
		Set @SQLText = 'sp_recompile ' + @ProcName;
		exec (@SQLText);

		fetch next from UserStoredProc into @Procname;
		
	end;
close UserStoredProc;
deallocate UserStoredProc;