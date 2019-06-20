CREATE TABLE [dbo].[tblEmployee] (
    [LogonName]    NVARCHAR (150) NOT NULL,
    [EmployeeId]   INT            NOT NULL,
    [CreationDate] DATETIME       NOT NULL,
    [LastAccessed] DATETIME       NOT NULL,
    [InPayroll]    CHAR (1)       NULL,
    [LastUpdated]  DATETIME       NULL,
    CONSTRAINT [PK_tbHREmployeeLookup] PRIMARY KEY CLUSTERED ([LogonName] ASC)
);

