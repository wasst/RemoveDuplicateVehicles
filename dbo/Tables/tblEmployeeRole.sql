CREATE TABLE [dbo].[tblEmployeeRole] (
    [EmployeeID] INT NOT NULL,
    [RoleID]     INT NOT NULL,
    CONSTRAINT [PK_tblEmployeeRole] PRIMARY KEY CLUSTERED ([EmployeeID] ASC, [RoleID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblEmployeeRole_tblRole] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[tblRole] ([RoleID])
);

