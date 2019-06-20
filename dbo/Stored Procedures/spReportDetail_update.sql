CREATE PROCEDURE [spReportDetail_update]
	(@UserName_1 	[nvarchar],
	 @ReportID_2 	[int],
	 @SQLWhere_3 	[nvarchar](50),
	 @Heading3_4 	[nvarchar](50),
	 @Heading4_5 	[nvarchar](50))

AS UPDATE [vehiclebookings].[dbo].[tblReportDetail] 

SET  [ReportID]	 = @ReportID_2,
	 [SQLWhere]	 = @SQLWhere_3,
	 [Heading3]	 = @Heading3_4,
	 [Heading4]	 = @Heading4_5 

WHERE 
	( [UserName]	 = @UserName_1)

--If you can't update row, then insert row
IF @@ROWCOUNT = 0
BEGIN
	exec spReportDetail_insert 
		@UserName_1 	
	 	,@ReportID_2 	
	 	,@SQLWhere_3 
	 	,@Heading3_4 	
	 	,@Heading4_5
END