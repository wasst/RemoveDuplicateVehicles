CREATE PROCEDURE [spKeyLocation_insert]
	(
	@KeyLocationID_1 	[int] OUTPUT,
	 @Description_2 	[varchar](20),
	 @Directions_3 	[varchar](255))

AS INSERT INTO [vehiclebookings].[dbo].[tblKeyLocation] 
	 (
	-- [KeyLocationID],
	 [Description],
	 [Directions]) 
 
VALUES 
	( 
	--@KeyLocationID_1,
	 @Description_2,
	 @Directions_3)

	SET @KeyLocationID_1 =  @@IDENTITY