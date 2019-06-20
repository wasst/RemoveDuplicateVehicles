CREATE TABLE [dbo].[tblDuplicateLogonName] (
    [Employee_ID]  INT           NOT NULL,
    [Last_Name]    VARCHAR (255) NULL,
    [First_Name]   VARCHAR (255) NULL,
    [LogonName]    VARCHAR (64)  NULL,
    [CreationDate] DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Employee_ID] ASC)
);

