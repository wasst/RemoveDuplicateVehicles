CREATE TABLE [dbo].[tblDebugInfo] (
    [DebugID]       INT            IDENTITY (1, 1) NOT NULL,
    [ProcedureName] NVARCHAR (50)  NOT NULL,
    [SQLUser]       NVARCHAR (50)  NULL,
    [TimeRun]       DATETIME       NOT NULL,
    [Parameters]    NVARCHAR (150) NULL,
    [OtherInfo1]    NVARCHAR (150) NULL,
    [OtherInfo2]    NVARCHAR (150) NULL,
    [OtherInfo3]    NVARCHAR (150) NULL
);

