CREATE TABLE [dbo].[tblRefreshHistory] (
    [RefreshId]   INT      IDENTITY (1, 1) NOT NULL,
    [RefreshDate] DATETIME NOT NULL,
    CONSTRAINT [PK_tblRefreshHistory] PRIMARY KEY CLUSTERED ([RefreshId] ASC)
);

