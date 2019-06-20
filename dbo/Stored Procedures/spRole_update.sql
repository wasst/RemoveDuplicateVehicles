CREATE PROCEDURE [spRole_update]
	(@RoleID_1 	[int],
	 @RoleID_2 	[int],
	 @RoleName_3 	[nvarchar](50),
	 @RoleDescription_4 	[nvarchar](150))

AS UPDATE [dbo].[tblRole] 

SET  [RoleID]	 = @RoleID_2,
	 [RoleName]	 = @RoleName_3,
	 [RoleDescription]	 = @RoleDescription_4 

WHERE 
	( [RoleID]	 = @RoleID_1)