CREATE TABLE [dbo].[tblPerson] (
    [Employee_ID]       INT           NOT NULL,
    [FullName_Backward] VARCHAR (102) NOT NULL,
    [FullName_Forward]  VARCHAR (101) NULL,
    [Last_Name]         VARCHAR (50)  NULL,
    [First_Name]        VARCHAR (50)  NULL,
    [Middle_Name]       VARCHAR (50)  NULL,
    [PhWork_Full]       VARCHAR (20)  NULL,
    [PhWork_Ext]        VARCHAR (20)  NULL,
    [PhMobile]          VARCHAR (20)  NULL,
    [PhHome]            VARCHAR (20)  NULL,
    [Email]             VARCHAR (99)  NULL,
    [Fax]               VARCHAR (20)  NULL,
    [Is_Current]        VARCHAR (1)   NULL,
    [LogonName]         VARCHAR (50)  NULL,
    [Unit_Name]         VARCHAR (64)  NULL,
    [Division_Name]     VARCHAR (64)  NULL,
    [Position_Desc]     VARCHAR (64)  NULL,
    [IsOnPayroll]       CHAR (1)      CONSTRAINT [DF_tblPerson_IsOnPayroll] DEFAULT ('Y') NOT NULL,
    [IsExternal]        CHAR (1)      CONSTRAINT [DF_tblPerson_IsExternal] DEFAULT ('N') NOT NULL,
    CONSTRAINT [PK_tblPerson] PRIMARY KEY NONCLUSTERED ([Employee_ID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [IX_tblPerson_1] UNIQUE NONCLUSTERED ([LogonName] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE CLUSTERED INDEX [IX_tblPerson]
    ON [dbo].[tblPerson]([FullName_Backward] ASC) WITH (FILLFACTOR = 90);

