CREATE TABLE [dbo].[tblLogon] (
    [EmployeeID] INT           NOT NULL,
    [LogonName]  NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_tblLogon] PRIMARY KEY NONCLUSTERED ([EmployeeID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [IX_tblLogon] UNIQUE CLUSTERED ([LogonName] ASC) WITH (FILLFACTOR = 90)
);

