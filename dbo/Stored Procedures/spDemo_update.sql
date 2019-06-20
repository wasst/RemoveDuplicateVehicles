CREATE PROCEDURE [spDemo_update]
	(@a_1 	[int],
	 @b_2 	[nvarchar](50),
	 @c_3 	[nvarchar](50),
	 @d_4 	[nvarchar](50),
	 @e_5 	[nvarchar](50),
	 @f_6 	[nvarchar](50),
	 @g_7 	[nvarchar](50))

AS UPDATE [vehiclebookings].[dbo].[tblDemo] 

SET  [b]	 = @b_2,
	 [c]	 = @c_3,
	 [d]	 = @d_4,
	 [e]	 = @e_5,
	 [f]	 = @f_6,
	 [g]	 = @g_7 

WHERE 
	( [a]	 = @a_1)