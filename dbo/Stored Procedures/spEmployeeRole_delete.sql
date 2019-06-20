CREATE PROCEDURE [spEmployeeRole_delete]
	(@EmployeeID_1 	[int],
	 @RoleID_2 	[int])

AS DELETE [dbo].[tblEmployeeRole] 

WHERE 
	( [EmployeeID]	 = @EmployeeID_1 AND
	 [RoleID]	 = @RoleID_2)