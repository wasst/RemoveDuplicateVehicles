CREATE TABLE [dbo].[tblWeighting] (
    [WeightingID]          CHAR (10)     NOT NULL,
    [WeightingValue]       INT           NOT NULL,
    [WeightingDescription] NVARCHAR (50) NULL,
    CONSTRAINT [PK_tblWeighting] PRIMARY KEY CLUSTERED ([WeightingID] ASC) WITH (FILLFACTOR = 90)
);

