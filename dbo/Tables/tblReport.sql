CREATE TABLE [dbo].[tblReport] (
    [ReportID] INT            NOT NULL,
    [SQLBase]  NVARCHAR (600) NULL,
    [Heading1] NVARCHAR (150) NULL,
    [Heading2] NVARCHAR (150) NULL,
    CONSTRAINT [PK_tblReport] PRIMARY KEY CLUSTERED ([ReportID] ASC) WITH (FILLFACTOR = 90)
);

