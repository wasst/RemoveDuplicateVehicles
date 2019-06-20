CREATE TABLE [dbo].[tblRole] (
    [RoleID]          INT            NOT NULL,
    [RoleName]        NVARCHAR (50)  NOT NULL,
    [RoleDescription] NVARCHAR (150) NULL,
    CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED ([RoleID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [IX_tblRole] UNIQUE NONCLUSTERED ([RoleName] ASC) WITH (FILLFACTOR = 90)
);

