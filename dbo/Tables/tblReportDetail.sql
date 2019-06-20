CREATE TABLE [dbo].[tblReportDetail] (
    [UserName] NVARCHAR (50) NOT NULL,
    [ReportID] INT           NOT NULL,
    [SQLWhere] NVARCHAR (50) NOT NULL,
    [Heading3] NVARCHAR (50) NULL,
    [Heading4] NVARCHAR (50) NULL,
    CONSTRAINT [PK_tblReportDetail] PRIMARY KEY CLUSTERED ([UserName] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblReportDetail_tblReport] FOREIGN KEY ([ReportID]) REFERENCES [dbo].[tblReport] ([ReportID])
);

