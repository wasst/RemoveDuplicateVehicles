CREATE PROCEDURE [spRole_insert]
	@RoleID_1 Int output,
	@RoleName_2 	[nvarchar](50),
	@RoleDescription_3 	[nvarchar](150)



AS


DECLARE @LAST_ERROR Int

SELECT  @RoleID_1 =   isnull(Max(RoleID),0) + 1 from tblRole


 INSERT INTO [dbo].[tblRole] 
	 ( [RoleID],
	 [RoleName],
	 [RoleDescription]) 
 
VALUES 
	( @RoleID_1,
	 @RoleName_2,
	 @RoleDescription_3)



RETURN @@ERROR
/*
--Print @@Error

SET @LAST_ERROR =  @@ERROR
print 'Last error is '
print @last_Error

IF @LAST_ERROR = 2627
BEGIN
	RAISERROR( 'SOME ERROR ENCOUNTERED', 16, 1)
END
ELSE
BEGIN
	RAISERROR( 'SOME OTHER KIND OF ERROR ENCOUNTERED', 16, 1)
END
*)
*/