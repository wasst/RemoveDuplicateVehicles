CREATE TABLE [dbo].[tblKeyLocation] (
    [KeyLocationID] INT           IDENTITY (1, 1) NOT NULL,
    [Description]   VARCHAR (50)  NOT NULL,
    [Directions]    VARCHAR (255) NULL,
    CONSTRAINT [PK_tblKeyLocation] PRIMARY KEY NONCLUSTERED ([KeyLocationID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [IX_tblKeyLocation] UNIQUE CLUSTERED ([Description] ASC) WITH (FILLFACTOR = 90)
);

