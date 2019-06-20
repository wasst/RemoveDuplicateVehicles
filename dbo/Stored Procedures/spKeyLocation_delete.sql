CREATE PROCEDURE [spKeyLocation_delete]
	(@KeyLocationID_1 	[int])

AS DELETE [vehiclebookings].[dbo].[tblKeyLocation] 

WHERE 
	( [KeyLocationID]	 = @KeyLocationID_1)