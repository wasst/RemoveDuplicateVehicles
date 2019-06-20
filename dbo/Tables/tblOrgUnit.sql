CREATE TABLE [dbo].[tblOrgUnit] (
    [Org_Unit_ID] INT          NOT NULL,
    [Unit_Name]   VARCHAR (64) NULL,
    [Division_ID] INT          NULL,
    CONSTRAINT [PK_tblOrgUnit] PRIMARY KEY CLUSTERED ([Org_Unit_ID] ASC) WITH (FILLFACTOR = 90)
);

