CREATE PROCEDURE [spReportDetail_Insert]
	(@UserName_1 	[nvarchar](50),
	 @ReportID_2 	[int],
	 @SQLWhere_3 	[nvarchar](50),
	 @Heading3_4 	[nvarchar](50),
	 @Heading4_5 	[nvarchar](50))

AS INSERT INTO [vehiclebookings].[dbo].[tblReportDetail] 
	 ( [UserName],
	 [ReportID],
	 [SQLWhere],
	 [Heading3],
	 [Heading4]) 
 
VALUES 
	( @UserName_1,
	 @ReportID_2,
	 @SQLWhere_3,
	 @Heading3_4,
	 @Heading4_5)