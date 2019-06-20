CREATE procedure spGrantPermissions as

declare @Tablename varchar(150)
declare @SQLText varchar(250)

declare TableNames  cursor for
select name from sysobjects where xtype = 'u'  or xtype = 'v'
open tablenames

fetch next from tablenames into @Tablename

while @@fetch_status = 0
begin
	--print @Tablename
	Select @SQLText = 'Revoke all on ' + @TableName + ' to HCCUsers'
	exec (@SQLText)
	Select @SQLText = 'Grant  select on ' + @TableName + ' to HCCUsers'
	exec (@SQLText)
	fetch next from tablenames into @Tablename
end
close tablenames

deallocate tablenames

------------------
Select @SQLText = 'Grant  all on tblPerson to HCCUsers'
	exec (@SQLText)

declare ProcNames  cursor for
select name from sysobjects where xtype =  'p'
open Procnames

fetch next from ProcNames into @Tablename

while @@fetch_status = 0
begin
	--print @Tablename
	Select @SQLText = 'Grant  execute  on ' + @TableName + ' to HCCUsers'
	exec (@SQLText)
	fetch next from Procnames into @Tablename
end
close  ProcNames

deallocate   ProcNames