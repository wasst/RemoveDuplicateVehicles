CREATE TABLE [dbo].[tblDivision] (
    [Division_ID]   INT          NOT NULL,
    [Division_Name] VARCHAR (64) NULL,
    CONSTRAINT [PK_tblDivision] PRIMARY KEY CLUSTERED ([Division_ID] ASC) WITH (FILLFACTOR = 90)
);

