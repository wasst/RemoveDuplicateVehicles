CREATE TABLE [dbo].[tblPerson_transfer] (
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
    [Position_Desc]     VARCHAR (64)  NULL
);

