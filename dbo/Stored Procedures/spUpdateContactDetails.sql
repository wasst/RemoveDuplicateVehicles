
CREATE procedure [dbo].[spUpdateContactDetails]

@EmployeeID    Integer

,@WorkPhone_Full varchar(50)
,@WorkPhone_Ext varchar(50) 
,@PhMobile      varchar(50) 
,@PhHome        varchar(50) 
,@LogonName varchar(50) 
,@Email            varchar(50) 
,@IsExternal    char(1) = 'N'

AS



---------------------------------------------------------------------------------------------------------------------------------------------
declare @Parameters nvarchar(250)

Set @Parameters =  'WorkPhone_Full = ' + @WorkPhone_Full 
				+ 'WorkPhone_Ext = ' + @WorkPhone_Ext 
				+ 'PhMobile = ' + @PhMobile 	
				+ 'PhHome = ' + @PhHome 
				+ 'LogonName = '+ @LogonName 
				+ 'Email = ' + @Email

exec spDebugInfo_Insert 
	@ProcedureName_2 = 'spUpdateContactDetails'
	,@Parameters_5        =  @Parameters

---------------------------------------------------------------------------------------------------------------------------------------------

declare @IsOnPayroll char(1)


--Begin Tran

Update tblPerson
set  	 PhWork_Full = @WorkPhone_Full
       	,PhWork_Ext  = @WorkPhone_Ext
         	,PhMobile     = @PhMobile
        	,PhHome      = @PhHome
	,LogonName = @LogonName
	,Email            = @Email
	,IsExternal    = @IsExternal

where Employee_ID = @EmployeeID 

If @@Error > 0
	begin
		--while @@trancount > 0 rollback
		return -100
	end



Set @IsOnPayroll = (Select IsOnPayroll from tblPerson where Employee_ID = @EmployeeID)


--Update this person in People1 database
if @IsOnPayroll = 'Y' 
begin
exec [vs2\sql2].AdministrativeTools.dbo.spUpdateContactDetails @EmployeeID, @WorkPhone_Full, @WorkPhone_Ext, @PhMobile, @PhHome, @LogonName, @Email
end

IF @@Error = 0
begin
	while @@Trancount > 0 commit tran
	return 0
end else
begin
	while @@trancount > 0 rollback tran
	return -1
end;

