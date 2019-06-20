CREATE TABLE [dbo].[tblFbtYearCalender] (
    [PK_FBTYear] INT      IDENTITY (1, 1) NOT NULL,
    [Year]       INT      NULL,
    [DepartTime] DATETIME NULL,
    CONSTRAINT [PK_tblFbtYearCalender] PRIMARY KEY CLUSTERED ([PK_FBTYear] ASC)
);


GO
CREATE NONCLUSTERED INDEX [Ak_Year_departTime]
    ON [dbo].[tblFbtYearCalender]([Year] ASC, [DepartTime] ASC);

