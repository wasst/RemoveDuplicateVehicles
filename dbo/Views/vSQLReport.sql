CREATE VIEW dbo.vSQLReport
AS
SELECT     dbo.tblReport.SQLBase + dbo.tblReportDetail.SQLWhere AS SQLStatement, dbo.tblReportDetail.UserName, dbo.tblReport.Heading1, 
                      dbo.tblReport.Heading2, dbo.tblReportDetail.Heading3, dbo.tblReportDetail.Heading4
FROM         dbo.tblReport INNER JOIN
                      dbo.tblReportDetail ON dbo.tblReport.ReportID = dbo.tblReportDetail.ReportID
