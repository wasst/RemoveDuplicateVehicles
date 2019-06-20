CREATE PROCEDURE [spDemo_insert]
	(@a_1 	[int] output,
	 @b_2 	[nvarchar](50),
	 @c_3 	[nvarchar](50),
	 @d_4 	[nvarchar](50),
	 @e_5 	[nvarchar](50),
	 @f_6 	[nvarchar](50),
	 @g_7 	[nvarchar](50))

AS INSERT INTO [vehiclebookings].[dbo].[tblDemo] 
	 ( 
	 [b],
	 [c],
	 [d],
	 [e],
	 [f],
	 [g]) 
 
VALUES 
	( 
	 @b_2,
	 @c_3,
	 @d_4,
	 @e_5,
	 @f_6,
	 @g_7)

set @a_1 = @@IDENTITY