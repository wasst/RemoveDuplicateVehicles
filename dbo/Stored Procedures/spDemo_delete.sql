CREATE PROCEDURE [spDemo_delete]
	(@a_1 	[int] )

AS DELETE [dbo].[tblDemo] 

WHERE 
	( [a]	 = @a_1 )