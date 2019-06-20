CREATE PROCEDURE [spEmployeeRole_insert]
	(@EmployeeID_1 	[int],
	 @RoleID_2 	[int])

AS INSERT INTO [dbo].[tblEmployeeRole] 
	 ( [EmployeeID],
	 [RoleID]) 
 
VALUES 
	( @EmployeeID_1,
	 @RoleID_2)