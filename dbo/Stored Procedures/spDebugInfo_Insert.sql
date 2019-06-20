CREATE PROCEDURE [spDebugInfo_Insert]
	(--@DebugID_1 	[int],
	 @ProcedureName_2 	[nvarchar](50),
	 --@SQLUser_3 	[nvarchar](50),
	 --@TimeRun_4 	[datetime],
	 @Parameters_5 	[nvarchar](250),
	 @OtherInfo1_6 	[nvarchar](150) = '',
	 @OtherInfo2_7 	[nvarchar](150) = '',
	 @OtherInfo3_8 	[nvarchar](150) = '')

AS 


	
INSERT INTO 
[dbo].[tblDebugInfo] 
	 ( 
	--[DebugID],
	 [ProcedureName],
	 [SQLUser],
	 [TimeRun],
	 [Parameters],
	 [OtherInfo1],
	 [OtherInfo2],
	 [OtherInfo3]) 
 
VALUES 
	( 
	--@DebugID_1,
	 @ProcedureName_2,
	 USER_NAME(), --@SQLUser_3,
	Getdate(),            --@TimeRun_4,
	 @Parameters_5,
	 @OtherInfo1_6,
	 @OtherInfo2_7,
	 @OtherInfo3_8)