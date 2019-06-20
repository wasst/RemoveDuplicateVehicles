CREATE PROCEDURE [spRole_delete]
	(@RoleID_1 	[int])

AS DELETE [dbo].[tblRole] 

WHERE 
	( [RoleID]	 = @RoleID_1)